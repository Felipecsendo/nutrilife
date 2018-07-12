class Blog::HomeController < BlogController
  def index
    @posts = Post.all
    @categories = Category.all
    @admin = Admin.first
  end
end
