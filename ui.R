
dashboardPage(
  title = 'Pesquisa Jornada Financeira',
  header = dashboardHeader(
    titleWidth='100%',
    title = span(
      tags$img(src="ban_1024x152.jpg", height = 135 , width = 880)
    ),
    dropdownMenuOutput("helpMenu")
  ),dashboardSidebar(sidebarMenu( 
    selectInput("slct3", "Selecione a Abertura", choices = c("","Perguntas", "Perfil financeiro")),
    conditionalPanel(condition = "input.slct3 == 'Perguntas'",
                     selectInput("slct4", "", c(""))),
    conditionalPanel(condition = "input.slct4 == 'Questão 1.1' |
                                  input.slct4 == 'Questão 1.2' |
                                  input.slct4 == 'Questão 1.3' |
                                  input.slct4 == 'Questão 1.4' |
                                  input.slct4 == 'Questão 2.1' |
                                  input.slct4 == 'Questão 2.2' |
                                  input.slct4 == 'Questão 2.3' |
                                  input.slct4 == 'Questão 2.4' |
                                  input.slct4 == 'Questão 2.5' |
                                  input.slct4 == 'Questão 2.5a' |
                                  input.slct4 == 'Questão 2.6' |
                                  input.slct4 == 'Questão 2.7' |
                                  input.slct4 == 'Questão 2.8' |
                                  input.slct4 == 'Questão 2.9' |
                                  input.slct4 == 'Questão 2.10' |
                                  input.slct4 == 'Questão 2.11' |
                                  input.slct4 == 'Questão 3.1' |
                                  input.slct4 == 'Questão 3.2' |
                                  input.slct4 == 'Questão 3.3' |
                                  input.slct4 == 'Questão 3.4' |
                                  input.slct3 == 'Perfil financeiro'",
                     selectInput("slct5", "", c("")))
    )),
  body = dashboardBody(#uiOutput("qst2"),
    
    uiOutput("saida_ui"),
    # fluidRow(column(width = 12, uiOutput("qst2")),
    #          column(width = 1, offset = 0, textOutput("txt"))),
    tags$style(type="text/css", "
/*    Move everything below the header */
    .content-wrapper {
        margin-top: 0px;
    }
    .content {
        padding-top: 100px;
    }
    .shiny-html-output {
     font-weight: 300;
     font-size: 20px;
     font-family: 'Roboto', sans-serif;

    }
/*    Format the title/subtitle text */
    .title-box {
        position: absolute;
        text-align: center;
        top: 0%;
        left: 0%;
        transform:translate(0%, 0%);
    }
    @media (max-width: 0px) {
        .title-box {
            position: absolute;
            text-align: center;
            top: 0%;
            left: 0%;
            transform:translate(0%, 0%);
        }
    }
    @media (max-width: 0px) {
        .primary-title {
            font-size: 1.1em;
        }
        .primary-subtitle {
            font-size: 1em;
        }
    }
/*    Make the image taller */
    .main-header .logo {
        height: 130px;
    }
/*    Override the default media-specific settings */
    @media (max-width: 5000px) {
        .main-header {
            padding: 0 0;
            position: relative;
        }
        .main-header .logo,
        .main-header .navbar {
            width: 100%;
            float: none;
        }
        .main-header .navbar {
            margin: 0;
        }
        .main-header .navbar-custom-menu {
            float: right;
        }
    }
/*    Move the sidebar down */
    .main-sidebar {
        position: absolute;
    }
    .left-side, .main-sidebar {
        padding-top: 183px;
    }"
    )
  )
)
