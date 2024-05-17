## Introdução

### Comandos Básicos

* Mexer nas configurações
set -> abrir configuracoes
set dp comma  // separador decimal BR
set more off // sem pausar

* Realizar Comentários *
Comentário -> *
Comnetario em intervalo -> /* Gosto de Bacon */

* Abrir Bloco de anotações 
doedit -> bloco notas 

* Abrir Log-File (bloco para exportar código e resultados)
log using "resultados.txt" /* criando o arquivo */ 
log close /* fechando o arquivo */

* Manipulação de variaveis 
sum m* -> todas as variaveis iniciadas com letra M
summarize price-trunk (periodo das variaveis) -> todas as variaveis entre price e truck

* Criando diretório de trabalho
cd "C:\Stata"

* Comandos essenciais
generate -> gerar nova variavel
summarize -> resumo das variaveis
replace -> substitui o conteudo de qualquer variavel ou dado
describe -> descrever variavel
clear -> usar para limpar a base anterior e carregar uma nova /*(Exemplo: use "C:\Stata\dta1_pnad2014.dta", clear)*/
view -> visualizar base
recode -> Altera o contepudo apenas de variaveis numericas
update query -> 
bysort -> organizar de forma crescente
cls -> limpar aba de resultados

* Buscando ajuda
help
search /*(não conhecemos o nome do comando)*/

* Exemplo: carregar base de dados 
sysuse auto.dta

*-----------------------------------------------*
* OPERADORES ARITMÉTICOS, RELACIONAIS E LÓGICOS *
*-----------------------------------------------*

* OPERAÇÕES ARITMÉTICAS
1) soma -> +
2) substracao -> -
3) multiplicacao -> *
4) divisao -> /
5) potencia -> ^

*Exemplos:
display 4+7
display 9-7
display 6*5
display 16/4
display 2^4
display 3*(10-8)
display (-9)^2/3

* OPERAÇÕES RELACIONAIS E LÓGICAS
1) igualdade -> ==
2) maior que -> > or =>
3) menor que -> < or <=
4) diferenca -> ~
5) e -> & (duas condicoes precisam ser satisfeitas ao mesmo tempo)
6) ou -> | (uma condicoes ou outra precisa ser satisfeita)
7) atribuindo valor -> = 

* Carregando base de dados
use "C:\Users\Documents\Stata\dta_pnad2014.dta"

*renda per capita no estado de SP
summarize rendatotalpc if uf==35 
*criar variável renda do trabalho
generate y_trabalho = y_trabhomem + y_trabmulher
summarize y_trabalho if uf==35 & idade>50
summarize y_trabalho if uf==35 | idade>50
summarize y_trabalho if uf~35
summarize rendatotalpc if !y_previdência_priv

*---------------------------------*
* EXCLUIR VARIÁVEIS E OBSERVAÇÕES *
*---------------------------------*

* Excluir variáveis
drop V9126 V1101 V1141 V1142

* Excluir indivíduos com informações faltantes:
drop if  V4803==. /*(dados faltantes)*/
drop if V4803==17 

* Manter variáveis
keep V0101 UF V0102 V0103 V0301 V0302 V8005  

* Manter a variável com modificações
keep if  V8005>=18 & V8005<=24 /*(manter apenas individuos jovens)*/

* Salvar a base com outro nome
save "C:\Stata\dta2_pnad2014.dta"

* Caso já exista uso um replace (sobrescrever os dados no mesmo arquivo)
save "C:\Stata\dta2_pnad2014.dta", replace

*--------------------*
* RENOMEAR VARIÁVEIS *
*--------------------*

* Abrir base de dados (Sintaxe = rename old_varname new_varname)

* Renomear variáveis de interesse
rename V0101 ano
rename V4803 anosestudo

* Renomear variáveis de interesse
rename (UF  V0102   V0103 V0301 V0302   V4727  V4728  ) /// 
       (uf controle serie ordem genero areacen urbana ) 
   
*-------------------------------*
* ALTERAR CONTEÚDO DE VARIÁVEIS *
*-------------------------------*

* Acrescentar ou mudar legenda do banco de dados
label data pnad2014pes

* Acrescentar ou mudar legenda da variável
label variable ano "V0101-ANO DE REFERÊNCIA"
label variable serie "V0103-NÚMERO DE SÉRIE"

* Alterando rótulos das dados das variáveis
label define pdom 1 "chefe" 2 "cônjuge" 3 "filho" 4 "outro parente" ///
 5 "agregado" 6 "pensionista" 7 "doméstico" 8 "parente doméstico", replace /* especificando mudancas */
label values pdom pdom /*aplicando as mudancas*/

label define uf 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 ///
"TO" 21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" ///
29 "BA" 31 "MG" 32 "ES" 33 "RJ" 35 "SP" 41 "PR" 42 "SC" 43 "RS" 50 "MS" ///
51 "MT" 52 "GO" 53 "DF", replace 
label values uf uf

* Recodificar as variáveis para retirar os não aplicáveis e sem declaração
recode V4720 (. 999999999999=0)
recode V1252 (. 999999999999=0)
recode V1255 (. 999999999999=0)

* Recodificar a variável "genero"
recode genero (2=1) (4=0)

label define genero 1 "masculino" 0 "feminino", replace
label values genero genero

* Recodificar a variável "área censitária"
recode urbana (2/3=1) (4/8=0) /* substituindo entre intervalos*/
label define urbana 1 "urbana" 0 "rural" , replace 
label values urbana urbana

*---------------------------*
*      CRIAR VARIÁVEIS      *
*---------------------------*

* Criando a variável "regiao"
gen regiao = 1 if uf>=11 & uf<=17
replace regiao = 2 if uf>=21 & uf<=29
replace regiao = 3 if uf>=31 & uf<=35
replace regiao = 4 if uf>=41 & uf<=43 
replace regiao = 5 if uf>=50 & uf<=53

label define regiao 1 "norte" 2 "nordeste" 3 "sudeste" 4 "sul" ///
5 "centro_oeste"
label values regiao regiao

* Criando dummies de regiao
gen norte=1 if uf>=11 & uf<=17
recode norte .=0
gen nordeste=1 if uf>=21 & uf<=29
recode nordeste .=0
gen sudeste=1 if uf>=31 & uf<=35
recode sudeste .=0
gen centro_oeste=1 if uf>=50 & uf<=53
recode centro_oeste .=0
gen sul=1 if uf>=41 & uf<=43
recode sul .=0

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
