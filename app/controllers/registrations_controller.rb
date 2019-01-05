class RegistrationsController < Devise::RegistrationsController
  def create
    @secretcode = SecretCode.where(code: params[:secret_code],user_id: nil).first
    build_resource(sign_up_params)
    if @secretcode.blank?
    	flash.now[:alert] = "Secret Code not found"
    	return render :new 
    end	
		if resource.save
      @secretcode.update(user_id:resource.id)
			sign_in(resource)
			redirect_to controller: :home,action: :index
		else
    	return render :new 
		end
	end
	protected
	  def sign_up_params
      params.require(:user).permit(:first,:last,:email,:password,:password_confirmation)
    end
end