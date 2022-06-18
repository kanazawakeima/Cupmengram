FactoryBot.define do
  factory :user do
    username {'test'}
    email {'test@test.com'}
    password {'123456'}
    admin {'false'}
  end
  factory :admin_user, class: User do
    username {'admin'}
    email {'admin@admin.com'}
    password {'123456'}
    admin {'true'}
  end
  factory :clone_user, class: User do
    username {'clone'}
    email {'clone@clone.com'}
    password {'123456'}
    admin {'false'}
  end
end
