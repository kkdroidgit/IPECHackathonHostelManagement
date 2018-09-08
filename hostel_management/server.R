library(shiny)
library(shinydashboard)

hosteldata <- read.csv("hosteldata.csv", TRUE, ",")

fieldsAll <- c("name", "fatherName", "rollno", "email", "percentage", "gender", "year", "branch", "sec", "category", "religion", "roomType", "building")
fieldsMandatory <- c("name", "fatherName", "rollno", "email", "percentage", "gender", "year", "branch", "sec", "category", "roomType", "building")
responsesDir <- file.path("responses")



epochTime <- function(){
  as.integer(Sys.time())
}

humanTime <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}

saveData <- function(data){
  fileName <- sprintf("%s_%s.csv",
                      humanTime(),
                      digest::digest(data))
  
  write.csv(x = data, file = file.path(responsesDir, fileName),
            row.names = FALSE, quote = TRUE)
}

# data starts

loadData <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  data
}

buildingdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, building == "Aryabhata Bhawan")
  
}

veerbuildingdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, building == "Veer Savakar Bhawan")
  
}

vivekabuildingdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, building == "Vivekanand Bhawan")
  
}

sarobuildingdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, building == "Sarojini Bhawan")
  
}

laxmibuildingdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, building == "Laxmibai Bhawan")
  
}

maledata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, gender == "male")
  
}

femaledata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, gender == "female")
  
}

singledata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, roomType == "Single-Seater")
  
}

doubledata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, roomType == "Double-Seater")
  
}

tripledata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, roomType == "Triple-Seater")
  
}

firstdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, year == 1)
  
}

seconddata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, year == 2)
  
}

thirddata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, year == 3)
  
}

fourthdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, year == 4)
  
}


ecedata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "ECE")
  
}

itdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "IT")
  
}

csdata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "CS")
  
}

medata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "ME")
  
}

endata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "EN")
  
}

civildata <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  subset(data, branch == "Civil")
  
}

yearstats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  table(data$year)
  
}

buildingsstats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  table(data$building)
  
}

roomTypestats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  table(data$roomType)
  
}

branchstats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  table(data$branch)
  
}

genderstats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  table(data$gender)
  
}

applicantsNo <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(data)
  
}

applicantsboys <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, gender == "male"))
  
}

applicantsgirls <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, gender == "female"))
  
}

applicantsSingle <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, roomType == "Single-Seater"))
  
}

applicantsDouble <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, roomType == "Double-Seater"))
  
}

applicantsTriple <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, roomType == "Triple-Seater"))
  
}

applicantscs <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "CS"))
  
}

applicantsece <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "ECE"))
  
}

applicantsit <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "IT"))
  
}

applicantscivil <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "Civil"))
  
}

applicantsme <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "ME"))
  
}

applicantsen <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, branch == "EN"))
  
}

applicantsveer <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, building == "Veer Savakar Bhawan"))
  
}

applicantsarya <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, building == "Aryabhata Bhawan"))
  
}

applicantsvivek <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, building == "Vivekanand Bhawan"))
  
}

applicantssaroj <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, building == "Sarojini Bhawan"))
  
}

applicantslaxmi <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, building == "Laxmibai Bhawan"))
  
}

applicantsfirst <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, year == 1))
  
}
applicantssecond <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, year == 2))
  
}

applicantsthird <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, year == 3))
  
}

applicantsfourth <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  nrow(subset(data, year == 4))
  
}



# data end

