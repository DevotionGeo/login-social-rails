class SessionsController < ApplicationController
  def create
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>><"
    puts env['omniauth.auth'].provider.inspect
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
