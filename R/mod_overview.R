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
    bslib::card(
      bslib::card_header("Select box"),
      shiny::selectInput(
        ns("evento"),
        "Evento",
        choices = NULL,
        selected = NULL
      )),
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

    shiny::observeEvent(r$full_data$evento,{
      shiny::updateSelectInput(inputId = "evento",
                               session = session,
                               choices = unique(r$full_data$evento))
    })

    shiny::observeEvent(input$evento,{
      if (!is.null(input$evento) && input$evento != ""){
        full_data <- r$full_data[r$full_data$evento %in% input$evento,]
      } else {
        full_data <- r$full_data

      }

      mod_raw_table_server(id = "table",
                           input = input,
                           session = session,
                           full_data = full_data)
    })
  })
}

## To be copied in the UI
# mod_overview_ui("overview_1")

## To be copied in the server
# mod_overview_server("overview_1")
