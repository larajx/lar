#' Read a plate setup from an excel file and convert to tidy format.  [UNDER CONSTRUCTION]
#'
#' @param file_path
#' @param sheet
#' @param ...
#'
#' @return a tidy tibble
#' @export
#'
#' @examples
c_readplate <- function(file_path, sheet, ...) {

        library(readxl,
                plater)

        working_file <-  readxl::read_excel(path = file_path, ...)


        file1 <-
                tempfile(pattern = "file1",
                         tmpdir = tempdir(),
                         fileext = ".csv")

        write.table(
                working_file,
                file = file1,
                row.names = FALSE,
                na = "",
                sep = ","
        )


        final_file <- plater::read_plate(file = file1)
        unlink(file1)
        final_file
}
