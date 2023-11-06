 require 'rails_helper'

RSpec.describe InssCreateSalaryService, type: :service do
  describe "Save inss valores" do
    context "success" do
      context "range salary 1045" do
        let!(:proponent1) { create(:proponent, salary: 1044.0) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 1045.01) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          proponent1.reload
          expect(proponent1.inss_aliquot).to eq(7.5)
          expect(proponent1.inss_dedution.to_f).to eq(78.300)
          expect(proponent1.inss_liquid_salary.to_f).to eq(965.7)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          proponent2.reload
          expect(proponent2.inss_aliquot).to eq(7.5)
          expect(proponent2.inss_dedution.to_f).to eq(78.375)
          expect(proponent2.inss_liquid_salary.to_f).to eq(966.625)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          proponent3.reload
          expect(proponent3.inss_aliquot).to eq(9)
          expect(proponent3.inss_dedution.to_f).to eq(94.0509)
          expect(proponent3.inss_liquid_salary.to_f).to eq(950.9591)
        end
      end

      context "range salary 2089" do
        let!(:proponent1) { create(:proponent, salary: 2089.60) }
        let!(:proponent2) { create(:proponent, salary: 1045.0) }
        let!(:proponent3) { create(:proponent, salary: 2089.61) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          proponent1.reload
          expect(proponent1.inss_aliquot).to eq(9)
          expect(proponent1.inss_dedution.to_f).to eq(188.064)
          expect(proponent1.inss_liquid_salary.to_f).to eq(1901.536)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          proponent2.reload

          expect(proponent2.inss_aliquot).to eq(7.5)
          expect(proponent2.inss_dedution.to_f).to eq(78.375)
          expect(proponent2.inss_liquid_salary.to_f).to eq(966.625)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          proponent3.reload
          expect(proponent3.inss_aliquot).to eq(12)
          expect(proponent3.inss_dedution.to_f).to eq(250.7532)
          expect(proponent3.inss_liquid_salary.to_f).to eq(1838.8568)
        end
      end

      context "range salary 3134" do
        let!(:proponent1) { create(:proponent, salary: 3134.40) }
        let!(:proponent2) { create(:proponent, salary: 2089.60) }
        let!(:proponent3) { create(:proponent, salary: 3134.41) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          proponent1.reload
          expect(proponent1.inss_aliquot).to eq(12)
          expect(proponent1.inss_dedution.to_f).to eq(376.128)
          expect(proponent1.inss_liquid_salary.to_f).to eq(2758.272)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          proponent2.reload
          expect(proponent2.inss_aliquot).to eq(9)
          expect(proponent2.inss_dedution.to_f).to eq(188.064)
          expect(proponent2.inss_liquid_salary.to_f).to eq(1901.536)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          proponent3.reload
          expect(proponent3.inss_aliquot).to eq(14)
          expect(proponent3.inss_dedution.to_f).to eq(438.8174)
          expect(proponent3.inss_liquid_salary.to_f).to eq(2695.5926)
        end
      end

      context "range salary 6101" do
        let!(:proponent1) { create(:proponent, salary: 6101.06) }
        let!(:proponent2) { create(:proponent, salary: 3134.40) }
        let!(:proponent3) { create(:proponent, salary: 10000.41) }

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent1).call

          proponent1.reload
          expect(proponent1.inss_aliquot).to eq(14)
          expect(proponent1.inss_dedution.to_f).to eq(854.1484)
          expect(proponent1.inss_liquid_salary.to_f).to eq(5246.9116)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent2).call

          proponent2.reload
          expect(proponent2.inss_aliquot).to eq(12)
          expect(proponent2.inss_dedution.to_f).to eq(376.128)
          expect(proponent2.inss_liquid_salary.to_f).to eq(2758.272)
        end

        it "should be return value of inss" do
          klass = described_class.new(proponent: proponent3).call

          proponent3.reload
          expect(proponent3.inss_aliquot).to eq(14)
          expect(proponent3.inss_dedution.to_f).to eq(854.1484000000002)
          expect(proponent3.inss_liquid_salary.to_f).to eq(9146.2616)
        end

      end
    end

    context "fail" do
      let!(:proponent) { create(:proponent, salary: -1044.0) }

      it "should be return error with value negative" do
        klass = described_class.new(proponent: proponent).call

        expect(klass.errors.full_messages).to include("Not saved salary")

        # verify if not save
        proponent.reload
        expect(proponent.inss_aliquot).to be_nil
        expect(proponent.inss_dedution.to_f).to eq(0)
        expect(proponent.inss_liquid_salary.to_f).to eq(0)
      end
    end
  end
end