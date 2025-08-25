#' raw_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_raw_table_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::tableOutput(ns("table"))

  )
}

#' raw_table Server Functions
#'
#' @noRd
mod_raw_table_server <- function(id,
                                 input,
                                 session,
                                 full_data){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    # browser()

    remove_cols <- sapply(colnames(full_data), FUN = function(x) !all(is.na(full_data[[x]]) | full_data[[x]] %in% ""))
    display_cols <- colnames(full_data)[remove_cols]
    display_cols <- display_cols[!display_cols %in% c("abrangencia","formulario")]
    full_data <- full_data[,display_cols]
    output$table <- renderTable(head(full_data))

  })
}

## To be copied in the UI
# mod_raw_table_ui("raw_table_1")

## To be copied in the server
# mod_raw_table_server("raw_table_1")
