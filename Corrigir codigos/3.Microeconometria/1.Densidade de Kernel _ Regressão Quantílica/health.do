. gen ltotexp=log(totexp)
totexp not found
r(111);

. use "C:\Users\henri\OneDrive\Documentos\Programação\Stata\2.Revisão Econométria\base_health.dta"

. gen ltotexp=log(totexp)
(109 missing values generated)

. reg ltotexp suppins female phylim actlim income totchr, robust

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

. predict erro, resid
(109 missing values generated)

. scatter ltotexp age

. * deletar ultimo comanda

. kdensity erro

. * equivalente ao histograma, gerado de uma forma suavizada dos meus dados

. * muito interessante para o uso de variaveis continuas

. hist erro
(bin=34, start=-6.1688509, width=.28863272)

. kdensity erro, normal

. doedit

. reg totexp age famsze

      Source |       SS           df       MS      Number of o
> bs   =     3,064
-------------+----------------------------------   F(2, 3061) 
>      =      3.74
       Model |  1.0483e+09         2   524158380   Prob > F   
>      =    0.0239
    Residual |  4.2927e+11     3,061   140237044   R-squared  
>      =    0.0024
-------------+----------------------------------   Adj R-squar
> ed   =    0.0018
       Total |  4.3031e+11     3,063   140487727   Root MSE   
>      =     11842

--------------------------------------------------------------
> ----------------
      totexp | Coefficient  Std. err.      t    P>|t|     [95%
>  con                                                        
>     f. interval]
-------------+------------------------------------------------
> ----------------
         age |   42.13606   34.04935     1.24   0.216    -24.6
> 2584                                                        
>          108.898
      famsze |  -482.6316   219.5523    -2.20   0.028    -913.
> 1164                                                        
>        -52.14688
       _cons |   4826.431   2636.526     1.83   0.067    -343.
> 1088                                                        
>          9995.97
--------------------------------------------------------------
> ----------------

. reg totexp age famsze

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

. qreg totexp age famsze
Iteration  1:  WLS sum of weighted deviations =  9926244.6

Iteration  1: sum of abs. weighted deviations =  9927479.5
Iteration  2: sum of abs. weighted deviations =  9658415.5
Iteration  3: sum of abs. weighted deviations =  8889404.5
Iteration  4: sum of abs. weighted deviations =  8842439.8
note: alternate solutions exist.
Iteration  5: sum of abs. weighted deviations =  8676860.5
note: alternate solutions exist.
Iteration  6: sum of abs. weighted deviations =  8676170.5
Iteration  7: sum of abs. weighted deviations =  8675406.7
Iteration  8: sum of abs. weighted deviations =  8675248.2

Median regression                                   Number of obs =      3,064
  Raw sum of deviations  8731965 (about 3132)
  Min sum of deviations  8675248                    Pseudo R2     =     0.0065

------------------------------------------------------------------------------
      totexp | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |   70.26667   14.48543     4.85   0.000     41.86452    98.66882
      famsze |  -313.9111   93.40291    -3.36   0.001    -497.0499   -130.7724
       _cons |  -1472.756   1121.643    -1.31   0.189    -3672.004    726.4932
------------------------------------------------------------------------------

. qreg totexp age famsze q(1).
coding operators not allowed
r(198);

. qreg totexp age famsze, q(1).
option . is not allowed
r(198);

. qreg totexp age famsze, q(.1)
Iteration  1:  WLS sum of weighted deviations =  7102693.1

Iteration  1: sum of abs. weighted deviations =  7108604.4
Iteration  2: sum of abs. weighted deviations =    6875304
Iteration  3: sum of abs. weighted deviations =  3747431.3
Iteration  4: sum of abs. weighted deviations =  3223769.1
Iteration  5: sum of abs. weighted deviations =    2791450
Iteration  6: sum of abs. weighted deviations =  2237593.8
Iteration  7: sum of abs. weighted deviations =  2141692.5
Iteration  8: sum of abs. weighted deviations =  2123412.9
Iteration  9: sum of abs. weighted deviations =  2106232.1
Iteration 10: sum of abs. weighted deviations =  2105062.5
Iteration 11: sum of abs. weighted deviations =  2104666.2
Iteration 12: sum of abs. weighted deviations =  2104655.8
Iteration 13: sum of abs. weighted deviations =  2104608.6
Iteration 14: sum of abs. weighted deviations =  2104595.2
Iteration 15: sum of abs. weighted deviations =  2104595.1

