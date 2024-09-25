# frozen_string_literal: true

RSpec.describe MinimizedUrl do
  subject(:minimized_url) { build(:minimized_url) }

  it { is_expected.to validate_presence_of(:origin) }
  it { is_expected.to validate_uniqueness_of(:origin) }
end
