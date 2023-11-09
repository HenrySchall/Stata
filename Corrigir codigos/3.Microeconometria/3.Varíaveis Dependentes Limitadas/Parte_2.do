edit
sum winner

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      winner |        760    .3605263    .4804694          0          1

*há varios fatores que podem explicar a vitoria, como jogar fora ou em casa

reg winner

      Source |       SS           df       MS      Number of obs   =       760
-------------+----------------------------------   F(0, 759)       =      0.00
       Model |           0         0           .   Prob > F        =         .
    Residual |  175.215789       759  .230850843   R-squared       =    0.0000
-------------+----------------------------------   Adj R-squared   =    0.0000
       Total |  175.215789       759  .230850843   Root MSE        =    .48047

------------------------------------------------------------------------------
      winner | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
       _cons |   .3605263   .0174285    20.69   0.000     .3263126      .39474
------------------------------------------------------------------------------

scatter winner rodada
scatter winner goals

reg winner rodada goals

      Source |       SS           df       MS      Number of obs   =       760
-------------+----------------------------------   F(2, 757)       =    287.45
       Model |  75.6299957         2  37.8149979   Prob > F        =    0.0000
    Residual |  99.5857938       757  .131553228   R-squared       =    0.4316
-------------+----------------------------------   Adj R-squared   =    0.4301
       Total |  175.215789       759  .230850843   Root MSE        =     .3627

------------------------------------------------------------------------------
      winner | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      rodada |  -.0002938   .0011998    -0.24   0.807    -.0026491    .0020615
       goals |   .2852607   .0118976    23.98   0.000     .2619046    .3086169
       _cons |   .0134321   .0305812     0.44   0.661     -.046602    .0734661
------------------------------------------------------------------------------

tab winner

     winner |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        486       63.95       63.95
          1 |        274       36.05      100.00
------------+-----------------------------------
      Total |        760      100.00

* Comentários: 
* Rodada não é siginificativa
* Goals é significativa
* Controlada pela variável rodada, cada gol a mais gera um aumento na probabilidade de vitória em 28,52%

corr rodada goals
(obs=760)

             |   rodada    goals
-------------+------------------
      rodada |   1.0000
       goals |   0.0026   1.0000


predict pwinner
(option xb assumed; fitted values)

sum winner pwinner

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      winner |        760    .3605263    .4804694          0          1
     pwinner |        760    .3605263    .3156648   .0022694   1.716771


edit time rodada goals winner pwinner

reg goals home

      Source |       SS           df       MS      Number of obs   =       760
-------------+----------------------------------   F(1, 758)       =     37.30
       Model |  43.5842105         1  43.5842105   Prob > F        =    0.0000
    Residual |  885.784211       758  1.16858075   R-squared       =    0.0469
-------------+----------------------------------   Adj R-squared   =    0.0456
       Total |  929.368421       759  1.22446432   Root MSE        =     1.081

------------------------------------------------------------------------------
       goals | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
        home |   .4789474   .0784246     6.11   0.000     .3249921    .6329027
       _cons |   .9973684   .0554546    17.99   0.000     .8885056    1.106231
------------------------------------------------------------------------------

* Estimando por Máxima Verossimilhança (Caso não seja específicado o modelo padrão é MQO)
program define regressest

args lnf theta1 theta2

quietly replace `lnf'=-ln(sqrt(2*_pi*`theta2'^2))-1/(2*`theta2'^2)*($ML_y1-`theta1')^2

end

ml model lf regressest (eq1:goals=red attendance) (eq2:goals=)

ml maximize

reg goals red attendance


