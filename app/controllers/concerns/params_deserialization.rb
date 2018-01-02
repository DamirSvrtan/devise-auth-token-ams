module ParamsDeserialization
  def deserialized_params
    ActionController::Parameters.new(ActiveModelSerializers::Deserialization.jsonapi_parse(params))
  end
end
