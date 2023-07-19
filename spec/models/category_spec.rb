# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  subject do
    Category.new(name: 'payment type-1', author: user)
  end

  it 'is not valid when name is nil' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with name and author' do
    expect(subject).not_to be_valid
  end

  it 'is not valid when name is empty' do
    subject.name = ''
    expect(subject).not_to be_valid
  end

  it 'is not valid without an attached icon' do
    expect(subject).not_to be_valid
  end

  it 'is valid when all requirements are met' do
    icon_path = Rails.root.join('spec/fixtures/sample.png')
    file = fixture_file_upload(icon_path, 'image/png')
    subject.icon.attach(file)

    expect(subject).to be_valid
  end

  it 'is not valid if the name is longer than 100 characters' do
    subject.name = 'a' * 101
    expect(subject).not_to be_valid
  end

  it 'is not valid if the name contains invalid characters' do
    subject.name = 'Invalid Name!'
    expect(subject).not_to be_valid
  end
end
