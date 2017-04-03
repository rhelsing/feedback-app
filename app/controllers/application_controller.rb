class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_token

  def set_token
    if params[:token]
      @token = params[:token]
    elsif params[:feedback]
      @token = params[:feedback][:token]
    end
  end

end
