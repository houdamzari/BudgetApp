require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit home_index_path
  end

  it 'should display the home page' do
    expect(page).to have_content('Budget app')
  end

  it 'should display the sign up button' do
    expect(page).to have_content('Signup')
  end

  it 'should display the log in button' do
    expect(page).to have_content('Login')
  end

  it 'should display sign up forms' do
    click_on 'Signup'
    expect(page).to have_content('Sign up')
  end

  it 'should display log in forms' do
    click_on 'Login'
    expect(page).to have_content('Log in')
  end
end
