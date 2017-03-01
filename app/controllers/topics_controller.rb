class TopicsController < ApplicationController
  before_action :set_params, only: [:show, :update, :edit, :destroy]
  def index
    @topic = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
   if @topic.save
     redirect_to topics_path
     flash[:notice] = "You've published your topic successfully."
   else
     render 'new'
   end
  end

  def show
  end

  def update
    if @topic.update(topic_params)
     redirect_to topics_path
     flash[:notice] = "You've updated your topic successfully."
   else
     render 'new'
   end
  end

  def edit
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
    flash[:notice] = "You've deleted your topic successfully."
  end

private
  def set_params
    @topic = Topic.find(params[:id])
  end

  def topic_params
     params.require(:topic).permit(:title)
  end
end
