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
FactoryBot.define do
  factory :inss do
    aliquot { 1.5 }
    from { 1.5 }
    to { 1.5 }

  end
end
