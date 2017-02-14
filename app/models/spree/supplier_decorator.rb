Spree::Supplier.class_eval do

	attr_accessor :first_name, :last_name
  
	has_many :bank_accounts, class_name: 'Spree::SupplierBankAccount'
	has_attached_file :profile_picture, dependent: :destroy, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :path => ":rails_root/public/assets/profile_pictures/:style/:filename", :url => "/assets/profile_pictures/:style/:filename"
  validates_attachment :profile_picture, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :in => 0..500.kilobytes }

  validates :tax_id, length: { is: 9, allow_blank: true }

  before_create :assign_name

  private

  def assign_name
    self.address = Spree::Address.default     unless self.address.present?
    self.address.first_name = self.first_name unless self.address.first_name.present?
    self.address.last_name = self.last_name   unless self.address.last_name.present?
  end

end
