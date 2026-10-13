from harness import *
import sqlite3

while True:
    print('############################################')
    print('ASK A QUESTION:')
    user_input = input()
    if user_input.upper() in ['Q', 'QUIT']:
        print('############################################')
        break
    if user_input == '':
        continue
    else:
        sql_query, explanation = get_sql_from_nl(user_input)
        with sqlite3.connect('game_store.db') as conn:
            c = conn.cursor()
            data = c.execute(sql_query).fetchall()
            c.close()

        nl_response = get_nl_from_sql(user_input, data, explanation)
        print()
        print(nl_response)