# == Schema Information
#
# Table name: insses
#
#  id         :bigint           not null, primary key
#  aliquot    :float            not null
#  from       :float            not null
#  to         :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Inss, type: :model do
  subject(:inss) { build(:inss) }

  it { is_expected.to validate_presence_of(:aliquot) }
  it { is_expected.to validate_presence_of(:from) }
  it { is_expected.to validate_presence_of(:to) }
end
