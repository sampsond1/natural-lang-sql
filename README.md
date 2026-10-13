# Natural Language-AI Interface

For my database modeling class project in October 2026, I did a short project creating a basic harness for Google Gemini's free Flash 3.5 model to read a database of fake store data and respond naturally to user queries. While the scope is admittedly small and there are many improvements to be made, I'm proud of how in less than 5 hours I coded a simple harness from the ground up.

## AI Use
All Python and all prompts were written by me without any AI generation. The fake data was AI generated.

## Features
- Ask about the database and get your answer in plain English!
- Protects against basic prompt injection and off-topic questions

## Skills
- Google Gemini API
- Prompt engineering

## Guide
- Run `main.py` to see it in action!
- `create_table.py` and `create_table.sql` will create the included `game_store.db` file.
- `prompts.py` are all the handwritten prompts and examples.
- `harness.py` is the API work