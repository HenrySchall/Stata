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

![Captura de tela 2023-10-25 160334](https://github.com/HenrySchall/Stata/assets/96027335/c391791c-29b2-40d7-a1c4-0fb49ac271fb)

Nessa regressão temos 1.129 observações, se quissemos saber quantas observações temos
em cada ano dariamos:

```r
sort year
by year: tab kids (kids é nossa variável dependente, poderiamos pegar qualquer variável)
```
![2](https://github.com/HenrySchall/Stata/assets/96027335/ce057eb6-1b1d-4948-9010-a2b76b4b17ec)

 - Pegando os anos de 72 e 74 como exemplo. Podemos ver que no ano de 72, obtivemos 156 entrevistas 
e no ano de 74 obtivemos 173 entrevistadas, se somarmos os demais anos iremos obter as 1.129 observações.

- Nosso modelo é significativo, porque temos Prob > F = 0.0000

![3](https://github.com/HenrySchall/Stata/assets/96027335/bad65065-3312-45f0-8a46-2c3e86f6ca47)

