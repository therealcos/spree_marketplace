module Spree
  class SupplierBankAccount < ActiveRecord::Base

    attr_accessor :account_number, :routing_number, :type

    belongs_to :supplier

    validates :name,           presence: true
    validates :type,           presence: true
    validates :supplier,       presence: true
    validates :token,          presence: true, uniqueness: true

  end
end
