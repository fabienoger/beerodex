class BeerController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def destroy_unregistered_beer
    @beer = UnregisteredBeer.find(params[:id]).destroy
    redirect_to '/admin/unregistered-beer'
  end

  def create_unregistered_beer
    @beer = Beer.new(:name => params[:beer][:name], :degrees => params[:beer][:degrees], :country => params[:beer][:country], :quality_hangover => params[:beer][:quality_hangover], :technical_sheet => params[:beer][:technical_sheet])
    if @beer.save
      @unregistered_beer = UnregisteredBeer.find(params[:id]).destroy
      flash[:success] = "La bière à bien été enregistré."
    else
      flash[:error] = "La bière n'a pas été enregistré."
    end
    redirect_to '/admin/unregistered-beer/'
  end

  def add_unregistered_beer
    @beer = UnregisteredBeer.find(params[:id])
  end

  def unregistered_beer
    @unregistered_beer = UnregisteredBeer.all
  end

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(:name => params[:beer][:name], :degrees => params[:beer][:degrees], :country => params[:beer][:country], :quality_hangover => params[:beer][:quality_hangover], :technical_sheet => params[:beer][:technical_sheet])
    if @beer.save
      flash[:success] = "La bière à bien été enregistré."
    else
      flash[:error] = "La bière n'a pas été enregistré."
    end
    redirect_to '/admin/beers'
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.name = params[:beer][:name]
    @beer.degrees = params[:beer][:degrees]
    @beer.country = params[:beer][:country]
    @beer.quality_hangover = params[:beer][:quality_hangover]
    @beer.technical_sheet = params[:beer][:technical_sheet]
    if @beer.save
      flash[:success] = "La bière à bien été modifié."
      redirect_to '/admin/beers'
    else
      flash[:error] = "La bière n'a pas été modifié."
      redirect_to request.referer || '/admin/beers'
    end
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    if beer.save
      flash[:success] = "La bière à bien été supprimé."
    else
      flash[:error] = "La bière n'a pas été supprimé."
    end
    redirect_to '/admin/beers'
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
