class Readers::HomeController < ReadersController
  def index
    @posts = Post.published.most_recently_published
    @top_posts = Post.published.top_three_most_liked
  end
end
