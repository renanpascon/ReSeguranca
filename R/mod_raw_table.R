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
                                 session,
                                 full_data){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$table <- renderTable(head(full_data))

  })
}

## To be copied in the UI
# mod_raw_table_ui("raw_table_1")

## To be copied in the server
# mod_raw_table_server("raw_table_1")
