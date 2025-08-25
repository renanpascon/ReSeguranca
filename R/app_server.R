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
  r[["full_data"]] <- data.table::setDT(df)

  mod_overview_server(id = "overview",
                      session = session,
                      r = r)

  mod_select_data_server(id = "select",
                     session = session)



}
