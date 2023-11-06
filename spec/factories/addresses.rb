# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  cep          :string
#  city         :string
#  neighborhood :string
#  number       :string
#  state        :string
#  street       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  Faker::Address.country_by_code(code: 'NL')
  factory :address do
    street { Faker::Address.street_address }
    number { Faker::Address.zip  }
    neighborhood { Faker::Address.city_prefix }
    city { Faker::Address.city }
    state {Faker::Address.state }
    cep { Faker::Address.postcode }
  end
end
