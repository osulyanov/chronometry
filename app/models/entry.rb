class Entry < ActiveRecord::Base
  belongs_to :user

  default_scope { order('date DESC') }

  validates :user_id, presence: true
  validates :date, presence: true, not_in_future: true
  validates :minutes_worked, presence: true, inclusion: 0..1440
end
