class CatBreedsController < ApplicationController
  before_action :set_cat_breed, only: %i[ show edit update destroy ]

  # GET /cat_breeds or /cat_breeds.json
  def index
    @cat_breeds = CatBreed.all
  end

  # GET /cat_breeds/1 or /cat_breeds/1.json
  def show
  end

  # GET /cat_breeds/new
  def new
    @cat_breed = CatBreed.new
  end

  # GET /cat_breeds/1/edit
  def edit
  end

  # POST /cat_breeds or /cat_breeds.json
  def create
    @cat_breed = CatBreed.new(cat_breed_params)

    respond_to do |format|
      if @cat_breed.save
        format.html { redirect_to @cat_breed, notice: "Cat breed was successfully created." }
        format.json { render :show, status: :created, location: @cat_breed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_breeds/1 or /cat_breeds/1.json
  def update
    respond_to do |format|
      if @cat_breed.update(cat_breed_params)
        format.html { redirect_to @cat_breed, notice: "Cat breed was successfully updated." }
        format.json { render :show, status: :ok, location: @cat_breed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_breeds/1 or /cat_breeds/1.json
  def destroy
    @cat_breed.destroy
    respond_to do |format|
      format.html { redirect_to cat_breeds_url, notice: "Cat breed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_breed
      @cat_breed = CatBreed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_breed_params
      params.require(:cat_breed).permit(:name, :description)
    end
end
