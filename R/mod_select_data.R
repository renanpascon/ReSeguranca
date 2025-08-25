#' select_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_select_data_ui <- function(id) {
  ns <- NS(id)
  tagList(
    checkboxGroupInput(ns("regioes"),
                       "Regiões",
                       choiceNames = c("Norte","Nordeste","Centro-Oeste","Sudeste","Sul"),
                       choiceValues =
                         list(c("AC","AM","AP","PA", "RO","RR", "TO",NA,NA),
                              c("AL","BA","CE","MA","PB","PE", "PI", "RN","SE"),
                              c("DF", "GO","MS", "MT",NA,NA,NA,NA,NA),
                              c("ES", "MG", "RJ","SP",NA,NA,NA,NA,NA),
                              c( "PR","RS", "SC",NA,NA,NA,NA,NA,NA)),
                       selected = T,
                       inline = FALSE
    ),
    shiny::selectInput(
      ns("uf"),
      "UF",
      choices = "Todos",
      selected = "Todos"
    ),
    shiny::selectInput(
      ns("municipio"),
      "Município",
      choices = "Todos",
      selected = "Todos"
    )
  )
}

#' select_data Server Functions
#'
#' @noRd
mod_select_data_server <- function(id,
                                   session){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    shiny::observeEvent(input$regioes,{

      estados <- c()

      for (i in 1:length(input$regioes)){
        estados_i <- eval(parse(text = paste0(input$regioes[i])))
        estados <- cbind(estados_i,estados)
      }

      shiny::updateSelectInput(inputId = "uf",
                               session = session,
                               choices = estados)
    })

  })
}

## To be copied in the UI
# mod_select_data_ui("select_data_1")

## To be copied in the server
# mod_select_data_server("select_data_1")
