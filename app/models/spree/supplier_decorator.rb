Spree::Supplier.class_eval do

	attr_accessor :first_name, :last_name
  
	has_many :bank_accounts, class_name: 'Spree::SupplierBankAccount'
	has_attached_file :profile_picture, 
                    dependent: :destroy, 
                    :styles => {:medium => "300x300>", :thumb => "100x100>"}, 
                    :path => ":rails_root/public/spree/suppliers/:id/:style/:filename", 
                    :url => "/spree/suppliers/:id/:style/:filename",
                    s3_credentials: {
                      access_key_id:     Rails.application.secrets.aws_access_key_id,
                      secret_access_key: Rails.application.secrets.aws_secret_access_key,
                      bucket:            Rails.application.secrets.s3_bucket_name,
                      s3_region:         Rails.application.secrets.aws_region
                    },
                    storage:        :s3,
                    s3_headers:     { "Cache-Control" => "max-age=31557600" },
                    s3_protocol:    "https",
                    bucket:         Rails.application.secrets.s3_bucket_name,
                    url:            ":s3_domain_url"
  validates_attachment :profile_picture, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :in => 0..500.kilobytes }

  before_create :assign_name

  private

  def assign_name
    self.address = Spree::Address.default     unless self.address.present?
    self.address.first_name = self.first_name unless self.address.first_name.present?
    self.address.last_name = self.last_name   unless self.address.last_name.present?
  end

end


  

  