shinyServer(function(input, output, session){
  # Dashboard Start
  
  output$totalApplicants <- renderValueBox({
    valueBox(
      value = applicantsNo(),
      subtitle = "No. of Applicants Applied",
      color = "blue",
      icon = icon("user")
    )
  })
  
  output$ApplicantsBoys <- renderValueBox({
    valueBox(
      value = applicantsboys(),
      subtitle = "No. of Boy's Applicants Applied",
      color = "red",
      icon = icon("male")
      
    )
  })
  
  output$ApplicantsGirls <- renderValueBox({
    valueBox(
      value = applicantsgirls(),
      subtitle = "No. of Girl's Applicant Applied",
      color = "green",
      icon = icon("female")
    )
  })
  
  output$SingleRooms <- renderValueBox({
    valueBox(
      value = applicantsSingle(),
      subtitle = "No. of Single Rooms Applicants / 114",
      color = "yellow",
      icon = icon("bed")
      
    )
  })
  
  output$DoubleRooms <- renderValueBox({
    valueBox(
      value = applicantsDouble(),
      subtitle = "No. of Double Rooms Applicants / 79",
      color = "blue",
      icon = icon("bed")
    )
  })
  
  output$TripleRooms <- renderValueBox({
    valueBox(
      value = applicantsTriple(),
      subtitle = "No. of Triple Rooms Applicants / 184",
      color = "orange",
      icon = icon("bed")
    )
  })
  
  output$CSApplicants <- renderValueBox({
    valueBox(
      value = applicantscs(),
      subtitle = "CS Applicants",
      color = "yellow",
      icon = icon("book")
    )
  })
  
  output$ECApplicants <- renderValueBox({
    valueBox(
      value = applicantsece(),
      subtitle = "EC Applicants",
      color = "blue",
      icon = icon("book")
    )
  })
  
  output$ITApplicants <- renderValueBox({
    valueBox(
      value = applicantsit(),
      subtitle = "IT Applicants",
      color = "yellow",
      icon = icon("book")
    )
  })
  
  output$MEApplicants <- renderValueBox({
    valueBox(
      value = applicantsme(),
      subtitle = "ME Applicants",
      color = "purple",
      icon = icon("book")
    )
  })
  
  output$CivilApplicants <- renderValueBox({
    valueBox(
      value = applicantscivil(),
      subtitle = "Civil Applicants",
      color = "orange",
      icon = icon("book")
    )
  })
  
  output$ENApplicants <- renderValueBox({
    valueBox(
      value = applicantsen(),
      subtitle = "EN Applicants",
      color = "green",
      icon = icon("book")
    )
  })
  
  output$building1 <- renderValueBox({
    valueBox(
      value = applicantsveer(),
      subtitle = "Veer Savakar Applicants / 175",
      color = "red",
      icon = icon("building")
    )
  })
  
  output$building2 <- renderValueBox({
    valueBox(
      value = applicantsarya(),
      subtitle = "Aryabhata Applicants / 235",
      color = "blue",
      icon = icon("building")
    )
  })
  
  output$building3 <- renderValueBox({
    valueBox(
      value = applicantsvivek(),
      subtitle = "Vivekanand Applicants / 175",
      color = "yellow",
      icon = icon("building")
    )
  })
  
  output$building4 <- renderValueBox({
    valueBox(
      value = applicantssaroj(),
      subtitle = "Sarojini Applicants / 97",
      color = "purple",
      icon = icon("building")
    )
  })
  
  output$building5 <- renderValueBox({
    valueBox(
      value = applicantslaxmi(),
      subtitle = "Laxmibai Applicants / 139",
      color = "red",
      icon = icon("building")
    )
  })
  
  output$firstyear <- renderValueBox({
    valueBox(
      value = applicantsfirst(),
      subtitle = "First Y Applicants",
      color = "yellow",
      icon = icon("calendar")
    )
  })
  
  output$secondyear <- renderValueBox({
    valueBox(
      value = applicantssecond(),
      subtitle = "Second Y Applicants",
      color = "blue",
      icon = icon("calendar")
    )
  })
  
  output$thirdyear <- renderValueBox({
    valueBox(
      value = applicantsthird(),
      subtitle = "Third Y Applicants",
      color = "purple",
      icon = icon("calendar")
    )
  })
  
  output$fourthyear <- renderValueBox({
    valueBox(
      value = applicantsfourth(),
      subtitle = "Fourth Y Applicants",
      color = "yellow",
      icon = icon("calendar")
    )
  })
  
  # Dashboard End
  
  # Hostel Info Starts
  
  
  output$data <- renderDataTable(hosteldata)
  
  output$stats1 <- renderPlot({
    barplot(hosteldata$Total.Floors, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = c("purple","green", "orange", "yellow"),
            main = "Total No. of Floors",
            border = F)
  })
  
  output$stats2 <- renderPlot({
    barplot(hosteldata$Total.Rooms, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = c("yellow","blue", "purple","green"),
            main = "Total No. of Floors",
            border = F)
  })
  
  output$stats3 <- renderPlot({
    barplot(hosteldata$Single.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = c("yellow","green", "red", "blue"),
            main = "Total No. of Single-Seater Rooms",
            border = F)
  })
  
  output$stats4 <- renderPlot({
    barplot(hosteldata$Double.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = c("yellow","blue", "red", "green"),
            main = "Total No. of Double-Seater Rooms",
            border = F)
  })
  
  output$stats5 <- renderPlot({
    barplot(hosteldata$Triple.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = c("yellow","red", "blue", "purple"),
            main = "Total No. of Triple-Seater Rooms",
            border = F)
  })
  
  # Hostel Info Ends
  
  observe({
    mandatoryFilled <- 
      vapply(fieldsMandatory, 
             function(x){
               !is.null(input[[x]]) && input[[x]] != ""
             }, logical(1))
    mandatoryFilled <- all(mandatoryFilled)
    
    shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
  })
  
  formData <- reactive({
    data <- sapply(fieldsAll, function(x) input[[x]])
    data <- c(data, timestamp = epochTime())
    data <- t(data)
    data
  })
  
  observeEvent(input$submit, {
    shinyjs::disable("submit")
    shinyjs::show("submit_msg")
    shinyjs::hide("error")
    
    tryCatch({
      saveData(formData())
      shinyjs::reset("form")
      shinyjs::hide("form")
      shinyjs::show("thankyou_msg")
    },
    error = function(err){
      shinyjs::html("error_msg", err$message)
      shinyjs::show(id = "error", anim = TRUE, animType = "fade")
    },
    finally = {
      shinyjs::enable("submit")
      shinyjs::hide("submit_msg")
    }
    )
    
  })
  observeEvent(input$submit_another, {
    shinyjs::show("form")
    shinyjs::hide("thankyou_msg")
  })
  
  output$responsesTable <- DT::renderDataTable(
    loadData(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$buildingData <- DT::renderDataTable(
    buildingdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$veerBuildingData <- DT::renderDataTable(
    veerbuildingdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$vivekaBuildingData <- DT::renderDataTable(
    vivekabuildingdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$saroBuildingData <- DT::renderDataTable(
    sarobuildingdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$laxmiBuildingData <- DT::renderDataTable(
    laxmibuildingdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  # Gender
  output$maleData <- DT::renderDataTable(
    maledata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$femaleData <- DT::renderDataTable(
    femaledata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  # Room Types
  
  output$singleData <- DT::renderDataTable(
    singledata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$doubleData <- DT::renderDataTable(
    doubledata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$tripleData <- DT::renderDataTable(
    tripledata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$firstData <- DT::renderDataTable(
    firstdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$secondData <- DT::renderDataTable(
    seconddata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$thirdData <- DT::renderDataTable(
    thirddata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$fourthData <- DT::renderDataTable(
    fourthdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$ECEData <- DT::renderDataTable(
    ecedata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$ITData <- DT::renderDataTable(
    itdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$CSData <- DT::renderDataTable(
    csdata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  output$MEData <- DT::renderDataTable(
    medata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  output$ENData <- DT::renderDataTable(
    endata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  output$CivilData <- DT::renderDataTable(
    civildata(),
    rownames = FALSE,
    options = list(searching = TRUE, lengthChange = FALSE)
  )
  
  # More stats
  
  output$year <- renderPlot({
    barplot(yearstats(), 
            
            ylab = "Year",
            col = c("purple", "red", "blue", "yellow"),
            main = "Year Wise",
            border = F)
    
    
  })
  
  output$buildingwise <- renderPlot({
    barplot(buildingsstats(), 
            
            ylab = "No. of Applicants",
            col = c("yellow", "purple", "blue", "red"),
            main = "Building Wise",
            border = F)
  })
  
  output$roomTypewise <- renderPlot({
    barplot(roomTypestats(), 
            
            ylab = "No. of Applicants",
            col = c("red","yellow", "pink","green"),
            main = "Room Type Wise",
            border = F)
  })
  
  output$branchwise <- renderPlot({
    barplot(branchstats(), 
            
            ylab = "No. of Applicants",
            col = c("orange", "red", "blue", "green"),
            main = "Branch Wise",
            border = F)
  })
  
  output$genderwise <- renderPlot({
    barplot(genderstats(), 
            
            ylab = "No. of Applicants",
            col = c("red", "green", "orange", "yellow"),
            main = "Gender Wise",
            border = F)
  })
  
  output$sshb <- renderPlot({
    pie3D(hosteldata$Single.Seater,
          labels = hosteldata$Hostel.Name,
          explode = 0.1,
          main = "Pie Chart of Single Seater")
  })
  output$dshb <- renderPlot({
    pie3D(hosteldata$Double.Seater,
          labels = hosteldata$Hostel.Name,
          explode = 0.1,
          main = "Pie Chart of Double Seater")
  })
  output$tshb <- renderPlot({
    pie3D(hosteldata$Triple.Seater,
          labels = hosteldata$Hostel.Name,
          explode = 0.1,
          main = "Pie Chart of Triple Seater")
  })
  
  
  
  # download data starts
  output$downloadBtn <- downloadHandler(
    filename = function(){
      paste("studentdata.csv")
    },
    content = function(file){
      write.table(loadData(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadA <- downloadHandler(
    filename = function(){
      paste("aryabhataBhawan.csv")
    },
    content = function(file){
      write.table(buildingdata(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadVeer <- downloadHandler(
    filename = function(){
      paste("veersavakarbhawan.csv")
    },
    content = function(file){
      write.table(veerbuildingdata(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadViveka <- downloadHandler(
    filename = function(){
      paste("vivekanandBhawan.csv")
    },
    content = function(file){
      write.table(vivekabuildingdata(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadSaro <- downloadHandler(
    filename = function(){
      paste("sarojiniBhawan.csv")
    },
    content = function(file){
      write.table(sarobuildingdata(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadLaxmi <- downloadHandler(
    filename = function(){
      paste("sarojiniBhawan.csv")
    },
    content = function(file){
      write.table(sarobuildingdata(), file, sep = ",", row.names = FALSE)
      
    }
  )
  
  output$downloadM <- downloadHandler(
    filename = function(){
      paste("maleApplicants.csv")
    },
    content = function(file){
      write.table(maledata(), file, sep = ",", row.names = FALSE)
      
    }
  )
 
   output$downloadF <- downloadHandler(
    filename = function(){
      paste("femaleApplicants.csv")
    },
    content = function(file){
      write.table(femaledata(), file, sep = ",", row.names = FALSE)
      
    }
  )
   
   output$downloadSingle <- downloadHandler(
     filename = function(){
       paste("single-seaterApplicants.csv")
     },
     content = function(file){
       write.table(singledata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadDouble <- downloadHandler(
     filename = function(){
       paste("double-seaterApplicants.csv")
     },
     content = function(file){
       write.table(doubledata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadTriple <- downloadHandler(
     filename = function(){
       paste("triple-seaterApplicants.csv")
     },
     content = function(file){
       write.table(tripledata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadFirst <- downloadHandler(
     filename = function(){
       paste("first-yearApplicants.csv")
     },
     content = function(file){
       write.table(firstdata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadSecond <- downloadHandler(
     filename = function(){
       paste("second-yearApplicants.csv")
     },
     content = function(file){
       write.table(seconddata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadThird <- downloadHandler(
     filename = function(){
       paste("third-yearApplicants.csv")
     },
     content = function(file){
       write.table(thirddata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadFourth <- downloadHandler(
     filename = function(){
       paste("fourth-yearApplicants.csv")
     },
     content = function(file){
       write.table(fourthdata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadECE <- downloadHandler(
     filename = function(){
       paste("eceApplicants.csv")
     },
     content = function(file){
       write.table(ecedata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadIT <- downloadHandler(
     filename = function(){
       paste("ITApplicants.csv")
     },
     content = function(file){
       write.table(itdata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadCS <- downloadHandler(
     filename = function(){
       paste("CSApplicants.csv")
     },
     content = function(file){
       write.table(csdata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadEN <- downloadHandler(
     filename = function(){
       paste("ENApplicants.csv")
     },
     content = function(file){
       write.table(endata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   output$downloadCivil <- downloadHandler(
     filename = function(){
       paste("CivilApplicants.csv")
     },
     content = function(file){
       write.table(civildata(), file, sep = ",", row.names = FALSE)
       
     }
   )
   
   
  
  # download data ends
  
  
}
)