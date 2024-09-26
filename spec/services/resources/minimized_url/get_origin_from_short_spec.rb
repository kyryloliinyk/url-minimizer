# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::GetOriginFromShort do
  subject(:called_service) { described_class.call(short_url) }
  let(:short_url) { minimized_url.short }
  let(:minimized_url) { build(:minimized_url) }

  skip 'returns origin version of minimized url' do
    expect(called_service).to eq(minimized_url.origin)
  end
end
