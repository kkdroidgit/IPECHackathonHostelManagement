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
  data$year
  
}

buildingsstats <- function(){
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  data$building
  
}




# data end

shinyServer(function(input, output, session){
  # Dashboard Start
  
  output$totalBuildings <- renderValueBox({
    valueBox(
      value = 5,
      subtitle = "No. of Hostel Buildings",
      color = "yellow",
      icon = icon("building")
    )
  })
  
  output$buildingsBoys <- renderValueBox({
    valueBox(
      value = 3,
      subtitle = "No. of Boy's Hostel Buildings",
      color = "blue",
      icon = icon("building")
      
    )
  })
  
  output$buildingsGirls <- renderValueBox({
    valueBox(
      value = 2,
      subtitle = "No. of Girl's Hotel Buildings",
      color = "purple",
      icon = icon("building")
    )
  })
  
  output$totalRooms <- renderValueBox({
    valueBox(
      value = 500,
      subtitle = "No. of Rooms in Hostels",
      color = "yellow",
      icon = icon("bed")
      
    )
  })
  
  output$RoomsBoys <- renderValueBox({
    valueBox(
      value = 300,
      subtitle = "No. of Rooms in Boys Hostel",
      color = "blue",
      icon = icon("bed")
    )
  })
  
  output$RoomsGirls <- renderValueBox({
    valueBox(
      value = 200,
      subtitle = "No. of Rooms in girls Hostel",
      color = "purple",
      icon = icon("bed")
    )
  })
  
  output$singleRooms <- renderValueBox({
    valueBox(
      value = 100,
      subtitle = "No. of Single- Seater Rooms",
      color = "yellow",
      icon = icon("bed")
    )
  })
  
  output$singleBoys <- renderValueBox({
    valueBox(
      value = 50,
      subtitle = "No. of Single-Seater Rooms in Boy's Hostel",
      color = "blue",
      icon = icon("bed")
    )
  })
  
  output$singleGirls <- renderValueBox({
    valueBox(
      value = 50,
      subtitle = "No. of Single-Seater Rooms in Girl's Hostel",
      color = "purple",
      icon = icon("bed")
    )
  })
  
  output$doubleRooms <- renderValueBox({
    valueBox(
      value = 150,
      subtitle = "No. of Double- Seater Rooms",
      color = "yellow",
      icon = icon("bed")
    )
  })
  
  output$doubleBoys <- renderValueBox({
    valueBox(
      value = 100,
      subtitle = "No. of Double-Seater Rooms in Boy's Hostel",
      color = "blue",
      icon = icon("bed")
    )
  })
  
  output$doubleGirls <- renderValueBox({
    valueBox(
      value = 50,
      subtitle = "No. of Double-Seater Rooms in Girl's Hostel",
      color = "purple",
      icon = icon("bed")
    )
  })
  
  output$tripleRooms <- renderValueBox({
    valueBox(
      value = 250,
      subtitle = "No. of Triple- Seater Rooms",
      color = "yellow",
      icon = icon("bed")
    )
  })
  
  output$tripleBoys <- renderValueBox({
    valueBox(
      value = 150,
      subtitle = "No. of Triple-Seater Rooms in Boy's Hostel",
      color = "blue",
      icon = icon("bed")
    )
  })
  
  output$tripleGirls <- renderValueBox({
    valueBox(
      value = 100,
      subtitle = "No. of Triple- Seater Rooms in Girl's Hostel",
      color = "purple",
      icon = icon("bed")
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
            col = "purple",
            main = "Total No. of Floors",
            border = F)
  })
  
  output$stats2 <- renderPlot({
    barplot(hosteldata$Total.Rooms, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = "yellow",
            main = "Total No. of Floors",
            border = F)
  })
  
  output$stats3 <- renderPlot({
    barplot(hosteldata$Single.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = "yellow",
            main = "Total No. of Single-Seater Rooms",
            border = F)
  })
  
  output$stats4 <- renderPlot({
    barplot(hosteldata$Double.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = "yellow",
            main = "Total No. of Double-Seater Rooms",
            border = F)
  })
  
  output$stats5 <- renderPlot({
    barplot(hosteldata$Triple.Seater, 
            names.arg = hosteldata$Hostel.Name,
            xlab = "Hostel Names",
            ylab = "No. of Floors",
            col = "yellow",
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
            names.arg = buildingsstats(),
            xlab = "Hostel Names",
            ylab = "Year",
            col = "purple",
            main = "Hostel Building Vs Year",
            border = F)
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