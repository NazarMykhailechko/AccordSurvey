library(shinysurveys)
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinyFeedback)
library(shinytitle)
library(shinyWidgets)
library(RMySQL)
library(pool)
library(DBI)


#pool <- pool::dbPool(
#  drv = RMySQL::MySQL(),
#  dbname = "quest",
#  host = "127.0.0.1",
#  username = "root",
#  password = "WIN72007@NAZAr"
#)

pool <- pool::dbPool(
  drv = RMySQL::MySQL(),
  dbname = "heroku_623d565686a87a4",
  host = "eu-cluster-west-01.k8s.cleardb.net",
  username = "bc6a3dad916b4a",
  password = "0c7f407f"
)

onStop(function() {
  print("POOL CLOSED!!!!!!!!!!!!!")
  poolClose(pool)
})


questions <- read.csv(file = "questions.txt",header = TRUE, sep = ";", stringsAsFactors=FALSE)

extendInputType("picker", { shinyWidgets::pickerInput(inputId =  surveyID(),
            label = surveyLabel(),
            selected = NULL,
            multiple = TRUE,
            options = pickerOptions(style = "my-class", maxOptions = 1, noneSelectedText ="відділення"),
            choices = surveyOptions(),
            choicesOpt = list(content = paste0("<img src='accordbank.svg' width=15px> ", surveyOptions(), "</img>")
            ))})

#choicesOpt = list(content = c("<img src='accordbank.svg' width=15px> 1 відділення</img>",
 #                             "<img src='accordbank.svg' width=15px> 2 відділення</img>",
  #                            "<img src='accordbank.svg' width=15px> 3 відділення</img>"

