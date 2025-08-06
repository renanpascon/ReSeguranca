#' overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_overview_ui <- function(id) {
  ns <- NS(id)
  tagList(
    mod_raw_table_ui(ns("table"))

  )
}

#' overview Server Functions
#'
#' @noRd
mod_overview_server <- function(id,
                                session,
                                r){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    mod_raw_table_server(id = "table",
                         session = session,
                         full_data = r$full_data)
  })
}

## To be copied in the UI
# mod_overview_ui("overview_1")

## To be copied in the server
# mod_overview_server("overview_1")
