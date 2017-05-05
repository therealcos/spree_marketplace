class Spree::SuppliersController < Spree::StoreController

	def index
		@suppliers = Spree::Supplier.all
	end

	def show
	  @supplier = Spree::Supplier.find(params[:id])
	end

end
