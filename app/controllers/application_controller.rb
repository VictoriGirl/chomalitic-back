# ApplicationController
class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User

  def index
    render plain: 'API for chromalitic'
  end
end
