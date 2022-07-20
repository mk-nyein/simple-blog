class Readers::HomeController < ReadersController
  def index
    @posts = Post.published.most_recently_published
    @top_posts = Post.published.top_three_most_liked
  end

  def posts_of_member
    member = Author.find_by(username: params[:username]) || not_found
    @posts = member.posts.published.most_recently_published
  end

end
