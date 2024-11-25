class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  ###
  # hook que faz com que o método :set_default_format seja
  # executado antes de qualquer action de qualquer controller
  before_action :set_default_format

  protected

  ###
  # método para renderizar a view compartilhada de erros,
  # podendo ser acessado por qualquer controller que herde dessa classe
  def render_error(error, status:)
    render partial: "shared/error", locals: { error: error }, status: status
  end

  private

  ###
  # Define o formato de resposta padrão.
  # Caso não seja solicitado um dos formatos aceitos,
  # o formato JSON é definido por padrão
  def set_default_format
    allowed_accepts = [ "application/json", "application/xml" ]
    request.format = :json unless allowed_accepts.include? request.headers[:accept]
  end
end
