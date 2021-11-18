class BirdBreedsController < ApplicationController
  before_action :set_bird_breed, only: %i[ show edit update destroy ]

  # GET /bird_breeds or /bird_breeds.json
  def index
    @bird_breeds = BirdBreed.all
  end

  # GET /bird_breeds/1 or /bird_breeds/1.json
  def show
  end

  # GET /bird_breeds/new
  def new
    @bird_breed = BirdBreed.new
  end

  # GET /bird_breeds/1/edit
  def edit
  end

  # POST /bird_breeds or /bird_breeds.json
  def create
    @bird_breed = BirdBreed.new(bird_breed_params)

    respond_to do |format|
      if @bird_breed.save
        format.html { redirect_to @bird_breed, notice: "Bird breed was successfully created." }
        format.json { render :show, status: :created, location: @bird_breed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bird_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bird_breeds/1 or /bird_breeds/1.json
  def update
    respond_to do |format|
      if @bird_breed.update(bird_breed_params)
        format.html { redirect_to @bird_breed, notice: "Bird breed was successfully updated." }
        format.json { render :show, status: :ok, location: @bird_breed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bird_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bird_breeds/1 or /bird_breeds/1.json
  def destroy
    @bird_breed.destroy
    respond_to do |format|
      format.html { redirect_to bird_breeds_url, notice: "Bird breed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird_breed
      @bird_breed = BirdBreed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bird_breed_params
      params.require(:bird_breed).permit(:name, :description)
    end
end
