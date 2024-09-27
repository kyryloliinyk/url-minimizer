# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::GetAll do
  it "calls GetStatistics and returns it's output" do
    stat_data = []
    allow(Resources::MinimizedUrl::GetStatistics).to receive(:call).and_return(stat_data)
    expect(described_class.call).to eq(stat_data)
  end
end
