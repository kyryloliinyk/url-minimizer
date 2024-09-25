# frozen_string_literal: true

RSpec.describe 'Compression and Decomressin url' do
  let(:compresor) { CompressUrl }
  let(:decompressor) { DecompressUrl }
  let(:origin_url) { FFaker::Internet.http_url }

  it 'creates corre' do
    short = compresor.call(origin_url)
    origin = decompressor.call(short)

    expect(origin).to eq(origin_url)
  end
end
