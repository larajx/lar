#' Read a plate setup from an excel file and convert to tidy format.
#'
#' @param file_path
#' @param sheet
#' @param ...
#'
#' @return a tidy tibble
#' @export
#'
#' @examples
c_readplate <- function(file_path, sheet, range, ...) {

        library(readxl,
                plater,
                readr)

        working_file <-  readxl::read_excel(path = file_path,...)


        file1 <-
                tempfile(pattern = "file1",
                         tmpdir = tempdir(),
                         fileext = ".csv")

        readr::write_csv(
                working_file,
                file = file1,
                na = "",
                )


        final_file <- plater::read_plate(file = file1) # throws an error saying it cannot tell how many columns are in the plate. I wonder if the csv file is including blank spaces, thinking it is data.  unsure how to proceed.
        unlink(file1)
        final_file
}

