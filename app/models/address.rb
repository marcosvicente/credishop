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
class Address < ApplicationRecord

  has_one :proponent

  validates :cep, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: true
  validates :number, presence: true
  validates :state, presence: true
  validates :street, presence: true
end
