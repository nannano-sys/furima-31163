FactoryBot.define do
  factory :user do
      transient do
        person { Gimei.name } #人名に漢字とカタカナを適用するための記述
      end
    nickname {Faker::Name.initials}
    email    {Faker::Internet.free_email}
    password {"a1"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {person.first.kanji}
    family_name {person.last.kanji}
    first_name_kana {person.last.katakana}
    family_name_kana {person.last.katakana}
    birthday {Faker::Date.backward}
  end
end
