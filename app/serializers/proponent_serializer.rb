# == Schema Information
#
# Table name: proponents
#
#  id         :bigint           not null, primary key
#  birth_date :string
#  cpf        :string
#  name       :string
#  salary     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#
# Indexes
#
#  index_proponents_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
class ProponentSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :birth_date, :salary
  has_one :address
end