.1 Quantile regression                              Number of 
> obs =      3,064
  Raw sum of deviations  2113293 (about 389)
  Min sum of deviations  2104595                    Pseudo R2 
>     =     0.0041

--------------------------------------------------------------
> ----------------
      totexp | Coefficient  Std. err.      t    P>|t|     [95%
>  con                                                        
>     f. interval]
-------------+------------------------------------------------
> ----------------
         age |   18.51515   5.170089     3.58   0.000     8.37
> 7954                                                        
>         28.65235
      famsze |  -95.30303   33.33705    -2.86   0.004    -160.
> 6683                                                        
>        -29.93778
       _cons |  -745.4848   400.3328    -1.86   0.063    -1530
> .433                                                        
>         39.46343
--------------------------------------------------------------
> ----------------

. qreg totexp age famsze, q(.1)
Iteration  1:  WLS sum of weighted deviations =  7102693.1

Iteration  1: sum of abs. weighted deviations =  7108604.4
Iteration  2: sum of abs. weighted deviations =    6875304
Iteration  3: sum of abs. weighted deviations =  3747431.3
Iteration  4: sum of abs. weighted deviations =  3223769.1
Iteration  5: sum of abs. weighted deviations =    2791450
Iteration  6: sum of abs. weighted deviations =  2237593.8
Iteration  7: sum of abs. weighted deviations =  2141692.5
Iteration  8: sum of abs. weighted deviations =  2123412.9
Iteration  9: sum of abs. weighted deviations =  2106232.1
Iteration 10: sum of abs. weighted deviations =  2105062.5
Iteration 11: sum of abs. weighted deviations =  2104666.2
Iteration 12: sum of abs. weighted deviations =  2104655.8
Iteration 13: sum of abs. weighted deviations =  2104608.6
Iteration 14: sum of abs. weighted deviations =  2104595.2
Iteration 15: sum of abs. weighted deviations =  2104595.1

.1 Quantile regression                              Number of obs =      3,064
  Raw sum of deviations  2113293 (about 389)
  Min sum of deviations  2104595                    Pseudo R2     =     0.0041

------------------------------------------------------------------------------
      totexp | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |   18.51515   5.170089     3.58   0.000     8.377954    28.65235
      famsze |  -95.30303   33.33705    -2.86   0.004    -160.6683   -29.93778
       _cons |  -745.4848   400.3328    -1.86   0.063    -1530.433    39.46343
------------------------------------------------------------------------------

. * premieiro decil

. 18 coeficiente
18 is not a valid command name
r(199);

. no caos de 70 quando a idade cresce em uma unidade controlado pelos outros fatores, os gastos medicos sobem por volta de 7o unidades em tornao da medida
command caos is unrecognized
r(199);

. em torno da mediana dos gastos medicos
command em is unrecognized
r(199);

. que o mesmo efeito de aumento de uma 1 unidade na idade em torno do primeiro decil de gatos medicos e menor e gira em torno de 18 unidades
invalid syntax
r(198);

. regltotexp supins female phylis actile income totchr, robust
command regltotexp is unrecognized
r(199);

. reg ltotexp supins female phylis actile income totchr, robus
> t
variable supins not found
r(111);

. regltotexp suppins female phylis actile income totchr, robus
> t
command regltotexp is unrecognized
r(199);

. reg ltotexp suppins female phylis actile income totchr, robu
> st
variable phylis not found
r(111);

.  reg ltotexp suppins female phylim actile income totchr, robust
variable actile not found
r(111);

. reg ltotexp supins female phylis actilim income totchr, robus
variable supins not found
r(111);

. reg ltotexp suppins female phylis actilim income totchr, robust
variable phylis not found
r(111);

. reg ltotexp suppins female phylim actilim income totchr, robust
variable actilim not found
r(111);

. 
