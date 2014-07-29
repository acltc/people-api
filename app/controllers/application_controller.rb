class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  respond_to :json, :xml

  before_action :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => token)
    end
  end

end
