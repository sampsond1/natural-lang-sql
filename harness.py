from dotenv import load_dotenv
from google import genai
from prompts import *

load_dotenv()

def get_sql_from_nl(user_input):
    prompt = '\n'.join([nl_to_sql, examples1, schema, 'The user input is:', user_input])
    client = genai.Client()

    interaction = client.interactions.create(
        model='gemini-3.5-flash-lite',
        input=prompt
    )

    query, explain = tuple(interaction.output_text.split('```'))[1:]
    if query[0:3] == 'sql':
        query = query[3:]
    if any(['INSERT' in query, 'DELETE' in query, 'DROP TABLE' in query, 'CREATE TABLE' in query]):
        raise Exception('Not a read only query')

    return query, explain

def get_nl_from_sql(user_input, data, explain):
    prompt = '\n'.join([sql_to_nl, examples2, schema, 'User query: ', user_input, 'Data: ', str(data), 'Explanation: ', explain])
    client = genai.Client()
    
    interaction = client.interactions.create(
        model='gemini-3.5-flash-lite',
        input=prompt
    )

    return interaction.output_text