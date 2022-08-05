# get twitter access
twitter_token <- rtweet::rtweet_bot(
  api_key       = Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  api_secret    = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token  = Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret = Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

# calculate days since SBXXX (Jan 28 1996)
days <- (Sys.Date() - as.Date("1996-01-28")) |>
  as.numeric() |>
  format(big.mark = ",")

# write tweet
tweet <- paste(days, "days since the Dallas Cowboys won a Super Bowl")

# send tweet
rtweet::post_tweet(
  status = tweet,
  token = twitter_token
)