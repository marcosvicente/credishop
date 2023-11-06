class CreateSalaryDependecesWorker
  include Sidekiq::Worker

  sidekiq_options queue: :base

  def perform(proponent_id)
    proponent = Proponent.find(proponent_id)
    InssCreateSalaryService.new(proponent: proponent).call
  end
end