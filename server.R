
function(input, output, session) {
  observe({
     x <- input$slct3
    if (is.null(x))
     x <- character(0)
    escolha_sclt3 <- tabinput %>%
      filter(bloco == x) %>%
      pull(questao) %>%
      unique

    updateSelectInput(session, "slct4",
                      label = "Selecione a Questão",
                      choices = c("",escolha_sclt3))

  })

  observe({
    x <- input$slct3
    y <- input$slct4
    if (nchar(y)==0)y <- "Perfil"
    
    escolha_sclt4 <- tabinput %>%
      filter(bloco == x, questao == y) %>%
      pull(cruzamento) %>%
      unique

    updateSelectInput(session, "slct5",
                      label = "Selecione o Cruzamento",
                      choices = c("",escolha_sclt4))
  })


  output$qst2 <- renderUI({
    req(input$slct5)
    
    y <- input$slct4
    if (nchar(y)==0) y <- "Perfil"
    
    index_lista <- tabinput %>% 
      filter(bloco ==input$slct3, questao == y, cruzamento == input$slct5) %>% 
      pull(id)
    
    qclm[[index_lista]][[1]] %>%
               htmltools_value(ft.align = NULL, ft.shadow = NULL,
                               extra_dependencies = NULL)
    
  })

  output$txt <- renderUI({
    y <- input$slct4
    if (nchar(y)==0) y <- "Perfil"
      tabinput %>% 
      filter(bloco ==input$slct3, questao == y,
             cruzamento == input$slct5) %>%
      pull(nota) %>% HTML
      
  }) 
  
  output$img <- renderUI({
    tags$img(src="Imagem1.png", width = "100%")#height = 751, width = 1320)
  }) 
  
  output$img2 <- renderUI({
    tags$img(src="Imagem2.png", width = "100%")#height = 742, width = 1325)
  }) 

output$saida_ui <- renderUI({
  
  saida <- fluidRow(column(width = 8, offset = 2, uiOutput("img2")))
  if(input$slct3 == "Perfil financeiro"){
    saida <- fluidRow(column(width = 8, offset = 2, uiOutput("img")))
  }
  
  if(input$slct3 == "Perguntas"){
    saida <- fluidRow()
  }
  
  y <- input$slct4
  if (nchar(y)==0) {y <- "Perfil"}
  

  condicao <- tabinput %>% 
    filter(bloco ==input$slct3, questao == y, cruzamento == input$slct5) %>% 
    pull(nota)
  if(nchar(input$slct5) > 0){
  if(nchar(condicao) == 0){
    saida <- fluidRow(column(width = 12, uiOutput("qst2")))
  } else {
    saida <- fluidRow(column(width = 6, uiOutput("qst2")),
                   column(width = 6, offset = 0, 
                   box(title = "Nota:", width = "100%",
                      uiOutput("txt")
                      ))
                    )
  }
  }
  saida
})

}

## Função que está funcionando atualmente
# function(input, output) {
#   output$qst2 <- renderUI({
#     index <- input$slct3
#     qclm[[as.numeric(index)]][[1]] %>%
#       htmltools_value(#eval(parse(text = nome)),
#         ft.align = NULL,
#         ft.shadow = NULL,
#         extra_dependencies = NULL)
#   })
# }








# if(input$slct2 == "Geral"){
#   index <- input$slct
#   qg[[as.numeric(index)]][[1]] %>%
#     htmltools_value(#eval(parse(text = nome)),
#       ft.align = NULL,
#       ft.shadow = NULL,
#       extra_dependencies = NULL)
# }