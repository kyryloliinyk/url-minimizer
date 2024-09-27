# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Admin::Create do
  let(:service_call) { described_class.(origin_url) }
  let(:origin_url) { attributes_for(:minimized_url)[:origin] }

  it 'creates new entity' do
    expect { service_call }.to change(MinimizedUrl, :count).by(1)
  end

  it 'returns created entity' do
    expect(service_call).to be_kind_of(MinimizedUrl)
  end

  it 'creates admin pass' do
    expect(service_call.admin_pass).to be_kind_of(String)
  end
end
