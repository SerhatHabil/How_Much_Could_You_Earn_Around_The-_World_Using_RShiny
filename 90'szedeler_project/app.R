library(ggplot2)
library(plotly)
library(shiny)
getwd()
setwd("C:/Users/Cesur/Desktop/Serhat Habil Çelik/STAT 292/Final Project/90'szedeler_project")

doksanzedeler <- read.csv("292Data.csv", header = F, dec = "," , sep = ";")

colnames(doksanzedeler) <- c("Country", "Equivalent", "Average Salaries", "Cost of Live", "Job")

doksanzedeler$`Cost of Live` <- as.numeric(doksanzedeler$`Cost of Live`)

ui <- fluidPage(theme = bslib::bs_theme(bootswatch = "sketchy"),
                navbarPage("HOW MUCH COULD YOU EARN AROUND THE WORLD ?",
                           tabsetPanel(
                             tabPanel("Description",
                                      mainPanel(
                                        tabsetPanel(type = "tabs",
                                                    tabPanel("Introduction",
                                                             h5("Our data consists of 700 rows and 5 columns.",style = "font-size:120%"),
                                                             h5("The first column shows the name of country.",style = "font-size:120%"),
                                                             h5("The second column shows equivalent salariesfor each country for each job.",style = "font-size:125%"),
                                                             h5("The third columnn shows average salaries for each country for each job.",style = "font-size:125%"),
                                                             h5("The fourth column shows cost of live for each country for each job.",style = "font-size:125%"),
                                                             h5("And the last column shows the name of the jobs.",style = "font-size:125%"),
                                                             h5("Here is the data we have used for this project.", style = "font-size:125%"),
                                                             h5("https://business.yell.com/sme-insight/how-much-could-you-earn-around-the-world/?Accountant#view", style = "font-size:125%"),
                                                             
                                                    ),
                                                    
                                                    tabPanel("Aim",
                                                             h5("In this project, our aim is to make an easy and quick portrayal of how much people could earn in different countries according to their professions and how their lifestyles can be in accordance with their earnings.",style = "font-size:125%"),
                                                             h5("With this app, you will be able to see average salaries for different countries and jobs.",style = "font-size:125%"),
                                                             
                                                    ),
                                                    tabPanel("Contributors",mainPanel(
                                                      HTML('<center><img src="project.jpg"></center>')
                                                    )
                                                    
                                                    ),
                                                    
                                        )
                                        
                                      )),
                             
                             tabPanel("Jobs",
                                      sidebarLayout(sidebarPanel(radioButtons("Jobs", "Choose a job",
                                                                              c("Accountant"="Acc", 
                                                                                "Bricklayer"="Bric",
                                                                                "Builder"="Build", 
                                                                                "Dentist"="Dent",
                                                                                "Doctor"="Doc",
                                                                                "Driving Instructor"="Dri",
                                                                                "Engineer"="Engi",
                                                                                "Estate Agent"="Estate",
                                                                                "Florist"="Flor",
                                                                                "Graphic Designer"="Graph",
                                                                                "Hairdresser"="Hair",
                                                                                "HR Consultant"="HR",
                                                                                "IT Technician"="IR",
                                                                                "Journalists"="Jour",
                                                                                "Nurse"="Nurse",
                                                                                "Personal Trainer"="Personal",
                                                                                "Pharmacist"="Pharmacist",
                                                                                "Photographer"="Photo",
                                                                                "Plumbers"="Plumb",
                                                                                "Recruitment Consultant"="Recru",
                                                                                "Retail Management"="Retail",
                                                                                "Sales Assistant"="Sales",
                                                                                "Solicitor"="Solic",
                                                                                "Taxi Driver"="Taxi",
                                                                                "Teacher"="Teacher",
                                                                                "Truck Driver"="Truck",
                                                                                "Web Developer"="Web",
                                                                                "Window Cleaner"="Window")),
                                      ),
                                      mainPanel(
                                        tabsetPanel(type = "tabs",
                                                    tabPanel("Plot", plotlyOutput("plot1")),
                                                    tabPanel("Summary", verbatimTextOutput("summary1")),
                                        )
                                        
                                      )
                                      
                                      )),
                             tabPanel("Countries",
                                      sidebarLayout(sidebarPanel(radioButtons("Countries", "Choose a country",
                                                                              c("China"="China", 
                                                                                "Saudi Arabia"="SaudiArabia",
                                                                                "Switzerland"="Switzerland", 
                                                                                "France"="France",
                                                                                "Japan"="Japan",
                                                                                "Brazil"="Brazil",
                                                                                "Thailand"="Thailand",
                                                                                "Spain"="Spain",
                                                                                "Belgium"="Belgium",
                                                                                "USA"="USA",
                                                                                "Portugal"="Portugal",
                                                                                "UK"="UK",
                                                                                "Austraila"="Australia",
                                                                                "Germany"="Germany",
                                                                                "Greece"="Greece",
                                                                                "South Korea"="SouthKorea",
                                                                                "Canada"="Canada",
                                                                                "Ireland"="Ireland",
                                                                                "South Africa"="SouthAfrica",
                                                                                "Netherlands"="Netherlands",
                                                                                "Italy"="Italy",
                                                                                "Russia"="Russia",
                                                                                "Norway"="Norway",
                                                                                "New Zealand"="NewZealand",
                                                                                "Poland"="Poland"))),
                                                    
                                                    mainPanel(
                                                      tabsetPanel(type = "tabs",
                                                                  tabPanel("Plot", plotlyOutput("plot2")),
                                                                  tabPanel("Summary", verbatimTextOutput("summary2")),
                                                      )
                                                      
                                                    )
                                      )),
                             
                             tabPanel("Linear Regression Between Cost Of Live and Average Salaries",
                                      sidebarLayout(sidebarPanel(radioButtons("Reg", "Choose a job",
                                                                              c("Accountant"="A", 
                                                                                "Bricklayer"="B",
                                                                                "Builder"="C", 
                                                                                "Dentist"="D",
                                                                                "Doctor"="E",
                                                                                "Driving Instructor"="f",
                                                                                "Engineer"="G",
                                                                                "Estate Agent"="H",
                                                                                "Florist"="I",
                                                                                "Graphic Designer"="J",
                                                                                "Hairdresser"="K",
                                                                                "HR Consultant"="L",
                                                                                "IT Technician"="M",
                                                                                "Journalists"="N",
                                                                                "Nurse"="O",
                                                                                "Personal Trainer"="P",
                                                                                "Pharmacist"="R",
                                                                                "Photographer"="S",
                                                                                "Plumbers"="t",
                                                                                "Recruitment Consultant"="U",
                                                                                "Retail Management"="V",
                                                                                "Sales Assistant"="Y",
                                                                                "Solicitor"="Z",
                                                                                "Taxi Driver"="Q",
                                                                                "Teacher"="W",
                                                                                "Truck Driver"="AA",
                                                                                "Web Developer"="BB",
                                                                                "Window Cleaner"="CC"))),
                                                    mainPanel(
                                                      tabsetPanel(
                                                        tabPanel("Plot", plotlyOutput("plot3")),
                                                        tabPanel("Linear Regression",verbatimTextOutput("Lm")),
                                                      )
                                                      
                                                    )
                                      )),
                             tabPanel("Data Summary And Structure Of The Data",
                                      sidebarLayout(sidebarPanel(),
                                                    mainPanel(
                                                      tabsetPanel(
                                                        tabPanel("Structure of Data", verbatimTextOutput("Str")),
                                                        tabPanel("Summary of the Data",verbatimTextOutput("Summaryy")),
                                                      )
                                                      
                                                    )
                                                    
                                      )),
                             
                             
                             
                           )
                )
)



