FactoryBot.define do
  factory :like do
  	id {1}
    user_id {1}
    color_id {1}
    association :user, factory: :user
    association :color, factory: :color
  end
end
