module MessageBroker
  class Publish
    attr_reader :publisher_name, :topic_name, :content

    def initialize(publisher_name, topic_name, content)
      @publisher_name = publisher_name
      @topic_name = topic_name
      @content = content
    end

    def call
      topic = Topic.find_by!(name: topic_name)
      message = Message.create!(
        publisher_name: publisher_name,
        topic: topic,
        content: content
      )

      subscribers = topic.subscribers
      subscribers.each do |subscriber|
        subscriber.receive(topic_name, content)
      end

      subscribers.map(&:name)
    end
  end
end
