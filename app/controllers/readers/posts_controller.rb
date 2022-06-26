module Readers
  class PostsController < ReadersController
    before_action :authenticate_author!, only: ['upvote', 'downvote']
    def show
      @post = Post.published.find(params[:id])
    end

    def upvote
      @post = Post.find(params[:id])
      @post.upvote_by current_author
      redirect_back fallback_location: root_path
    end

    def downvote
      @post = Post.find(params[:id])
      @post.downvote_by current_author
      redirect_back fallback_location: root_path
    end
  end
end