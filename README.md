# blit
Label your bank transactions using SQL

blit will:

- Ingest your bank transactions into PostgreSQL
- Map them to a common format, where you can query them.
- Label your bank transactions using SQL statements that you defined
- Run a few basic reports, plus any reports that you defined. Each report will result in one table, your "visualisation"
- If you want, you could connect a dashboard tool to those tables. Unless you are happy enough looking at tables ;-)

Supported bank formats until now:

- ASN Bank CSV format ~2019
- Rabobank CSV format ~2019

You are free to expand the code with other formats
"""
