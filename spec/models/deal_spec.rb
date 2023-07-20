require 'rails_helper'

RSpec.describe Deal, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:category1) do
    Category.create(name: 'Category 1', icon: fixture_file_upload('sample.png', 'image/png'), author: user)
  end
  let(:category2) do
    Category.create(name: 'Category 2', icon: fixture_file_upload('sample.png', 'image/png'), author: user)
  end

  subject do
    Deal.new(name: 'Deal 1', amount: 100, author: user)
  end

  it 'is not valid when name is nil' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid when name is empty' do
    subject.name = ''
    expect(subject).not_to be_valid
  end

  it 'is not valid without an attached author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'valid without an attached category' do
    expect(subject).to be_valid
  end



  it 'is not valid if the amount is less than 0' do
    subject.amount = -50
    expect(subject).not_to be_valid
  end
end
