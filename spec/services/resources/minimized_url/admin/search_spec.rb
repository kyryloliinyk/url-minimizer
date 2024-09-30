# frozen_string_literal: true

RSpec.describe Resources::MinimizedUrl::Admin::Search do
  let(:service_call) { described_class.call(search_term) }

  let(:search_term) { "#{FFaker::Internet.http_url}-#{FFaker::Lorem.word}" }

  before do
    create_list(:minimized_url, 3)

    2.times do |n|
      create(:minimized_url, short: "#{search_term}-#{FFaker::Lorem.word}-#{n}")
    end
  end

  it 'returns rigth count of entities' do
    expect(service_call.length).to eq(2)
  end

  it 'correct entities' do
    names = service_call.map(&:short)

    expect(names.all? { |name| name.include?(search_term) }).to equal(true)
  end
end
