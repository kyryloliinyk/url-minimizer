# frozen_string_literal: true

RSpec.describe DeleteUnusedUrls do
  before do
    create_list(:minimized_url, 3, visits_count: 2)
    create_list(:minimized_url, 2)
  end

  it 'delets unused urls' do
    described_class.call

    expect(MinimizedUrl.count).to eq(3)
  end
end
