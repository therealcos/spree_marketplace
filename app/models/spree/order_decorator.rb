Spree::Order.class_eval do

	def finalize_with_marketplace!
	finalize_without_marketplace!
	shipments.each do |shipment|
	  if SpreeDropShip::Config[:send_supplier_email] && shipment.supplier.present?

	  	puts "LOLLLLLLL"

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