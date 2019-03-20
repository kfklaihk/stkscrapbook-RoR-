class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [ :new, :create ], raise: false

  def new
  end

  def create
    @user = User.find_by_userid(params[:session][:userid])
    if @user && @user.authenticate(params[:session][:password])
				sign_in(@user)
        flash[:success] = "Welcome back, #{@user.userid}!"
        redirect_to :controller => 'users',:id=>@user.id, :action => 'notebooks'
    else
        flash.now[:error] = "Invalid email/password combination"
        render "new"
    end  	
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
