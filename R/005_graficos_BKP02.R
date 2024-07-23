#########################################################################################################
#pdf(file="TABELA_002_incidencia_comparada_alternativa.pdf", width = 5, height = 7, title = "INCIDENCIA COMPARADA")
setwd(file.path("~/diretorio_r/estcomissariado/img_nao_apagar/"))

GRAFICO <- read.csv("grafico.csv",header=TRUE, sep="|", dec=".", encoding = "UTF-8", skip = 0) ##Lendo arquivo de texto separado por vírgulas (CSV) e que usa o ponto.

#TABELA GT
#TABELA GT

#########################################################################################################
dir.create(file.path("~/diretorio_r/estcomissariado", "imagens"))
#########################################################################################################
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_AUDIENCIAS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_AUDIENCIAS_bkp =
  QUANT_AUDIENCIAS_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_AUDIENCIAS_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[1,],": Atendimento audiências, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 947))
ggsave("GRAFICO[1,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((TOTAL_ADL_ATENDIDOS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

TOTAL_ADL_ATENDIDOS_bkp =
  TOTAL_ADL_ATENDIDOS_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(TOTAL_ADL_ATENDIDOS_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[2,],": Atendimento adolescentes, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 1046))
ggsave("GRAFICO[2,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((PRESENCA_PAIS_AUD_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

PRESENCA_PAIS_AUD_bkp =
  PRESENCA_PAIS_AUD_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(PRESENCA_PAIS_AUD_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[3,],": Atendimento aos pais/responsáveis, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 606))
ggsave("GRAFICO[3,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((TOTAL_TESTEMUNHA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

TOTAL_TESTEMUNHA_bkp =
  TOTAL_TESTEMUNHA_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(TOTAL_TESTEMUNHA_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[4,],": Atendimento testemunhas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 541))
ggsave("GRAFICO[4,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_NAMSEP_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_NAMSEP_bkp =
  QUANT_ENC_NAMSEP_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_NAMSEP_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[5,],": Encaminhamento NAMSEP, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 300))
ggsave("GRAFICO[5,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_NEAF_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_NEAF_bkp =
  QUANT_ENC_NEAF_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_NEAF_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[6,],": Encaminhamento NEAF, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 55))
ggsave("GRAFICO[6,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_MASCULINO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_MASCULINO_bkp =
  QUANT_ENC_MASCULINO_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_MASCULINO_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[7,],": Encaminhamento aos CEIP's masculinos, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 225))
ggsave("GRAFICO[7,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_FEMININO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_FEMININO_bkp =
  QUANT_ENC_FEMININO_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_FEMININO_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[8,],": Encaminhamento ao CEIP feminino, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 5))
ggsave("GRAFICO[8,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_CT_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_CT_bkp =
  QUANT_ENC_CT_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_CT_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[9,],": Encaminhamento ao Conselho Tutelar, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 20))
ggsave("GRAFICO[9,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_PAIS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_PAIS_bkp =
  QUANT_ENC_PAIS_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_PAIS_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[10,],": Encaminhamento aos pais/responsáveis, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 452))
ggsave("GRAFICO[10,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################

#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_PPCAAM_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_PPCAAM_bkp =
  QUANT_ENC_PPCAAM_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_PPCAAM_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[11,],": Encaminhamento ao PPCAAM, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 5))
ggsave("GRAFICO[11,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_JR_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_JR_bkp =
  QUANT_ENC_JR_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_JR_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[12,],": Encaminhamento para Justiça Restaurativa, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 13))
ggsave("GRAFICO[12,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_CEDIPRO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_CEDIPRO_bkp =
  QUANT_ENC_CEDIPRO_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_CEDIPRO_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[13,],": Encaminhamento ao CEDIPRO, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 51))
ggsave("GRAFICO[13,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_DESEMBOLA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_DESEMBOLA_bkp =
  QUANT_ENC_DESEMBOLA_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_DESEMBOLA_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[14,],": Encaminhamento DESEMBOLA, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 8))
ggsave("GRAFICO[14,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#Atendimento ao adolescente
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))

#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((QUANT_ENC_OUTRAS_INST_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

QUANT_ENC_OUTRAS_INST_bkp =
  QUANT_ENC_OUTRAS_INST_bkp |>
  mutate(PERIODO2 = fct_reorder(PERIODO2, QUANTIDADE))

ggplot(QUANT_ENC_OUTRAS_INST_bkp, aes(x = PERIODO2, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[15,],": Encaminhamento outras instituições, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL/SUASE/DOPCAD",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 69))
ggsave("GRAFICO[15,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_TIPO_DILIGENCIA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_TIPO_DILIGENCIA_bkp =
  banco_TIPO_DILIGENCIA_bkp |>
  mutate(TIPO_DILIGENCIA = fct_reorder(TIPO_DILIGENCIA, QUANTIDADE))

ggplot(banco_TIPO_DILIGENCIA_bkp, aes(x = TIPO_DILIGENCIA, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[16,],": Total de atendimentos realizados, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 2150))
ggsave("GRAFICO[16,].png", width=15, height=10, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp =
  banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_INSPECAO_COM_JUIZ_INTERNACAO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[17,],": Inspeção com o Juiz em unidade de internação, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 11))
ggsave("GRAFICO[17,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_bkp =
  banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[18,],": Inspeção com o Juiz em unidade de semiliberdade, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 2))
ggsave("GRAFICO[18,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_bkp =
  banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[19,],": Inspeção com o Juiz em programa de meio aberto, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 4))
ggsave("GRAFICO[19,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_FISCALIZACAO_ORDINARIA_UNIDADE_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_FISCALIZACAO_ORDINARIA_UNIDADE_bkp =
  banco_FISCALIZACAO_ORDINARIA_UNIDADE_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_FISCALIZACAO_ORDINARIA_UNIDADE_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[20,],": Fiscalização ordinária em unidades socioeducativas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 29))
ggsave("GRAFICO[20,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_bkp =
  banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[21,],": Fiscalização extraordinária em unidades socioeducativas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 10))
ggsave("GRAFICO[21,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_FISCALIZACAO_UNIDADES_PLANTAO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_FISCALIZACAO_UNIDADES_PLANTAO_bkp =
  banco_FISCALIZACAO_UNIDADES_PLANTAO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_FISCALIZACAO_UNIDADES_PLANTAO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[22,],": Fiscalização em unidades socioeducativas nos finais de semana e feriado, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 22))
ggsave("GRAFICO[22,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_bkp =
  banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[23,],": Fiscalização ordinária programas de meio aberto, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 6))
ggsave("GRAFICO[23,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_CONCENTRADAS_INTERNACAO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_CONCENTRADAS_INTERNACAO_bkp =
  banco_CONCENTRADAS_INTERNACAO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_CONCENTRADAS_INTERNACAO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[24,],": Participação em audiências concentradas internação, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 16))
ggsave("GRAFICO[24,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_CONCENTRADAS_SEMILIBERDADE_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_CONCENTRADAS_SEMILIBERDADE_bkp =
  banco_CONCENTRADAS_SEMILIBERDADE_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_CONCENTRADAS_SEMILIBERDADE_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[25,],": Participação em audiências concentradas semiliberdade, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 13))
ggsave("GRAFICO[25,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_SIND_PRESENCIAIS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_SIND_PRESENCIAIS_bkp =
  banco_SIND_PRESENCIAIS_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_SIND_PRESENCIAIS_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[26,],": Sindicâncias presenciais, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 9))
ggsave("GRAFICO[26,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_SINDICANCIA_REMOTA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_SINDICANCIA_REMOTA_bkp =
  banco_SINDICANCIA_REMOTA_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_SINDICANCIA_REMOTA_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[27,],": Sindicâncias remotas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 7))
ggsave("GRAFICO[27,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_DILIGENCIA_REALIZADA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_DILIGENCIA_REALIZADA_bkp =
  banco_DILIGENCIA_REALIZADA_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_DILIGENCIA_REALIZADA_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[28,],": Diligências realizadas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 8))
ggsave("GRAFICO[28,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_CADASTRAMENTO_CNJ_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_CADASTRAMENTO_CNJ_bkp =
  banco_CADASTRAMENTO_CNJ_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_CADASTRAMENTO_CNJ_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[29,],": Cadastramento fiscalização CNJ, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 47))
ggsave("GRAFICO[29,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_MONITORAMENTO_UNIDADE_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_MONITORAMENTO_UNIDADE_bkp =
  banco_MONITORAMENTO_UNIDADE_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_MONITORAMENTO_UNIDADE_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[30,],": Monitoramento unidade socioeducativa, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 1420))
ggsave("GRAFICO[30,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_ATENDIMENTO_REMOTO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_ATENDIMENTO_REMOTO_bkp =
  banco_ATENDIMENTO_REMOTO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_ATENDIMENTO_REMOTO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[31,],": Atendimentos remotos, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 127))
ggsave("GRAFICO[31,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_RELATORIOS_PRODUZIDOS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_RELATORIOS_PRODUZIDOS_bkp =
  banco_RELATORIOS_PRODUZIDOS_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_RELATORIOS_PRODUZIDOS_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[32,],": Relatórios produzidos, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 205))
ggsave("GRAFICO[32,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_OFICIOS_PRODUZIDOS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_OFICIOS_PRODUZIDOS_bkp =
  banco_OFICIOS_PRODUZIDOS_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_OFICIOS_PRODUZIDOS_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[33,],": Ofícios produzidos, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 3))
ggsave("GRAFICO[33,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_MAIL_RECEBIDO_TRATADO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_MAIL_RECEBIDO_TRATADO_bkp =
  banco_MAIL_RECEBIDO_TRATADO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_MAIL_RECEBIDO_TRATADO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[34,],": Emails recebidos e tratados, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 1260))
ggsave("GRAFICO[34,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_MAIL_PRODUZIDO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_MAIL_PRODUZIDO_bkp =
  banco_MAIL_PRODUZIDO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_MAIL_PRODUZIDO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[35,],": Emails produzidos, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 33))
ggsave("GRAFICO[35,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_REUNIAO_REALIZADA_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_REUNIAO_REALIZADA_bkp =
  banco_REUNIAO_REALIZADA_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_REUNIAO_REALIZADA_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[36,],": Reuniões realizadas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 14))
ggsave("GRAFICO[36,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_ZAP_RECEBIDO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_ZAP_RECEBIDO_bkp =
  banco_ZAP_RECEBIDO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_ZAP_RECEBIDO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[37,],": Mensagens (whatsapp - ligações) recebidas de unidades socioeducativas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 530))
ggsave("GRAFICO[37,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_ZAP_ENCAMINHADO_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_ZAP_ENCAMINHADO_bkp =
  banco_ZAP_ENCAMINHADO_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_ZAP_ENCAMINHADO_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[38,],": Mensagens (whatsapp - ligações) encaminhadas para unidades socioeducativas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 660))
ggsave("GRAFICO[38,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################

#########################################################################################################
#########################################################################################################
SINAL <- paste((banco_OUTRAS_DEMANDAS_bkp$PERCENTUAL), "%")#para plotar o sinal de porcentagem
#pdf(file="grafico_banco_incidencia_bkp_alternativo.pdf", title = "grafico_banco_incidencia_bkp", width = 10, height = 8)
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#salvar png
library(forcats)

banco_OUTRAS_DEMANDAS_bkp =
  banco_OUTRAS_DEMANDAS_bkp |>
  mutate(DIA_UTIL_OU_PLANTAO = fct_reorder(DIA_UTIL_OU_PLANTAO, QUANTIDADE))

ggplot(banco_OUTRAS_DEMANDAS_bkp, aes(x = DIA_UTIL_OU_PLANTAO, y = QUANTIDADE)) +
  geom_bar(stat = "identity", fill="#bb1e23") +
  coord_flip() +
  labs(title = (str_c(GRAFICO[39,],": Outras demandas, ", "01/01/24 a 30/06/24")),
       #subtitle = "Adolescentes por Atos Infracionais",
       caption = "FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE",
       x = "", y = "")  +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption =element_text(hjust = 0.5, size = 12)  ) +
  geom_text(aes(label = SINAL), hjust = 0, nudge_x = 0.05, colour= "#bb1e23", size = 3) +
  #scale_y_continuous(n.breaks=5)
  scale_y_continuous(limits=c(0, 180))
ggsave("GRAFICO[39,].png", width=10, height=8, pointsize=12, dpi = 512)
#########################################################################################################
#########################################################################################################









setwd(file.path("~/diretorio_r/estcomissariado/R/"))#configurar diretorio
#########################################################################################################
