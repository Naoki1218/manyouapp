FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'テスト' }
    email { 'test@test.com' }
    password { '11111111' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@admin.com' }
    password { '00000000' }
    admin { true }
  end
end
