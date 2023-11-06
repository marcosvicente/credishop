class InssCalculationService
  prepend SimpleCommand
  include ActiveModel::Validations

  def initialize(proponent:)
    @proponent = proponent
    @salary = proponent.salary
    @inss = nil
  end

  def call
    base_salary = calculation_base_salary

    return errors if errors.presence
    
    result = {
      dedution: base_salary,
      aliquot: @inss.aliquot,
      liquid_salary: @salary - base_salary,
    }
  end

  def calculation_base_salary
    @inss = get_value_between
    return errors if errors.presence

    if @salary > get_maxium_value_from_inss.to
      @inss.to * ( @inss.aliquot / 100) 
    else
      @salary * (@inss.aliquot / 100) 
    end
  end
  
  def get_maxium_value_from_inss
    Inss.where(to: Inss.maximum(:to)).first
  end
  
  def get_value_between
    inss = Inss.select { |e| (e.from..e.to).include? @salary }

    if inss.blank? && @salary > get_maxium_value_from_inss.to
      return get_maxium_value_from_inss
    end

    errors.add(:base, 'Not calculated salary') if inss.blank?

    inss[0]
  end
end