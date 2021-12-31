#' Retrieve basic information about the logged in user
#'
#' @references [User information](https://www.inoreader.com/developers/user-info)
#' @return (invisibly) user information as a classed (`ino_user`) list
#' @export

ino_user <- function() {

  httr::GET(
    url = "https://www.inoreader.com/reader/api/0/user-info",
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  class(out) <- c("ino_user", "list")

  invisible(out)

}
