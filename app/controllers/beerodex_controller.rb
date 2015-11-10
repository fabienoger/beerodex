class BeerodexController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    beers = []
    beerodec = Beerodec.by_user_id(current_user.id)
    beerodec.each do |beer|
      beers << beer.beer_id
    end
    @beers = []
    beers.each do |beer_id|
      @beers << Beer.find(beer_id)
    end
  end

  def show
  end

  def create
    beer = Beer.where(["name = ? and degrees = ?", params[:beerodex][:name], params[:beerodex][:degrees]]).first
    if beer
      @beerodec = Beerodec.new(:beer_id => beer.id, :user_id => current_user.id)
      if @beerodec.save
        puts "La bière à bien été ajouté au Beer O' Dex.".green
        flash[:success] = "La bière à bien été ajouté au Beer O' Dex."
      else
        puts "La bière n'a pas été ajouté au Beer O' Dex.".red
        flash[:error] = "La bière n'a pas été ajouté au Beer O' Dex."
      end
    else
      @unregistered_beer = UnregisteredBeer.new(:name => params[:beerodex][:name], :degrees => params[:beerodex][:degrees], :user_id => current_user.id)
      if @unregistered_beer.save
        puts "La bière n'existe pas elle sera vérifiée par un administrateur.".blue
        flash[:info] = "La bière n'existe pas elle sera vérifiée par un administrateur."
      else
        puts "La bière n'existe pas.".yellow
        flash[:info] = "La bière n'existe pas."
      end
    end
    redirect_to '/beerodex'
  end
end
