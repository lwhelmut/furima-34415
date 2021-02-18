FactoryBot.define do
  factory :item do
    item_name                         {Faker::Lorem.sentence}
    item_explanation                  {Faker::Lorem.sentence}
    category_id                       {2}
    item_price                        {300}
    item_status_id                    {2}
    shipping_price_responsibility_id  {2}
    prefecture_id                     {2}
    shipping_date_forecast_id         {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
