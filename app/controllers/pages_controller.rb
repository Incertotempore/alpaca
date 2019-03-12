class PagesController < ApplicationController
  def home
  end

  def about
    redirect_to root_path
  end

  def contacts
  end

  def faq
    # redirect_to root_path
  end

end
