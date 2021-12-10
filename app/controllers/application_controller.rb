class ApplicationController < ActionController::Base
  helper_method :cms_pages

  $animal_type = 0
  # @@animal_type_static = 0
  $g_category_search = nil

  $contact_page_g = false

  ################################################################
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  # def home; end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up)
  #   devise_parameter_sanitizer.permit(:account_update)
  # end
  ################################################################

  def cms_pages
    Page.all
  end

  def cms_pages_about
    Page.first
  end

  before_action :initialize_session
  helper_method :cart

  def initialize_session
    # $animal_type = 0
    # this will initialize the visit count to zero for new users.
    session[:shopping_cart_cat] ||= [] # empty array of product IDs
    session[:shopping_cart_dog] ||= [] # empty array of product IDs
    session[:shopping_cart_bird] ||= [] # empty array of product IDs
  end

  def cart_cat
    # you can pass an array of ids, and you'll get back a collection/!
    Cat.find(session[:shopping_cart_cat])
    # pass an array of product id's.. get a collection of products!

    # Dog.find(session[:shopping_cart_dog])

    # Bird.find(session[:shopping_cart_bird])
  end

  def cart_dog
    Dog.find(session[:shopping_cart_dog])
  end

  def cart_bird
    Bird.find(session[:shopping_cart_bird])
  end

  def cart
    [cart_cat, cart_dog, cart_bird]
  end

  def search
    # wildcard_search = "%#{params[:keywords]}%"
    # category_search = "%#{params[:category]}%"

    # case category_search
    # when "Cat"
    #   @cats = Cat.where("name LIKE ?", wildcard_search)
    #   puts "🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱..."
    # when "Dog"
    #   @dogs = Dog.where("name LIKE ?", wildcard_search)
    #   puts "🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶..."
    # when "Bird"
    #   @birds = Bird.where("name LIKE ?", wildcard_search)
    #   puts "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜..."
    # when "All"
    #   @cats = Cat.where("name LIKE ?", wildcard_search)
    #   @dogs = Dog.where("name LIKE ?", wildcard_search)
    #   @birds = Bird.where("name LIKE ?", wildcard_search)
    #   puts "🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱🐱..."
    #   puts "🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶..."
    #   puts "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜..."
    # end

    # byebug
    # if category_search == "Cat"
    #   @cats = Cat.where("name LIKE ?", wildcard_search)
    # elsif category_search == "Dog"
    #   @dogs = Dog.where("name LIKE ?", wildcard_search)
    # elsif category_search == "Bird"
    #   @birds = Bird.where("name LIKE ?", wildcard_search)
    # else
    #   @cats = Cat.where("name LIKE ?", wildcard_search)
    #   @dogs = Dog.where("name LIKE ?", wildcard_search)
    #   @birds = Bird.where("name LIKE ?", wildcard_search)
    # end
  end
end
