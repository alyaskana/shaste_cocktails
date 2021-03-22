class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def authenticate_user!
    unless current_user
      return render json: {
        error: "You must log in first"
      }, status: 401
    end
  end
end
