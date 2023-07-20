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

  it 'redirects to Transaction details path to make payment' do
    category_details = find('.name_date')
    category_details.click
    make_paymentBtn = find('.test_payment')
    make_paymentBtn.click
    select 'test_payment', from: 'deal[category_id]'
    fill_in 'Enter Payment Name', with: 'Test_Transaction'
    fill_in 'Amount', with: '100.00'
    click_button 'Confirm Payment'
    expect(page).to have_content('Payment Was Completed Successfully!')
  end

  it 'redirects to Transaction details path to details' do
    category_details = find('.name_date')
    category_details.click
    make_paymentBtn = find('.test_payment')
    make_paymentBtn.click
    select 'test_payment', from: 'deal[category_id]'
    fill_in 'Enter Payment Name', with: 'Test_Transaction'
    fill_in 'Amount', with: '100.00'
    click_button 'Confirm Payment'
    sleep 3
    test_Btn = find('.testBtn1')
    test_Btn.click
    sleep 5
    expect(page).to have_content('Total Payment:')
    expect(page).to have_content('Payment Amount')
    expect(page).to have_content('Time')
    expect(page).to have_content('Test_Transaction')
    expect(page).to have_content('Transaction Name')
    test_Btn2 = find('.testBtn2')
    test_Btn2.click
    sleep 3
    backBtn_test = find('.backBtn_test')
    backBtn_test.click
    sleep 2
    hum_menu = find('p.menu_test', wait: 10)
    hum_menu.click
    sleep 3
    test_logout = find('.test_logout')
    page.evaluate_script('window.confirm = function() { return true; }')
    test_logout.click
    # Ensure the user is redirected to the root path after logging out
    expect(page).to have_current_path(root_path)
  end
end
