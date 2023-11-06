require 'rails_helper'

RSpec.describe InssCalculationService, type: :service do
  describe 'Calculate inss' do
    context 'success' do
      context 'range salary 1045' do
        let!(:proponent1) { create(:proponent, salary: 1044.0) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 1045.01) }

        it 'be return value of inss with salary 1044.0' do
          service_class = described_class.new(proponent: proponent1).call

          expect(service_class.result[:aliquot]).to eq(7.5)
          expect(service_class.result[:dedution].to_f).to eq(78.300)
          expect(service_class.result[:liquid_salary].to_f).to eq(965.7)
        end

        it 'be return value of inss with salary 1045.0' do
          service_class = described_class.new(proponent: proponent2).call

          expect(service_class.result[:aliquot]).to eq(7.5)
          expect(service_class.result[:dedution].to_f).to eq(78.375)
          expect(service_class.result[:liquid_salary].to_f).to eq(966.625)
        end
        it 'be return value of inss with salary 1045.01' do
          service_class = described_class.new(proponent: proponent3).call

          expect(service_class.result[:aliquot]).to eq(9)
          expect(service_class.result[:dedution].to_f).to eq(94.0509)
          expect(service_class.result[:liquid_salary].to_f).to eq(950.9591)
        end
      end

      context 'range salary 2089' do
        let!(:proponent1) { create(:proponent, salary: 2089.60) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 2089.61) }

        it 'be return value of inss with salary 2089.60' do
          service_class = described_class.new(proponent: proponent1).call

          expect(service_class.result[:aliquot]).to eq(9)

          expect(service_class.result[:dedution].to_f).to eq(188.064)
          expect(service_class.result[:liquid_salary].to_f).to eq(1901.536)
        end

        it 'be return value of inss with salary 1045.0' do
          service_class = described_class.new(proponent: proponent2).call

          expect(service_class.result[:aliquot]).to eq(7.5)

          expect(service_class.result[:dedution].to_f).to eq(78.375)
          expect(service_class.result[:liquid_salary].to_f).to eq(966.625)
        end

        it 'be return value of inss with salary 2089.61' do
          service_class = described_class.new(proponent: proponent3).call

          expect(service_class.result[:aliquot]).to eq(12)

          expect(service_class.result[:dedution].to_f).to eq(250.7532)
          expect(service_class.result[:liquid_salary].to_f).to eq(1838.8568)
        end
      end

      context 'range salary 3134' do
        let!(:proponent1) { create(:proponent, salary: 3134.40) }
        let!(:proponent2) { create(:proponent, salary: 2089.60) }
        let!(:proponent3) { create(:proponent, salary: 3134.41) }

        it 'be return value of inss with salary 3134.40' do
          service_class = described_class.new(proponent: proponent1).call

          expect(service_class.result[:aliquot]).to eq(12)

          expect(service_class.result[:dedution].to_f).to eq(376.128)
          expect(service_class.result[:liquid_salary].to_f).to eq(2758.272)
        end

        it 'be return value of inss with salary 2089.60' do
          service_class = described_class.new(proponent: proponent2).call

          expect(service_class.result[:aliquot]).to eq(9)

          expect(service_class.result[:dedution].to_f).to eq(188.064)
          expect(service_class.result[:liquid_salary].to_f).to eq(1901.536)
        end
        it 'be return value of inss with salary 3134.41' do
          service_class = described_class.new(proponent: proponent3).call

          expect(service_class.result[:aliquot]).to eq(14)

          expect(service_class.result[:dedution].to_f).to eq(438.8174)
          expect(service_class.result[:liquid_salary].to_f).to eq(2695.5926)
        end
      end
      context 'range salary 6101' do
        let!(:proponent1) { create(:proponent, salary: 6101.06) }
        let!(:proponent2) { create(:proponent, salary: 3134.40) }
        let!(:proponent3) { create(:proponent, salary: 10_000.41) }

        it 'be return value of inss with salary 6101.06' do
          service_class = described_class.new(proponent: proponent1).call

          expect(service_class.result[:aliquot]).to eq(14)

          expect(service_class.result[:dedution].to_f).to eq(854.1484)
          expect(service_class.result[:liquid_salary].to_f).to eq(5246.9116)
        end

        it 'be return value of inss with salary 3134.40' do
          service_class = described_class.new(proponent: proponent2).call

          expect(service_class.result[:aliquot]).to eq(12)

          expect(service_class.result[:dedution].to_f).to eq(376.128)
          expect(service_class.result[:liquid_salary].to_f).to eq(2758.272)
        end

        it 'be return value of inss with salary 10000.41' do
          service_class = described_class.new(proponent: proponent3).call

          expect(service_class.result[:aliquot]).to eq(14)

          expect(service_class.result[:dedution].to_f).to eq(854.1484000000002)
          expect(service_class.result[:liquid_salary].to_f).to eq(9146.2616)
        end

      end
    end

    context 'fail' do
      let!(:proponent) { create(:proponent, salary: -1044.0) }

      it 'be return error with salary value negative' do
        service_class = described_class.new(proponent: proponent).call

        expect(service_class.errors.full_messages).to include('Not calculated salary')
      end
    end
  end
end