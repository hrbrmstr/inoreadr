#' Fetches the current folders and tags for the logged-in user
#'
#' @param types (lgl) if `TRUE` (the default) the item type will be included in the result
#' @param counts (lgl) if `TRUE` (the default) unread counts for tags and active searches will be included
#'        in the result
#' @references [Folders and tags list](https://www.inoreader.com/developers/tag-list)
#' @return data frame. See linked reference for field definitions.
#' @export
ino_folder_tag_list <- function(types = TRUE, counts = TRUE) {

  httr::POST(
    url = "https://www.inoreader.com/reader/api/0/tag/list",
    query = list(
      types = if (types[1]) 1 else 0,
      counts = if (counts[1]) 1 else 0
    ),
    httr::config(token = .pkg$token)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out$tags

}
