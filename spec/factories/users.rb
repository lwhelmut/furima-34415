FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sir_name              {person.last.kanji}
    name                  {person.first.kanji}
    sir_name_reading      {person.last.katakana}
    name_reading          {person.last.katakana}
    birth_date            {Faker::Date.birthday}
  end
end