# == Schema Information
#
# Table name: phones
#
#  id           :bigint           not null, primary key
#  number       :string
#  reference    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  proponent_id :bigint           not null
#
# Indexes
#
#  index_phones_on_proponent_id  (proponent_id)
#
# Foreign Keys
#
#  fk_rails_...  (proponent_id => proponents.id)
#
FactoryBot.define do
  factory :phone do
    number { Faker::PhoneNumber.phone_number }
    reference { Faker::Name.name }
    proponent { create(:proponent) }
  end
end
