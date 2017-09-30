require 'rails_helper'

feature 'Bank Accounts Index', js: true do
  login_js

  context 'with bank accounts' do
    before(:each) do
      @account_count = 5
      FactoryGirl.create_list(:bank_account, 5, user: @user)
      visit bank_accounts_path
    end

    scenario 'shows a bank account' do
      expect(all('.bank-account').count).to eq(@account_count)

      @user.bank_accounts.each do |account|
        expect(page).to have_content(account.institution)
        expect(page).to have_content(account.description)
      end
    end

  end

    context 'without bank accounts' do
      before(:each) do
        # Capybara DSL - docs
        visit bank_accounts_path
      end

      scenario 'correct no bank account message' do
        expect(page).to have_content('No Bank Accounts, Please Create One!')
      end
      
    end

end
