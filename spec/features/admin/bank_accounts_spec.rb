require 'spec_helper'

feature 'Admin - Supplier Bank Accounts', js: true do

  before do
    country = create(:country, name: "United States")
    create(:state, name: "Vermont", country: country)
  end

  context 'as a Supplier' do

    before do
      login_user create(:supplier_user)
      visit spree.account_path
      within 'dd.supplier-info' do
        click_link 'Edit'
      end
    end

  end

end
