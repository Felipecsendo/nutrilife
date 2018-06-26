class Backoffice::BlogController < BackofficeController
  before_action :authenticate_admin!
  before_action :set_blog, only:[:edit, :update]
  before_action :set_categories, only:[:new, :edit]

  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
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
  
  def edit
  end
  
  def update
    if @blog.update(params_blog)
      redirect_to backoffice_blog_index_path, notice: 'Postagem editada com sucesso!'
    else
      render :edit
    end
    
  end
  
  private
  
  def set_blog
    @blog = Blog.find params[:id]
  end
  
  def set_categories
    @categories = Category.all
  end
  
  def params_blog
    params.require(:blog).permit(:title, :body, :category_id, { images: [] })
  end

end