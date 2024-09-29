# frozen_string_literal: true

# MiniimizedUrl entity serialier
class AdminMinimizedUrlSerializer < ActiveModel::Serializer
    attributes :short, :origin, :visits_count, :admin_pass
  end
  