# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::GetOriginFromShort do
  subject(:called_service) { described_class.call(minimized_url.short) }
  let(:minimized_url) { create(:minimized_url, short:, origin:) }
  let(:short) { CompressUrl.call(origin) }
  let(:origin) { FFaker::Internet.http_url }

  it 'returns origin version of minimized url' do
    expect(called_service).to eq(minimized_url.origin)
  end

  it 'increments counter' do
    init_count = minimized_url.visits_count
    called_service
    new_count = MinimizedUrl.last.visits_count
    expect(init_count + 1).to eq(new_count)
  end
end
