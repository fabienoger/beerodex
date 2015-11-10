class BeerodexController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
  end

  def show
  end

  def create
    beer = Beer.where(["name = ? and degrees = ?", params[:beerodex][:name], params[:beerodex][:degrees]]).first
    if beer
      @unregistered_beer = UnregisteredBeer.new(:name => params[:beerodex][:name], :degrees => params[:beerodex][:degrees], :user_id => current_user.id)
      if @unregistered_beer.save
        flash[:success] = "La bière à bien été ajouté au Beer O' Dex."
      else
        flash[:error] = "La bière n'a pas été ajouté au Beer O' Dex."
      end
    else
      flash[:info] = "La bière n'existe pas elle sera vérifiée par un administrateur."
    end
    redirect_to '/beerodex'
  end
end
