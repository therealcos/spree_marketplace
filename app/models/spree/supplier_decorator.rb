Spree::Supplier.class_eval do

	attr_accessor :first_name, :last_name
  
	has_many :bank_accounts, class_name: 'Spree::SupplierBankAccount'

  before_create :assign_name

  private

  def assign_name
    self.address = Spree::Address.default     unless self.address.present?
    self.address.first_name = self.first_name unless self.address.first_name.present?
    self.address.last_name = self.last_name   unless self.address.last_name.present?
  end

end
