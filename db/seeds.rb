Topic.find_or_create_by(name: 'X')
Topic.find_or_create_by(name: 'Y')

Subscriber.find_or_create_by(name: 'A')
Subscriber.find_or_create_by(name: 'B')
Subscriber.find_or_create_by(name: 'D')

MessageBroker.subscribe!('A', 'X')
MessageBroker.subscribe!('A', 'Y')
MessageBroker.subscribe!('B', 'X')
MessageBroker.subscribe!('D', 'X')
MessageBroker.subscribe!('B', 'Y')
