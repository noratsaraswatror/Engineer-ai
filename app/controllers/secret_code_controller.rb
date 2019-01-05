class SecretCodeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  protect_from_forgery

  def generate_secret_codes
    (1..params[:count].to_i).each do |count|
      charset = Array('A'..'Z') + Array('a'..'z')  + Array('0'..'9')
      code =   Array.new(16) { charset.sample }.join
    	@secret_code = SecretCode.new(code: code)
    	@secret_code.save(validate: false)
    end
    redirect_to action: :index
  end

  def index
    @secret_codes = SecretCode.all
  end

  protected
  def check_admin
      if !current_user.admin?
      redirect_to root_path
    end
  end
end
