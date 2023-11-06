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
class Inss < ApplicationRecord
  validates :aliquot, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
