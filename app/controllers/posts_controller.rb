class PostsController < ApplicationController
  before_action :set_postparams, only: [:index, :create,:new,:show, :update, :edit, :destroy]

  def index
    @post = @topic.posts.all
  end

  def new
    @post = @topic.posts.build
  end

  def create
    @post = @topic.posts.create(post_params)
    @post.save
    redirect_to topic_path(@topic)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     redirect_to topic_path(@topic)
     flash[:notice] = "You've updated your post successfully."
   else
     render 'new'
   end
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to topic_path(topic)
    flash[:notice] = "You've deleted your post successfully."
  end

  private
    def set_postparams
      @topic = Topic.find(params[:topic_id])
    end

    def post_params
       params.require(:post).permit(:content)
    end
end
