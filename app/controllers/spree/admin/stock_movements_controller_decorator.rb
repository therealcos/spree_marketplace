Spree::Admin::StockMovementsController.class_eval do

  before_filter :redirect_to_profile

  def redirect_to_profile
  	if try_spree_current_user.try(:supplier?)
    	redirect_to spree.admin_products_path
    end
  end 
  
end