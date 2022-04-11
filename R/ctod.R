#' Write out dataframe to the desktop
#'
#' @param df Name of object.  Can be anything like a dataframe, tibble, etc.
#'
#' @return
#' @export
#'
#' @examples
ctod <- function(df) {

        path_name <- str_c("/Users/luisrodriguez/Desktop/", substitute(df), ".csv")
        write.csv(df, path_name)
}

