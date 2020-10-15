FactoryBot.define do
  factory :complaint do
    title { 'title' }
    text { 'text' }
    association :user
  end
end