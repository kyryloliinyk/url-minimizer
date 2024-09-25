# frozen_string_literal: true

FactoryBot.define do
  factory :minimized_url do
    sequence(:origin) { |n| "#{FFaker::Lorem.word}-#{n}" }
  end
end
