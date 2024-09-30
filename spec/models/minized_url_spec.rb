# frozen_string_literal: true

RSpec.describe MinimizedUrl do
  subject(:minimized_url) { build(:minimized_url) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:origin) }
    it { is_expected.to validate_uniqueness_of(:origin).case_insensitive }
    it { is_expected.to validate_presence_of(:short) }
    it { is_expected.to validate_uniqueness_of(:short).case_insensitive }

    it 'validates origin to be valid' do
      mini_url = build(:minimized_url, origin: FFaker::Lorem.word)
      mini_url.valid?
      expect(mini_url.errors.messages).to eq({ origin: ['must be a valid URL'] })
    end
    it 'validates short to be valid' do
      mini_url = build(:minimized_url, short: FFaker::Lorem.word)
      mini_url.valid?
      expect(mini_url.errors.messages).to eq({ short: ['must be a valid URL'] })
    end
  end
end
