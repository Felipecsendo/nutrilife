class HomeController < ApplicationController
  
  def index
    @blogs = Blog.all
    @categories = Category.all
  end
end