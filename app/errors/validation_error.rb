class ValidationError < Exception
  attr_reader :message, :details

  def initialize(details)
    @message = "Unprocessed entity"
    @details = details
  end
end
