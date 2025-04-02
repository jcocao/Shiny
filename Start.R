library(stringr)
cat("Vamos lá! Rastreando se a porta está livre!")
ip <- system2("ipconfig", stdout = T)
ip <- (ip[ip %>% str_detect("IPv4")] %>% str_split(": ") %>% unlist)[2]
porta_ativo <- system2("netstat", args = "-an", stdout = T) %>%
  str_detect("10.2.12.168:2254") %>%
  sum()
cat("Feito!")
if(porta_ativo == 0){cat("Porta livre, inciando o app!\n")
  shiny::runApp(host = ip, port = 2254)
} else {cat("Já está ocupada a porta!\n")
  cat("Encerrando o processo\n")
  Sys.sleep(3)}
  