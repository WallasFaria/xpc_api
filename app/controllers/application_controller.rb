class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :set_default_format

  private

  def set_default_format
    allowed_accepts = [ "application/json", "application/xml" ]
    request.format = :json unless allowed_accepts.include? request.headers[:accept]
  end

  def render_error(error, status:)
    render partial: "shared/error", locals: { error: error }, status: status
  end
end
