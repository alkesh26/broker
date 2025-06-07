class SubscribersController < ApplicationController
  def new
    @topics = Topic.all
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.find_or_create_by!(name: subscriber_params[:name])

    MessageBroker::Subscribe.new(@subscriber.name, subscriber_params[:topic_id]).call
    flash[:notice] = "Subscriber #{@subscriber.name} successfully subscribed"
    redirect_to root_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :topic_id)
  end
end 