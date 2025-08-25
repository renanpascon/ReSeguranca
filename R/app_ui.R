#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {

  tagList(
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      bslib::page_sidebar(
        title = "Segurança",
        sidebar = bslib::sidebar(
          mod_select_data_ui("select")
          ),
      mod_overview_ui("overview")))
  )

}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ReSeguranca"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
