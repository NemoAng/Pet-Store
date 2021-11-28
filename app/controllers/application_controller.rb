class ApplicationController < ActionController::Base
  helper_method :cms_pages

  def cms_pages
    Page.all
  end

  def cms_pages_about
    Page.first
  end

  before_action :initialize_session
  helper_method :cart

  def initialize_session
    # this will initialize the visit count to zero for new users.
    session[:shopping_cart_cat] ||= [] # empty array of product IDs
    # session[:shopping_cart_dog] ||= [] # empty array of product IDs
    # session[:shopping_cart_bird] ||= [] # empty array of product IDs
  end

  def cart
    # you can pass an array of ids, and you'll get back a collection!
    Cat.find(session[:shopping_cart_cat])
    # pass an array of product id's.. get a collection of products!

    # Dog.find(session[:shopping_cart_dog])

    # Bird.find(session[:shopping_cart_bird])
  end
end
