class CartController < ApplicationController
  before_action :set_cart, only: %i[show]

  def index
    # @cats = Cat.all
    # byebug
    # @cart = session[:shopping_cart_cat]
    # @cart = session

    console # Trigger the web console for debugging.
  end

  # POST /cart
  # Data sent as form data(params)
  def create
    # Adds params[:id] to cart
    # the logger will show in the rails server.. super useful for debugging!!
    # logger.debug("Adding #{params[:id]} to cart.")

    # logger.debug params.inspect.to_sp
    id = params[:id].to_i

    # byebug # cart_controller.rb

    if $animal_type == "cats"
      puts "π±π±π±π±π±π±π±π±π±π±π±π±π±+"
      session[:shopping_cart_cat] << id
      redirect_to cats_path
    elsif $animal_type == "dogs"
      puts "πΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆ+"
      session[:shopping_cart_dog] << id
      redirect_to dogs_path
    elsif $animal_type == "birds"
      puts "π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦+"
      session[:shopping_cart_bird] << id

      # byebug
      redirect_to birds_path
    else
      puts "π©π©π©π©π©π©π©π©π©π©π©π©π©"
    end

    # byebug

    # for cat
    # session[:shopping_cart_cat] << id # puts onto the array on the end!

    # cat = Cat.find(id)
    # flash[:notice] = "β #{cat.name} added to cart!"

    # for dog
    # session[:shopping_cart_dog] << id # puts onto the array on the end!
    # dog = Dog.find(id)
    # flash[:notice] = "β #{dog.name} added to cart!"

    # for bird
    # session[:shopping_cart_bird] << id # puts onto the array on the end!
    # bird = Bird.find(id)
    # flash[:notice] = "β #{bird.name} added to cart!"

    # byebug
    # redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # remove params[:id] from cart
    id = params[:id].to_i

    if $animal_type == "cats"
      puts "π±π±π±π±π±π±π±π±π±π±π±π±π±-"
      session[:shopping_cart_cat].delete(id)
      redirect_to cats_path
    elsif $animal_type == "dogs"
      puts "πΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆπΆ-"
      session[:shopping_cart_dog].delete(id)
      redirect_to dogs_path
    elsif $animal_type == "birds"
      puts "π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦π¦-"
      session[:shopping_cart_bird].delete(id)
      redirect_to birds_path
    else
      puts "π©π©π©π©π©π©π©π©π©π©π©π©π©"
    end

    # for cat
    ## session[:shopping_cart_cat].delete(id) # puts onto the array on the end!
    # cat = Cat.find(id)
    # flash[:notice] = "β #{cat.name} removed from cart!"

    # for dog
    # session[:shopping_cart_dog].delete(id) # puts onto the array on the end!
    # dog = Dog.find(id)
    # flash[:notice] = "β #{dog.name} removed from cart!"

    # for bird
    # session[:shopping_cart_bird].delete(id) # puts onto the array on the end!
    # bird = Bird.find(id)
    # flash[:notice] = "β #{bird.name} removed from cart!"

    # redirect_to root_path
  end

  private

  def set_cart
    @cart_cat = Cart.find(params[:shopping_cart_cat])

    @cart_dog = Cart.find(params[:shopping_cart_dog])

    @cart_bird = Cart.find(params[:shopping_cart_bird])
  end
end
