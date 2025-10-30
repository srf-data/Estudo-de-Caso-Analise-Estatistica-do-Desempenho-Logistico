# Estudo de Caso: Análise do Desempenho Logístico e Eficiência Regional

## Objetivo do Projeto

Este estudo de caso aplica a estatística descritiva e visualização de dados para avaliar a eficiência operacional de uma rede de distribuição. O foco principal é diagnosticar como a **Região** (Norte, Sul, Sudeste, Nordeste) influencia a variável crítica: **Tempo de Entrega (em dias)**.

Os resultados visam identificar gargalos logísticos e otimizar processos para melhoria da satisfação do cliente.

---

## Tecnologias e Métodos

* **Linguagem:** R
* **Pacotes:** `ggplot2` (visualização de dados).
* **Métodos Estatísticos:** Média, Mediana, Desvio Padrão Populacional, Coeficiente de Variação (CV), Quartis, IQR, Regra de Sturges.

---

## Resultados e Conclusões Chave

A análise de 50 transações revelou uma alta variabilidade no tempo de entrega, que é **fortemente correlacionada com a região**.

### 1. Estatísticas Descritivas (Tempo de Entrega)

| Métrica | Valor | Interpretação |
| :--- | :--- | :--- |
| **Média** | 10,58 dias | Alto tempo de entrega dos produtos. |
| **Mediana** | 8,5 dias | 50% das entregas sendo concluídas em até 8,5 dias. |
| **Desvio Padrão Pop.** | 7,19 dias | Alta variação de dias em relação a média. |
| **CV** | 68% | Alta variabilidade para determinar uma previsão para o prazo de entrega. |
| **Q1 (25%)** | 4 dias | 25% das entregas são feitas em até 4 dias. |
| **Q2 (50%)** Mediana | 8,5 dias | 50% das entregas são feitas de forma "rápida".|
| **Q3 (75%)** | 17,25 dias | 75% das entregas são feitas em até 17,25 dias. |
| **Moda** | Unimodal (4) | Quantidade de tempo mais frequente. |

### 2. Análise de Distribuição (Histograma e Boxplot)

* **Assimetria:** O Histograma confirma uma **forte assimetria positiva (à direita)**. A maioria das entregas se concentra em prazos baixos (5-10 dias), mas uma minoria de entregas longas (19-25 dias) alonga a distribuição e eleva a média.
* **Boxplot e Outliers:** O Boxplot demonstra a alta dispersão dos 50% centrais (IQR = 37,12 dias). **Não foram identificados *outliers***, ou seja, mesmo a entrega mais longa (25 dias) é considerada estatisticamente normal para essa distribuição.

### 3. Conclusão da Influência Regional

A análise comparativa (Gráfico de Barras/Boxplot por Região) prova que a **Região é o principal fator de variabilidade**:

| Região | Média de Entrega (Dias) | Conclusão Logística |
| :--- | :--- | :--- |
| **Sudeste** | $\approx 3,3$ | **Mais eficiente.** Referência de otimização de processos. |
| **Sul** | $\approx 5,2$ | Alta eficiência e bom desempenho. |
| **Nordeste** | $\approx 12,5$ | Média próxima à média geral, requer atenção. |
| **Norte** | $\approx 21,3$ | **Maior gargalo.** Média de entrega 6x maior que o Sudeste. |

### 4. Filtro Condicional (Otimização)

Foi realizada a filtragem de pedidos que combinam alta eficiência (tempo rápido) com desafios logísticos (alto peso):

* **Critérios:** (Tempo $\mathbf{<}$ 10 dias) **E** (Custo $\mathbf{<}$ Mediana de Custo - R$ 31,70) **E** (Peso $\mathbf{>}$ 1.5 kg).
* **Resultado:** 8 pedidos atenderam aos critérios.
* **Representatividade:** **16%** do total de transações.

Estes 8 pedidos representam a **Melhor Prática** da empresa, pois conseguem ser entregues rapidamente e com baixo custo, apesar de terem um peso que, em teoria, poderia retardá-los.

---

## Código R para Consulta

O código R utilizado para gerar as estatísticas e os gráficos pode ser consultado no arquivo:
[`analise_logistica.R`](https://github.com/srf-data/Estudo-de-Caso-Analise-Estatistica-do-Desempenho-Logistico/blob/main/logistica_manipulacao.R)
