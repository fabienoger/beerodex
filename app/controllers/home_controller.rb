class HomeController < ApplicationController
  def index
  end

  def avatar
    if user_signed_in?
      @user = current_user
    else
      redirect_to '/users/sign_in'
    end
  end

  def create_avatar
    if user_signed_in?
      @user = current_user
      if @user = @user.update( user_params )
        flash[:success] = "L'avatar a bien été ajouté."
      else
        flash[:error] = "L'avatar n'a pas été ajouté."
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
