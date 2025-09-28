## Introduction
- Comunidade: https://www.statalist.org/forums/
  
> Stata is a statistical software created by the company StataCorp, headquartered in College Station, Texas, USA. It was initially developed in 1985 by William Gould, the company's founder, who sought to create software with simple navigation to analyze statistical data. Unlike its more popular open source competitors, such as Python and R, Stata is a close source software, It this mean that, all updates performed by the controlling company, not allowing users to download or create content to the software.

### Doedit
> In Stata, you can create a file called doedit, with the extension .do. These files are scripts that can store commands typed into Stata in text format, as if it were a notepad. They help automate data analysis by allowing users to execute a series of commands in a sequential and repeatable manner.

### Basic Commands

- Creating working directory
```
cd "C:\Stata"
```

- Open settings
```
set
```

- Sets comma as decimal separator
```
set dp comma
```

- Return to default (dot decimal separator)
```stata
set dp period
```

- Disable auto-pause when displaying long lists of results on the screen
```stata
set more off
```

- Open doedit
```stata
doedit
```

- Generate a new variable
```stata
generate
```

- Summarize variables
```stata
summarize ou sum
```

- Describe variables
```stata
describe
```

- Create frequency tables
```stata
tab
```

- Clear the old base and load a new one
```stata
clear
```

- Base visualization 
```stata
view 
```

- Clear results
```stata
cls
```

- Organize in ascending order
```stata
bysort
```

- Ask Help
```stata
help
```

### Arithmetic Operations
- Sum
```stata
+
```

- Subtraction
```stata
-
```

- Multiplication
```stata
*
```

- Division
```stata
/
```

- Potentiation
```stata
^
```

- Equality
```stata
==
```

- Greater than
```stata
> or =>
```

- Less than
```stata
< or <=
```

- Difference 
```stata
~
```

- e (duas condicoes precisam ser satisfeitas ao mesmo tempo)
```stata
&
```

- or (uma condicoes ou outra precisa ser satisfeita)
```stata
|
```

- Assigning value
```stata
=
```

### Manipulate Variables 
- Delete variables
```stata
drop
```

- Reclassify variables
```stata
recode idade (0/17 = 1 "Jovem") (18/64 = 2 "Adulto") (65/max = 3 "Idoso")
```
- Replace variables
```stata
replace idade = 25 if sexo == 1
```

- Delete missing information
```stata
drop if missing(x)
```

- Delete specific information
```stata
drop if ==X
```

- Keep only specific variables
```stata
keep
```

- Keep the variable with modifications
```stata
keep if  V8005>=18 & V8005<=24 /*(manter apenas individuos jovens)*/
```

- Rename variables of interest
```stata
rename x y
```

- Change variable description
```stata
label variable ano "V0101-ANO DE REFERÊNCIA"
```

- Change data labels of variables
```
label define x 1 "y" 2 "w", replace //especificando mudancas //
```
```
label values x x 
```

### Practical Demonstration
> The example and the database are taken from the book: "*Econometric Analysis of Cross Section and Panel Data, Second Edition, by Jeffrey M. Wooldridge*"

health.dta
- Download -> https://drive.google.com/uc?export=download&id=
```
sum
```
```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    dupersid |      3,064    6.24e+07    3.43e+07   2.00e+07   9.83e+07
      year03 |      3,064           1           0          1          1
         age |      3,064    74.17167    6.372938         65         90
      famsze |      3,064    1.907963    .9883496          1         13
      educyr |      3,064    11.77546    3.435878          0         17
-------------+---------------------------------------------------------
      totexp |      3,064    7030.889    11852.75          0     125610
     private |      3,064    .5812663    .4934321          0          1
      retire |      3,064    .5946475    .4910403          0          1
      female |      3,064    .5796345    .4936982          0          1
       white |      3,064    .9742167    .1585141          0          1
-------------+---------------------------------------------------------
        hisp |      3,064    .0848564    .2787134          0          1
       marry |      3,064    .5558094    .4969567          0          1
      northe |      3,064    .1517624     .358849          0          1
       mwest |      3,064    .2310705    .4215862          0          1
       south |      3,064    .3962141    .4891897          0          1
-------------+---------------------------------------------------------
      phylim |      3,064    .4255875    .4945125          0          1
      actlim |      3,064    .2836162    .4508263          0          1
         msa |      3,064    .7415144    .4378737          0          1
      income |      3,064    22.47472    22.53491         -1     312.46
      injury |      3,064    .1964752    .3973968          0          1
-------------+---------------------------------------------------------
    priolist |      3,064    .8028721    .3978947          0          1
      totchr |      3,064    1.754243    1.307197          0          7
         omc |      3,064    .4461488    .4971727          0          1
         hmo |      3,064    .1158616    .3201111          0          1
         mnc |      3,064    .0192559    .1374454          0          1
-------------+---------------------------------------------------------
       ratio |      3,064    .0120952    .0958159          0          1
      posexp |      3,064    .9644256    .1852568          0          1
     suppins |      3,064    .5812663    .4934321          0          1
        hvgg |      3,064    .6054178    .4888406          0          1
         hfp |      3,064    .2078982    .4216508          0          2
-------------+---------------------------------------------------------
        hins |      1,506           1           0          1          1
        hdem |      1,737           1           0          1          1
```

