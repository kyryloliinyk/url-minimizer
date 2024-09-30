# frozen_string_literal: true

# Base app controller to inherit shared behaviour from
class ApplicationController < ActionController::API
  private

  def serialized(serializer, entity)
    serializer.new(entity).as_json
  end

  def serialized_collection(serializer, collection)
    ActiveModelSerializers::SerializableResource.new(collection, each_serializer: serializer)
  end
end