ui <- shiny::fluidPage(use_shiny_title(),
  #shinysurveys::teaching_r_questions
  shinysurveys::surveyOutput(df = questions,
                             survey_title = div(img(src="accordbank.svg", height = 35, width = 35), "Опитування"),
                             survey_description = 'ПО ПРОДУКТУ БАНКУ ЩОДО ЗОВНІШНЬОЕКОНОМІЧНИХ ОПЕРАЦІЙ ЮРИДИЧНИХ ОСІБ/ФОП (ЗЕД), ТОБТО  ОПЕРАЦІЇ БЕЗГОТІВКОВОЇ КУПІВЛІ АБО ПРОДАЖУ ВАЛЮТИ КЛІЄНТАМИ БАНКУ',theme = "#7B1818"),
  
  useShinyjs(),
  tags$head(
    HTML("
                     <meta name='viewport' content= 'width=device-width, initial-scale=1.0'>
                     <link rel='shortcut icon' sizes='16x16' href='accordbank.svg'>
                 ")
  ),
  
  tags$head(
    tags$style(
      HTML("#shiny-notification-panel {
             top: 0;
  bottom: unset;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  max-width: 450px;
  opacity:1;
             }
             "
      )
    )
  ),

  
  tags$body(
    HTML(
      "
          <script>
              document.getElementById('submit').innerHTML = 'Відправити';
          </script>
          
          "
    )
  ),

  
  tags$body(
    HTML(
      "
          <script>
          
              var iDiv1 = document.createElement('div');
              iDiv1.id = 'title-description-1';
              iDiv1.className = 'title-description';
              var iDiv1_1 = document.createElement('h1');
              iDiv1_1.id = 'survey-title1';
              var iDiv1_2 = document.createElement('p');
              iDiv1_2.id = 'survey-description1';
              
              document.getElementById('q21-question').before(iDiv1)
              document.getElementById('title-description-1').appendChild(iDiv1_1)
              document.getElementById('title-description-1').appendChild(iDiv1_2)
              document.getElementById('survey-description1').innerHTML = 'ОПИТУВАННЯ ПО ПРОДУКТУ БАНКУ ВІДКРИТТЯ ПОТОЧНИХ РАХУНКІВ ТА РКО ЮРИДИЧНИХ ОСІБ';

              var iDiv1_1_1 = document.createElement('div');
              iDiv1_1_1.id = 'div1';
              document.getElementById('survey-title1').appendChild(iDiv1_1_1);
              document.getElementById('div1').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              

              
              
              
              var iDiv3 = document.createElement('div');
              iDiv3.id = 'title-description-2';
              iDiv3.className = 'title-description';
              var iDiv3_3 = document.createElement('h1');
              iDiv3_3.id = 'survey-title2';
              var iDiv3_4 = document.createElement('p');
              iDiv3_4.id = 'survey-description2';
              
              document.getElementById('q31-question').before(iDiv3)
              document.getElementById('title-description-2').appendChild(iDiv3_3)
              document.getElementById('title-description-2').appendChild(iDiv3_4)
              document.getElementById('survey-description2').innerHTML = 'ОПИТУВАННЯ ПО ПРОДУКТУ БАНКУ «ПРИЙОМ ПЛАТЕЖІВ ВІД НАСЕЛЕННЯ» ( фіз особи)';

              var iDiv3_3_3 = document.createElement('div');
              iDiv3_3_3.id = 'div3';
              document.getElementById('survey-title2').appendChild(iDiv3_3_3);
              document.getElementById('div3').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              



              var iDiv5 = document.createElement('div');
              iDiv5.id = 'title-description-3';
              iDiv5.className = 'title-description';
              var iDiv5_5 = document.createElement('h1');
              iDiv5_5.id = 'survey-title3';
              var iDiv5_6 = document.createElement('p');
              iDiv5_6.id = 'survey-description3';
              
              document.getElementById('q41-question').before(iDiv5)
              document.getElementById('title-description-3').appendChild(iDiv5_5)
              document.getElementById('title-description-3').appendChild(iDiv5_6)
              document.getElementById('survey-description3').innerHTML = 'ОПИТУВАННЯ ПО ПРОДУКТУ БАНКУ «СТРОКОВІ ДЕПОЗИТИ ФІЗ ОСІБ»';

              var iDiv5_5_5 = document.createElement('div');
              iDiv5_5_5.id = 'div5';
              document.getElementById('survey-title3').appendChild(iDiv5_5_5);
              document.getElementById('div5').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              

              document.getElementById('survey-description').setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;');



              var iDiv11 = document.createElement('div');
              iDiv11.id = 'q11';
              iDiv11.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q11').before(iDiv11);
              document.getElementById('q11').innerHTML = 'ОЦІНІТЬ ВАШІ ЗНАННЯ НАПРЯМУ ЗЕД (ОПЕРАЦІЇ ПРОДАЖУ КУПІВЛІ БЕЗГОТІВКОВОЇ ІНОЗЕМНОЇ ВАЛЮТИ)';
              
              
              
              var iDiv12 = document.createElement('div');
              iDiv12.id = 'q12';
              iDiv12.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q12').before(iDiv12);
              document.getElementById('q12').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ НАПРЯМ';
              
              
              var iDiv13 = document.createElement('div');
              iDiv13.id = 'q13';
              iDiv13.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q13').before(iDiv13);
              document.getElementById('q13').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ ВАЛЮТНОГО НАГЛЯДУ, УФМ ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';


              var iDiv21 = document.createElement('div');
              iDiv21.id = 'q21';
              iDiv21.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q21').before(iDiv21);
              document.getElementById('q21').innerHTML = 'ОЦІНІТЬ ВАШІ ЗНАННЯ НАПРЯМУ СПІВПРАЦІ З ЮРИДИЧНИМИ ОСОБАМИ - РОЗРАХУНКОВО-КАСОВОГО ОБСЛУГОВУВАННЯ ЮР.ОСІБ';
              
              
              
              var iDiv22 = document.createElement('div');
              iDiv22.id = 'q22';
              iDiv22.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q22').before(iDiv22);
              document.getElementById('q22').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ НОВИХ КЛІЄНТІВ (ЮР.ОСІБ) НА ВІДКРИТТЯ РАХУНКІВ У БАНКУ, У Т.Ч. ДЛЯ РКО';
              

              var iDiv23 = document.createElement('div');
              iDiv23.id = 'q23';
              iDiv23.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q23').before(iDiv23);
              document.getElementById('q23').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ВІДДІЛАМИ KYC, УФМ ТА ІНШИМИ';
              
              
              
              var iDiv31 = document.createElement('div');
              iDiv31.id = 'q31';
              iDiv31.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q31').before(iDiv31);
              document.getElementById('q31').innerHTML = 'ОЦІНІТЬ ВАШІ ЗНАННЯ ПРОДУКТУ -  ПРИЙОМ ПЛАТЕЖІВ ВІД НАСЕЛЕННЯ';
              
              
              var iDiv32 = document.createElement('div');
              iDiv32.id = 'q32';
              iDiv32.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q32').before(iDiv32);
              document.getElementById('q32').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ ПРОДУКТ';
              
              
              
              var iDiv33 = document.createElement('div');
              iDiv33.id = 'q33';
              iDiv33.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q33').before(iDiv33);
              document.getElementById('q33').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ РОЗВИТКУ РОЗРАХУНКОВИХ ОПЕРАЦІЙ ТА ДЕПОЗИТНИХ ПРОДУКТІВ, УФМ, ОПЕРАЦІЙНИМ ДЕПАРТАМЕНТОМ ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';
              
              
              
              var iDiv41 = document.createElement('div');
              iDiv41.id = 'q41';
              iDiv41.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q41').before(iDiv41);
              document.getElementById('q41').innerHTML = 'ОЦІНІТЬ ВАШІ ЗНАННЯ ПРОДУКТУ -  СТРОКОВІ ДЕПОЗИТИ ФІЗ ОСІБ';
              
              
              var iDiv42 = document.createElement('div');
              iDiv42.id = 'q42';
              iDiv42.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q42').before(iDiv42);
              document.getElementById('q42').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ ПРОДУКТ';
              
              
              
              var iDiv43 = document.createElement('div');
              iDiv43.id = 'q43';
              iDiv43.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q43').before(iDiv43);
              document.getElementById('q43').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ РОЗВИТКУ РОЗРАХУНКОВИХ ОПЕРАЦІЙ ТА ДЕПОЗИТНИХ ПРОДУКТІВ, УФМ, ОПЕРАЦІЙНИМ ДЕПАРТАМЕНТОМ  ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';
              
              
          </script>
          
          "
    )
  ),
 
  
  tags$body(tags$style("#submit {color: white;background-color: grey;} ")),
  tags$body(tags$style("#survey-title {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
  tags$body(tags$style("#survey-title1 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
  tags$body(tags$style("#survey-title2 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
  tags$body(tags$style("#survey-title3 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
  tags$body(tags$style("#survey-description1 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
  tags$body(tags$style("#survey-description2 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
  tags$body(tags$style("#survey-description3 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
  tags$body(tags$style("table {font-size: 10px;} ")),
  tags$head(tags$style("input[type=radio] {accent-color: red;};} ")),
 
)

server <- function(input, output, session) {
  shinysurveys::renderSurvey()
  change_window_title(session, "Опитування")
  flashing_window_title( session, "Акордбанк", inactive_only = TRUE, interval = 1000 )
  
  observeEvent(input$submit, {

    showModal(modalDialog(footer = NULL,
      title = "Ваші відповіді надіслано! Дякуємо за участь в опитуванні!",
      #"You can customize what actions happen when a user finishes a survey using input$submit."
    ))
    
    print("clicked save!!!")

    ssql <- "INSERT INTO questionare (division, q11ker, q11zam, q11eco, q12ker, q12zam, q12eco, q13ker, q13zam, q13eco, q21ker, q21zam, q21eco, q22ker, q22zam, q22eco, q23ker, q23zam, q23eco, q31ker, q31zam, q31eco, q32ker, q32zam, q32eco, q33ker, q33zam, q33eco, q41ker, q41zam, q41eco, q42ker, q42zam, q42eco, q43ker, q43zam, q43eco) "
    

   
    data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", input$division, "','", input$q11[1,3],"','",input$q11[2,3],"','", input$q11[3,3],
                                                                           "','", input$q12[1,3],"','",input$q12[2,3],"','", input$q12[3,3],
                                                                           "','", input$q13[1,3],"','",input$q13[2,3],"','", input$q13[3,3],
                                                                           "','", input$q21[1,3],"','",input$q21[2,3],"','", input$q21[3,3],
                                                                           "','", input$q22[1,3],"','",input$q22[2,3],"','", input$q22[3,3],
                                                                           "','", input$q23[1,3],"','",input$q23[2,3],"','", input$q23[3,3],
                                                                           "','", input$q31[1,3],"','",input$q31[2,3],"','", input$q31[3,3],
                                                                           "','", input$q32[1,3],"','",input$q32[2,3],"','", input$q32[3,3],
                                                                           "','", input$q33[1,3],"','",input$q33[2,3],"','", input$q33[3,3],
                                                                           "','", input$q41[1,3],"','",input$q41[2,3],"','", input$q41[3,3],
                                                                           "','", input$q42[1,3],"','",input$q42[2,3],"','", input$q42[3,3],
                                                                           "','", input$q43[1,3],"','",input$q43[2,3],"','", input$q43[3,3],"')"))
    #showNotification("Ваші відповіді надіслано! Дякуємо за участь в опитуванні!",duration = 4,closeButton = FALSE, type = "error",id = "info")
    #print(getSurveyData())
    

  })
  
  
}

shiny::shinyApp(ui = ui, server = server)