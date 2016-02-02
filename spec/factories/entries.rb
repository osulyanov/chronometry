FactoryGirl.define do
  factory :entry do
    user
    task_description 'Test App'
    date { Time.zone.today }
    minutes_worked 60
  end
end
