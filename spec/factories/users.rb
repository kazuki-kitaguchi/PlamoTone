FactoryBot.define do
	factory :user, class: User do
		id {1}
		email { "test@gmail.com" }
		password { "testps" }
		admin { false }
	end
end
