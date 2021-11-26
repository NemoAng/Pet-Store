class ApplicationController < ActionController::Base
  helper_method :cms_pages

  def cms_pages
    Page.all
  end

  def cms_pages_about
    Page.first
  end
end
