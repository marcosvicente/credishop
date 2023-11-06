class InssCreateSalaryService
  prepend SimpleCommand
  include ActiveModel::Validations

  def initialize(proponent:)
    @proponent = proponent
    @salary = proponent.salary
  end

  def call
    inss = InssCalculationService.new(proponent: @proponent).call
    return errors.add(:base, 'Not saved salary') unless inss.success?

    save_proponent_inss_value(inss)
  end
  
  def save_proponent_inss_value(inss)
    ActiveRecord::Base.transaction do
      @proponent.inss_dedution = inss.result[:dedution]
      @proponent.inss_aliquot = inss.result[:aliquot]
      @proponent.inss_liquid_salary = inss.result[:liquid_salary]
      @proponent.save!
    end
  end
end