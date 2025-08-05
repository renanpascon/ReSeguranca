#' read_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_read_data_ui <- function(id) {
  ns <- NS(id)
  tagList(

  )
}

#' read_data Server Functions
#'
#' @noRd
mod_read_data_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns


  })
}

## To be copied in the UI
# mod_read_data_ui("read_data_1")

## To be copied in the server
# mod_read_data_server("read_data_1")
