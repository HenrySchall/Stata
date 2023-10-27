# Estimação de Dados em Painel
>Esse documento procura demonstrar o processo de estimação de dados em painel, usando como base o livro *Econometric Analysis of Cross Section and Panel Data, Second Edition, de Jeffrey M. Wooldridge*. Todas as bases utilizadas nesse código poder ser encontradas nesse repositório, para quaisquer dúvidas consultar a obra citada acima.

### Pooled Cross Section
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

kids| Coefficient|P>(t)  
:---:|:---:|:---:
educ|-.1428788|0.000    
age|.5624223|0.000     
age2|-.0060917|0.000    
black|.977559|0.000    
east|.2362931|0.078    
northcen|.3847487|0.002   
west|.2447027|0.147    
farm|-.054186|0.715    
othrural|-.1670751|0.346   
town|.0842369|0.503    
smcity|.1830768|0.259   
_cons|-8.487543|

- educ = É significativa e possui efeito *negativo* na variável dependente, ou seja, mulheres mais educadas, controlado
pelas outras variáveis, tem menos filhos ou o aumento de 1 ano de educação, controlado pelos outros fatores, levá a uma diminuição de 14,28% nos níveis de fecundidade. **DÚVIDA** interpretacaoesta correta?
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

**DÚVIDA**
Essa base nos permite fazer diversas indagações, sobre o efeito da fecundidade em cada ano, por exemplo será que y76 é maior que y80?. Por isso usaremos dummies estruturais temporais, buscando ver o efeito causal isolado de cada ano.

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

#### 2) Segundo Exemplo

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

**DÚVIDA**
Por isso novamente voltaremos à usar dummies para quantificar esse efeito

```r
reg lwage y85 educ y85educ exper expersq union female y85fem
```

**DÚVIDA** -> Porque nao fizemos isso no exemplo anterior
As dummies multiplicativas serão usadas para testar o efeito de alteração das variáveis durante y78 e y85

