library(shiny)
library(shinydashboard)
library(flextable)
library(readxl)
library(tidyverse)
library(officer)
library(tidyr)
library(dplyr)
library(openxlsx)
library(stringr)
library(readxl)
library(gfonts)

generate_css("roboto", "light", font_dir = "path/to/font")

qclm <- readRDS("tabclm.Rds")
tabinput <- readRDS("tabinput.Rds")
tabinput <- tabinput %>% mutate(id = 1:53)
esc1 <- tabinput %>% select(bloco) %>% unique() %>% as.vector()
opcoes <- c("Bloco 1, Questão 1", "Bloco 1, Questão 2", "Bloco 1, Questão 3",
            "Bloco 1, Questão 4", "Bloco 2, Questão 1", "Bloco 2, Questão 2",
            "Bloco 2, Questão 3", "Bloco 2, Questão 4", "Bloco 2, Questão 4a",
            "Bloco 2, Questão 5", "Bloco 2, Questão 5a", "Bloco 2, Questão 6",
            "Bloco 2, Questão 7", "Bloco 2, Questão 7a", "Bloco 2, Questão 7b",
            "Bloco 2, Questão 8", "Bloco 2, Questão 8a", "Bloco 2, Questão 8b",
            "Bloco 2, Questão 9", "Bloco 2, Questão 9a", "Bloco 2, Questão 9b", 
            "Bloco 2, Questão 10", "Bloco 2, Questão 10a", "Bloco 2, Questão 11",
            "Bloco 2, Questão 12.1", "Bloco 2, Questão 12.2",
            "Bloco 2, Questão 13", "Bloco 3, Questão 1", 
            "Bloco 3, Questão 2", "Bloco 3, Questão 3", "Bloco 3, Questão 4",
            "Bloco 3, Questão 5", "Perfil, Bloco 1, Questão 2",
            "Perfil, Bloco 1, Questão 3", "Perfil, Bloco 1, Questão 4", 
            "Perfil, Bloco 2, Questão 1", "Perfil, Bloco 2, Questão 2",
            "Perfil, Bloco 2, Questão 3", "Perfil, Bloco 3, Questão 1",
            "Perfil, Bloco 3, Questão 2", "Bloco 1, Questão 1 x Sexo",
            "Bloco 1, Questão 1 x Faixa etária", "Bloco 1, Questão 1 x Faixa salarial",
            "Bloco 1, Questão 1 x Empresa", "Bloco 1, Questão 4 x Sexo",
            "Bloco 1, Questão 4 x Faixa etária", "Bloco 1, Questão 4 x Faixa salarial",
            "Bloco 1, Questão 4 x Empresa", "Bloco 2, Questão 1 x Sexo",
            "Bloco 2, Questão 1 x Faixa etária", "Bloco 2, Questão 1 x Faixa salarial",
            "Bloco 2, Questão 1 x Empresa", "Bloco 2, Questão 3 x Sexo",
            "Bloco 2, Questão 3 x Faixa etária", "Bloco 2, Questão 3 x Faixa salarial",
            "Bloco 2, Questão 3 x Empresa", "Bloco 2, Questão 4 x Sexo",
            "Bloco 2, Questão 4 x Faixa etária", "Bloco 2, Questão 4 x Faixa salarial",
            "Bloco 2, Questão 4 x Empresa", "Bloco 3, Questão 3 x Sexo",
            "Bloco 3, Questão 3 x Faixa etária", "Bloco 3, Questão 3 x Faixa salarial",
            "Bloco 3, Questão 3 x Empresa", "Perfil x Sexo", "Perfil x Faixa etária",
            "Perfil x Faixa salarial", "Perfil x Empresa")

quest <- c("q1_01", "q1_02", "q1_03", "q1_04", "q2_01", "q2_02", "q2_03",
          "q2_04", "q2_04a", "q2_05", "q2_05a", "q2_06", "q2_07", "q2_07a",
          "q2_07b", "q2_08", "q2_08a", "q2_08b", "q2_09", "q2_09a", "q2_09b",
          "q2_10", "q2_10a", "q2_11", "q2_12_1", "q2_12_2", "q2_13", "q3_01",
          "q3_02", "q3_03", "q3_04", "q3_05", "v1_02", "v1_03", "v1_04",
          "v2_01", "v2_02", "v2_03", "v3_01", "v3_02", "v1_02s", "v1_03s", "v1_04s",
          "v2_01s", "v2_02s", "v2_03s", "v3_01s", "v3_02s")


questclm <- c("q1_01clm",
              "v1_01s",
              "v1_01id",
              "v1_01fx",
              "v1_01emp",
              "q1_02clm",
              "q1_03clm",
              "q1_04clm",
              "v1_04s",
              "v1_04id", 
              "v1_04fx",
              "v1_04emp",
              "q2_01clm",
              "v2_01s",
              "v2_01id",
              "v2_01fx",
              "v2_01emp",
              "q2_02clm",
              "q2_03clm",
              "v2_03s",
              "v2_03id",
              "v2_03fx",
              "v2_03emp",
              "q2_04clm",
              "v2_04s",
              "v2_04id",
              "v2_04fx",
              "v2_04emp",
              "q2_05clm",
              "q2_05aclm",
              "q2_06clm",
              "q2_07clm",
              "q2_08clm",
              "q2_09clm",
              "q2_10clm",
              "q2_11clm",
              "q3_01clm",
              "q3_02clm",
              "q3_03clm",
              "v3_03s",
              "v3_03id",
              "v3_03fx", 
              "v3_03emp",
              "q3_04clm",
              "perf_g",
              "perf_sx",
              "perf_id",
              "perf_fx",
              "perf_emp",
              "v1_02",
              "v1_03",
              "v1_04",
              "v3_01")

inst <- c("Geral", "CNC", "Senac", "Sesc")

fx <- c("Total", "Faixa 1", "Faixa 2", "Faixa 3", "Faixa 4", "Faixa 5", "Faixa 6",
        "Faixa 7", "Faixa 8", "Faixa 9", "Faixa 10", "Faixa 11")

id <- c("Total", "Menos de 55 anos", "55 a 59", "60 a 64", "65 a 69", "70 a 74",
        "Prefiro não responder", "Não sei")

emp <- c("Total", "CNC", "Senac", "Sesc")

s <- c("Feminino/Masculino", "Feminino", "Masculino")

border <- fp_border(color = "white")
bot_border <- fp_border(color = "#00417b")

tema_flex <- function(tab){
  border <- fp_border(color = "white")
  bot_border <- fp_border(color = "#00417b")
  tab <- colformat_double(tab, digits = 1)
  tab <- colformat_num(tab, big.mark = ".", decimal.mark = ",", na_str = "N/A")
  tab <- bg(tab, bg = "#b3e6fa", part = "body")
  tab <- bg(tab, bg = "#00417b", part = "header")
  tab <- bold(tab, part = "header")
  tab <- color(tab, part = "header", color = "white")
  tab <- vline(tab, border = border)
  tab <- vline_left(tab, border = border)
  tab <- vline_right(tab, border = border)
  tab <- hline(tab, border = border)
  tab <- hline_top(tab, border = border, part = "all")
  tab <- hline_bottom(tab, border = bot_border)
  tab <- add_footer_lines(tab, "Fonte: Senac, DN. Pesquisa Jornada Financeira.")
  tab <- fontsize(tab, size = 13, part = "all")
}

opcoes <- `names<-`(1:68, opcoes)
