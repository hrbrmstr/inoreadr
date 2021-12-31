#' Authenticate to Inoreader's API
#'
#' This uses Inoreader's [OAuth 2.0 endpoint](https://www.inoreader.com/developers/oauth) and
#' MUST be called at the start of a session before any other operations.
#'
#' @return the OAuth token (invisibly). NOTE: You do not need to use this; tis provided merely
#'         as a convenience
#' @export
ino_auth <- function() {

  httr::oauth2.0_token(
    endpoint = inoreadr,
    app = inoreadr_app,
    scope = c("read", "write")
  ) -> token

  .pkg$token <- token

  invisible(token)

}
