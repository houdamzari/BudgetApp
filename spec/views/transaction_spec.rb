require 'rails_helper'

RSpec.describe 'Transactions page', type: :feature do
  before :each do
    @user = User.new(name: 'Nana', email: 'is@gmail.com', password: '124578',
                     password_confirmation: '124578')

    @user.save

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    @category = Group.new(name: 'Food', user_id: @user.id)
    @category.save

    @transaction = Entity.new(name: 'Food', amount: 100, user_id: @user.id)

    @transaction.save

    visit entities_path
  end

  it 'should display the transactions page' do
    expect(page).to have_content('Categories')
  end

  it 'should display add new transaction button' do
    visit group_path(2)
    expect(page).to have_content('Add transaction')
  end

  it 'should display the transaction form' do
    click_link 'Add transaction'
    expect(page).to have_content('Add New transaction')
  end

  it 'should save the transaction' do
    click_link 'Add transaction'
    fill_in 'Name', with: 'Food'
    fill_in 'Enter a Number', with: 100
    click_button 'Savee'
    expect(page).to have_content('This transaction was created successfully')
  end
end
