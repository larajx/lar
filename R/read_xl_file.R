#' Read All Worksheets of an Excel File into a List
#'
#' @param xl_file_path file path of the xlsx file you are importing.
#'
#' @return a list with each entry as a tibble matching each imported sheet, with the sheetname as the title.
#'
#'derived from a post online:  https://statisticsglobe.com/read-all-worksheets-of-excel-file-into-list-in-r
#'
#' @examples
read_xl_file <- function(xl_file_path) {
      pacman::p_load(readxl,
                     tidyverse)
      sheet_names <- excel_sheets(xl_file_path)
      
      list_all <- lapply(sheet_names, function(x) { # Read all sheets to list
            tibble(read_excel(xl_file_path, sheet = x)) } )
      
      names(list_all) <- sheet_names 
      
      list_all
}