#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  ns <- session$ns

  board <- pins::board_folder(path = "inst/pins/")
  df <- pins::pin_read(board, "full_data")

# browser()
  r <- shiny::reactiveValues()
  r[["full_data"]] <- df

  mod_raw_table_server("view",
                       session = session,
                       full_data = r$full_data)


}
