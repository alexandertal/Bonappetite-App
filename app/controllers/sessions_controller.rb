class SessionsController < ApplicationController



  def new
end

def create
  @user = User.
          find_by(username: params[:username]).
          try(:authenticate, params[:password])

    return render action: 'signin' unless @user

    session[:user_id] = @user.id
    redirect_to pictures_path
end



def destroy
    session[:user_id] = nil
    redirect_to '/'
end

end
