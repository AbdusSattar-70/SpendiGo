require 'rails_helper'

RSpec.feature 'User', type: :feature do
  include Devise::Test::IntegrationHelpers

  it 'displays the login link on the homepage' do
    visit root_path
    expect(page).to have_content('LOG IN')
  end

  it 'displays the Welcome! message on the homepage' do
    visit root_path
    expect(page).to have_content('Wecome To SpendiGo!')
  end

  scenario 'User can register with valid information' do
    visit root_path
    click_link 'SIGN UP'
    attach_file 'user_photo', Rails.root.join('spec/fixtures/sample.png')
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'New Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    find('input[name="user[password_confirmation]"]').send_keys(:enter)
    sleep 2
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'User cannot register with invalid information' do
    visit new_user_registration_path
    find('input[name="user[password_confirmation]"]').send_keys(:enter)
    expect(page).to have_content('prohibited this user from being saved')
  end
end
