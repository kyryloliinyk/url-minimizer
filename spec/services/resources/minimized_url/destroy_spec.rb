# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Destroy do
  let(:called_service) { described_class.call(**args) }
  let(:args) { { short_url:, admin_pass: } }
  let(:admin_pass) { nil }

  context 'when entity exist' do
    before { create(:minimized_url, short: short_url, admin_pass: admin_password) }
    let(:admin_pass) { FFaker::Lorem.word }
    let(:admin_password) { admin_pass }

    let(:short_url) { attributes_for(:minimized_url)[:short] }

    it 'deletes MinimizedUrl' do
      expect { called_service }.to change(MinimizedUrl, :count).by(-1)
    end

    context 'when password invalid' do
      let(:admin_password) { FFaker::Lorem.word }

      it 'does not delete MinimizedUrl' do
        expect { called_service }.to raise_error(ArgumentError, 'invalid password')
      end
    end
  end

  context 'when entity does not exist' do
    let(:short_url) { attributes_for(:minimized_url)[:short] }

    it 'deletes MinimizedUrl' do
      expect { called_service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
