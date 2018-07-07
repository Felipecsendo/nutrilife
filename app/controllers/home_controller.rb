class HomeController < ApplicationController
  layout 'site'
  def index
    @posts = Post.all
    @categories = Category.all
    @admin = Admin.first
  end
end
