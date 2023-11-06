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
require 'cpf_cnpj'

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
 
  after_create :create_salary_dependeces

  def valid_cpf?
    errors.add('CPF não e valido') unless CPF.valid?(self.cpf) 
  end

  def create_salary_dependeces
    CreateSalaryDependecesWorker.perform_async(self.id)
  end
end
