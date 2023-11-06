class CreateSalaryDependecesWorker
  include Sidekiq::Worker
  sidekiq_options queue: :base
  sidekiq_options retry: 0

  def perform(proponent_id)
    proponent = Proponent.find(proponent_id)
    InssCreateSalaryService.new(proponent: proponent).call
  end
end