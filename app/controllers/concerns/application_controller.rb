class ApplicationController < ActionController::Base
    helper_method :current_user
    def cureent_user
    @current_user ||= User.first
    end
end
