# UI
# ==============================================================================

ui <- pageWithSidebar(

  # Application title.
  headerPanel("Super Human"),

  # sideBar with control widgets.
  sidebarPanel(width = 2,
    tags$img(src = "Wellcome.png"), tags$hr(),
    fileInput("path", label = "Data File", accept = c(".csv"))
  ),

  # mainPanel with tabPanels.
  mainPanel(
    tabsetPanel(type = "pills", selected = "Mental Skill",
      tabPanel("About", includeMarkdown("./include/about.md")),
      tabPanel("Mental Skill", plotOutput("mental")),
      tabPanel("Physical Skill", plotOutput("physical"))
    )
  )
)
