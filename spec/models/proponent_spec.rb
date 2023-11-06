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
require 'rails_helper'

RSpec.describe Proponent, type: :model do
  it { is_expected.to belong_to(:address).class_name('Address') }
  it { is_expected.to have_many(:phone).class_name('Phone') }

  subject(:proponent) { build(:proponent) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:salary) }

  context ".cpf" do
    it "sould be valid with valid cpf" do
      proponent.cpf = CPF.generate
      expect(proponent).to be_valid
    end

    it "sould be invalid with not valid cpf" do
      proponent.cpf = "11111111111"
      expect(proponent).to be_invalid
    end
  end
end
