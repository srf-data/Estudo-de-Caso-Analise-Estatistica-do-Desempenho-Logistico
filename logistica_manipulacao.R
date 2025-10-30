library(ggplot2)

tempo_entrega_dias = Logistica_Dados$Tempo_de_Entrega_Dias

desvio_populacional = sqrt(sum((tempo_entrega_dias - media)^2)/length(tempo_entrega_dias))
coeficiente_variacao = (desvio_populacional/media)*100

media = mean(tempo_entrega_dias)
mediana = median(tempo_entrega_dias)

moda_funcao = function(dados){
  frequencias = table(dados)
  frequencia_max = max(frequencias)
  moda <- names(frequencias[frequencias == frequencia_max])
  return(moda)
}

moda = moda_funcao(tempo_entrega_dias)

# ---------------------------

# HISTOGRAMA

k = ceiling(1 + 3.322 * log10(length(tempo_entrega_dias)))

maximo_tempo = max(tempo_entrega_dias)
minimo_tempo = min(tempo_entrega_dias)

amplitude = (maximo_tempo - minimo_tempo)/k
limite_classes = seq(from = minimo_tempo, to = maximo_tempo, by = amplitude)


hist(
  tempo_entrega_dias,
  breaks = limite_classes,
  main = "Histograma do Tempo de Entrega",
  xlab = "Tempo (Dias)",
  ylab = "Frequência",
  col = "pink"
)

# ---------------------------

# BOXPLOT

boxplot(tempo_entrega_dias, 
        xlab = "Boxplot Tempo de Entrega (Dias)",
        ylab = "Quantidade de Dias",
        col = "pink"
)

# ---------------------------

# GRÁFICO EM BARRAS (Pacote ggplot2)

ggplot(data = Logistica_Dados, aes(
  x = Regiao,
  y = Tempo_de_Entrega_Dias, 
  main = "Tempo Médio de Entrega por Região",
  fill = "pink"
)) + stat_summary(fun = "mean", geom = "bar") +
  labs(
    x = "Região",
    y = "Tempo de Entrega (Dias)",
)

# --------------------------------

custo_envio = Logistica_Dados$`Custo_Envio_R$`
mediana_custo = median(custo_envio)
peso = Logistica_Dados$Peso_Kg

produtos_filtrados = Logistica_Dados$ID_Pedido[
  tempo_entrega_dias < 10 &
  custo_envio < mediana_custo &
  peso > 1.5
]


porcentagem = (length(produtos_filtrados) / length(Logistica_Dados$ID_Pedido))*100



