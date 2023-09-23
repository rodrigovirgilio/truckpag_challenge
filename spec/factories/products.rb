FactoryBot.define do
  factory :product do
    code { rand(10_000_000..99_999_999) }
    status { Product::STATUS[:daft] }
    imported_t { Time.current }
    url { FFaker::Image.url }
    creator { FFaker::Name.name }
    created_t { rand(10_000_000..99_999_999) }
    last_modified_t { rand(10_000_000..99_999_999) }
    product_name { FFaker::Name.name }
    quantity { FFaker::Food.fruit }
    brands { FFaker::Product.brand }
    categories { FFaker::Game.category }
    labels { FFaker::Name.name }
    cities { FFaker::Address.city }
    purchase_places { FFaker::Name.name }
    stores { FFaker::Name.name }
    ingredients_text { FFaker::Food.ingredient }
    traces { FFaker::Name.name }
    serving_size { FFaker::UnitMetric.mass_name }
    serving_quantity { rand(0.01..99.99).round(2) }
    nutriscore_score { rand(1..10) }
    nutriscore_grade { FFaker::UnitMetric.mass_abbr }
    main_category { FFaker::Name.name }
    image_url { FFaker::Image.url }
  end
end
