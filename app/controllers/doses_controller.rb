class DosesController < ApplicationController
  
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new
  end

  def create
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new(strong_dose_params)
    @dose.cocktail = @cocktail
  	if @dose.save
  	  redirect_to cocktail_path(@cocktail)
    else
    puts @dose.errors.full_messages
    render :new
    end
  end

  def destroy
  	cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.find(params[:id])
  	@dose.destroy
  end

  private

  def strong_dose_params
  	params.require(:dose).permit(:description, :ingredient_id)
  end
end
