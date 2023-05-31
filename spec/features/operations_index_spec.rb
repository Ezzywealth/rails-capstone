require 'rails_helper'

RSpec.feature 'CategoriesIndices', type: :feature do
  describe 'Categories Index' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test1.webp'), 'image/webp') }
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'ezekiel', email: 'ezekiel@example.com', password: '1111111111')
      @user.confirm
      @category = Category.create(name: 'Food', user_id: @user.id)
      @category.icon.attach(file)
      @categorytwo = Category.create(name: 'Football', user_id: @user.id)
      @categorytwo.icon.attach(file)
      @categorythree = Category.create(name: 'Tacos', user_id: @user.id)
      @categorythree.icon.attach(file)
      @transaction1 = Operation.create(name: 'Athletics', amount: 100, user_id: @user.id)
      @transaction2 = Operation.create(name: 'Boxing', amount: 300, user_id: @user.id)
      @transaction3 = Operation.create(name: 'Wrestling', amount: 500, user_id: @user.id)
      @operation_category1 = OperationCategory.create(operation_id: @transaction1.id, category_id: @category.id)
      @operation_category2 = OperationCategory.create(operation_id: @transaction2.id, category_id: @category.id)
      @operation_category3 = OperationCategory.create(operation_id: @transaction3.id, category_id: @category.id)

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'should have a title' do
      expect(page).to have_current_path(categories_path)
      click_on @category.name
      expect(page).to have_current_path(category_operations_path(@category.id))
      expect(page).to have_content('Transactions')
    end

    it 'should have a link to create a new transaction' do
      expect(page).to have_current_path(categories_path)
      click_on @category.name
      expect(page).to have_current_path(category_operations_path(@category.id))
      expect(page).to have_content('Add New Transaction')
    end

    it 'should have a category name' do
      expect(page).to have_current_path(categories_path)
      click_on @category.name
      @transactions = Operation.all
      @transactions.each do |transaction|
        expect(page).to have_content(transaction.name.capitalize)
      end
      expect(@transactions.count).to eq(3)
    end
  end
end
