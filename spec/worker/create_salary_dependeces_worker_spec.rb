require 'rails_helper'

RSpec.describe CreateSalaryDependecesWorker, type: :worker do
  let!(:proponent) { create(:proponent) }
  
  it 'worker is enqueued in the default queue' do
    expect(described_class).to receive(:perform_async).once
    described_class.perform_async
    expect(described_class.queue.to_sym).to eq(:base)
  end

  it 'goes into the jobs array for testing environment' do
    expect do
      described_class.perform_async
    end.to change(described_class.jobs, :size).by(1)
  end

  it 'has a enqueued worker' do
    job = described_class.perform_async
    expect(described_class.jobs.last['jid']).to include(job)
  end
end