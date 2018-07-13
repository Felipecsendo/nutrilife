class Blog::SearchController < BlogController
  
  def by_date
    date = params[:date].to_datetime
    @posts = Post.where(created_at: date.all_day)
  end
end