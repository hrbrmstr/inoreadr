#' Subscribe to feeds
#'
#' @param feed to subscribe to (e.g. `feed/http://feeds.arstechnica.com/arstechnica/science`)
#' @references [Add subscription](https://www.inoreader.com/developers/add-subscription)
#' @return (invisibly) subscription request result as a classed (`ino_sub_res`) list
#' @export
ino_add_feed <- function(feed) {

  httr::POST(
    url = "https://www.inoreader.com/reader/api/0/subscription/quickadd",
    query = list(
      quickadd = feed[1]
    ),
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  class(out) <- c("ino_sub_res", "list")

  if (out$numResults == 0) warning("Operation unsuccessful. Feed not added.")

  invisible(out)

}
