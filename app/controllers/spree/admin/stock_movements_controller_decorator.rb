Spree::Admin::StockMovementsController.class_eval do

  before_filter :redirect_to_products

  def redirect_to_products
    redirect_to spree.admin_products_path
  end 
  
end