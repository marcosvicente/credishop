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
require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { is_expected.to belong_to(:proponent).class_name('Proponent') }

  subject(:phone) { build(:phone) }
  
  it { is_expected.to validate_presence_of(:number) }
end
