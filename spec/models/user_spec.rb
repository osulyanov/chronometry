require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  it 'not valid without email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'not valid without password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end
end