```
tab age
```
```
        Age |      Freq.     Percent        Cum.
------------+-----------------------------------
         65 |        249        8.13        8.13
         66 |        165        5.39       13.51
         67 |        166        5.42       18.93
         68 |        153        4.99       23.92
         69 |        145        4.73       28.66
         70 |        151        4.93       33.58
         71 |        162        5.29       38.87
         72 |        191        6.23       45.10
         73 |        167        5.45       50.55
         74 |        153        4.99       55.55
         75 |        147        4.80       60.35
         76 |        145        4.73       65.08
         77 |        117        3.82       68.90
         78 |        117        3.82       72.72
         79 |        113        3.69       76.40
         80 |         97        3.17       79.57
         81 |         89        2.90       82.47
         82 |         73        2.38       84.86
         83 |         80        2.61       87.47
         84 |         72        2.35       89.82
         85 |        295        9.63       99.45
         86 |          4        0.13       99.58
         87 |          4        0.13       99.71
         88 |          3        0.10       99.80
         89 |          2        0.07       99.87
         90 |          4        0.13      100.00
------------+-----------------------------------
      Total |      3,064      100.00
```
> We can see that the database presents ages ranging from 65 to 90 years old.

```
tab age female

           |     =1  if female
       Age |         0          1 |     Total
-----------+----------------------+----------
        65 |       123        126 |       249 
        66 |        65        100 |       165 
        67 |        80         86 |       166 
        68 |        76         77 |       153 
        69 |        55         90 |       145 
        70 |        65         86 |       151 
        71 |        72         90 |       162 
        72 |        77        114 |       191 
        73 |        75         92 |       167 
        74 |        66         87 |       153 
        75 |        71         76 |       147 
        76 |        66         79 |       145 
        77 |        61         56 |       117 
        78 |        49         68 |       117 
        79 |        47         66 |       113 
        80 |        35         62 |        97 
        81 |        23         66 |        89 
        82 |        21         52 |        73 
        83 |        31         49 |        80 
        84 |        25         47 |        72 
        85 |        99        196 |       295 
        86 |         2          2 |         4 
        87 |         1          3 |         4 
        88 |         2          1 |         3 
        89 |         1          1 |         2 
        90 |         0          4 |         4 
-----------+----------------------+----------
     Total |     1,288      1,776 |     3,064 
```
> Total number of individuals in the sample separated by age and gender (1=female and 0=male)

- Summary variable age
```
sum age
```
```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      3,064    74.17167    6.372938         65         90
```

- Obtaining the summary of the age variable, conditioned on the factor of being a woman
```
sum age if female==1
```
```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      1,776    74.61655    6.498272         65         90
```

- Obtaining the summary of the age variable, conditioned on the factor of not being a woman
```
sum age if female==0
```
```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      1,288    73.55823    6.145834         65         89
```

```
sort female
```
```
by female:sum age
```
> Obtendo o resumo da variável female, condicionado ao fator idade (age)

```
-----------------------------------------------------------------------------

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      1,288    73.55823    6.145834         65         89

-----------------------------------------------------------------------------

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      1,776    74.61655    6.498272         65         90
```

```
generate velhos=0
```

```
edit velhos
```
> Create dummy variable

```
replace velhos=1 if age>=85
(312 real changes made)
```

```
tab age if age >=85
```

```

        Age |      Freq.     Percent        Cum.
------------+-----------------------------------
         85 |        295       94.55       94.55
         86 |          4        1.28       95.83
         87 |          4        1.28       97.12
         88 |          3        0.96       98.08
         89 |          2        0.64       98.72
         90 |          4        1.28      100.00
------------+-----------------------------------
      Total |        312      100.00
```

