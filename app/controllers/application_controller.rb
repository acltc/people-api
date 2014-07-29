class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  respond_to :json, :xml

  before_filter :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => token)
      # api_key = ApiKey.find_by(access_token: token) 
      # user = api_key && User.find_by(id: api_key.user_id)
      # user && user.email == request.headers["X-User-Email"]
    end
  end

end
