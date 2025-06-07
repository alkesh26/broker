class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.find_or_create_by!(name: topic_params[:name])

    flash[:notice] = "Topic #{@topic.name} was successfully created"
    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
