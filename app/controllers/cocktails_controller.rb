class CocktailsController < ApplicationController
  
  def index
  	@cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
  	@cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def create

    @cocktail = Cocktail.new(strong_cocktail_params)
    if @cocktail.save
  	  redirect_to cocktail_path(@cocktail)
  	else
  	  render :new
  	end

  end

  def destroy
  	@cocktail = Cocktail.find(params[:id])
  	@cocktail.destroy
  	redirect_to cocktails_path
  end

  private

  def strong_cocktail_params
  	params.require(:cocktail).permit(:name, :photo)
  end
end
