#' Returns the articles for a given collection
#'
#' @param num_items Number of items to return (default `20`, max `1000`). If the value passed is
#'        less than zero or greater than one thousand, 20 and 1000 will be used (respectively).
#' @param order Order. By default, it is `newest` first. You can pass `oldest` here to get oldest first.
#' @param start_time Start time (`POSIXct` or a string that can be converted to `POSIXct`) from
#'        which to start to get items. Defaults to 7 days ago.
#' @param exclude Exclude Target — You can query all items from a feed that are not flagged as read
#'        by setting this to  `user/-/state/com.google/read`. Default is `NULL`.
#' @param include Include Target — You can query for a certain label with this. Accepted values: (e.g.)
#'        `user/-/state/com.google/starred`, `user/-/state/com.google/like`. Default is `NULL`.
#' @param continuation Continuation (default `NULL`) — a string used for continuation process.
#'         Each response returns not all, but only a certain number of items.
#'         Pass the `continuation` value of the returned list (if one exists) to retrieve the
#'         next part of the result set. If there is no `continuation` value, there are no more
#'         feed items left.
#' @param all - set this to `FALSE` (default is `TRUE`) if you want to receive only manually added
#'        tags in the categories list. Otherwise automatically added tags from the folders will be
#'        populated there too.
#' @param annotations - set this to `TRUE` (default is `FALSE`) if you want to get an array of your
#'        annotations for each article.
#' @references [Stream contents](https://www.inoreader.com/developers/stream-contents)
#' @return list with metadata about the result and result items in the `item` slot. See linked
#'         reference for field information.
#' @export
ino_stream_contents <- function(stream_id,
                                num_items = 20L,
                                order = c("newest", "oldest"),
                                start_time = (Sys.time() - 604800),
                                exclude = NULL,
                                include = NULL,
                                continuation = NULL,
                                all = TRUE,
                                annotations = FALSE
) {

  num_items <- as.integer(num_items[1])
  if (num_items < 0L) num_items <- 20L
  if (num_items > 1000L) num_items <- 1000L

  order <- match.arg(order[1], choices = c("newest", "oldest"), several.ok = FALSE)
  if (order == "newest") order <- NULL else order <- "o"

  httr::POST(
    url = "https://www.inoreader.com/reader/api/0/stream/contents/" %s+% stream_id,
    query = list(
      n = num_items,
      r = order[1],
      ot = as.POSIXct(start_time[1]),
      xt = exclude[1],
      it = include[1],
      c = continuation[1],
      includeAllDirectStreamIds = all[1],
      annotations = annotations[1]
    ),
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out

}