```
generate log_age = log(age)
```
> Gerando os logs da variável age

```
sum age lage
```

```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      3,064    74.17167    6.372938         65         90
        lage |      3,064    4.302728    .0853122   4.174387    4.49981
```

```
tab age
```
```
        Age |      Freq.     Percent        Cum.
------------+-----------------------------------
         65 |        249        8.13        8.13
         66 |        165        5.39       13.51
         67 |        166        5.42       18.93
         68 |        153        4.99       23.92
         69 |        145        4.73       28.66
         70 |        151        4.93       33.58
         71 |        162        5.29       38.87
         72 |        191        6.23       45.10
         73 |        167        5.45       50.55
         74 |        153        4.99       55.55
         75 |        147        4.80       60.35
         76 |        145        4.73       65.08
         77 |        117        3.82       68.90
         78 |        117        3.82       72.72
         79 |        113        3.69       76.40
         80 |         97        3.17       79.57
         81 |         89        2.90       82.47
         82 |         73        2.38       84.86
         83 |         80        2.61       87.47
         84 |         72        2.35       89.82
         85 |        295        9.63       99.45
         86 |          4        0.13       99.58
         87 |          4        0.13       99.71
         88 |          3        0.10       99.80
         89 |          2        0.07       99.87
         90 |          4        0.13      100.00
------------+-----------------------------------
      Total |      3,064      100.00
```
```
tabulate age, generate(age_)
```
```

        Age |      Freq.     Percent        Cum.
------------+-----------------------------------
         65 |        249        8.13        8.13
         66 |        165        5.39       13.51
         67 |        166        5.42       18.93
         68 |        153        4.99       23.92
         69 |        145        4.73       28.66
         70 |        151        4.93       33.58
         71 |        162        5.29       38.87
         72 |        191        6.23       45.10
         73 |        167        5.45       50.55
         74 |        153        4.99       55.55
         75 |        147        4.80       60.35
         76 |        145        4.73       65.08
         77 |        117        3.82       68.90
         78 |        117        3.82       72.72
         79 |        113        3.69       76.40
         80 |         97        3.17       79.57
         81 |         89        2.90       82.47
         82 |         73        2.38       84.86
         83 |         80        2.61       87.47
         84 |         72        2.35       89.82
         85 |        295        9.63       99.45
         86 |          4        0.13       99.58
         87 |          4        0.13       99.71
         88 |          3        0.10       99.80
         89 |          2        0.07       99.87
         90 |          4        0.13      100.00
------------+-----------------------------------
      Total |      3,064      100.00
```
- Creating scatter diagram
```
scatter age famsze
```

```
scatter age totexp
```

```
graph matrix age totexp
```

```
hist age
```
- Calculated correlation
```
corr age famsze
```
```
             |      age   famsze
-------------+------------------
         age |   1.0000
      famsze |  -0.1663   1.0000
```

- Significance testing
```
pwcorr age famsze, star(.1)
```
```
             |      age   famsze
-------------+------------------
         age |   1.0000 
      famsze |  -0.1663*  1.0000
```
> ( * ) Inside the parentheses is the significance level, .1 = 10%, .05 = 5%. When ( * ) is displayed it means that the correlation is significant, at the defined significance level.

```
reg totexp age famsze
```
```
      Source |       SS           df       MS      Number of obs   =     3,064
-------------+----------------------------------   F(2, 3061)      =      3.74
       Model |  1.0483e+09         2   524158380   Prob > F        =    0.0239
    Residual |  4.2927e+11     3,061   140237044   R-squared       =    0.0024
-------------+----------------------------------   Adj R-squared   =    0.0018
       Total |  4.3031e+11     3,063   140487727   Root MSE        =     11842

------------------------------------------------------------------------------
      totexp | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |   42.13606   34.04935     1.24   0.216    -24.62584     108.898
      famsze |  -482.6316   219.5523    -2.20   0.028    -913.1164   -52.14688
       _cons |   4826.431   2636.526     1.83   0.067    -343.1088     9995.97
------------------------------------------------------------------------------
```
* The first variable is the dependent variable and the subsequent ones are the explanatory variables
* Estimation of all elements is always using OLS, unless otherwise specified
* Std. err is the standard errors
* R-Squared * 100 = means that 24% of age and family size explain total expenditure
* Reading the coefficient -> controlled by the age variable when family size increases by 1 unit, the data shows that on average health expenditures fall by 482 dollars
* Analyzing coefficients -> age is positive, so increasing age increases family expenditures, while family size is negative, which means that larger families spend less correlation and the degree of association between two variables

