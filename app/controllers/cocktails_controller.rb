class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @doses = Dose.all
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(parmas[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
