import nltk
from nltk.chat.util import Chat, reflections

# Define patterns for the chatbot
patterns = [
    (r'hi|hello|hey', ['Hello!', 'Hi there!']),
    (r'how are you', ['I am good, thank you. How are you?']),
    (r'what is your name', ['I am a chatbot.']),
    (r'bye|goodbye', ['Goodbye!', 'See you later.']),
]

# Create a chatbot with defined patterns
chatbot = Chat(patterns, reflections)

# Start the chat
print("Hello! I'm a simple chatbot. You can type 'bye' to exit.")
while True:
    user_input = input("You: ")
    response = chatbot.respond(user_input)
    print("Chatbot:", response)
    if user_input.lower() == 'bye':
        break