------------------------------------------------------------------------------------------------------------------------------------------------------------
RASCUNHO 

* Prob > F is the global test (Test F), my model passes the global test; I don't need to do individual tests ***** Teste Global (Teste F) ******

H0 -> B1 e B2 = 0 -> modelo não é significativo
H1 -> B1 ≠ 0 e ou B2 ≠ 0 -> modelo é significativo

**** Metodo de avaliação *****

Deveria comparar o F com o F-crítico, mas é maís facil usar o P > F (P-valor)
Se o F for maior que o F-crítico eu rejeito a hipotese H0 e aceito a hipotese alternativa

*** OU ***

F > Prob>F - rejeito H0
F < Prob>F - não rejeito H0

**** Teste individuais (Teste T) *****

*H0 -> B1 = 0 -> modelo não é significativo (T > T-critico)
*H1 -> B1 ≠ 0 -> modelo é significativo

**** Metodo de avaliação ***** ------------------> Por isso a variável age não é significativa e o tamanho da família é significativa 

t > t-critico - rejeito H0
t < t-critivo - não rejeito H0

*** OU ***

P<T é menor que o nível de significancia- rejeito H0
P>T é maior que o nível de significancia- nao rejeito H0

**** Avaliar Multicolinearidade ****

* VIF -> Variance inflation factor (baseado no R2 de regressões auxiliares) ---> Geralmente maior que 5 é considerado a presença de multicolinearidade
* R-squared muito alto pode signficar multicolinearidade 

vif

    Variable |       VIF       1/VIF  
-------------+----------------------
         age |      1.03    0.972341
      famsze |      1.03    0.972341
-------------+----------------------
    Mean VIF |      1.03

**** Avaliar Homocedasticidade ****

**** Teste BP ****

hettest

    chi2(1) =   0.18
Prob > chi2 = 0.6749

* H0 -> homocedasticidade
* H1 -> Heterocedasticidade

* Prob > chi2 > intervalo de confianca -> não rejeita h0
* Prob > chi2 < intervalo de confianca -> rejeita h0
* Se eu rejeito H0 heterocedasticidade se eu não rejeito H0 homocedasticidade


**** Teste de white ****

imtest, white

    chi2(5) =   4.92
Prob > chi2 = 0.4251

Cameron & Trivedi's decomposition of IM-test

--------------------------------------------------
              Source |       chi2     df         p
---------------------+----------------------------
  Heteroskedasticity |       4.92      5    0.4251
            Skewness |      43.03      2    0.0000
            Kurtosis | -249213.50      1    1.0000
---------------------+----------------------------
               Total | -249165.54      8    1.0000
--------------------------------------------------

**** Previsão ****

*valores totais
edit totexp

*valores previstos
predict totexp_ajus
edit totexp totexp_ajus
sum totexp totexp_ajus

* as previsoes são péssimas, pois estamos usando um modelo de regressao simples = não é o modelo adequado (R-squared era ridículo)

predict residuos, resid -> erros estimados
edit residuos
hist residuos, normal 

**** Teste Normalidade dos Erros ****

edit totexp

gen ltotexp=log(totexp)

reg ltotexp suppins female phylim actlim income totchr, robust

Linear regression                               Number of obs     =      2,955
                                                F(6, 2948)        =     147.83
                                                Prob > F          =     0.0000
                                                R-squared         =     0.2286
                                                Root MSE          =     1.2023

------------------------------------------------------------------------------
             |               Robust
     ltotexp | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     suppins |   .2512797   .0463629     5.42   0.000     .1603728    .3421866
      female |  -.0825354   .0456855    -1.81   0.071     -.172114    .0070433
      phylim |   .3103849   .0566753     5.48   0.000     .1992578    .4215121
      actlim |   .3625158   .0630662     5.75   0.000     .2388576    .4861739
      income |    .002447   .0010454     2.34   0.019     .0003972    .0044968
      totchr |   .3755429   .0187169    20.06   0.000     .3388433    .4122425
       _cons |   6.984852   .0647095   107.94   0.000     6.857971    7.111732
------------------------------------------------------------------------------

