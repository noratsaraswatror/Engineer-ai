class ApplicationController < ActionController::Base
	#before_action :check_secret_code, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end


  protected

	def check_secret_code
		# if !params[:secret_code].blank? && params[:secret_code] != "foobar"
		# 	flash[:notice] = 'Secret Code not matched.'
		# 	redirect_to '/users/sign_up'
		# end
	end
	
 


end 
