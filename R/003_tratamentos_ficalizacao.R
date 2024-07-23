#########################################################################################################
#########################################################################################################

# PROCEDIMENTOS INICIAIS : LIMPAR OBJETOS

#rm(list=ls(all=TRUE))

# DEFINIR DIRETÓRIO DE TRABALHO: usar Ctrl+Shift+H e escolher diretório

# 2) DEFINIR DIRETÓRIO DE TRABALHO: usar Ctrl+Shift+H e escolher diretório
dir.create(file.path("~/diretorio_r/estcomissariado", "imagens"))
setwd(file.path("~/diretorio_r/estcomissariado/arq_fontes"))
#########################################################################################################
#########################################################################################################
# CARREGANDO O BANCO PARA TRATAMENTO NO R: observar se variaveis são iguais
#Ao salvar o banco como .csv escolher separador ":"

banco <- read.csv("fiscalizacao_banco_atual.csv",header=TRUE, sep="|", dec=".", encoding = "UTF-8", skip = 0) ##Lendo arquivo de texto separado por vírgulas (CSV) e que usa o ponto.

#baixando do site google:

#banco <- read_sheet("https://docs.google.com/spreadsheets/d/1boTaqbMxoO9gWJ39IB7Q4Z9K5NGsv296ILyX0w-Fv6k/edit?resourcekey#gid=577815317")

banco_inicial_bkp <- banco

dir.create(file.path("~/diretorio_r/estcomissariado", "planilhas"))
dir.create(file.path("~/diretorio_r/estcomissariado", "imagens"))
setwd(file.path("~/diretorio_r/estcomissariado/planilhas"))
##SALVANDO BANCO ORIGINAL
#write.csv(banco_inicial_bkp, file ="banco_inicial_bkp.csv",row.names=TRUE)
#write.xlsx(banco_inicial_bkp, file ="banco_inicial_bkp.xlsx")
#  verificando o nome das variaveis pertencentes ao objeto dados:
names(banco)
#############################################################################################################
#RENOMEANDO COLUNA
colnames(banco)[1]<-'DATA_SISTEMA'
colnames(banco)[2]<-'DATA_COMISSARIO'
colnames(banco)[3]<-'DIA_UTIL_OU_PLANTAO'
colnames(banco)[4]<-'PERIODO_DO_DIA'
colnames(banco)[5]<-'TIPO_DILIGENCIA'
colnames(banco)[6]<-'QUANTIDADE'
colnames(banco)[7]<-'TIPO_DILIGENCIA_1'
colnames(banco)[8]<-'QUANTIDADE_1'
colnames(banco)[9]<-'TIPO_DILIGENCIA_2'
colnames(banco)[10]<-'QUANTIDADE_2'
colnames(banco)[11]<-'TIPO_DILIGENCIA_3'
colnames(banco)[12]<-'QUANTIDADE_3'
colnames(banco)[13]<-'TIPO_DILIGENCIA_4'
colnames(banco)[14]<-'QUANTIDADE_4'
colnames(banco)[15]<-'TIPO_DILIGENCIA_5'
colnames(banco)[16]<-'QUANTIDADE_5'
colnames(banco)[17]<-'PARTICIPANTES'

names(banco)
#########################################################################################################
# Para converter um dataframe em tibble:

banco <- as_tibble(banco)

str(banco)


banco$DATA_COMISSARIO <- as.Date(banco$DATA_COMISSARIO)


#########################################################################################################
# TRATAMENTO PERIODO
#########################################################################################################


banco = banco %>%
  filter(DATA_COMISSARIO >= (str_c(format(Sys.Date()-365*0, "%Y"), "-01-01")) &
           DATA_COMISSARIO <= (str_c(format(Sys.Date()-365*0, "%Y"), "-06-30")))

#########################################################################################################
banco$QUANTIDADE <- as.numeric(banco$QUANTIDADE)
banco$QUANTIDADE_1 <- as.numeric(banco$QUANTIDADE_1)
banco$QUANTIDADE_2 <- as.numeric(banco$QUANTIDADE_2)
banco$QUANTIDADE_3 <- as.numeric(banco$QUANTIDADE_3)
banco$QUANTIDADE_4 <- as.numeric(banco$QUANTIDADE_4)
banco$QUANTIDADE_5 <- as.numeric(banco$QUANTIDADE_5)
#########################################################################################################





#########################################################################################################
# 1 TRATAMENTO banco_TIPO_DILIGENCIA
#########################################################################################################
#MUDANDO GRAFIA
banco$DIA_UTIL_OU_PLANTAO[banco$DIA_UTIL_OU_PLANTAO == "PLANTÃO (FINAL DE SEMANA, RECESSO, FERIADO)"] <-
  "PLANTÃO"
#########################################################################################################

banco_TIPO_DILIGENCIA =
  banco %>%
  select(TIPO_DILIGENCIA, QUANTIDADE)


banco_TIPO_DILIGENCIA_1 =
  banco %>%
  select(TIPO_DILIGENCIA_1, QUANTIDADE_1) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_1) %>%
  mutate(QUANTIDADE = QUANTIDADE_1)

banco_TIPO_DILIGENCIA_1$TIPO_DILIGENCIA_1 = NULL
banco_TIPO_DILIGENCIA_1$QUANTIDADE_1 = NULL


banco_TIPO_DILIGENCIA_2 =
  banco %>%
  select(TIPO_DILIGENCIA_2, QUANTIDADE_2) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_2) %>%
  mutate(QUANTIDADE = QUANTIDADE_2)

banco_TIPO_DILIGENCIA_2$TIPO_DILIGENCIA_2 = NULL
banco_TIPO_DILIGENCIA_2$QUANTIDADE_2 = NULL



banco_TIPO_DILIGENCIA_3 =
  banco %>%
  select(TIPO_DILIGENCIA_3, QUANTIDADE_3) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_3) %>%
  mutate(QUANTIDADE = QUANTIDADE_3)

banco_TIPO_DILIGENCIA_3$TIPO_DILIGENCIA_3 = NULL
banco_TIPO_DILIGENCIA_3$QUANTIDADE_3 = NULL


banco_TIPO_DILIGENCIA_4 =
  banco %>%
  select(TIPO_DILIGENCIA_4, QUANTIDADE_4) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_4) %>%
  mutate(QUANTIDADE = QUANTIDADE_4)

banco_TIPO_DILIGENCIA_4$TIPO_DILIGENCIA_4 = NULL
banco_TIPO_DILIGENCIA_4$QUANTIDADE_4 = NULL


banco_TIPO_DILIGENCIA_5 =
  banco %>%
  select(TIPO_DILIGENCIA_5, QUANTIDADE_5) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_5) %>%
  mutate(QUANTIDADE = QUANTIDADE_5)

banco_TIPO_DILIGENCIA_5$TIPO_DILIGENCIA_5 = NULL
banco_TIPO_DILIGENCIA_5$QUANTIDADE_5 = NULL


#JUNTANDO OS BANCOS

banco_TIPO_DILIGENCIA =

  bind_rows(banco_TIPO_DILIGENCIA, banco_TIPO_DILIGENCIA_1, banco_TIPO_DILIGENCIA_2,
            banco_TIPO_DILIGENCIA_3, banco_TIPO_DILIGENCIA_4, banco_TIPO_DILIGENCIA_5, id = NULL)


banco_TIPO_DILIGENCIA <- na.omit(banco_TIPO_DILIGENCIA)

banco_TIPO_DILIGENCIA =
  banco_TIPO_DILIGENCIA %>%
  filter(!QUANTIDADE == 0)


#APAGANDO

banco_TIPO_DILIGENCIA_1 = NULL
banco_TIPO_DILIGENCIA_2 = NULL
banco_TIPO_DILIGENCIA_3 = NULL
banco_TIPO_DILIGENCIA_4 = NULL
banco_TIPO_DILIGENCIA_5 = NULL
#########################################################################################################
#MUDANDO GRAFIA

