class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  def show
    @dose = Dose.new
    @review = Review.new
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  # POST /cocktails
  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.rating = 0
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # PATCH/PUT /cocktails/1
  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail
    else render :edit
    end
  end

  # DELETE /cocktails/1
  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  def search
    query = "%#{params[:search]}%"
    c = Cocktail.arel_table
    i = Ingredient.arel_table

    @cocktails =  Cocktail.joins(:doses, :ingredients).where(
      c[:name].matches(query).
      or(i[:name].matches(query))
    ).distinct

    if  @cocktails.nil?
      redirect_to root_path
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses, :ingredients, :rating, :photo)
  end
end
