class HomeController < ApplicationController
  
  def index
    @blogs = Blog.all
    @categories = Category.all
    @admin = Admin.first
  end
end