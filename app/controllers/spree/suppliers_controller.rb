class Spree::SuppliersController < Spree::StoreController
	before_filter :check_if_supplier, only: [:create, :new]

	def show
	  @supplier = Spree::Supplier.friendly.find(params[:id].to_s)
	  unless @supplier.active
	  	redirect_to '/'
	  end
	end

  def create
    @supplier = Spree::Supplier.new(supplier_params)

    # Dont sign in as the newly created user if users already signed in.
    unless spree_current_user
      # Find or create user for email.
      if @user = Spree.user_class.find_by_email(params[:supplier][:email])
        unless @user.valid_password?(params[:supplier][:password])
          flash[:error] = Spree.t('supplier_registration.create.invalid_password')
          render :new and return
        end
      else
        @user = Spree.user_class.new(email: params[:supplier][:email], password: params[:supplier].delete(:password), password_confirmation: params[:supplier].delete(:password_confirmation))
        @user.save!
        session[:spree_user_signup] = true
      end
      sign_in(Spree.user_class.to_s.underscore.gsub('/', '_').to_sym, @user)
      associate_user
    end

    # Now create supplier.
    @supplier.email = spree_current_user.email if spree_current_user

    if @supplier.save
      flash[:success] = Spree.t(:supplier_created)
      redirect_to spree.edit_admin_supplier_url(@supplier)
    else
      render :new
    end
  end

  def new
    @supplier = Spree::Supplier.new
    @supplier.active = false
  end

  private

  def check_if_supplier
    if spree_current_user and spree_current_user.supplier?
      flash[:error] = Spree.t(:already_supplier)
      redirect_to spree.edit_admin_supplier_url(spree_current_user.supplier) and return
    end
  end

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end
