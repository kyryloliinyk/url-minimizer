# frozen_string_literal: true

FactoryBot.define do
  factory :minimized_url do
    sequence(:origin) { |n| "#{FFaker::Internet.http_url}-#{n}" }
  end
end
