# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Destroy do
  let(:called_service) { described_class.call(short) }

  context 'when entity exist' do
    before { create(:minimized_url, short:) }

    let(:short) { attributes_for(:minimized_url)[:short] }

    it 'deletes MinimizedUrl' do
      expect { called_service }.to change(MinimizedUrl, :count).by(-1)
    end
  end

  context 'when entity does not exist' do
    let(:short) { attributes_for(:minimized_url)[:short] }

    it 'deletes MinimizedUrl' do
      expect { called_service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
