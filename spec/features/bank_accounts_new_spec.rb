require 'rails_helper'

feature 'Bank Accounts Index', js: true do
  login_js

    context 'new bank account' do
      before(:each) do
        @account_count = 5
        FactoryGirl.create_list(:bank_account, user: @user)
        visit new_bank_account_path
      end

      scenario 'makes new bank account' do
        expect(all('.bank-account').count).to eq(@account_count)

        @user.bank_accounts.each do |account|
          expect(page).to have_content(account.institution)
          expect(page).to have_content(account.discription)
          expect(page).to have_content(account.amount)
        end
      end
      
    end

end
