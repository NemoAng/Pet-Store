class CartController < ApplicationController
  before_action :set_cart, only: %i[show]

  def index
    # @cats = Cat.all
    # byebug
    @cart = session[:shopping_cart_cat]

    # console # Trigger the web console for debugging.
  end

  # POST /cart
  # Data sent as form data(params)
  def create
    # Adds params[:id] to cart
    # the logger will show in the rails server.. super useful for debugging!!
    # logger.debug("Adding #{params[:id]} to cart.")

    # logger.debug params.inspect.to_sp
    id = params[:id].to_i

    # for cat
    session[:shopping_cart_cat] << id # puts onto the array on the end!
    cat = Cat.find(id)
    # flash[:notice] = "➕ #{cat.name} added to cart!"

    # for dog
    # session[:shopping_cart_dog] << id # puts onto the array on the end!
    # dog = Dog.find(id)
    # flash[:notice] = "➕ #{dog.name} added to cart!"

    # for bird
    # session[:shopping_cart_bird] << id # puts onto the array on the end!
    # bird = Bird.find(id)
    # flash[:notice] = "➕ #{bird.name} added to cart!"

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # remove params[:id] from cart
    id = params[:id].to_i

    # for cat
    session[:shopping_cart_cat].delete(id) # puts onto the array on the end!
    cat = Cat.find(id)
    # flash[:notice] = "— #{cat.name} removed from cart!"

    # for dog
    # session[:shopping_cart_dog].delete(id) # puts onto the array on the end!
    # dog = Dog.find(id)
    # flash[:notice] = "— #{dog.name} removed from cart!"

    # for bird
    # session[:shopping_cart_bird].delete(id) # puts onto the array on the end!
    # bird = Bird.find(id)
    # flash[:notice] = "— #{bird.name} removed from cart!"

    redirect_to root_path
  end

  private

  def set_cart
    @cart = Cart.find(params[:shopping_cart_cat])
    # $checkout = 0
  end
end
