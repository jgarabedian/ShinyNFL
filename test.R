library(nflscrapR)

week_2_games <- scrape_game_ids(2018, weeks = 2)
week_2_games %>%
  pander::pander()