banco_TIPO_DILIGENCIA$TIPO_DILIGENCIA[banco_TIPO_DILIGENCIA$TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) ENCAMINHADAS PARA UNIDADES SOCIOEDUCATIVAS"] <-
  "MENSAGENS WHATSAPP OU LIGAÇÕES ENCAMINHADAS PARA UNIDADES SOCIOEDUCATIVAS"

banco_TIPO_DILIGENCIA$TIPO_DILIGENCIA[banco_TIPO_DILIGENCIA$TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) RECEBIDAS DE UNIDADES SOCIOEDUCATIVAS"] <-
  "MENSAGENS WHATSAPP OU LIGAÇÕES RECEBIDAS DAS UNIDADES SOCIOEDUCATIVAS"

#########################################################################################################
#banco_TIPO_DILIGENCIA %>% janitor::tabyl(TIPO_DILIGENCIA)

banco_TIPO_DILIGENCIA$QUANTIDADE <- as.numeric(banco_TIPO_DILIGENCIA$QUANTIDADE)


banco_TIPO_DILIGENCIA <- ddply(banco_TIPO_DILIGENCIA,
                               c("TIPO_DILIGENCIA"),
                               summarise,
                               QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_TIPO_DILIGENCIA$PERCENTUAL <- round_preserve_sum(prop.table(banco_TIPO_DILIGENCIA$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)


banco_TIPO_DILIGENCIA_bkp = banco_TIPO_DILIGENCIA #salvando atos atendimento original
#acrescentando linha com total
banco_TIPO_DILIGENCIA <- rbind(banco_TIPO_DILIGENCIA,
                               data.frame(TIPO_DILIGENCIA = "TOTAL", QUANTIDADE = sum(banco_TIPO_DILIGENCIA$QUANTIDADE), PERCENTUAL = sum(banco_TIPO_DILIGENCIA$PERCENTUAL),
                                          stringsAsFactors = FALSE))

colnames(banco_TIPO_DILIGENCIA) <- c("DILIGÊNCIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_TIPO_DILIGENCIA FIM
#########################################################################################################

#########################################################################################################
#########################################################################################################
#TRATAMENTO banco_MATRIZ
#########################################################################################################
banco_MATRIZ =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE)


banco_MATRIZ_1 =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA_1, QUANTIDADE_1) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_1) %>%
  mutate(QUANTIDADE = QUANTIDADE_1)

banco_MATRIZ_1$TIPO_DILIGENCIA_1 = NULL
banco_MATRIZ_1$QUANTIDADE_1 = NULL


banco_MATRIZ_2 =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA_2, QUANTIDADE_2) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_2) %>%
  mutate(QUANTIDADE = QUANTIDADE_2)

banco_MATRIZ_2$TIPO_DILIGENCIA_2 = NULL
banco_MATRIZ_2$QUANTIDADE_2 = NULL



banco_MATRIZ_3 =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA_3, QUANTIDADE_3) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_3) %>%
  mutate(QUANTIDADE = QUANTIDADE_3)

banco_MATRIZ_3$TIPO_DILIGENCIA_3 = NULL
banco_MATRIZ_3$QUANTIDADE_3 = NULL


banco_MATRIZ_4 =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA_4, QUANTIDADE_4) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_4) %>%
  mutate(QUANTIDADE = QUANTIDADE_4)

banco_MATRIZ_4$TIPO_DILIGENCIA_4 = NULL
banco_MATRIZ_4$QUANTIDADE_4 = NULL


banco_MATRIZ_5 =
  banco %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA_5, QUANTIDADE_5) %>%
  mutate(TIPO_DILIGENCIA = TIPO_DILIGENCIA_5) %>%
  mutate(QUANTIDADE = QUANTIDADE_5)

banco_MATRIZ_5$TIPO_DILIGENCIA_5 = NULL
banco_MATRIZ_5$QUANTIDADE_5 = NULL


#JUNTANDO OS BANCOS

banco_MATRIZ =

  bind_rows(banco_MATRIZ, banco_MATRIZ_1, banco_MATRIZ_2,
            banco_MATRIZ_3, banco_MATRIZ_4, banco_MATRIZ_5, id = NULL)


banco_MATRIZ <- na.omit(banco_MATRIZ)

banco_MATRIZ =
  banco_MATRIZ %>%
  filter(!QUANTIDADE == 0)


#APAGANDO

banco_MATRIZ_1 = NULL
banco_MATRIZ_2 = NULL
banco_MATRIZ_3 = NULL
banco_MATRIZ_4 = NULL
banco_MATRIZ_5 = NULL
#########################################################################################################
#TRATAMENTO banco_MATRIZ_FIM
#########################################################################################################

#########################################################################################################
# 2 TRATAMENTO banco_INSPECAO_COM_JUIZ_INTERNACAO
#########################################################################################################

#########################################################################################################

banco_INSPECAO_COM_JUIZ_INTERNACAO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM UNIDADE DE INTERNAÇÃO")

banco_INSPECAO_COM_JUIZ_INTERNACAO$QUANTIDADE <- as.numeric(banco_INSPECAO_COM_JUIZ_INTERNACAO$QUANTIDADE)

banco_INSPECAO_COM_JUIZ_INTERNACAO <- ddply(banco_INSPECAO_COM_JUIZ_INTERNACAO,
                                            c("DIA_UTIL_OU_PLANTAO"),
                                            summarise,
                                            QUANTIDADE = sum(QUANTIDADE))

banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp = banco_INSPECAO_COM_JUIZ_INTERNACAO #salvando atos atendimento original

#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_INTERNACAO$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_INTERNACAO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)

banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp = banco_INSPECAO_COM_JUIZ_INTERNACAO
#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_INTERNACAO <- rbind(banco_INSPECAO_COM_JUIZ_INTERNACAO,
                                            data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_INTERNACAO$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_INTERNACAO$PERCENTUAL),
                                                       stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_INTERNACAO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_INTERNACAO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO
#########################################################################################################

banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM UNIDADE DE INTERNAÇÃO")

banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO <- ddply(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO,
                                                    c("PERIODO_DO_DIA"),
                                                    summarise,
                                                    QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)


banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO_bkp = banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO
banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO_bkp$PERCENTUAL <- paste(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO <- rbind(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO,
                                                    data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO$PERCENTUAL),
                                                               stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_INTERNACAO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_SEMILIBERDADE
#########################################################################################################

banco_INSPECAO_COM_JUIZ_SEMILIBERDADE =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM UNIDADE DE SEMILIBERDADE")



banco_INSPECAO_COM_JUIZ_SEMILIBERDADE <- ddply(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE,
                                               c("DIA_UTIL_OU_PLANTAO"),
                                               summarise,
                                               QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_bkp = banco_INSPECAO_COM_JUIZ_SEMILIBERDADE #salvando atos atendimento original
#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE <- rbind(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE,
                                               data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE$PERCENTUAL),
                                                          stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_SEMILIBERDADE FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO
#########################################################################################################

banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM UNIDADE DE SEMILIBERDADE")

banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO <- ddply(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO,
                                                       c("PERIODO_DO_DIA"),
                                                       summarise,
                                                       QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)

banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO_bkp = banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO #salvando atos atendimento original
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO_bkp$PERCENTUAL <- paste(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO <- rbind(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO,
                                                       data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO$PERCENTUAL),
                                                                  stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_MEIO_ABERTO
#########################################################################################################

banco_INSPECAO_COM_JUIZ_MEIO_ABERTO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM PROGRAMA DE MEIO ABERTO")



banco_INSPECAO_COM_JUIZ_MEIO_ABERTO <- ddply(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO,
                                             c("DIA_UTIL_OU_PLANTAO"),
                                             summarise,
                                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_bkp = banco_INSPECAO_COM_JUIZ_MEIO_ABERTO #salvando atos atendimento original
#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO <- rbind(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO,
                                             data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO$PERCENTUAL),
                                                        stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_MEIO_ABERTO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO
#########################################################################################################

banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "INSPEÇÃO COM O JUIZ EM PROGRAMA DE MEIO ABERTO")

banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO <- ddply(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO,
                                                     c("PERIODO_DO_DIA"),
                                                     summarise,
                                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO_bkp = banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO #salvando atos atendimento original
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL <- paste(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO <- rbind(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO,
                                                     data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO$PERCENTUAL),
                                                                stringsAsFactors = FALSE))

colnames(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_UNIDADE
#########################################################################################################

banco_FISCALIZACAO_ORDINARIA_UNIDADE =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO ORDINÁRIA UNIDADES SOCIOEDUCATIVAS")



banco_FISCALIZACAO_ORDINARIA_UNIDADE <- ddply(banco_FISCALIZACAO_ORDINARIA_UNIDADE,
                                              c("DIA_UTIL_OU_PLANTAO"),
                                              summarise,
                                              QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_ORDINARIA_UNIDADE$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_ORDINARIA_UNIDADE$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_ORDINARIA_UNIDADE_bkp = banco_FISCALIZACAO_ORDINARIA_UNIDADE #salvando atos atendimento original
#acrescentando linha com total
banco_FISCALIZACAO_ORDINARIA_UNIDADE <- rbind(banco_FISCALIZACAO_ORDINARIA_UNIDADE,
                                              data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_ORDINARIA_UNIDADE$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_ORDINARIA_UNIDADE$PERCENTUAL),
                                                         stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_ORDINARIA_UNIDADE) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_UNIDADE FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO
#########################################################################################################

banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO ORDINÁRIA UNIDADES SOCIOEDUCATIVAS")

banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO <- ddply(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO,
                                                      c("PERIODO_DO_DIA"),
                                                      summarise,
                                                      QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO_bkp = banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO #salvando atos atendimento original

banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO_bkp$PERCENTUAL <- paste(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO_bkp$PERCENTUAL, "%", sep=" ")


#acrescentando linha com total
banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO <- rbind(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO,
                                                      data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO$PERCENTUAL),
                                                                 stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_UNIDADE_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE
#########################################################################################################

banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO EXTRAORDINÁRIA UNIDADES SOCIOEDUCATIVAS")



banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE <- ddply(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE,
                                                   c("DIA_UTIL_OU_PLANTAO"),
                                                   summarise,
                                                   QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_bkp = banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE #salvando atos atendimento original
#acrescentando linha com total
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE <- rbind(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE,
                                                   data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE$PERCENTUAL),
                                                              stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO
#########################################################################################################

banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO EXTRAORDINÁRIA UNIDADES SOCIOEDUCATIVAS")

banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO <- ddply(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO,
                                                           c("PERIODO_DO_DIA"),
                                                           summarise,
                                                           QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO_bkp = banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO #salvando atos atendimento original
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO_bkp$PERCENTUAL <- paste(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO <- rbind(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO,
                                                           data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO$PERCENTUAL),
                                                                      stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_UNIDADES_PLANTAO
#########################################################################################################

banco_FISCALIZACAO_UNIDADES_PLANTAO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÕES EM UNIDADES SOCIOEDUCATIVAS NOS FINAIS DE SEMANA E FERIADOS")



banco_FISCALIZACAO_UNIDADES_PLANTAO <- ddply(banco_FISCALIZACAO_UNIDADES_PLANTAO,
                                             c("DIA_UTIL_OU_PLANTAO"),
                                             summarise,
                                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_UNIDADES_PLANTAO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_UNIDADES_PLANTAO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_UNIDADES_PLANTAO_bkp = banco_FISCALIZACAO_UNIDADES_PLANTAO #salvando atos atendimento original
#acrescentando linha com total
banco_FISCALIZACAO_UNIDADES_PLANTAO <- rbind(banco_FISCALIZACAO_UNIDADES_PLANTAO,
                                             data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_UNIDADES_PLANTAO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_UNIDADES_PLANTAO$PERCENTUAL),
                                                        stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_UNIDADES_PLANTAO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_UNIDADES_PLANTAO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO
#########################################################################################################

banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÕES EM UNIDADES SOCIOEDUCATIVAS NOS FINAIS DE SEMANA E FERIADOS")

banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO <- ddply(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO,
                                                     c("PERIODO_DO_DIA"),
                                                     summarise,
                                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO_bkp = banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO #salvando atos atendimento original
banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO_bkp$PERCENTUAL <- paste(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO <- rbind(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO,
                                                     data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO$PERCENTUAL),
                                                                stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_UNIDADES_PLANTAO_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO
#########################################################################################################

banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO ORDINÁRIA PROGRAMAS MEIO ABERTO")


banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO <- ddply(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO,
                                                  c("DIA_UTIL_OU_PLANTAO"),
                                                  summarise,
                                                  QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_bkp = banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO #salvando atos atendimento original

#acrescentando linha com total
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO <- rbind(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO,
                                                  data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO$PERCENTUAL),
                                                             stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO
#########################################################################################################

banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO ORDINÁRIA PROGRAMAS MEIO ABERTO")

banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO <- ddply(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO,
                                                          c("PERIODO_DO_DIA"),
                                                          summarise,
                                                          QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO_bkp = banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO #salvando atos atendimento original
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL <- paste(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO <- rbind(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO,
                                                          data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO$PERCENTUAL),
                                                                     stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRA_MEIO_ABERTO
#########################################################################################################

banco_FISCALIZACAO_EXTRA_MEIO_ABERTO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO EXTRAORDINÁRIA PROGRAMAS MEIO ABERTO")


banco_FISCALIZACAO_EXTRA_MEIO_ABERTO <- ddply(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO,
                                              c("DIA_UTIL_OU_PLANTAO"),
                                              summarise,
                                              QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_bkp = banco_FISCALIZACAO_EXTRA_MEIO_ABERTO #salvando atos atendimento original

#acrescentando linha com total
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO <- rbind(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO,
                                              data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO$PERCENTUAL),
                                                         stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRA_MEIO_ABERTO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO
#########################################################################################################

banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "FISCALIZAÇÃO EXTRAORDINÁRIA PROGRAMAS MEIO ABERTO")

banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO <- ddply(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO,
                                                      c("PERIODO_DO_DIA"),
                                                      summarise,
                                                      QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO_bkp = banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO #salvando atos atendimento original
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL <- paste(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO <- rbind(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO,
                                                      data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO$PERCENTUAL),
                                                                 stringsAsFactors = FALSE))

colnames(banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_FISCALIZACAO_EXTRA_MEIO_ABERTO_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_INTERNACAO
#########################################################################################################

banco_CONCENTRADAS_INTERNACAO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "PARTICIPAÇÃO EM AUDIÊNCIAS CONCENTRADAS INTERNAÇÃO")


banco_CONCENTRADAS_INTERNACAO <- ddply(banco_CONCENTRADAS_INTERNACAO,
                                       c("DIA_UTIL_OU_PLANTAO"),
                                       summarise,
                                       QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CONCENTRADAS_INTERNACAO$PERCENTUAL <- round_preserve_sum(prop.table(banco_CONCENTRADAS_INTERNACAO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CONCENTRADAS_INTERNACAO_bkp = banco_CONCENTRADAS_INTERNACAO #salvando atos atendimento original

#acrescentando linha com total
banco_CONCENTRADAS_INTERNACAO <- rbind(banco_CONCENTRADAS_INTERNACAO,
                                       data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_CONCENTRADAS_INTERNACAO$QUANTIDADE), PERCENTUAL = sum(banco_CONCENTRADAS_INTERNACAO$PERCENTUAL),
                                                  stringsAsFactors = FALSE))

colnames(banco_CONCENTRADAS_INTERNACAO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_INTERNACAO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_INTERNACAO_PERIODO
#########################################################################################################

banco_CONCENTRADAS_INTERNACAO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "PARTICIPAÇÃO EM AUDIÊNCIAS CONCENTRADAS INTERNAÇÃO")

banco_CONCENTRADAS_INTERNACAO_PERIODO <- ddply(banco_CONCENTRADAS_INTERNACAO_PERIODO,
                                               c("PERIODO_DO_DIA"),
                                               summarise,
                                               QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CONCENTRADAS_INTERNACAO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_CONCENTRADAS_INTERNACAO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CONCENTRADAS_INTERNACAO_PERIODO_bkp = banco_CONCENTRADAS_INTERNACAO_PERIODO #salvando atos atendimento original
banco_CONCENTRADAS_INTERNACAO_PERIODO_bkp$PERCENTUAL <- paste(banco_CONCENTRADAS_INTERNACAO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_CONCENTRADAS_INTERNACAO_PERIODO <- rbind(banco_CONCENTRADAS_INTERNACAO_PERIODO,
                                               data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_CONCENTRADAS_INTERNACAO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_CONCENTRADAS_INTERNACAO_PERIODO$PERCENTUAL),
                                                          stringsAsFactors = FALSE))

colnames(banco_CONCENTRADAS_INTERNACAO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_INTERNACAO_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_SEMILIBERDADE
#########################################################################################################

banco_CONCENTRADAS_SEMILIBERDADE =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "PARTICIPAÇÃO EM AUDIÊNCIAS CONCENTRADAS SEMILIBERDADE")


banco_CONCENTRADAS_SEMILIBERDADE <- ddply(banco_CONCENTRADAS_SEMILIBERDADE,
                                          c("DIA_UTIL_OU_PLANTAO"),
                                          summarise,
                                          QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CONCENTRADAS_SEMILIBERDADE$PERCENTUAL <- round_preserve_sum(prop.table(banco_CONCENTRADAS_SEMILIBERDADE$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CONCENTRADAS_SEMILIBERDADE_bkp = banco_CONCENTRADAS_SEMILIBERDADE #salvando atos atendimento original

#acrescentando linha com total
banco_CONCENTRADAS_SEMILIBERDADE <- rbind(banco_CONCENTRADAS_SEMILIBERDADE,
                                          data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_CONCENTRADAS_SEMILIBERDADE$QUANTIDADE), PERCENTUAL = sum(banco_CONCENTRADAS_SEMILIBERDADE$PERCENTUAL),
                                                     stringsAsFactors = FALSE))

colnames(banco_CONCENTRADAS_SEMILIBERDADE) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_SEMILIBERDADE FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_SEMILIBERDADE_PERIODO
#########################################################################################################

banco_CONCENTRADAS_SEMILIBERDADE_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "PARTICIPAÇÃO EM AUDIÊNCIAS CONCENTRADAS SEMILIBERDADE")

banco_CONCENTRADAS_SEMILIBERDADE_PERIODO <- ddply(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO,
                                                  c("PERIODO_DO_DIA"),
                                                  summarise,
                                                  QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CONCENTRADAS_SEMILIBERDADE_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CONCENTRADAS_SEMILIBERDADE_PERIODO_bkp = banco_CONCENTRADAS_SEMILIBERDADE_PERIODO #salvando atos atendimento original
banco_CONCENTRADAS_SEMILIBERDADE_PERIODO_bkp$PERCENTUAL <- paste(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_CONCENTRADAS_SEMILIBERDADE_PERIODO <- rbind(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO,
                                                  data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO$PERCENTUAL),
                                                             stringsAsFactors = FALSE))

colnames(banco_CONCENTRADAS_SEMILIBERDADE_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CONCENTRADAS_SEMILIBERDADE_PERIODO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_SIND_PRESENCIAIS
#########################################################################################################

banco_SIND_PRESENCIAIS =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "SINDICÂNCIAS PRESENCIAIS")


banco_SIND_PRESENCIAIS <- ddply(banco_SIND_PRESENCIAIS,
                                c("DIA_UTIL_OU_PLANTAO"),
                                summarise,
                                QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_SIND_PRESENCIAIS$PERCENTUAL <- round_preserve_sum(prop.table(banco_SIND_PRESENCIAIS$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_SIND_PRESENCIAIS_bkp = banco_SIND_PRESENCIAIS #salvando atos atendimento original

#acrescentando linha com total
banco_SIND_PRESENCIAIS <- rbind(banco_SIND_PRESENCIAIS,
                                data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_SIND_PRESENCIAIS$QUANTIDADE), PERCENTUAL = sum(banco_SIND_PRESENCIAIS$PERCENTUAL),
                                           stringsAsFactors = FALSE))

colnames(banco_SIND_PRESENCIAIS) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_SIND_PRESENCIAIS FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_SIND_PRESENCIAIS_PERIODO
#########################################################################################################

banco_SIND_PRESENCIAIS_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "SINDICÂNCIAS PRESENCIAIS")

banco_SIND_PRESENCIAIS_PERIODO <- ddply(banco_SIND_PRESENCIAIS_PERIODO,
                                        c("PERIODO_DO_DIA"),
                                        summarise,
                                        QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_SIND_PRESENCIAIS_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_SIND_PRESENCIAIS_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_SIND_PRESENCIAIS_PERIODO_bkp = banco_SIND_PRESENCIAIS_PERIODO #salvando atos atendimento original
banco_SIND_PRESENCIAIS_PERIODO_bkp$PERCENTUAL <- paste(banco_SIND_PRESENCIAIS_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_SIND_PRESENCIAIS_PERIODO <- rbind(banco_SIND_PRESENCIAIS_PERIODO,
                                        data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_SIND_PRESENCIAIS_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_SIND_PRESENCIAIS_PERIODO$PERCENTUAL),
                                                   stringsAsFactors = FALSE))

colnames(banco_SIND_PRESENCIAIS_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_SIND_PRESENCIAIS_PERIODO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_SINDICANCIA_REMOTA
#########################################################################################################

banco_SINDICANCIA_REMOTA =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "SINDICÂNCIAS REMOTAS")


banco_SINDICANCIA_REMOTA <- ddply(banco_SINDICANCIA_REMOTA,
                                  c("DIA_UTIL_OU_PLANTAO"),
                                  summarise,
                                  QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_SINDICANCIA_REMOTA$PERCENTUAL <- round_preserve_sum(prop.table(banco_SINDICANCIA_REMOTA$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_SINDICANCIA_REMOTA_bkp = banco_SINDICANCIA_REMOTA #salvando atos atendimento original

#acrescentando linha com total
banco_SINDICANCIA_REMOTA <- rbind(banco_SINDICANCIA_REMOTA,
                                  data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_SINDICANCIA_REMOTA$QUANTIDADE), PERCENTUAL = sum(banco_SINDICANCIA_REMOTA$PERCENTUAL),
                                             stringsAsFactors = FALSE))

colnames(banco_SINDICANCIA_REMOTA) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_SINDICANCIA_REMOTA FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_SINDICANCIA_REMOTA_PERIODO
#########################################################################################################

banco_SINDICANCIA_REMOTA_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "SINDICÂNCIAS REMOTAS")

banco_SINDICANCIA_REMOTA_PERIODO <- ddply(banco_SINDICANCIA_REMOTA_PERIODO,
                                          c("PERIODO_DO_DIA"),
                                          summarise,
                                          QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_SINDICANCIA_REMOTA_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_SINDICANCIA_REMOTA_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_SINDICANCIA_REMOTA_PERIODO_bkp = banco_SINDICANCIA_REMOTA_PERIODO #salvando atos atendimento original
banco_SINDICANCIA_REMOTA_PERIODO_bkp$PERCENTUAL <- paste(banco_SINDICANCIA_REMOTA_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_SINDICANCIA_REMOTA_PERIODO <- rbind(banco_SINDICANCIA_REMOTA_PERIODO,
                                          data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_SINDICANCIA_REMOTA_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_SINDICANCIA_REMOTA_PERIODO$PERCENTUAL),
                                                     stringsAsFactors = FALSE))

colnames(banco_SINDICANCIA_REMOTA_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_SINDICANCIA_REMOTA_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_DILIGENCIA_REALIZADA
#########################################################################################################

banco_DILIGENCIA_REALIZADA =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "DILIGÊNCIA REALIZADA")


banco_DILIGENCIA_REALIZADA <- ddply(banco_DILIGENCIA_REALIZADA,
                                    c("DIA_UTIL_OU_PLANTAO"),
                                    summarise,
                                    QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_DILIGENCIA_REALIZADA$PERCENTUAL <- round_preserve_sum(prop.table(banco_DILIGENCIA_REALIZADA$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_DILIGENCIA_REALIZADA_bkp = banco_DILIGENCIA_REALIZADA #salvando atos atendimento original

#acrescentando linha com total
banco_DILIGENCIA_REALIZADA <- rbind(banco_DILIGENCIA_REALIZADA,
                                    data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_DILIGENCIA_REALIZADA$QUANTIDADE), PERCENTUAL = sum(banco_DILIGENCIA_REALIZADA$PERCENTUAL),
                                               stringsAsFactors = FALSE))

colnames(banco_DILIGENCIA_REALIZADA) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_DILIGENCIA_REALIZADA FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_DILIGENCIA_REALIZADA_PERIODO
#########################################################################################################

banco_DILIGENCIA_REALIZADA_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "DILIGÊNCIA REALIZADA")

banco_DILIGENCIA_REALIZADA_PERIODO <- ddply(banco_DILIGENCIA_REALIZADA_PERIODO,
                                            c("PERIODO_DO_DIA"),
                                            summarise,
                                            QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_DILIGENCIA_REALIZADA_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_DILIGENCIA_REALIZADA_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_DILIGENCIA_REALIZADA_PERIODO_bkp = banco_DILIGENCIA_REALIZADA_PERIODO #salvando atos atendimento original
banco_DILIGENCIA_REALIZADA_PERIODO_bkp$PERCENTUAL <- paste(banco_DILIGENCIA_REALIZADA_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_DILIGENCIA_REALIZADA_PERIODO <- rbind(banco_DILIGENCIA_REALIZADA_PERIODO,
                                            data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_DILIGENCIA_REALIZADA_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_DILIGENCIA_REALIZADA_PERIODO$PERCENTUAL),
                                                       stringsAsFactors = FALSE))

colnames(banco_DILIGENCIA_REALIZADA_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_DILIGENCIA_REALIZADA_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_CADASTRAMENTO_CNJ
#########################################################################################################

banco_CADASTRAMENTO_CNJ =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "CADASTRAMENTO FISCALIZAÇÃO CNJ")


banco_CADASTRAMENTO_CNJ <- ddply(banco_CADASTRAMENTO_CNJ,
                                 c("DIA_UTIL_OU_PLANTAO"),
                                 summarise,
                                 QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CADASTRAMENTO_CNJ$PERCENTUAL <- round_preserve_sum(prop.table(banco_CADASTRAMENTO_CNJ$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CADASTRAMENTO_CNJ_bkp = banco_CADASTRAMENTO_CNJ #salvando atos atendimento original

#acrescentando linha com total
banco_CADASTRAMENTO_CNJ <- rbind(banco_CADASTRAMENTO_CNJ,
                                 data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_CADASTRAMENTO_CNJ$QUANTIDADE), PERCENTUAL = sum(banco_CADASTRAMENTO_CNJ$PERCENTUAL),
                                            stringsAsFactors = FALSE))

colnames(banco_CADASTRAMENTO_CNJ) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CADASTRAMENTO_CNJ FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_CADASTRAMENTO_CNJ_PERIODO
#########################################################################################################

banco_CADASTRAMENTO_CNJ_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "CADASTRAMENTO FISCALIZAÇÃO CNJ")

banco_CADASTRAMENTO_CNJ_PERIODO <- ddply(banco_CADASTRAMENTO_CNJ_PERIODO,
                                         c("PERIODO_DO_DIA"),
                                         summarise,
                                         QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_CADASTRAMENTO_CNJ_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_CADASTRAMENTO_CNJ_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_CADASTRAMENTO_CNJ_PERIODO_bkp = banco_CADASTRAMENTO_CNJ_PERIODO #salvando atos atendimento original
banco_CADASTRAMENTO_CNJ_PERIODO_bkp$PERCENTUAL <- paste(banco_CADASTRAMENTO_CNJ_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_CADASTRAMENTO_CNJ_PERIODO <- rbind(banco_CADASTRAMENTO_CNJ_PERIODO,
                                         data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_CADASTRAMENTO_CNJ_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_CADASTRAMENTO_CNJ_PERIODO$PERCENTUAL),
                                                    stringsAsFactors = FALSE))

colnames(banco_CADASTRAMENTO_CNJ_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_CADASTRAMENTO_CNJ_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_MONITORAMENTO_UNIDADE
#########################################################################################################

banco_MONITORAMENTO_UNIDADE =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "MONITORAMENTO UNIDADE SOCIOEDUCATIVA")


banco_MONITORAMENTO_UNIDADE <- ddply(banco_MONITORAMENTO_UNIDADE,
                                     c("DIA_UTIL_OU_PLANTAO"),
                                     summarise,
                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MONITORAMENTO_UNIDADE$PERCENTUAL <- round_preserve_sum(prop.table(banco_MONITORAMENTO_UNIDADE$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MONITORAMENTO_UNIDADE_bkp = banco_MONITORAMENTO_UNIDADE #salvando atos atendimento original

#acrescentando linha com total
banco_MONITORAMENTO_UNIDADE <- rbind(banco_MONITORAMENTO_UNIDADE,
                                     data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_MONITORAMENTO_UNIDADE$QUANTIDADE), PERCENTUAL = sum(banco_MONITORAMENTO_UNIDADE$PERCENTUAL),
                                                stringsAsFactors = FALSE))

colnames(banco_MONITORAMENTO_UNIDADE) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MONITORAMENTO_UNIDADE FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_MONITORAMENTO_UNIDADE_PERIODO
#########################################################################################################

banco_MONITORAMENTO_UNIDADE_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "MONITORAMENTO UNIDADE SOCIOEDUCATIVA")

banco_MONITORAMENTO_UNIDADE_PERIODO <- ddply(banco_MONITORAMENTO_UNIDADE_PERIODO,
                                             c("PERIODO_DO_DIA"),
                                             summarise,
                                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MONITORAMENTO_UNIDADE_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_MONITORAMENTO_UNIDADE_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MONITORAMENTO_UNIDADE_PERIODO_bkp = banco_MONITORAMENTO_UNIDADE_PERIODO #salvando atos atendimento original
banco_MONITORAMENTO_UNIDADE_PERIODO_bkp$PERCENTUAL <- paste(banco_MONITORAMENTO_UNIDADE_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_MONITORAMENTO_UNIDADE_PERIODO <- rbind(banco_MONITORAMENTO_UNIDADE_PERIODO,
                                             data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_MONITORAMENTO_UNIDADE_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_MONITORAMENTO_UNIDADE_PERIODO$PERCENTUAL),
                                                        stringsAsFactors = FALSE))

colnames(banco_MONITORAMENTO_UNIDADE_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MONITORAMENTO_UNIDADE_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_ATENDIMENTO_REMOTO
#########################################################################################################

banco_ATENDIMENTO_REMOTO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "ATENDIMENTO REMOTO")


banco_ATENDIMENTO_REMOTO <- ddply(banco_ATENDIMENTO_REMOTO,
                                  c("DIA_UTIL_OU_PLANTAO"),
                                  summarise,
                                  QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ATENDIMENTO_REMOTO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ATENDIMENTO_REMOTO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ATENDIMENTO_REMOTO_bkp = banco_ATENDIMENTO_REMOTO #salvando atos atendimento original

#acrescentando linha com total
banco_ATENDIMENTO_REMOTO <- rbind(banco_ATENDIMENTO_REMOTO,
                                  data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_ATENDIMENTO_REMOTO$QUANTIDADE), PERCENTUAL = sum(banco_ATENDIMENTO_REMOTO$PERCENTUAL),
                                             stringsAsFactors = FALSE))

colnames(banco_ATENDIMENTO_REMOTO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ATENDIMENTO_REMOTO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_ATENDIMENTO_REMOTO_PERIODO
#########################################################################################################

banco_ATENDIMENTO_REMOTO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "ATENDIMENTO REMOTO")

banco_ATENDIMENTO_REMOTO_PERIODO <- ddply(banco_ATENDIMENTO_REMOTO_PERIODO,
                                          c("PERIODO_DO_DIA"),
                                          summarise,
                                          QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ATENDIMENTO_REMOTO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ATENDIMENTO_REMOTO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ATENDIMENTO_REMOTO_PERIODO_bkp = banco_ATENDIMENTO_REMOTO_PERIODO #salvando atos atendimento original
banco_ATENDIMENTO_REMOTO_PERIODO_bkp$PERCENTUAL <- paste(banco_ATENDIMENTO_REMOTO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_ATENDIMENTO_REMOTO_PERIODO <- rbind(banco_ATENDIMENTO_REMOTO_PERIODO,
                                          data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_ATENDIMENTO_REMOTO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_ATENDIMENTO_REMOTO_PERIODO$PERCENTUAL),
                                                     stringsAsFactors = FALSE))

colnames(banco_ATENDIMENTO_REMOTO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ATENDIMENTO_REMOTO_PERIODO FIM
#########################################################################################################



#########################################################################################################
#TRATAMENTO banco_RELATORIOS_PRODUZIDOS
#########################################################################################################

banco_RELATORIOS_PRODUZIDOS =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "RELATÓRIOS PRODUZIDOS")


banco_RELATORIOS_PRODUZIDOS <- ddply(banco_RELATORIOS_PRODUZIDOS,
                                     c("DIA_UTIL_OU_PLANTAO"),
                                     summarise,
                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_RELATORIOS_PRODUZIDOS$PERCENTUAL <- round_preserve_sum(prop.table(banco_RELATORIOS_PRODUZIDOS$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_RELATORIOS_PRODUZIDOS_bkp = banco_RELATORIOS_PRODUZIDOS #salvando atos atendimento original

#acrescentando linha com total
banco_RELATORIOS_PRODUZIDOS <- rbind(banco_RELATORIOS_PRODUZIDOS,
                                     data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_RELATORIOS_PRODUZIDOS$QUANTIDADE), PERCENTUAL = sum(banco_RELATORIOS_PRODUZIDOS$PERCENTUAL),
                                                stringsAsFactors = FALSE))

colnames(banco_RELATORIOS_PRODUZIDOS) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_RELATORIOS_PRODUZIDOS FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_RELATORIOS_PRODUZIDOS_PERIODO
#########################################################################################################

banco_RELATORIOS_PRODUZIDOS_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "RELATÓRIOS PRODUZIDOS")

banco_RELATORIOS_PRODUZIDOS_PERIODO <- ddply(banco_RELATORIOS_PRODUZIDOS_PERIODO,
                                             c("PERIODO_DO_DIA"),
                                             summarise,
                                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_RELATORIOS_PRODUZIDOS_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_RELATORIOS_PRODUZIDOS_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_RELATORIOS_PRODUZIDOS_PERIODO_bkp = banco_RELATORIOS_PRODUZIDOS_PERIODO #salvando atos atendimento original
banco_RELATORIOS_PRODUZIDOS_PERIODO_bkp$PERCENTUAL <- paste(banco_RELATORIOS_PRODUZIDOS_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_RELATORIOS_PRODUZIDOS_PERIODO <- rbind(banco_RELATORIOS_PRODUZIDOS_PERIODO,
                                             data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_RELATORIOS_PRODUZIDOS_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_RELATORIOS_PRODUZIDOS_PERIODO$PERCENTUAL),
                                                        stringsAsFactors = FALSE))

colnames(banco_RELATORIOS_PRODUZIDOS_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_RELATORIOS_PRODUZIDOS_PERIODO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_OFICIOS_PRODUZIDOS
#########################################################################################################

banco_OFICIOS_PRODUZIDOS =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "OFÍCIOS PRODUZIDOS")


banco_OFICIOS_PRODUZIDOS <- ddply(banco_OFICIOS_PRODUZIDOS,
                                  c("DIA_UTIL_OU_PLANTAO"),
                                  summarise,
                                  QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_OFICIOS_PRODUZIDOS$PERCENTUAL <- round_preserve_sum(prop.table(banco_OFICIOS_PRODUZIDOS$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_OFICIOS_PRODUZIDOS_bkp = banco_OFICIOS_PRODUZIDOS #salvando atos atendimento original

#acrescentando linha com total
banco_OFICIOS_PRODUZIDOS <- rbind(banco_OFICIOS_PRODUZIDOS,
                                  data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_OFICIOS_PRODUZIDOS$QUANTIDADE), PERCENTUAL = sum(banco_OFICIOS_PRODUZIDOS$PERCENTUAL),
                                             stringsAsFactors = FALSE))

colnames(banco_OFICIOS_PRODUZIDOS) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_OFICIOS_PRODUZIDOS FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_OFICIOS_PRODUZIDOS_PERIODO
#########################################################################################################

banco_OFICIOS_PRODUZIDOS_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "OFÍCIOS PRODUZIDOS")

banco_OFICIOS_PRODUZIDOS_PERIODO <- ddply(banco_OFICIOS_PRODUZIDOS_PERIODO,
                                          c("PERIODO_DO_DIA"),
                                          summarise,
                                          QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_OFICIOS_PRODUZIDOS_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_OFICIOS_PRODUZIDOS_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_OFICIOS_PRODUZIDOS_PERIODO_bkp = banco_OFICIOS_PRODUZIDOS_PERIODO #salvando atos atendimento original
banco_OFICIOS_PRODUZIDOS_PERIODO_bkp$PERCENTUAL <- paste(banco_OFICIOS_PRODUZIDOS_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_OFICIOS_PRODUZIDOS_PERIODO <- rbind(banco_OFICIOS_PRODUZIDOS_PERIODO,
                                          data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_OFICIOS_PRODUZIDOS_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_OFICIOS_PRODUZIDOS_PERIODO$PERCENTUAL),
                                                     stringsAsFactors = FALSE))

colnames(banco_OFICIOS_PRODUZIDOS_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_OFICIOS_PRODUZIDOS_PERIODO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_MAIL_RECEBIDO_TRATADO
#########################################################################################################

banco_MAIL_RECEBIDO_TRATADO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "EMAIL RECEBIDO E TRATADO")


banco_MAIL_RECEBIDO_TRATADO <- ddply(banco_MAIL_RECEBIDO_TRATADO,
                                     c("DIA_UTIL_OU_PLANTAO"),
                                     summarise,
                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MAIL_RECEBIDO_TRATADO$PERCENTUAL <- round_preserve_sum(prop.table(banco_MAIL_RECEBIDO_TRATADO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MAIL_RECEBIDO_TRATADO_bkp = banco_MAIL_RECEBIDO_TRATADO #salvando atos atendimento original

#acrescentando linha com total
banco_MAIL_RECEBIDO_TRATADO <- rbind(banco_MAIL_RECEBIDO_TRATADO,
                                     data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_MAIL_RECEBIDO_TRATADO$QUANTIDADE), PERCENTUAL = sum(banco_MAIL_RECEBIDO_TRATADO$PERCENTUAL),
                                                stringsAsFactors = FALSE))

colnames(banco_MAIL_RECEBIDO_TRATADO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MAIL_RECEBIDO_TRATADO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_MAIL_RECEBIDO_TRATADO_PERIODO
#########################################################################################################

banco_MAIL_RECEBIDO_TRATADO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "EMAIL RECEBIDO E TRATADO")

banco_MAIL_RECEBIDO_TRATADO_PERIODO <- ddply(banco_MAIL_RECEBIDO_TRATADO_PERIODO,
                                             c("PERIODO_DO_DIA"),
                                             summarise,
                                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MAIL_RECEBIDO_TRATADO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_MAIL_RECEBIDO_TRATADO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MAIL_RECEBIDO_TRATADO_PERIODO_bkp = banco_MAIL_RECEBIDO_TRATADO_PERIODO #salvando atos atendimento original
banco_MAIL_RECEBIDO_TRATADO_PERIODO_bkp$PERCENTUAL <- paste(banco_MAIL_RECEBIDO_TRATADO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_MAIL_RECEBIDO_TRATADO_PERIODO <- rbind(banco_MAIL_RECEBIDO_TRATADO_PERIODO,
                                             data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_MAIL_RECEBIDO_TRATADO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_MAIL_RECEBIDO_TRATADO_PERIODO$PERCENTUAL),
                                                        stringsAsFactors = FALSE))

colnames(banco_MAIL_RECEBIDO_TRATADO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MAIL_RECEBIDO_TRATADO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_MAIL_PRODUZIDO
#########################################################################################################

banco_MAIL_PRODUZIDO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "EMAIL PRODUZIDO")


banco_MAIL_PRODUZIDO <- ddply(banco_MAIL_PRODUZIDO,
                              c("DIA_UTIL_OU_PLANTAO"),
                              summarise,
                              QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MAIL_PRODUZIDO$PERCENTUAL <- round_preserve_sum(prop.table(banco_MAIL_PRODUZIDO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MAIL_PRODUZIDO_bkp = banco_MAIL_PRODUZIDO #salvando atos atendimento original

#acrescentando linha com total
banco_MAIL_PRODUZIDO <- rbind(banco_MAIL_PRODUZIDO,
                              data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_MAIL_PRODUZIDO$QUANTIDADE), PERCENTUAL = sum(banco_MAIL_PRODUZIDO$PERCENTUAL),
                                         stringsAsFactors = FALSE))

colnames(banco_MAIL_PRODUZIDO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MAIL_PRODUZIDO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_MAIL_PRODUZIDO_PERIODO
#########################################################################################################

banco_MAIL_PRODUZIDO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "EMAIL PRODUZIDO")

banco_MAIL_PRODUZIDO_PERIODO <- ddply(banco_MAIL_PRODUZIDO_PERIODO,
                                      c("PERIODO_DO_DIA"),
                                      summarise,
                                      QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_MAIL_PRODUZIDO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_MAIL_PRODUZIDO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_MAIL_PRODUZIDO_PERIODO_bkp = banco_MAIL_PRODUZIDO_PERIODO #salvando atos atendimento original
banco_MAIL_PRODUZIDO_PERIODO_bkp$PERCENTUAL <- paste(banco_MAIL_PRODUZIDO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_MAIL_PRODUZIDO_PERIODO <- rbind(banco_MAIL_PRODUZIDO_PERIODO,
                                      data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_MAIL_PRODUZIDO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_MAIL_PRODUZIDO_PERIODO$PERCENTUAL),
                                                 stringsAsFactors = FALSE))

colnames(banco_MAIL_PRODUZIDO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_MAIL_PRODUZIDO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_REUNIAO_REALIZADA
#########################################################################################################

banco_REUNIAO_REALIZADA =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "REUNIÃO REALIZADA")


banco_REUNIAO_REALIZADA <- ddply(banco_REUNIAO_REALIZADA,
                                 c("DIA_UTIL_OU_PLANTAO"),
                                 summarise,
                                 QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_REUNIAO_REALIZADA$PERCENTUAL <- round_preserve_sum(prop.table(banco_REUNIAO_REALIZADA$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_REUNIAO_REALIZADA_bkp = banco_REUNIAO_REALIZADA #salvando atos atendimento original

#acrescentando linha com total
banco_REUNIAO_REALIZADA <- rbind(banco_REUNIAO_REALIZADA,
                                 data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_REUNIAO_REALIZADA$QUANTIDADE), PERCENTUAL = sum(banco_REUNIAO_REALIZADA$PERCENTUAL),
                                            stringsAsFactors = FALSE))

colnames(banco_REUNIAO_REALIZADA) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_REUNIAO_REALIZADA FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_REUNIAO_REALIZADA_PERIODO
#########################################################################################################

banco_REUNIAO_REALIZADA_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "REUNIÃO REALIZADA")

banco_REUNIAO_REALIZADA_PERIODO <- ddply(banco_REUNIAO_REALIZADA_PERIODO,
                                         c("PERIODO_DO_DIA"),
                                         summarise,
                                         QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_REUNIAO_REALIZADA_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_REUNIAO_REALIZADA_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_REUNIAO_REALIZADA_PERIODO_bkp = banco_REUNIAO_REALIZADA_PERIODO #salvando atos atendimento original
banco_REUNIAO_REALIZADA_PERIODO_bkp$PERCENTUAL <- paste(banco_REUNIAO_REALIZADA_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_REUNIAO_REALIZADA_PERIODO <- rbind(banco_REUNIAO_REALIZADA_PERIODO,
                                         data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_REUNIAO_REALIZADA_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_REUNIAO_REALIZADA_PERIODO$PERCENTUAL),
                                                    stringsAsFactors = FALSE))

colnames(banco_REUNIAO_REALIZADA_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_REUNIAO_REALIZADA_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_COLETA_REMOTA
#########################################################################################################

banco_COLETA_REMOTA =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "COLETA DE INFORMAÇÃO REMOTA")


banco_COLETA_REMOTA <- ddply(banco_COLETA_REMOTA,
                             c("DIA_UTIL_OU_PLANTAO"),
                             summarise,
                             QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_COLETA_REMOTA$PERCENTUAL <- round_preserve_sum(prop.table(banco_COLETA_REMOTA$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_COLETA_REMOTA_bkp = banco_COLETA_REMOTA #salvando atos atendimento original

#acrescentando linha com total
banco_COLETA_REMOTA <- rbind(banco_COLETA_REMOTA,
                             data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_COLETA_REMOTA$QUANTIDADE), PERCENTUAL = sum(banco_COLETA_REMOTA$PERCENTUAL),
                                        stringsAsFactors = FALSE))

colnames(banco_COLETA_REMOTA) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_COLETA_REMOTA FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_COLETA_REMOTA_PERIODO
#########################################################################################################

banco_COLETA_REMOTA_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "COLETA DE INFORMAÇÃO REMOTA")

banco_COLETA_REMOTA_PERIODO <- ddply(banco_COLETA_REMOTA_PERIODO,
                                     c("PERIODO_DO_DIA"),
                                     summarise,
                                     QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_COLETA_REMOTA_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_COLETA_REMOTA_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_COLETA_REMOTA_PERIODO_bkp = banco_COLETA_REMOTA_PERIODO #salvando atos atendimento original
banco_COLETA_REMOTA_PERIODO_bkp$PERCENTUAL <- paste(banco_COLETA_REMOTA_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_COLETA_REMOTA_PERIODO <- rbind(banco_COLETA_REMOTA_PERIODO,
                                     data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_COLETA_REMOTA_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_COLETA_REMOTA_PERIODO$PERCENTUAL),
                                                stringsAsFactors = FALSE))

colnames(banco_COLETA_REMOTA_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_COLETA_REMOTA_PERIODO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_ZAP_RECEBIDO
#########################################################################################################

banco_ZAP_RECEBIDO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) RECEBIDAS DE UNIDADES SOCIOEDUCATIVAS")


banco_ZAP_RECEBIDO <- ddply(banco_ZAP_RECEBIDO,
                            c("DIA_UTIL_OU_PLANTAO"),
                            summarise,
                            QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ZAP_RECEBIDO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ZAP_RECEBIDO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ZAP_RECEBIDO_bkp = banco_ZAP_RECEBIDO #salvando atos atendimento original

#acrescentando linha com total
banco_ZAP_RECEBIDO <- rbind(banco_ZAP_RECEBIDO,
                            data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_ZAP_RECEBIDO$QUANTIDADE), PERCENTUAL = sum(banco_ZAP_RECEBIDO$PERCENTUAL),
                                       stringsAsFactors = FALSE))

colnames(banco_ZAP_RECEBIDO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ZAP_RECEBIDO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_ZAP_RECEBIDO_PERIODO
#########################################################################################################

banco_ZAP_RECEBIDO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) RECEBIDAS DE UNIDADES SOCIOEDUCATIVAS")

banco_ZAP_RECEBIDO_PERIODO <- ddply(banco_ZAP_RECEBIDO_PERIODO,
                                    c("PERIODO_DO_DIA"),
                                    summarise,
                                    QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ZAP_RECEBIDO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ZAP_RECEBIDO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ZAP_RECEBIDO_PERIODO_bkp = banco_ZAP_RECEBIDO_PERIODO #salvando atos atendimento original
banco_ZAP_RECEBIDO_PERIODO_bkp$PERCENTUAL <- paste(banco_ZAP_RECEBIDO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_ZAP_RECEBIDO_PERIODO <- rbind(banco_ZAP_RECEBIDO_PERIODO,
                                    data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_ZAP_RECEBIDO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_ZAP_RECEBIDO_PERIODO$PERCENTUAL),
                                               stringsAsFactors = FALSE))

colnames(banco_ZAP_RECEBIDO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ZAP_RECEBIDO_PERIODO FIM
########################################################################################################


#########################################################################################################
#TRATAMENTO banco_ZAP_ENCAMINHADO
#########################################################################################################

banco_ZAP_ENCAMINHADO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) ENCAMINHADAS PARA UNIDADES SOCIOEDUCATIVAS")


banco_ZAP_ENCAMINHADO <- ddply(banco_ZAP_ENCAMINHADO,
                               c("DIA_UTIL_OU_PLANTAO"),
                               summarise,
                               QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ZAP_ENCAMINHADO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ZAP_ENCAMINHADO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ZAP_ENCAMINHADO_bkp = banco_ZAP_ENCAMINHADO #salvando atos atendimento original

#acrescentando linha com total
banco_ZAP_ENCAMINHADO <- rbind(banco_ZAP_ENCAMINHADO,
                               data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_ZAP_ENCAMINHADO$QUANTIDADE), PERCENTUAL = sum(banco_ZAP_ENCAMINHADO$PERCENTUAL),
                                          stringsAsFactors = FALSE))

colnames(banco_ZAP_ENCAMINHADO) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ZAP_ENCAMINHADO FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_ZAP_ENCAMINHADO_PERIODO
#########################################################################################################

banco_ZAP_ENCAMINHADO_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "(MENSAGENS WHATSAPP – LIGAÇÕES) ENCAMINHADAS PARA UNIDADES SOCIOEDUCATIVAS")



banco_ZAP_ENCAMINHADO_PERIODO <- ddply(banco_ZAP_ENCAMINHADO_PERIODO,
                                       c("PERIODO_DO_DIA"),
                                       summarise,
                                       QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_ZAP_ENCAMINHADO_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_ZAP_ENCAMINHADO_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_ZAP_ENCAMINHADO_PERIODO_bkp = banco_ZAP_ENCAMINHADO_PERIODO #salvando atos atendimento original
banco_ZAP_ENCAMINHADO_PERIODO_bkp$PERCENTUAL <- paste(banco_ZAP_ENCAMINHADO_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_ZAP_ENCAMINHADO_PERIODO <- rbind(banco_ZAP_ENCAMINHADO_PERIODO,
                                       data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_ZAP_ENCAMINHADO_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_ZAP_ENCAMINHADO_PERIODO$PERCENTUAL),
                                                  stringsAsFactors = FALSE))

colnames(banco_ZAP_ENCAMINHADO_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_ZAP_ENCAMINHADO_PERIODO FIM
#########################################################################################################


#########################################################################################################
#TRATAMENTO banco_OUTRAS_DEMANDAS
#########################################################################################################

banco_OUTRAS_DEMANDAS =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "OUTRAS DEMANDAS")


banco_OUTRAS_DEMANDAS <- ddply(banco_OUTRAS_DEMANDAS,
                               c("DIA_UTIL_OU_PLANTAO"),
                               summarise,
                               QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_OUTRAS_DEMANDAS$PERCENTUAL <- round_preserve_sum(prop.table(banco_OUTRAS_DEMANDAS$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_OUTRAS_DEMANDAS_bkp = banco_OUTRAS_DEMANDAS #salvando atos atendimento original

#acrescentando linha com total
banco_OUTRAS_DEMANDAS <- rbind(banco_OUTRAS_DEMANDAS,
                               data.frame(DIA_UTIL_OU_PLANTAO = "TOTAL", QUANTIDADE = sum(banco_OUTRAS_DEMANDAS$QUANTIDADE), PERCENTUAL = sum(banco_OUTRAS_DEMANDAS$PERCENTUAL),
                                          stringsAsFactors = FALSE))

colnames(banco_OUTRAS_DEMANDAS) <- c("PERÍODO", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_OUTRAS_DEMANDAS FIM
#########################################################################################################

#########################################################################################################
#TRATAMENTO banco_OUTRAS_DEMANDAS_PERIODO
#########################################################################################################

banco_OUTRAS_DEMANDAS_PERIODO =
  banco_MATRIZ %>%
  select(DIA_UTIL_OU_PLANTAO, PERIODO_DO_DIA, TIPO_DILIGENCIA, QUANTIDADE) %>%
  filter(TIPO_DILIGENCIA == "OUTRAS DEMANDAS")

banco_OUTRAS_DEMANDAS_PERIODO <- ddply(banco_OUTRAS_DEMANDAS_PERIODO,
                                       c("PERIODO_DO_DIA"),
                                       summarise,
                                       QUANTIDADE = sum(QUANTIDADE))


#########################################################################################################
#########################################################################################################


#acrescentando coluna com percentual

#funcao para preservar soma de 100 no processamento do round:
round_preserve_sum <- function(x, digits = 0) {
  up <- 10 ^ digits
  x <- x * up
  y <- floor(x)
  indices <- tail(order(x-y), round(sum(x)) - sum(y))
  y[indices] <- y[indices] + 1
  return(y / up)
}

#usando a funcao criada:
#TIPO_DILIGENCIA$PERCENTUAL <- round(prop.table(TIPO_DILIGENCIA$QUANTIDADE)*100, 2)
banco_OUTRAS_DEMANDAS_PERIODO$PERCENTUAL <- round_preserve_sum(prop.table(banco_OUTRAS_DEMANDAS_PERIODO$QUANTIDADE)*100, 2)

#outra forma de calcular percentual
#TIPO_DILIGENCIA = mutate(TIPO_DILIGENCIA,
#                          PERCENTUAL = (QUANTIDADE / sum(QUANTIDADE))*100)
banco_OUTRAS_DEMANDAS_PERIODO_bkp = banco_OUTRAS_DEMANDAS_PERIODO #salvando atos atendimento original
banco_OUTRAS_DEMANDAS_PERIODO_bkp$PERCENTUAL <- paste(banco_OUTRAS_DEMANDAS_PERIODO_bkp$PERCENTUAL, "%", sep=" ")

#acrescentando linha com total
banco_OUTRAS_DEMANDAS_PERIODO <- rbind(banco_OUTRAS_DEMANDAS_PERIODO,
                                       data.frame(PERIODO_DO_DIA = "TOTAL", QUANTIDADE = sum(banco_OUTRAS_DEMANDAS_PERIODO$QUANTIDADE), PERCENTUAL = sum(banco_OUTRAS_DEMANDAS_PERIODO$PERCENTUAL),
                                                  stringsAsFactors = FALSE))

colnames(banco_OUTRAS_DEMANDAS_PERIODO) <- c("PERÍODO DO DIA", "QUANTIDADE", "%")

#########################################################################################################
#TRATAMENTO banco_OUTRAS_DEMANDAS_PERIODO FIM
#########################################################################################################


#########################################################################################################
#tabela alternativa
#########################################################################################################
#salvando tabela
#pdf(file="TABELA_001_df_atendimento.pdf", width = 6, height = 3, title = "tabela_df_atendimento_alternativa")
setwd(file.path("~/diretorio_r/estcomissariado/R/"))#configurar diretorio
#########################################################################################################
#FIM
#########################################################################################################

