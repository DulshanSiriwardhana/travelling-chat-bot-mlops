from travel_chatbot_app import process_query_simple

def chatbot_main(user_input):
    result = process_query_simple(user_input)
    return result['response']
