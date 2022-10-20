#' Create a dataframe from incucyte raw data and a plater format layout
#'
#' @param incu_data_file_path_txt the file path of the incucyte raw data file.  Make sure it has a header and is in its original txt format.
#' @param plater_layout_file_path_csv The file path of the plater style plate layout csv file.  See plater documentation if you 
#'
#' @return a tidy df ready for analysis.
#'
#' @examples
read_incucyte <- function(incu_data_file_path_txt, plater_layout_file_path_csv, sheet = ) {
      
      # 0 required packages 
      pacman::p_load(
            tidyverse,
            readxl,
            plater,
            janitor
      )
      
      # 1 read in the two files
      plate_data <- read.delim(incu_data_file_path_txt, skip = 6) %>%
      select(!Date.Time) %>% # this vector redundant with 'elapsed' vector
            pivot_longer(cols = !Elapsed, names_to = 'Wells', values_to = 'signal') %>% 
            mutate(Wells = gsub("(?<![0-9])([0-9])(?![0-9])", 
                                "0\\1", 
                                .$Wells, 
                                perl = TRUE)) # str_replace A1-A9 to A01-A09 and so on
      plate_layout <- plater::read_plate(plater_layout_file_path_csv)
      # 2 merge
      plate_df <- plate_layout %>% 
            left_join(plate_data, by = 'Wells') %>% 
            drop_na() %>% 
            janitor::clean_names()
      plate_df
}
