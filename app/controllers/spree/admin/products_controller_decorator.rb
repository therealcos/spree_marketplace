Spree::Admin::ProductsController.class_eval do

  before_filter :get_suppliers, only: [:edit, :update]
  before_filter :supplier_collection, only: [:index]

  create.after :add_product_to_supplier

  private

  def get_suppliers
    @suppliers = Spree::Supplier.order(:name)
  end

  # Scopes the collection to the Supplier.
  def supplier_collection
    if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
      @collection = @collection.joins(:suppliers).where('spree_suppliers.id = ?', try_spree_current_user.supplier_id)
    end
  end

  # Newly added products by a Supplier are associated with it.
  def add_product_to_supplier
    if try_spree_current_user && try_spree_current_user.supplier?
      @product.add_supplier!(try_spree_current_user.supplier_id)
    end
  end

  def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= "1"
        params[:q][:not_discontinued] ||= "1"
        params[:q][:no_available_date_set] ||= "1"

        params[:q][:s] ||= "name asc"
        @collection = super
        # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
        # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
        if params[:q][:deleted_at_null] == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
        # This is to include all products and not just deleted products.
        @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
        @collection = @search.result.
              distinct_by_product_ids(params[:q][:s]).
              includes(product_includes).
              page(params[:page]).
              per(params[:per_page] || Spree::Config[:admin_products_per_page])
        @collection
      end
end