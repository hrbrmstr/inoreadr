#' Retrieve unread counters for folders, tags and feeds.
#'
#' @references [Unread counters](https://www.inoreader.com/developers/unread-counts)
#' @return data frame. See linked reference for field definitions and the meaning of the `max` column.
#' @export
ino_unread_counts <- function() {

  httr::GET(
    url = "https://www.inoreader.com/reader/api/0/unread-count",
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out$unreadcounts$max <- (out$unreadcounts$count == as.numeric(out$max))

  out$unreadcounts$newestItemTimestampUsec <- as.numeric(out$unreadcounts$newestItemTimestampUsec) / 1000000
  out$unreadcounts$newestItemTimestampUsec <- anytime::anytime(out$unreadcounts$newestItemTimestampUsec)

  out$unreadcounts

}
