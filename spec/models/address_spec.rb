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
require 'rails_helper'

RSpec.describe Address, type: :model do

  subject(:address) { build(:address) }
  it { is_expected.to validate_presence_of(:cep) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:neighborhood) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:street) }
end
