setwd(file.path("~/diretorio_r/estcomissariado/img_nao_apagar/"))
#########################################################################################################
#########################################################################################################
# 3 CARREGANDO O BANCO PARA TRATAMENTO NO R: observar se variaveis são iguais
#Ao salvar o banco como .csv escolher separador ":"

TABELA <- read.csv("tabela.csv",header=TRUE, sep="|", dec=".", encoding = "UTF-8", skip = 0) ##Lendo arquivo de texto separado por vírgulas (CSV) e que usa o ponto.

setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#########################################################################################################
#########################################################################################################
TOTAL_ATENDIMENTOS_COM %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[1,],": Total de atendimentos realizados, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(TOTAL_ATENDIMENTOS_COM))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[1,].png", expand = 10)
#########################################################################################################
#########################################################################################################
TOTAL_ATENDIMENTOS_COM %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[1,],": Total de atendimentos realizados, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(TOTAL_ATENDIMENTOS_COM))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

gtsave("tab_1.docx")
#########################################################################################################
#########################################################################################################
QUANT_AUDIENCIAS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[2,],": Atendimento audiências, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_AUDIENCIAS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[2,].png", expand = 10)
#########################################################################################################
#########################################################################################################
TOTAL_ADL_ATENDIDOS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[3,],": Atendimento adolescentes, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(TOTAL_ADL_ATENDIDOS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[3,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
PRESENCA_PAIS_AUD %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[4,],": Atendimento aos pais/responsáveis, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(PRESENCA_PAIS_AUD))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[4,].png", expand = 10)
#########################################################################################################
#########################################################################################################
TOTAL_TESTEMUNHA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[5,],": Atendimento testemunhas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(TOTAL_TESTEMUNHA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[5,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_NAMSEP %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[6,],": Encaminhamento NAMSEP, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_NAMSEP))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[6,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_NEAF %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[7,],": Encaminhamento NEAF, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_NEAF))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[7,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_MASCULINO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[8,],": Encaminhamento aos CEIP's masculinos, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_MASCULINO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[8,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_FEMININO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[9,],": Encaminhamento ao CEIP feminino, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_FEMININO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[9,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_CT %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[10,],": Encaminhamento ao Conselho Tutelar, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_CT))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[10,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_PAIS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[11,],": Encaminhamento aos pais/responsáveis, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_PAIS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[11,].png", expand = 10)

#########################################################################################################
#########################################################################################################
QUANT_ENC_PPCAAM %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[12,],": Encaminhamento ao PPCAAM, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_PPCAAM))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[12,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_JR %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[13,],": Encaminhamento para Justiça Restaurativa, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_JR))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[13,].png", expand = 10)
#########################################################################################################
#########################################################################################################
QUANT_ENC_CEDIPRO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[14,],": Encaminhamento ao CEDIPRO, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_CEDIPRO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[14,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
QUANT_ENC_DESEMBOLA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[15,],": Encaminhamento DESEMBOLA, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_DESEMBOLA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[15,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
QUANT_ENC_OUTRAS_INST %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[16,],": Encaminhamento outras instituições, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(QUANT_ENC_OUTRAS_INST))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[16,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
# FISCALIZAÇAO CNJ
setwd(file.path("~/diretorio_r/estcomissariado/imagens"))
#########################################################################################################
#########################################################################################################
banco_TIPO_DILIGENCIA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[17,],": Total de atendimentos realizados, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_TIPO_DILIGENCIA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[17,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_TIPO_DILIGENCIA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[17,],": Total de atendimentos realizados, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_TIPO_DILIGENCIA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave("tab_1.docx")
#########################################################################################################
#########################################################################################################
banco_INSPECAO_COM_JUIZ_INTERNACAO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[18,],": Inspeção com o Juiz em unidade de internação, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_INSPECAO_COM_JUIZ_INTERNACAO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[18,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_INSPECAO_COM_JUIZ_SEMILIBERDADE %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[19,],": Inspeção com o Juiz em unidade de semiliberdade, 01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_INSPECAO_COM_JUIZ_SEMILIBERDADE))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[19,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_INSPECAO_COM_JUIZ_MEIO_ABERTO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[20,],": Inspeção com o Juiz em programa de meio aberto, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_INSPECAO_COM_JUIZ_MEIO_ABERTO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[20,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_FISCALIZACAO_ORDINARIA_UNIDADE %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[21,],": Fiscalização ordinária em unidades socioeducativas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_FISCALIZACAO_ORDINARIA_UNIDADE))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[21,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[22,],": Fiscalização extraordinária em unidades socioeducativas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_FISCALIZACAO_EXTRAORDINARIA_UNIDADE))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[22,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_FISCALIZACAO_UNIDADES_PLANTAO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[23,],": Fiscalização em unidades socioeducativas nos finais de semana e feriado, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_FISCALIZACAO_UNIDADES_PLANTAO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[23,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[24,],": Fiscalização ordinária programas de meio aberto, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_FISCALIZACAO_ORDINARIA_MEIO_ABERTO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[24,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_CONCENTRADAS_INTERNACAO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[25,],": Participação em audiências concentradas internação, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_CONCENTRADAS_INTERNACAO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[25,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_CONCENTRADAS_SEMILIBERDADE %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[26,],": Participação em audiências concentradas semiliberdade, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_CONCENTRADAS_SEMILIBERDADE))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[26,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_SIND_PRESENCIAIS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[27,],": Sindicâncias presenciais, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_SIND_PRESENCIAIS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[27,].png", expand = 10)

#########################################################################################################
#########################################################################################################
banco_SINDICANCIA_REMOTA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[28,],": Sindicâncias remotas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_SINDICANCIA_REMOTA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[28,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_DILIGENCIA_REALIZADA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[29,],": Diligências realizadas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_DILIGENCIA_REALIZADA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[29,].png", expand = 10)
#########################################################################################################
#########################################################################################################
banco_CADASTRAMENTO_CNJ %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[30,],": Cadastramento fiscalização CNJ, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_CADASTRAMENTO_CNJ))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[30,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_MONITORAMENTO_UNIDADE %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[31,],": Monitoramento unidade socioeducativa, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_MONITORAMENTO_UNIDADE))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[31,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_ATENDIMENTO_REMOTO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[32,],": Atendimentos remotos, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_ATENDIMENTO_REMOTO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[32,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_RELATORIOS_PRODUZIDOS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[33,],": Relatórios produzidos, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_RELATORIOS_PRODUZIDOS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[33,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_OFICIOS_PRODUZIDOS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[34,],": Ofícios produzidos, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_OFICIOS_PRODUZIDOS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[34,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_MAIL_RECEBIDO_TRATADO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[35,],": Emails recebidos e tratados, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_MAIL_RECEBIDO_TRATADO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[35,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_MAIL_PRODUZIDO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[36,],": Emails produzidos, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_MAIL_PRODUZIDO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[36,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_REUNIAO_REALIZADA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[37,],": Reuniões realizadas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_REUNIAO_REALIZADA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[37,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_COLETA_REMOTA %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[38,],": Coleta remota de informação, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_COLETA_REMOTA))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[38,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_ZAP_RECEBIDO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[39,],": Mensagens (whatsapp - ligações) recebidas de unidades socioeducativas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_ZAP_RECEBIDO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[39,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_ZAP_ENCAMINHADO %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[40,],": Mensagens (whatsapp - ligações) encaminhadas para unidades socioeducativas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_ZAP_ENCAMINHADO))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[40,].png", expand = 10)
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
banco_OUTRAS_DEMANDAS %>%
  gt() %>%

  tab_header(
    title = md((str_c(TABELA[41,],": Outras demandas, ","01/01/24 a 30/06/24"))),
    subtitle = "") %>%

  tab_source_note("FONTE: VARA INFRACIONAL DA INFÂNCIA E DA JUVENTUDE DE BELO HORIZONTE") %>%

  tab_style(
    style = list(
      cell_text(weight = "bold", size = "small")),
    locations = cells_body(rows = nrow(banco_OUTRAS_DEMANDAS))) %>%

  #tab_style(
  # style = cell_text(weight = "bold", align = "center" ),
  # locations = cells_column_labels(columns = c(2:3)))%>%

  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = c(1:3)))%>%

  tab_style(
    style = cell_text(align = "right"),
    locations = cells_column_labels(columns = c(2:3)))%>%

  #  tab_style(
  # style = cell_text(align = "center"),
  # locations = cells_body(
  # columns = c(2))) %>%

  tab_options(
    data_row.padding = px(1),
    table.font.size = 12,
    #heading.title.font.size = 20,
    heading.align = "center",
    #heading.title.font.size = "small",
    heading.subtitle.font.size = "small",) %>%

  # fmt_number(
  #columns = 3) %>%

  #cols_align(align = "center",
  #          columns = 1:2) %>%
  #summary_rows(fns = list(TOTAL = "sum"),
  #  columns = c(2, 3))

  gtsave(
    "TABELA[41,].png", expand = 10)
#########################################################################################################
#########################################################################################################
setwd(file.path("~/diretorio_r/estcomissariado/R/"))#configurar diretorio
#########################################################################################################
