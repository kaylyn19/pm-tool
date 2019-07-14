class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def authenticate!
        if !user_signed_in?
            redirect_to new_sessions_path, alert: "Please sign in first"
        end
    end
end
