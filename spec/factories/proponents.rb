# == Schema Information
#
# Table name: proponents
#
#  id                 :bigint           not null, primary key
#  birth_date         :date
#  cpf                :string
#  inss_aliquot       :float
#  inss_dedution      :float
#  inss_liquid_salary :float
#  name               :string
#  salary             :decimal(8, 2)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  address_id         :bigint           not null
#
# Indexes
#
#  index_proponents_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
require "cpf_cnpj"

FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    cpf { CPF.generate }
    address { create(:address) }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end
