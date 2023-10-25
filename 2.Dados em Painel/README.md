# Dados em Painel
#### 1) Primeiro Exemplo 

Carregar Base -> FERTIL1.DTA

Nessa base temos uma combinação de cortes transversais

```r
#criando variável, sugestão do autor
gen age2=age^2 
#fazendo regressão
reg kids educ age age2 black east northcen west farm othrural town smcity
```
*Resultados*:

![1](https://github.com/HenrySchall/Stata/assets/96027335/f10aab3c-e2c3-422d-82a3-c1ec5e566d6a)

Nessa regressão temos 1.129 observações, se quissemos saber quantas observações temos
em cada ano dariamos:

```r
sort year
by year: tab kids (kids é nossa variável dependente, poderiamos pegar qualquer variável)
```
![3](https://github.com/HenrySchall/Stata/assets/96027335/88b0ce25-dbe9-4ddd-a3d8-a5404f991af6)

 - Pegando os anos de 72 e 74 como exemplo. Podemos ver que no ano de 72, obtivemos 156 entrevistas 
e no ano de 74 obtivemos 173 entrevistadas, se somarmos os demais anos iremos obter as 1.129 observações.

- Nosso modelo é significativo, porque temos Prob > F = 0.0000

![2](https://github.com/HenrySchall/Stata/assets/96027335/656d6d21-c107-40c1-8607-56038fd40891)

