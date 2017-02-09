Spree::Order.class_eval do

	def finalize_with_marketplace!
		finalize_without_marketplace!

		shipments.each do |shipment|
			
			customer = Stripe::Customer.create(
    			:email => "therealcos@gmail.com",
    			:source  => "adsfasdfasdf"
  			)

			if SpreeDropShip::Config[:send_supplier_email] && shipment.supplier.present?
			    begin
			      Spree::DropShipOrderMailer.supplier_order(shipment.id).deliver!
			    rescue => ex #Errno::ECONNREFUSED => ex
			      puts ex.message
			      puts ex.backtrace.join("\n")
			      Rails.logger.error ex.message
			      Rails.logger.error ex.backtrace.join("\n")
			      return true # always return true so that failed email doesn't crash app.
			    end
			end
		end
	end
	alias_method_chain :finalize!, :marketplace

end