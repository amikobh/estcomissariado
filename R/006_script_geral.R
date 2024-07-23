# Import all data
setwd("/home/amikobh/diretorio_r/estcomissariado/R")

source('001_instalar_pacotes_bkp01.R')

#Sys.sleep(1)
source('002_tratamentos_flex_periodo.R')
#Sys.sleep(1)
source('003_tratamentos_ficalizacao.R')
#Sys.sleep(1)
source('004_tabelas_BKP01_gt.R')
#Sys.sleep(1)
source('005_graficos_BKP02.R')
#Sys.sleep(1)

setwd("/home/amikobh/diretorio_r/estcomissariado")
bookdown::render_book("index.Rmd", "bookdown::pdf_book")
