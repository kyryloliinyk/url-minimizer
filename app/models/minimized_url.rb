# frozen_string_literal: true

# Represents shortened link entity with additional attrs
class MinimizedUrl < ApplicationRecord
  validates :origin, presence: true, uniqueness: true
end
