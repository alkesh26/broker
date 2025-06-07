module MessageBroker
  class Subscribe
    attr_reader :subscriber_name, :topic_id

    def initialize(subscriber_name, topic_id)
      @subscriber_name = subscriber_name
      @topic_id = topic_id
    end

    def call
      subscriber = Subscriber.find_by!(name: subscriber_name)
      topic = Topic.find(topic_id)

      subscription = Subscription.find_or_create_by!(
        subscriber: subscriber,
        topic: topic
      )

      subscription
    end
  end
end
