FactoryBot.define do
  factory :color,class: Color do
  	association :maker, factory: :maker
    id {1}
    color_name {"テストホワイト"}
    color_code {"FFFFFF"}
  end
end