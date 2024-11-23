class ResourceNotFoundError < Exception
  attr_reader :message

  def initialize(param_key, param_value)
    @message = "Resource not found with #{param_key} = #{param_value}"
  end
end
