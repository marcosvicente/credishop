require 'rails_helper'

RSpec.describe InssCalculationService, type: :service do
  describe "Calculate inss" do
    context "success" do
      context "range salary 1045" do
        let!(:proponent1) { create(:proponent, salary: 1044.0) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 1045.01) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          expect(klass.result[:aliquot]).to eq(7.5)
          expect(klass.result[:dedution].to_f).to eq(78.300)
          expect(klass.result[:liquid_salary].to_f).to eq(965.7)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          expect(klass.result[:aliquot]).to eq(7.5)
          expect(klass.result[:dedution].to_f).to eq(78.375)
          expect(klass.result[:liquid_salary].to_f).to eq(966.625)
        end
        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          expect(klass.result[:aliquot]).to eq(9)
          expect(klass.result[:dedution].to_f).to eq(94.0509)
          expect(klass.result[:liquid_salary].to_f).to eq(950.9591)
        end
      end

      context "range salary 2089" do
        let!(:proponent1) { create(:proponent, salary: 2089.60) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 2089.61) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          expect(klass.result[:aliquot]).to eq(9)

          expect(klass.result[:dedution].to_f).to eq(188.064)
          expect(klass.result[:liquid_salary].to_f).to eq(1901.536)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          expect(klass.result[:aliquot]).to eq(7.5)

          expect(klass.result[:dedution].to_f).to eq(78.375)
          expect(klass.result[:liquid_salary].to_f).to eq(966.625)
        end
        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          expect(klass.result[:aliquot]).to eq(12)

          expect(klass.result[:dedution].to_f).to eq(250.7532)
          expect(klass.result[:liquid_salary].to_f).to eq(1838.8568)
        end
      end

      context "range salary 3134" do
        let!(:proponent1) { create(:proponent, salary: 3134.40) }
        let!(:proponent2) { create(:proponent, salary: 2089.60) }
        let!(:proponent3) { create(:proponent, salary: 3134.41) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          expect(klass.result[:aliquot]).to eq(12)

          expect(klass.result[:dedution].to_f).to eq(376.128)
          expect(klass.result[:liquid_salary].to_f).to eq(2758.272)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          expect(klass.result[:aliquot]).to eq(9)

          expect(klass.result[:dedution].to_f).to eq(188.064)
          expect(klass.result[:liquid_salary].to_f).to eq(1901.536)
        end
        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          expect(klass.result[:aliquot]).to eq(14)

          expect(klass.result[:dedution].to_f).to eq(438.8174)
          expect(klass.result[:liquid_salary].to_f).to eq(2695.5926)
        end
      end
      context "range salary 6101" do
        let!(:proponent1) { create(:proponent, salary: 6101.06) }
        let!(:proponent2) { create(:proponent, salary: 3134.40) }
        let!(:proponent3) { create(:proponent, salary: 10000.41) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          expect(klass.result[:aliquot]).to eq(14)

          expect(klass.result[:dedution].to_f).to eq(854.1484)
          expect(klass.result[:liquid_salary].to_f).to eq(5246.9116)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          expect(klass.result[:aliquot]).to eq(12)

          expect(klass.result[:dedution].to_f).to eq(376.128)
          expect(klass.result[:liquid_salary].to_f).to eq(2758.272)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          expect(klass.result[:aliquot]).to eq(14)

          expect(klass.result[:dedution].to_f).to eq(854.1484000000002)
          expect(klass.result[:liquid_salary].to_f).to eq(9146.2616)
        end

      end
    end

    context "fail" do
      let!(:proponent) { create(:proponent, salary: -1044.0) }

      it "should be return error with value negative" do
        klass = described_class.new(proponent: proponent).call

        expect(klass.errors.full_messages).to include("Not calculated salary")
      end
    end
  end
end