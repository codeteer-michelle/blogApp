class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      # render allows us to render a different view within the same controller 
      render 'new'  
      # before we had: redirect_to @post but changed it because that would mean that if (for some reason) your post had a glitch then it would still "auto-save" and keeo you on the same http request. If we put redirect, then you would lose everything because it makes a new http request

    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
        params.require(:post).permit(:title, :body)
  end
end