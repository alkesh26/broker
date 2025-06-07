class MessagesController < ApplicationController
  def new
    @topics = Topic.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @topics = Topic.all

    @message.save!
    @recipients = MessageBroker::Publish.new(
      @message.publisher_name,
      @message.topic.name,
      @message.content
    ).call

    flash.now[:notice] = "Message published to topic #{@message.topic.name}"
    render :new
  end

  def demo
    MessageBroker::Subscribe.new("A", "X").call
    MessageBroker::Subscribe.new("A", "Y").call
    MessageBroker::Subscribe.new("B", "X").call
    MessageBroker::Publish.new("C", "X", "Hello").call
    MessageBroker::Subscribe.new("D", "X").call
    MessageBroker::Subscribe.new("B", "Y").call
    MessageBroker::Publish.new("A", "X", "Hi").call

    render plain: "Messages published. Check logs."
  end

  private

  def message_params
    params.require(:message).permit(:topic_id, :publisher_name, :content)
  end
end
