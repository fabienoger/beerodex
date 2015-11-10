class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def check_admin
    if current_user.admin?
      return true
    else
      redirect_to '/'
    end
  end
end
