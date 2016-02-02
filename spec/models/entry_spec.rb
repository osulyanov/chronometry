require 'rails_helper'

RSpec.describe Entry, type: :model do
  subject { FactoryGirl.create(:entry) }

  it 'valid' do
    expect(subject).to be_valid
  end

  it 'not valid without user' do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it 'not valid if minutes more than in twenty-four hours' do
    subject.minutes_worked = 60*25
    expect(subject).not_to be_valid
  end

  it 'can\'t be in the future' do
    subject.date = Time.zone.tomorrow
    expect(subject).not_to be_valid
  end

  it 'load a user\'s entries in chronological order' do
    user = subject.user
    FactoryGirl.create(:entry, user: user, date: Time.zone.yesterday)
    expect(user.entries.first.id).to be_equal(subject.id)
  end
end
