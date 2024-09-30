# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Admin::Update do
  let(:service_call) { described_class.call(**args) }
  let(:args) { { short:, visits_count: } }
  let(:short) { minimized_url.short }
  let(:minimized_url) { create(:minimized_url) }
  let(:visits_count) { rand(0..10) }

  context 'when url exists an d vistis_count is a new value' do
    it ' updates visits_count' do
      service_call
      expect(MinimizedUrl.last.visits_count).to eq(visits_count)
    end

    context 'when url exists and visits_count is a new value' do
      let(:visits_count) { minimized_url.visits_count }

      it 'updates visits_count' do
        expect { service_call }.not_to change(minimized_url, :visits_count)
      end
    end

    context 'when url does not exist' do
      let(:short) { FFaker::Internet.http_url }

      it 'raises not found error' do
        expect { service_call }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
