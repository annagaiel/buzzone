FactoryGirl.define do
  factory :place do
    name 		"Gangnam Cafe"
    address 	"1035 Detroit Ave Concord, CA 94518"
    description	"Food taste homemade and fresh"
    latitude(37.955646)
    longitude(-122.029937)
    association :user
  end

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "12fdsa12"
  end

  factory :comment do 
    message "Best place ever!!"
    rating "5_star"
    association :user
    association :place
  end

end