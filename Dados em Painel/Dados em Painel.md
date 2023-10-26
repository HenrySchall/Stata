# Exemplos de Dados em Painel
>Esse documento procura demonstrar o processo de estimação de dados em painel, usando como base o livro *Econometric Analysis of Cross Section and Panel Data, Second Edition, de Jeffrey M. Wooldridge*. Todas as bases utilizadas nesse código poder ser encontradas nesse repositório, para quaisquer dúvidas consultar a obra citada acima.

### 1) Primeiro Exemplo 

Carregar Base -> FERTIL1.DTA

Nessa base temos uma combinação de cortes transversais

```r
#criando variável, sugestão do autor
gen age2=age^2 
#fazendo regressão
reg kids educ age age2 black east northcen west farm othrural town smcity
```
*Resultados*:

![novo1](https://github.com/HenrySchall/Stata/assets/96027335/d3220d18-ff9e-411b-bb54-ea5f619a4f99)

Nessa regressão temos 1.129 observações, se quissemos saber quantas observações temos
em cada ano dariamos:

```r
sort year
by year: tab kids (
#kids é nossa variável dependente, poderiamos pegar qualquer variável
```
![novo2](https://github.com/HenrySchall/Stata/assets/96027335/5672bab5-815c-4333-8893-a009961878b2)

Pegando os anos de 72 e 74 como exemplo. Podemos ver que no ano de 72, obtivemos 156 entrevistas 
e no ano de 74 obtivemos 173 entrevistadas, se somarmos os demais anos iremos obter as 1.129 observações.
Nosso modelo é significativo, porque temos Prob > F = 0.0000 . Todavia, nem todas nossas variáveis são
significativas ao nível de significância de 10%.

![2](https://github.com/HenrySchall/Stata/assets/96027335/ce057eb6-1b1d-4948-9010-a2b76b4b17ec)

- educ = É significativa e possui efeito *negativo* na variável dependente, ou seja, mulheres mais educadas, controlado
pelas outras variáveis, tem menos filhos ou o aumento de 1 ano de educação, controlado pelos outros fatores, levá a uma diminuição de 14,28% nos níveis de fecundidade. 
- age = É significativa e possui efeito *positivo* na variável dependente, controlado pelos outros fatores
- age2 = É significativa e possui efeito negativo na variável dependente, controlado pelos outros fatores
- black = É significativa e possui efeito positivo na variável dependente, controlado pelos outros fatores
- east = É significativa e possui efeito positivo na variável dependente, controlado pelos outros fatores
- northcen = É significativa e possui efeito positivo na variável dependente, controlado pelos outros fatores
- west = Não é significativa
- farm = Não é significativa
- othrural = Não é significativa
- town = Não é significativa
- smcity = Não é significativa
  
**DÚVIDA ~~É esperado, que ao longo do tempo ocorra uma queda estrutural, no número de filhos por mulher
Iremos retirar uma das dummies de intercepto temporais (no nosso exemplo y72), para evitar a multicolinealidade~~
usamos as dummies pra ver o efeito causal isolado de cada ano?

```r
reg kids educ age age2 black east northcen west farm othrural town smcity y74 y76 y78 y80 y82 y84
```
![Captura de tela 2023-10-26 090141](https://github.com/HenrySchall/Stata/assets/96027335/a46f4f3b-7e82-493c-b85b-75db87e6cd54)

- y74 = Não significativa e possui efeito *positivo*
- y76 = Não significativa e possui efeito negativo
- y78 = Não significativa e possui efeito negativo
- y80 = Não significativa e possui efeito negativo
- y82 = Significativa e possui efeito negativo
- y84 = Significativa e possui efeito negativo

Como as dummies de y74,y76,y78,80 são não significativas, controlado pelos outros fatores, a fecundidade desses anos é estatisticamente igual a de y72.

Podemos ver que as dummies y82 e y84 são significativas e negativas, ou seja, controlado pelos outros fatores, existe 
uma tendência de longo prazo de queda na fecundidade e essa queda é de aproximadamente de 1/2 filho (0.522 - 0.545).

### 2) Segundo Exemplo

Carregar base -> CPS78_85.DTA
```r
sum
```

![1](https://github.com/HenrySchall/Stata/assets/96027335/39ba4008-23ab-4681-94f1-5bc048e2d4dd)

Para analisarmos as observações em cada ano, damos: 
```r
tab year
```
![2](https://github.com/HenrySchall/Stata/assets/96027335/5ab82a94-afd5-42e9-92c5-97c0db330ab2)

```
reg lwage educ exper expersq union female
```
![3](https://github.com/HenrySchall/Stata/assets/96027335/b0f14b0e-e25d-401a-b82b-3af2b350dc1c)

Nosso modelo é significativo, porque temos Prob > F = 0.0000 e todas as variáveis são significativas estatisticamente
(P>|t| = 0.000). Pegando a variável educ como exemplo, podemos dizer que o aumento de 1 ano de educação, controlado pelos outros fatores, leva ao aumento de salário de aproximadamente 8,84%. Essa base de dados nos permite realizar várias perguntas como:

- Salários de 85 são maiores que os de 78?
- Esse efeito da educação é maior em 78 ou em 85?

Por isso novamente voltaremos à usar dummies para quantificar esse efeito

```r
reg lwage y85 educ y85educ exper expersq union female y85fem
```

**DÚVIDA ~~É esperado, que ao longo do tempo ocorra uma queda estrutural, no número de filhos por mulher
Iremos retirar uma das dummies de intercepto temporais (no nosso exemplo y72), para evitar a multicolinealidade~~
usamos as dummies pra ver o efeito causal isolado de cada ano?







