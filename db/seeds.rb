greetings = ['Hello', 'Hi', 'Hey', 'Greetings', 'Bonjour']

greetings.each do |greeting|
  Greeting.create(content: greeting)
end