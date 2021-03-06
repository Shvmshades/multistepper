# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def step2
    @user = User.new
    session[:user] = params[:user]
  end
  
  def step3
    @user = User.new
    user_values = params[:user].to_enum.to_h
    session[:user] = session[:user].merge!(user_values)
  end


  # POST /resource
  def create
#    debugger
    @user = User.new(email: session[:user]["email"], password: session[:user]["password"],name: session[:user]["name"],father_name: session[:user]["father_name"],dob: session[:user]["dob"],address: params[:user]["address"],aadhar_no: params[:user]["aadhar_no"])
    if @user.save
      session[:user] = nil 
      sign_in @user, :bypass => true
      redirect_to user_path
    else 
      redirect_to new_user_registration_path, alert:'something went wrong'
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
