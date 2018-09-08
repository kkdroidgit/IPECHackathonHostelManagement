library(shiny)
library(shinydashboard)
library(plotrix)


labelMandatory <- function(label){
  tagList(
    label,
    span("*", class= "mandatory_star")
  )
}

appCSS <- ".mandatory_star {color: red;}
            #error {color: red; }
            body { background: #544444; }"

shinyUI(
  dashboardPage( skin = "red",
    dashboardHeader(
      title = "HOSTEL DESK",
      titleWidth = 500
    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem(
          text = "Dashboard",
          tabName = "dashboard",
          icon = icon("rocket"),
          badgeLabel = "new",
          badgeColor = "yellow"
        ),
        
        menuItem(
          text = "Allotment",
          tabName = "allot",
          icon = icon("registered")
        ),
      
        menuItem(
          text = "Students Database",
          
          icon = icon("database"),
          
          menuSubItem("Overview",
                      tabName = "data",
                      
                      icon = icon("table")),
          menuSubItem("Building Stats",
                      tabName = "one",
                      icon = icon("building")),
          menuSubItem("Gender Stats",
                      tabName = "two",
                      icon = icon("users")),
          menuSubItem("Room Type Stats",
                      tabName = "three",
                      icon = icon("bed")),
          menuSubItem("Year Stats",
                      tabName = "four",
                      icon = icon("calendar")),
          menuSubItem("Branch Stats",
                      tabName = "five",
                      icon = icon("book")),
          menuSubItem("More Stats",
                      tabName = "six",
                      icon = icon("bar-chart"))
        ),
        menuItem( "Hostel Info",
        
          icon = icon("info-circle"),
          menuSubItem(
            "Overview",
            tabName = "info",
            icon = icon("table")
          ),
          menuSubItem("Stats",
                      tabName = "stats",
                      icon = icon("line-chart"))
        ),
        menuItem(
          text = "Link to code files",
          href = "https://github.com/kkdroidgit/IPECHackathonHostelManagement",
          icon = icon("code")
        )

      )
    ),
    dashboardBody(
      shinyjs::useShinyjs(),
      shinyjs::inlineCSS(appCSS),
      tabItems(
        tabItem(
          tabName = "dashboard",
          fluidRow(
            valueBoxOutput("totalApplicants", 
                           width = 4),
            valueBoxOutput("ApplicantsBoys", 
                           width = 4),
            valueBoxOutput("ApplicantsGirls",
                           width = 4)
            
          ),
          
          fluidRow(
            valueBoxOutput("SingleRooms", 
                           width = 4),
            valueBoxOutput("DoubleRooms", 
                           width = 4),
            valueBoxOutput("TripleRooms",
                           width = 4)
            
          ),
          
          fluidRow(
            valueBoxOutput("CSApplicants", 
                           width = 2),
            valueBoxOutput("ECApplicants", 
                           width = 2),
            valueBoxOutput("ITApplicants",
                           width = 2),
            valueBoxOutput("MEApplicants",
                           width = 2),
            valueBoxOutput("CivilApplicants",
                           width = 2),
            valueBoxOutput("ENApplicants",
                           width = 2)
            
          ),
          fluidRow(
            valueBoxOutput("building1", 
                           width = 3),
            valueBoxOutput("building2", 
                           width = 2),
            valueBoxOutput("building3",
                           width = 2),
            valueBoxOutput("building4",
                           width = 2),
            valueBoxOutput("building5",
                           width = 3)
            
          ),
          
          fluidRow(
            valueBoxOutput("firstyear", 
                           width = 3),
            valueBoxOutput("secondyear", 
                           width = 3),
            valueBoxOutput("thirdyear",
                           width = 3),
            valueBoxOutput("fourthyear",
                           width = 3)
            
          )
        ),
        
        tabItem(
          tabName = "info",
          
          
            box(
              title = "Hostel Information",
              dataTableOutput("data"),
              solidHeader = T,
              status = "primary",
              width = 12
              
            )
          
        ),
        
        
        
        tabItem(
          tabName = "stats",
          fluidRow(
            box(
              title = "Single Seater Vs Hostel Buildings",
              plotOutput("sshb"),
              solidHeader = T,
              status = "primary",
              width = 4,
              collapsible = T
            ),
            
            box(
              title = "Double Seater Vs Hostel Buildings",
              plotOutput("dshb"),
              solidHeader = T,
              status = "success",
              width = 4,
              collapsible = T
            ),
            box(
              title = "Triple Seater Vs Hostel Buildings",
              plotOutput("tshb"),
              solidHeader = T,
              status = "warning",
              width = 4,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Total No. of Floors",
              plotOutput("stats1"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Total No. of Rooms",
              plotOutput("stats2"),
              solidHeader = T,
              status = "danger",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Total No. of Single-Seater Rooms",
              plotOutput("stats3"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Total No. of Double-Seater Rooms",
              plotOutput("stats4"),
              solidHeader = T,
              status = "primary",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Total No. of Triple-Seater Rooms",
              plotOutput("stats5"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          )
          
        ),
        tabItem(
          tabName = "allot",
          div(
            align = "center",
            id = "heading",
            h2("Allotment of Hostel Rooms for Academic Year 2018-19")
          ),
          
          div(
            align = "center",
            id = "form",
            background = "purple",
            
            fluidRow(
              box(
                title = "Personal Details",
                textInput("name", h3(labelMandatory("Student's Name")), ""),
                textInput("fatherName", h3(labelMandatory("Father's Name")), ""),
                
                textInput("email", h3(labelMandatory("Email Id")), ""),
                checkboxGroupInput("gender", h3(labelMandatory("Select Your Gender")),
                                   choiceNames = 
                                     list(icon("male"), icon("female")),
                                   choiceValues = 
                                     list("male", "female")),
                
                solidHeader = T,
                status = "info",
                width = 6,
                collapsible = T,
                background = "navy"
              ),
              
              box(
                title = "Academic Details",
                textInput("rollno", h3(labelMandatory("RollNo.")), ""),
                textInput("percentage", h3(labelMandatory("Percentage")), ""),
                sliderInput("year", h3(labelMandatory("Year")), 1, 4, 2),
                selectInput("branch", h3(labelMandatory("Select Your Department")),
                            c("", "ECE", "CS", "IT", "ME", "EN", "Civil")),
                checkboxGroupInput("sec", h3(labelMandatory("Select Your Section")),
                                   choiceNames = 
                                     list("A", "B", "C", "D"),
                                   choiceValues = 
                                     list("a", "b", "c", "d")),
                
                
                solidHeader = T,
                status = "info",
                width = 6,
                collapsible = T,
                background = "navy"
              )
            ),
              
            fluidRow(
              box(
                title = "Hostel Preferences",
                selectInput("building", h3(labelMandatory("Select Your Building")),
                            c("", "Aryabhata Bhawan", "Veer Savakar Bhawan", "Vivekanand Bhawan", "Sarojini Bhawan", "Laxmibai Bhawan")),
                
                selectInput("roomType", h3(labelMandatory("Select Your Room Type")),
                            c("", "Single-Seater", "Double-Seater", "Triple-Seater")),
                
                solidHeader = T,
                status = "info",
                width = 6,
                collapsible = T,
                background = "navy"
              ),
              
              
              box(
                title = "Other Details",
                selectInput("category", h3(labelMandatory("Select Your Category")),
                            c("", "General", "SC/ST", "OBC", "Others")),
                selectInput("religion", h3("Select Your Religion"), 
                            c("", "Hindu", "Muslim", "Sikh")),
                solidHeader = T,
                status = "info",
                width = 6,
                collapsible = T,
                background = "navy"
              )
            ),
            
            
            
            
            
            
            actionButton("submit", "Submit", class="btn-primary"),
            
            shinyjs::hidden(
              span(id = "submit_msg", "Submitting..."),
              div(id = "error",
                  div(br(), tags$b("Error: "),
                      span(id = "error_msg")
                  )
              )
            )
          ),
          shinyjs::hidden(
            div(
              id = "thankyou_msg",
              h3("Thanks, your response was submitted successfuly!"),
              actionLink("submit_another", "Submit another response")
            )
          )
        
        ),
        
        tabItem(
          tabName = "data",
          downloadButton("downloadBtn", "Download Students Responses", class="butt1"),
          tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}")),
          br(),
          
          box(
            title = "Applied Students Data",
            DT::dataTableOutput("responsesTable"),
            solidHeader = T,
            status = "success",
            width = 12,
            collapsible = T
            
          )
          
        ),
        tabItem(
          tabName = "one",
          fluidRow(
            downloadButton("downloadA", "Aryabhata Bhawan", class = "butt1"),
            downloadButton("downloadVeer", "Veer Savakar Bhawan", class = "butt1"),
            downloadButton("downloadViveka", "Vivekanand Bhawan", class = "butt1"),
            downloadButton("downloadSaro", "Sarojini Bhawan", class = "butt1"),
            downloadButton("downloadLaxmi", "Laxmibai Bhawan", class = "butt1"),
            tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}"))
          ),
          br(),
          
          
          fluidRow(
            box(
              title = "Aryabhata Bhawan",
              DT::dataTableOutput("buildingData"),
              solidHeader = T,
              status = "warning",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Veer Savakar Bhawan",
              DT::dataTableOutput("veerBuildingData"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Vivekanand Bhawan",
              DT::dataTableOutput("vivekaBuildingData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Sarojini Bhawan",
              DT::dataTableOutput("saroBuildingData"),
              solidHeader = T,
              status = "primary",
              width = 12,
              collapsible = T
            )
          ),
          
          fluidRow(
            box(
              title = "Laxmibai Bhawan",
              DT::dataTableOutput("laxmiBuildingData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          )
          
          
        ),
        
        tabItem(
          tabName = "two",
          fluidRow(
            downloadButton("downloadM", "Male Applicants", class = "butt1"),
            downloadButton("downloadF", "Female Applicants", class = "butt1"),
            
            tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}"))
          ),
          br(),
          
          fluidRow(
            box(
              title = "Male Applicants",
              DT::dataTableOutput("maleData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Female Applicants",
              DT::dataTableOutput("femaleData"),
              solidHeader = T,
              status = "primary",
              width = 12,
              collapsible = T
            )
          )
        ),
        
        tabItem(
          tabName = "three",
          fluidRow(
            downloadButton("downloadSingle", "Single-Seater Applicants", class = "butt1"),
            downloadButton("downloadDouble", "Double-Seater Applicants", class = "butt1"),
            downloadButton("downloadTriple", "Triple-Seater", class = "butt1"),
            tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}"))
          ),
          br(),
          
          fluidRow(
            box(
              title = "Single-Seater Applicants",
              DT::dataTableOutput("singleData"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Double-Seater Applicants",
              DT::dataTableOutput("doubleData"),
              solidHeader = T,
              status = "warning",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Triple-Seater Applicants",
              DT::dataTableOutput("tripleData"),
              solidHeader = T,
              status = "danger",
              width = 12,
              collapsible = T
            )
          )
        ),
        
        tabItem(
          tabName = "four",
          fluidRow(
            downloadButton("downloadFirst", "First Year Applicants", class = "butt1"),
            downloadButton("downloadSecond", "Second Year Applicants", class = "butt1"),
            downloadButton("downloadThird", "Third Year Applicants", class = "butt1"),
            downloadButton("downloadFourth", "Fourth Year Applicants", class = "butt1"),
            tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}"))
          ),
          br(),
          
          fluidRow(
            box(
              title = "First Year Applicants",
              DT::dataTableOutput("firstData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Second Year Applicants",
              DT::dataTableOutput("secondData"),
              solidHeader = T,
              status = "danger",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Third Year Applicants",
              DT::dataTableOutput("thirdData"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Fourth Year Applicants",
              DT::dataTableOutput("fourthData"),
              solidHeader = T,
              status = "primary",
              width = 12,
              collapsible = T
            )
          )
        ),
        tabItem(
          tabName = "five",
          fluidRow(
            downloadButton("downloadECE", "ECE Applicants", class = "butt1"),
            downloadButton("downloadIT", "IT Applicants", class = "butt1"),
            downloadButton("downloadCS", "CS Applicants", class = "butt1"),
            downloadButton("downloadEN", "EN Applicants", class = "butt1"),
            downloadButton("downloadCivil", "Civil Applicants", class = "butt1"),
            tags$head(tags$style(".butt1{background-color:#B00020;} .butt1{color: white;} .butt1{font-family: Aileron Heavy}"))
          ),
          br(),
          
          fluidRow(
            box(
              title = "ECE Applicants",
              DT::dataTableOutput("ECEData"),
              solidHeader = T,
              status = "info",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "IT Applicants",
              DT::dataTableOutput("ITData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "CS Applicants",
              DT::dataTableOutput("CSData"),
              solidHeader = T,
              status = "warning",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "ME Applicants",
              DT::dataTableOutput("MEData"),
              solidHeader = T,
              status = "danger",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "EN Applicants",
              DT::dataTableOutput("ENData"),
              solidHeader = T,
              status = "success",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Civil Applicants",
              DT::dataTableOutput("CivilData"),
              solidHeader = T,
              status = "primary",
              width = 12,
              collapsible = T
            )
          )
          
          
        ),
        tabItem(
          tabName = "six",
          
          fluidRow(
            box(
              title = "Year Wise",
              plotOutput("year"),
              solidHeader = T,
              status = "success",
              width = 6,
              collapsible = T
            ),
            
            box(
              title = "Room Type Wise",
              plotOutput("roomTypewise"),
              solidHeader = T,
              status = "info",
              width = 6,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Building Wise",
              plotOutput("buildingwise"),
              solidHeader = T,
              status = "warning",
              width = 12,
              collapsible = T
            )
          ),
          fluidRow(
            box(
              title = "Branch Wise",
              plotOutput("branchwise"),
              solidHeader = T,
              status = "danger",
              width = 6,
              collapsible = T
            ),
            box(
              title = "Gender Wise",
              plotOutput("genderwise"),
              solidHeader = T,
              status = "success",
              width = 6,
              collapsible = T
            )
          )
        )
        
      )
    )
  )
)