* Robust regression is an alternative to least squares regression (MQO)

predict erro, resid

hist erro, normal

scatter ltotexp age

. * deletar esse último comando

.  * a os betas nao mudam, o que muda é a formula que se usa para calcularar a variancia dos erros

. se plotarmos o historgrama eles seram iguais
-set plotarmos- not allowed; 'plotarmos' not recognized
r(199);

. estimador de variancia de erro diferenca wue retorna um padrao diferente
command estimador is unrecognized
r(199);

. swilk -> shapiro wilk semelhante ao JAque-bera
- invalid name
r(198);

. dar um help para ver como funciona a performace
command dar is unrecognized
r(199);

. * sao baseados na logica jaque-bera, teste de hipotese conjunta de dois momentos de uma distribuicao normal, assimetria (diferen
> ca entre mediana e média, o useja graficamente se a massa da distribuicao tende mais para a esquerda ou para a direita) = assime
> tria da normal = 0 (igualmente disitrbuida dos dois lados) e curtose (densidade = disitrubicao mais alonga ou achatada normal = 
> 3), comparar os erros estimados (residuos) com a assimetria e a curtose da normal. a ideia e uma diferenca quadratica do valor c
> om a normal, se o valor é proximo da normal ele se aproxima de 0, jaque bera é pequeno

. H0 -> erro segue a disitruicao normal
command H0 is unrecognized
r(199);

. H1 -> erros seguem uma disitrbuição normal
command H1 is unrecognized
r(199);

. *tem performaces muito pequenas em amostrar pequenas

. swilk erro

                   Shapiro–Wilk W test for normal data

    Variable |        Obs       W           V         z       
> Prob>z
-------------+------------------------------------------------
> ------
        erro |      2,955    0.99187     13.743     6.759    0
> .00000

Note: The normal approximation to the sampling distribution of W'
      is valid for 4<=n<=2000.

. sfrancia erro

                  Shapiro–Francia W' test for normal data

    Variable |       Obs       W'          V'        z       P
> rob>z
-------------+------------------------------------------------
> -----
        erro |     2,955    0.99170     14.915     6.628    0.
> 00001

. help sfrancia

. Prob>P = 0 o valor calculado e tao alto que a area que sobrar dele é virtualmente zero, se o nivel de significancia e 
> 10% por exemplo, entao o valor calculado é muito maior que o valor critico, reijeito H) nao sao normais
command Prob not defined by Prob.ado
r(199);

. se o p vaor for maior que o nivel de significficancia nos podemos aceitar a hipotese H0
-set o- not allowed; 'o' not recognized
r(199);

. sktest erro

Skewness and kurtosis tests for normality
                                                         ----- Joint test -----
    Variable |       Obs   Pr(skewness)   Pr(kurtosis)   Adj chi2(2)  Prob>chi2
-------------+-----------------------------------------------------------------
        erro |     2,955         0.0000         0.0000         71.95     0.0000

. p valor e a area da estatica calculada para mais infinito da
>  distirbuicao
command p is unrecognized
r(199);

*-----------------------------------*
*        VARIÁVEIS DISCRETAS        *
*-----------------------------------*

* Criar uma tabela de frequências da variável "regiao"
tabulate regiao
tabulate regiao, missing

* Criar tabelas para várias variáveis em um único comando
tab1 regiao genero

* Criar tabelas cruzadas entre duas variáveis
tab regiao genero

* Criar tabelas cruzadas entre duas variáveis com opções
tab regiao genero, col
tab regiao genero, row
tab regiao genero, cel

* Criar tabela de frequências entre duas variáveis para um subgrupo da população
tab raca if genero==0

*--------------------------*
*   VARIÁVEIS CONTÍNUAS    *
*--------------------------*

** Para algumas variáveis
summarize idade anosestudo rendafampc

** Para informações detalhadas
summarize rendafampc, detail 

** Média
tabstat idade anosestudo rendafampc

** Com opções
tabstat idade anosestudo rendafampc, format(%10.2f)
tabstat idade anosestudo rendafampc, by(regiao) format(%10.2f)

** Definindo as estatísticas
tabstat idade anosestudo rendafampc, statistics( mean median sd min max ) format(%10.2f)

** Definindo as informações das colunas
tabstat idade anosestudo rendafampc, statistics( mean median sd min max ) columns(statistics) format(%10.2f)

* Calcular a correlação entre duas ou mais variáveis
correlate anosestudo V4719



