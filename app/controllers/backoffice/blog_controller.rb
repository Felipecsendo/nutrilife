class Backoffice::BlogController < BackofficeController
  before_action :authenticate_admin!
  before_action :set_categories, only:[:new, :edit]
  before_action :set_blog, only:[:edit, :update, :destroy]
  

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
      helpers.message_notices(@blog)
      render :edit
    end
  end
  
  def destroy
    if @blog.destroy
      redirect_to backoffice_blog_index_path, notice: 'Postagem excluída com sucesso!'
    else
      redirect_to backoffice_blog_index_path, notice: 'Não foi possível realizar esta ação.'
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