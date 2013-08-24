class RegistrationController < Devise::RegistrationsController

  def new

    @user= User.new
  end

  def create

    @user = User.new
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @user.valid?
    if @user.errors.blank?

      @user.save

      redirect_to home_path
    else
      render :action => "new"
    end
  end

end
