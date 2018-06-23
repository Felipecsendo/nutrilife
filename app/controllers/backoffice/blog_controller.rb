class Backoffice::BlogController < BackofficeController
  before_action :authenticate_admin!

  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
    @categories = Category.all
  end
  
  def create
    @blog = Blog.new(params_blog)
    @blog.admin = current_admin
    
    if @blog.save
      redirect_to backoffice_blog_index_path
    else
      render :new
    end
  end
  
  
  private
  
  def params_blog
    params.require(:blog).permit(:title, :body, :category_id, { images: [] })
  end

end