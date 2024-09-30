# frozen_string_literal: true

# frozent_string_literal: true

RSpec.describe AppSetting do
  it 'only one record can exits' do
    described_class.create

    second = described_class.new
    second.valid?

    expect(second.errors.messages).to eq({ base: ['Only one Settings record is allowed'] })
  end
end