![imag](https://github.com/HenrySchall/Stata/assets/96027335/689ef635-79c4-498c-94be-8dcd7e198770)

Podemos notar que a dummy de y85 não é significativa, ou seja, controlado pelos outros fatores os salários de y78 e y85
são estatisticamente iguais.

- Analisando à variável educ e y85educ. Passamos a decompor à variável, ou seja, controlado pelos outros fatores o aumento de 1 ano de estudo em y78, aumenta os salários em 7,47%, de tal forma, que no ano de y85 esse efeito é 1,85% maior (aumento do efeito de um ano para o outro, ou seja, o prêmio).

 - Analisando à variável female e y85fem. Passamos a decompor à variável, ou seja, controlado pelos outros fatores a diferença salarial em y78, é de -31,67%, de tal forma, que no ano de y85 esse efeito é 8,50% menor (31,67% - 8,50% = -23,17%, ou seja, diminuição do efeito de um ano para o outro).

#### 3) Terceiro Exemplo 
Carregar Base -> KIELMC.DTA

Nessa Base iremos ver como a instalação de um incinerador de lixo, afetou o preço dos imóveis em uma região de Massachusetts

```r
tab year
```
![imag1](https://github.com/HenrySchall/Stata/assets/96027335/d87c5f90-9086-4f4d-b5b1-054c694dedda)

```r
sum
```
![Imag2](https://github.com/HenrySchall/Stata/assets/96027335/d7b26c71-825c-414c-b976-bfa2ae16608c)

```r
#pegando o preço dos imóveis e regredindo com a dummy de localização em 81
reg rprice nearinc if year==1981
```
![imag3](https://github.com/HenrySchall/Stata/assets/96027335/71990ee0-1ecd-4ff4-9e1b-4f4f634ac1d7)

Nosso modelo será significativo do ponto de vista global e a nossa variável nearinc é significativa e negativa, ou seja, em
81, os imóveis que estão localizados próximos a construção do centro de tratamento de lixo possuem preços menores, em média 30.688 doláres, que os imóveis afastados da construção do centro de tratamento de lixo.

- Pergunta: *Essa diferença de preço é causada pela construção do centro de tratamento de lixo?*

```r
#pegando o preço dos imóveis e regredindo com a dummy de localização em 78
reg rprice nearinc if year==1978
```

![imagg](https://github.com/HenrySchall/Stata/assets/96027335/9ad2b6c6-aa1a-4621-81c7-abc58a9f17a4)

Nossa resposta será __*Não*__. Porque vemos o mesmo efeito em 78, muito antes da construção do centro de 
tratamento de lixo. Sendo assim os preço são mais baixos, porque muito possívelmente estamos analisando
uma região menos privilegiada da cidade. Então o efeito real da construção do centro de tratamento de lixo, será a diferença entre os anos y81 e y78, ou seja, 18.824 - 30.688 = 11.864 doláres -> estimador diferenças e indiferenças.

- Todavia esse processo não é nem um pouco prático, então como podemos realizar essa estimação diretamente?

![IMAGES](https://github.com/HenrySchall/Stata/assets/96027335/90d8cbfb-69b6-4513-825f-ae3ad6d0bd66)

```r
reg rprice y81 nearinc y81nri
# note que: y81 = dummy de 81 / nearinc = dummy de localização / y81nri = multiplicação das dummies 
```
![IMAGES](https://github.com/HenrySchall/Stata/assets/96027335/216e6461-362c-4512-83ec-13722622fc6b)

Observa-se que a variável foi dada como não significativa, nesse caso o autor recomenda acrescentar mais variáveis ao modelo (como no exemplo abaixo). Como é apenas um exemplo para demostrar o funcionamento do estimador desconsideramos esse resultado. 

```R
reg rprice y81 nearinc y81nrinc age agesq intst land area rooms baths
```
![ddd](https://github.com/HenrySchall/Stata/assets/96027335/ce010449-0a4e-4d44-9622-e1e8c07a439a)

- O que aconteceria de usássemos log price (lprice)? Teriamos resultados muito diferentes? (Experimente tentar)

#### 4) Quarto Exemplo
Carregar Base -> INJURY.DTA
Resumo base: Em julho de 80 havia um limite para recebimento de auxilio compensação por acidente de trabalho, em relação a renda dos indivíduos, sendo que indivíudos com renda superior ao limite, não recebiam compensação. Após julho de 80, esse limite foi elevado. Qual será o impacto da mudança?

```R
reg ldurat afchnge highearn afhigh
# afchnge = dummy pós período (1 = indivíduos afastados pós novo legislação e 0 = caso contrário)
# highearn = dummy de tratamento (1 = Individuos com renda acima do limite da legislação antiga e 0 = caso contrário)
# afhigh = dummy de interação
```
![imagess](https://github.com/HenrySchall/Stata/assets/96027335/5272cd4f-d043-4609-9255-99db6c4bb4fd)

- afchnge = é não significativa e positiva, ou seja, controlado pelos outros fatores, pós nova legislação não há mudança na duração do afastamento para os indivíduos de renda baixa, porque os afetados são apenas os indivíduos de renda alta. 
- afhigh = é significativa e positiva, ou seja, controlado pelos outros fatores, após a mudança da legislação, os indivíduos que tinham renda mais alta (não eram contemplados pela compensação), passaram à se afastar um período muito maior, cerca de 18% no tempo de duração de afastamento.

```R
reg ldurat afchnge highearn afhigh male married indust injtype
```
![ddddffe](https://github.com/HenrySchall/Stata/assets/96027335/f85820d6-3649-41e6-848c-bebe1f1033c8)

### Painel de Dois Períodos
#### 1) Primeiro Exemplo 
Carregar Base -> CRIME2.DTA
Resumo base: Taxas de criminalidade para os mesmos munícipios americanos em 87 e 82. 
- crmrte = taxa de crime
- unem = desemprego

```R
reg crmrte d87 unem
```
![001](https://github.com/HenrySchall/Stata/assets/96027335/adb966a2-9498-4ec7-97d4-9f4bf2c904a4)

* unem foi dada como não significativa, ou seja, há variáveis omitidas no erro e elas são coorrelacionadas com a variável explicativa desemprego, sendo assim, não posso estimar por MQO -> usar estimador de primeiras diferenças

```R
reg ccrmrte cunem
```
![00202](https://github.com/HenrySchall/Stata/assets/96027335/4ad5cd49-2833-46e5-9809-bd9d3f2181fb)

