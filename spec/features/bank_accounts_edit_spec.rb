require 'rails_helper'

feature 'Bank Accounts Index', js: true do
  login_js

  context 'with bank accounts' do
    before(:each) do
      @account_count = 5
      FactoryGirl.create_list(:bank_account, 5, user: @user)
      visit edit_bank_account_path
    end

    scenario 'edit bank account' do
      expect(all('.bank-account').count).to eq(@account_count)

      @user.bank_accounts.each do |account|
        expect(page).to have_content(account.institution)
        expect(page).to have_content(account.description)
      end
    end

  end
  
end
