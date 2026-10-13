import sqlite3

conn = sqlite3.connect('game_store.db')

with open('create_table.sql', 'r') as file:
    script = file.read()

with sqlite3.connect('game_store.db') as conn:
    c = conn.cursor()
    c.executescript(script)