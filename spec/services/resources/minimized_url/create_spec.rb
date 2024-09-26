# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Create do
  subject(:called_service) { described_class.call(url) }
  let(:url) { attributes_for(:minimized_url)[:origin] }

  it 'creates new record' do
    expect { called_service }.to change(MinimizedUrl, :count).by(1)
  end

  it 'returns record' do
    expect(called_service).to be_an_instance_of(MinimizedUrl)
  end

  context 'when url is not valid' do
    let(:url) { FFaker::Lorem.word }

    it 'raises expected error' do
      expect { called_service }.to raise_error(ArgumentError)
    end
  end

  context 'when url exists' do
    before { called_service }

    it 'dows not create new record' do
      expect { called_service }.not_to change(MinimizedUrl, :count)
    end
  end
end
