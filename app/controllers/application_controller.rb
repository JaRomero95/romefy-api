class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :on_parameter_missing

  def on_parameter_missing(exception)
    render json: {exception.param => 'is required'}, status: 422
  end
end
