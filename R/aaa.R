httr::user_agent(
  sprintf(
    "inoreadr R package v%s: (<%s>)",
    utils::packageVersion("inoreadr"),
    utils::packageDescription("inoreadr")$URL
  )
) -> .INOREADR_UA

.pkg <- new.env(parent = emptyenv())

httr::oauth_endpoint(
  request = NULL,
  authorize = "https://www.inoreader.com/oauth2/auth",
  access = "https://www.inoreader.com/oauth2/token"
) -> inoreadr

httr::oauth_app(
  appname = "inoreadr",
  key = "1000005232",
  secret = "tkCnq3X58IQlUOdLQIsdP7DNeIpJ4rlD"
) -> inoreadr_app
