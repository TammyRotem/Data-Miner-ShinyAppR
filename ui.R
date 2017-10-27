

shinyUI(fluidPage(theme="bootstrap.css",
                  navbarPage("Tammy's Data Miner",
                             tabPanel("Home",
                                      fluidRow(
                                        column(6, textOutput("Today_Date"),
                                               fileInput("file1", "Get some numbers to crunch!", accept = c(
                                                 "text/csv",
                                                 "text/comma-separated-values,text/plain",
                                                 ".csv"),placeholder = "Upload any csv file")
                                        ),#End of left column in first row in home tab
                                        
                                        
                                        column(6,
                                               div(style="font-weight:bold;color:#000000;
                                                   background-color:#ffffff;border-style:solid;border-color:#000000;padding:5px;",
                                                   h1("Welcome to Tammy's Data Miner Shiny App!"),p("Use the Browse button to upload a data file
                                                      to play with (csv/txt). Go to the Analyzer Tab to check out the metadata or the Visualizer Tab
                                                      to generate some charts!"),br(),p("The app is not perfect yet (I'm thin on spare time) so if it freezes hit refresh! :)"),tags$br(),
                                                   textOutput("file_name"),
                                                   textOutput("file_num_rec"),
                                                   textOutput("file_num_field"))
                                        )#End of right column in first row in home tab
                                        
                                      ),#End of first row in home tab
                                      fluidRow(dataTableOutput("new_data"),
                                               dataTableOutput("my_data"))#End of second row in home tab
                             ),#end of Home tab panel
                             
                             tabPanel("Analyzer",
                                      dataTableOutput("stats")), #End of Analyzer tab panel
                             tabPanel("Visualizer",
                                      fluidRow(
                                        h1("Visualize your data")),
                                      fluidRow(column(6,
                                                      p("Start by selecting a type of plot and then plug in the variables"),
                                                      br(),
                                                      selectInput("plots", "Select a plot type", choices=c("Bar Chart"="bar",
                                                                                                           "Scatter Plot"="scatter",
                                                                                                           "Heat Map"="heat"), multiple = FALSE )
                                                      ),
                                               column(6))
                 
                                      
                                      ),#END OF vISUALIZER TAB PANEL
                             textOutput("Today_Date")
                             
                  )#end of navbar page
)#end of fluid page
)#end of ShinyUI