module Spree
  class MarketplaceConfiguration < Preferences::Configuration

    # Allow users to signup as a supplier.
    preference :allow_signup, :boolean, default: false

  end
end
