Spree::Product.class_eval do

	add_search_scope :available_date_set do
      where("#{Product.quoted_table_name}.available_on IS NOT NULL")
    end
end