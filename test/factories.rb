FactoryGirl.define do
  factory :place do
    name 		"Gangnam Cafe"
    address 	"1035 Detroit Ave Concord, CA 94518"
    description	"Food taste homemade and fresh"
  end

  factory :user do
    email  				"buzzoneapp@gmail.com"
    encrypted_password  "12fdsa12"
  end
end