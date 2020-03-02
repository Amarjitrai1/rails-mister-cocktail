class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    if
    @dose.save
      redirect_to cocktail_doses_path(@dose)
    else
      render 'new'
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
