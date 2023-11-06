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
require "cpf_cnpj"

class Proponent < ApplicationRecord
  paginates_per 5

  belongs_to :address
  has_many :phone

  accepts_nested_attributes_for :phone, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :cpf, presence: true
  validates :name, presence: true
  validates :salary, presence: true

  validate :valid_cpf?
  
  def valid_cpf?
    errors.add("CPF não e valido") unless CPF.valid?(self.cpf) 
  end
end
