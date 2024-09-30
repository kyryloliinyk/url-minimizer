# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::GetStatistics do
  subject(:called_service) { described_class.call }

  before do
    create_list(:minimized_url, 2)
  end

  it { is_expected.to be_an(Array) }
  it { expect(called_service.size).to eq(2) }

  it 'has expected structure and elements' do
    called_service.each do |element|
      expect(element).to be_a(Hash)
      expect(element).to include('short', 'visits_count')
    end
  end
end
