# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
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
    click_button 'Add Payment'
    fill_in 'Enter Payment Name', with: 'test_payment'
    attach_file('category[icon]', Rails.root.join('spec/fixtures/sample.png'))
    click_button 'Create Payment Type'
  end

  it 'redirects to a form for new category & renders name of page,icon, Sum' do
    expect(page).to have_content('PAYMENT TYPE')
    expect(page).to have_selector('img[src*="sample.png"]')
    expect(page).to have_content('Sum Of All Transaction')
    expect(page).to have_content('Add Payment')
  end

  it 'redirects to Transaction details path' do
    category_details = find('.name_date')
    category_details.click
    sleep 2
    expect(page).to have_content('Make Payment')
    expect(page).to have_content('Destroy this category')
  end

  it 'redirects to Transaction details path' do
    category_details = find('.name_date')
    category_details.click
    sleep 2
    expect(page).to have_content('Make Payment')
    expect(page).to have_content('Destroy this category')
  end
end
