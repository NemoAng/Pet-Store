class CatsController < ApplicationController
  # before_action :set_cat, only: %i[show edit update destroy]
  before_action :set_cat, only: %i[show]

  # GET /cats or /cats.json
  def index
    # @cats = Cat.all
    # byebug
    @cats = Cat.order(:name).page_nemo_method params[:page_haha]

    console # Trigger the web console for debugging.
  end

  # GET /cats/1 or /cats/1.json
  def show
    console
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit; end

  # POST /cats or /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: "Cat was successfully created." }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to @cat, notice: "Cat was successfully updated." }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: "Cat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Search?
  # SELECT name FROM cats
  # WHERE name LIKE '%Hameowlton%'
  def search
    wildcard_search = "%#{params[:keywords]}%"
    $g_category_search = "%#{params[:category]}%"

    case $g_category_search
    when "%Cat%"
      @cats = Cat.where("name LIKE ?", wildcard_search)
      puts "🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱..."
    when "%Dog%"
      @dogs = Dog.where("name LIKE ?", wildcard_search)
      puts "🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶..."
    when "%Bird%"
      @birds = Bird.where("name LIKE ?", wildcard_search)
      puts "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜..."
    else
      @cats = Cat.where("name LIKE ?", wildcard_search)
      @dogs = Dog.where("name LIKE ?", wildcard_search)
      @birds = Bird.where("name LIKE ?", wildcard_search)
      puts "🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱..."
      puts "🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶..."
      puts "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜..."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cat
    @cat = Cat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cat_params
    params.require(:cat).permit(:name, :age, :price, :description)
  end
end
