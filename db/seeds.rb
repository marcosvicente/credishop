Inss.find_or_create_by!(
  from: 1,
  to: 1045.00,
  aliquot: 7.5
)
Inss.find_or_create_by!(
  from: 1045.01,
  to: 2089.60,
  aliquot: 9
)
Inss.find_or_create_by!(
  from: 2089.61,
  to: 3134.40,
  aliquot: 12
)
Inss.find_or_create_by!(
  from: 3134.41,
  to: 6101.06,
  aliquot: 14
)

10.times do |i|
  FactoryBot.create(:proponent)
end