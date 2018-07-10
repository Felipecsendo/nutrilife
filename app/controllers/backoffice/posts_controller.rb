class Backoffice::PostsController < BackofficeController
  before_action :authenticate_admin!
  before_action :set_categories, only:[:new, :edit]
  before_action :set_post, only:[:edit, :update, :destroy]
  

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.admin = current_admin
    
    if @post.save
      redirect_to  backoffice_posts_path
    else
      helpers.message_notices(@post)
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to  backoffice_posts_path, notice: 'Postagem editada com sucesso!'
    else
      helpers.message_notices(@post)
      render :edit
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to  backoffice_posts_path, notice: 'Postagem excluída com sucesso!'
    else
      redirect_to  backoffice_posts_path, notice: 'Não foi possível realizar esta ação.'
    end
  end
  
  private
  
  def set_post
    @post = Post.find params[:id]
  end
  
  def set_categories
    @categories = Category.all
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :category_id, { images: [] })
  end

end