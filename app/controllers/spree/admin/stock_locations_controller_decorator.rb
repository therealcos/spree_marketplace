Spree::Admin::StockLocationsController.class_eval do

  before_filter :redirect_to_profile

  def redirect_to_profile
  	if try_spree_current_user.try(:supplier?)
    	redirect_to spree.edit_admin_supplier_url(spree_current_user.supplier_id)
    end
  end 
  
end