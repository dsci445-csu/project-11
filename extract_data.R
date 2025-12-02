library(DBI)
library(RSQLite)
library(tidyverse)

# Connect to the SQLite database
con <- dbConnect(SQLite(), "database.sqlite")

# See all tables in the database
dbListTables(con)

# Export needed tables
match <- dbReadTable(con, "Match")
write_csv(match, "Match.csv")

team <- dbReadTable(con, "Team")
write_csv(team, "Team.csv")

team_attr <- dbReadTable(con, "Team_Attributes")
write_csv(team_attr, "Team_Attributes.csv")

# Disconnect from the database
dbDisconnect(con)
