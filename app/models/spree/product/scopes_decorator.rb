Spree::Product.class_eval do

	add_search_scope :no_available_date_set do
      where("#{Product.quoted_table_name}.available_on IS NULL")
    end
end