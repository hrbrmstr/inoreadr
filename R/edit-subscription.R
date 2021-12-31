#' Edit subscription
#'
#' This method is used to rename the subscription, add it to a folder, remove it from folder or
#' unsubscribe from it. You can also subscribe and directly rename it and add it to folder via
#' this method.
#'
#' @param action Action. Can be `edit`, `subscribe`, or `unsubscribe`.
#' @param stream_id Stream ID, e.g. `feed/http://feeds.arstechnica.com/arstechnica/science`
#' @param title Subscription title. Keep `NULL` to keep the title unchanged
#' @param add_to Add subscription to folder. Use full folder name like `user/-/label/Tech`.
#'        Keep `NULL` to leave in place.
#' @param remove_from - Remove subscription from folder. Use full folder name like `user/-/label/Tech`
#'        Keep `NULL` to leave in place.
#' @references [Edit subscription](https://www.inoreader.com/developers/edit-subscription)
#' @return (invisibly) subscription edit request result as a classed (`ino_edit_sub_res`) list
#' @export
ino_edit_subscription <- function(action = c("edit", "subscribe", "unsubscribe"),
                                  stream_id,
                                  title = NULL,
                                  add_to = NULL,
                                  remove_from = NULL
) {

  action <- match.arg(action[1], c("edit", "subscribe", "unsubscribe"), several.ok = FALSE)

  httr::POST(
    url = "https://www.inoreader.com/reader/api/0/subscription/edit",
    query = list(
      ac = action,
      s = stream_id,
      t = title,
      a = add_to,
      r = remove_from
    ),
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  class(out) <- c("ino_edit_sub_res", "character")

  if (out != "OK") warning("Operation unsuccessful.")

  invisible(out)

}
