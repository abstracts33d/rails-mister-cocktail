class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  # POST /doses
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail.doses.create!(dose_params)
    redirect_to cocktail_path(params[:cocktail_id])
  end

  # DELETE /doses/1
  def destroy
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
