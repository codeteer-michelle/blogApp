 class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post =Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
        params.require(:post).permit(:title, :body)
  end
end