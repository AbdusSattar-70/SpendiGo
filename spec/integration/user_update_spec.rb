require 'rails_helper'

RSpec.feature 'User Profile Update', type: :feature do
  include Devise::Test::IntegrationHelpers
  before do
    visit root_path
    click_link 'SIGN UP'
    attach_file 'user_photo', Rails.root.join('spec/fixtures/sample.png')
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'New Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    find('input[name="user[password_confirmation]"]').send_keys(:enter)
  end

  scenario 'User can back to the home page' do
    backBtn = find('p.backBtn_test')
    backBtn.click
    expect(page).to have_content('Welcome,')
    expect(page).to have_content('HOME')
  end

  scenario 'User can toggle mobile menu & update profile with valid information' do
    backBtn = find('p.backBtn_test')
    backBtn.click
    hum_menu = find('p.menu_test', wait: 10)
    hum_menu.click

    expect(page).to have_content('Account Settings')
    expect(page).to have_content('Merchant Finder')
    expect(page).to have_content('Claim Promo')
    expect(page).to have_content('Share Promo')
    expect(page).to have_content('Payments')
    settings = find('.test_settings')
    settings.click
    expect(page).to have_content('Delete Account')
    expect(page).to have_content('Upload Picture')
  end
end
