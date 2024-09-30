# frozen_string_literal: true

# MiniimizedUrl entity serialier
class MinimizedUrlSerializer < ActiveModel::Serializer
  attributes :short, :origin, :visits_count
end
