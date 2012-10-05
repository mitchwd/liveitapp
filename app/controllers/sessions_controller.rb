class SessionsController < ApplicationController
  
  def create
    # Line below will raise a page showing the full response of omniauth - good for debug.
    # raise env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in. Hello #{current_user.name}."
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end
end