server <- function(input, output) {
  d <- reactive({
    Jobs <- switch(input$Jobs,
                   Acc=subset(doksanzedeler,subset = Job == "Accountant",select = c("Country","Average Salaries")),
                   Bric=subset(doksanzedeler,subset = Job == "Bricklayer",select = c("Country","Average Salaries")),
                   Build=subset(doksanzedeler,subset = Job == "Builder",select = c("Country","Average Salaries")),
                   Dent=subset(doksanzedeler,subset = Job == "Dentist",select = c("Country","Average Salaries")),
                   Doc=subset(doksanzedeler,subset = Job == "Doctor",select = c("Country","Average Salaries")),
                   Dri=subset(doksanzedeler,subset = Job == "Driving Instructors",select = c("Country","Average Salaries")),
                   Engi=subset(doksanzedeler,subset = Job == "Engineer",select = c("Country","Average Salaries")),
                   Estate=subset(doksanzedeler,subset = Job == "Estate Agent",select = c("Country","Average Salaries")),
                   Flor=subset(doksanzedeler,subset = Job == "Florists",select = c("Country","Average Salaries")),
                   Graph=subset(doksanzedeler,subset = Job == "Graphic Designers",select = c("Country","Average Salaries")),
                   Hair=subset(doksanzedeler,subset = Job == "Hairdressers",select = c("Country","Average Salaries")),
                   HR=subset(doksanzedeler,subset = Job == "HR Consultants",select = c("Country","Average Salaries")),
                   IR=subset(doksanzedeler,subset = Job == "IT Technicians",select = c("Country","Average Salaries")),
                   Jour=subset(doksanzedeler,subset = Job == "Journalists",select = c("Country","Average Salaries")),
                   Nurse=subset(doksanzedeler,subset = Job == "Nurses",select = c("Country","Average Salaries")),
                   Personal=subset(doksanzedeler,subset = Job == "Personal Trainers",select = c("Country","Average Salaries")),
                   Pharmacist=subset(doksanzedeler,subset = Job == "Pharmacists",select = c("Country","Average Salaries")),
                   Photo=subset(doksanzedeler,subset = Job == "Photographers",select = c("Country","Average Salaries")),
                   Plumb=subset(doksanzedeler,subset = Job == "Plumbers",select = c("Country","Average Salaries")),
                   Recru=subset(doksanzedeler,subset = Job == "Recruitment Consultants",select = c("Country","Average Salaries")),
                   Retail=subset(doksanzedeler,subset = Job == "Retail Managers",select = c("Country","Average Salaries")),
                   Sales=subset(doksanzedeler,subset = Job == "Sales Assistants",select = c("Country","Average Salaries")),
                   Solic=subset(doksanzedeler,subset = Job == "Solicitors",select = c("Country","Average Salaries")),
                   Taxi=subset(doksanzedeler,subset = Job == "Taxi Drivers",select = c("Country","Average Salaries")),
                   Teacher=subset(doksanzedeler,subset = Job == "Teachers",select = c("Country","Average Salaries")),
                   Truck=subset(doksanzedeler,subset = Job == "Truck Drivers",select = c("Country","Average Salaries")),
                   Web=subset(doksanzedeler,subset = Job == "Web Developers",select = c("Country","Average Salaries")),
                   Window=subset(doksanzedeler,subset = Job == "Window Cleaners",select = c("Country","Average Salaries")),
    )
  })
  e <- reactive({switch(
    Countries <- input$Countries,
    China=subset(doksanzedeler,subset = Country == "China",select = c("Job","Average Salaries")),
    SaudiArabia=subset(doksanzedeler,subset = Country == "Saudi Arabia",select = c("Job","Average Salaries")),
    Switzerland=subset(doksanzedeler,subset = Country == "Switzerland",select = c("Job","Average Salaries")),
    France=subset(doksanzedeler,subset = Country == "France",select = c("Job","Average Salaries")),
    Japan=subset(doksanzedeler,subset = Country == "Japan",select = c("Job","Average Salaries")),
    Brazil=subset(doksanzedeler,subset = Country == "Brazil",select = c("Job","Average Salaries")),
    Thailand=subset(doksanzedeler,subset = Country == "Thailand",select = c("Job","Average Salaries")),
    Spain=subset(doksanzedeler,subset = Country == "Spain",select = c("Job","Average Salaries")),
    Belgium=subset(doksanzedeler,subset = Country == "Belgium",select = c("Job","Average Salaries")),
    USA=subset(doksanzedeler,subset = Country == "USA",select = c("Job","Average Salaries")),
    Portugal=subset(doksanzedeler,subset = Country == "Portugal",select = c("Job","Average Salaries")),
    UK=subset(doksanzedeler,subset = Country == "UK",select = c("Job","Average Salaries")),
    Australia=subset(doksanzedeler,subset = Country == "Australia",select = c("Job","Average Salaries")),
    Germany=subset(doksanzedeler,subset = Country == "Germany",select = c("Job","Average Salaries")),
    Greece=subset(doksanzedeler,subset = Country == "Greece",select = c("Job","Average Salaries")),
    SouthKorea=subset(doksanzedeler,subset = Country == "South Korea",select = c("Job","Average Salaries")),
    Canada=subset(doksanzedeler,subset = Country == "Canada",select = c("Job","Average Salaries")),
    Ireland=subset(doksanzedeler,subset = Country == "Ireland",select = c("Job","Average Salaries")),
    SouthAfrica=subset(doksanzedeler,subset = Country == "South Africa",select = c("Job","Average Salaries")),
    Netherlands=subset(doksanzedeler,subset = Country == "Netherlands",select = c("Job","Average Salaries")),
    Italy=subset(doksanzedeler,subset = Country == "Italy",select = c("Job","Average Salaries")),
    Russia=subset(doksanzedeler,subset = Country == "Russia",select = c("Job","Average Salaries")),
    Norway=subset(doksanzedeler,subset = Country == "Norway",select = c("Job","Average Salaries")),
    NewZealand=subset(doksanzedeler,subset = Country == "New Zealand",select = c("Job","Average Salaries")),
    Poland=subset(doksanzedeler,subset = Country == "Poland",select = c("Job","Average Salaries")),
    
    
  )
  })
  
  f <-reactive({switch(
    Reg <- input$Reg,
    A=subset(doksanzedeler,subset = Job == "Accountant",select = c("Cost of Live","Average Salaries")),
    B=subset(doksanzedeler,subset = Job == "Bricklayer",select = c("Cost of Live","Average Salaries")),
    C=subset(doksanzedeler,subset = Job == "Builder",select = c("Cost of Live","Average Salaries")),
    D=subset(doksanzedeler,subset = Job == "Dentist",select = c("Cost of Live","Average Salaries")),
    E=subset(doksanzedeler,subset = Job == "Doctor",select = c("Cost of Live","Average Salaries")),
    f=subset(doksanzedeler,subset = Job == "Driving Instructors",select = c("Cost of Live","Average Salaries")),
    G=subset(doksanzedeler,subset = Job == "Engineer",select = c("Cost of Live","Average Salaries")),
    H=subset(doksanzedeler,subset = Job == "Estate Agent",select = c("Cost of Live","Average Salaries")),
    I=subset(doksanzedeler,subset = Job == "Florists",select = c("Cost of Live","Average Salaries")),
    J=subset(doksanzedeler,subset = Job == "Graphic Designers",select = c("Cost of Live","Average Salaries")),
    K=subset(doksanzedeler,subset = Job == "Hairdressers",select = c("Cost of Live","Average Salaries")),
    L=subset(doksanzedeler,subset = Job == "HR Consultants",select = c("Cost of Live","Average Salaries")),
    M=subset(doksanzedeler,subset = Job == "IT Technicians",select = c("Cost of Live","Average Salaries")),
    N=subset(doksanzedeler,subset = Job == "Journalists",select = c("Cost of Live","Average Salaries")),
    O=subset(doksanzedeler,subset = Job == "Nurses",select = c("Cost of Live","Average Salaries")),
    P=subset(doksanzedeler,subset = Job == "Personal Trainers",select = c("Cost of Live","Average Salaries")),
    R=subset(doksanzedeler,subset = Job == "Pharmacists",select = c("Cost of Live","Average Salaries")),
    S=subset(doksanzedeler,subset = Job == "Photographers",select = c("Cost of Live","Average Salaries")),
    t=subset(doksanzedeler,subset = Job == "Plumbers",select = c("Cost of Live","Average Salaries")),
    U=subset(doksanzedeler,subset = Job == "Recruitment Consultants",select = c("Cost of Live","Average Salaries")),
    V=subset(doksanzedeler,subset = Job == "Retail Managers",select = c("Cost of Live","Average Salaries")),
    Y=subset(doksanzedeler,subset = Job == "Sales Assistants",select = c("Cost of Live","Average Salaries")),
    Z=subset(doksanzedeler,subset = Job == "Solicitors",select = c("Cost of Live","Average Salaries")),
    Q=subset(doksanzedeler,subset = Job == "Taxi Drivers",select = c("Cost of Live","Average Salaries")),
    W=subset(doksanzedeler,subset = Job == "Teachers",select = c("Cost of Live","Average Salaries")),
    AA=subset(doksanzedeler,subset = Job == "Truck Drivers",select = c("Cost of Live","Average Salaries")),
    BB=subset(doksanzedeler,subset = Job == "Web Developers",select = c("Cost of Live","Average Salaries")),
    CC=subset(doksanzedeler,subset = Job == "Window Cleaners",select = c("Cost of Live","Average Salaries")),
  )
  })
  
  
  output$plot1<-renderPlotly({
    ggplot(d(),aes(y=`Average Salaries`,x=Country,fill=Country))+geom_bar(stat="identity")+theme(axis.text.x=element_text(angle=45))
  })
  
  # Generate a summary of the data 
  output$summary1 <- renderPrint({
    summary(d())
  })
  output$plot2<-renderPlotly({
    ggplot(e(),aes(y=`Average Salaries`,x=Job,fill=Job))+geom_bar(stat="identity")+theme(axis.text.x=element_text(angle=45))
  })
  output$summary2 <- renderPrint({
    summary(e())
  })
  
  output$plot3 <- renderPlotly({
    ggplot(f(),aes(y=`Average Salaries`,x=`Cost of Live`))+stat_smooth(method=lm,col="orange3")+geom_point(pch = "*", cex = 1, col = "purple4")
  })
  output$Str <- renderPrint({
    str(doksanzedeler)
  })
  output$Summaryy <- renderPrint({
    summary(doksanzedeler)
  })
  output$Lm <- renderPrint({
    summary(lm(f()))
  })
}


shinyApp(ui=ui,server=server)

