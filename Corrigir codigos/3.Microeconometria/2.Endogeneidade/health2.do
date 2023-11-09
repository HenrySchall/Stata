
. *ssratio = renda da aposentadoria / renda tota do individuo

. * varíavel é exogena

. multlc = numero de plantas fabris
command multlc is unrecognized
r(199);

. corr hi_empunion ssiratio lowincome firmsz multlc
(obs=10,391)

             | hi_emp~n ssiratio lowinc~e   firmsz   multlc
-------------+---------------------------------------------
 hi_empunion |   1.0000
    ssiratio |  -0.1963   1.0000
   lowincome |  -0.1144   0.2498   1.0000
      firmsz |   0.0372  -0.0405  -0.0078   1.0000
      multlc |   0.1191  -0.1744  -0.0607   0.1874   1.0000


. corr ldrugexp hi_empunion ssiratio lowincome firmsz multlc
(obs=10,391)

             | ldrugexp hi_emp~n ssiratio lowinc~e   firmsz   multlc
-------------+------------------------------------------------------
    ldrugexp |   1.0000
 hi_empunion |   0.0345   1.0000
    ssiratio |   0.0611  -0.1963   1.0000
   lowincome |   0.0057  -0.1144   0.2498   1.0000
      firmsz |  -0.0354   0.0372  -0.0405  -0.0078   1.0000
      multlc |  -0.0489   0.1191  -0.1744  -0.0607   0.1874   1.0000


. reg ldrugexp hi_empunion ssiratio lowincome firmsz multlc

      Source |       SS           df       MS      Number of obs   =    10,391
-------------+----------------------------------   F(5, 10385)     =     18.06
       Model |   166.47671         5  33.2953419   Prob > F        =    0.0000
    Residual |  19146.9335    10,385  1.84371049   R-squared       =    0.0086
-------------+----------------------------------   Adj R-squared   =    0.0081
       Total |  19313.4102    10,390  1.85884602   Root MSE        =    1.3578

------------------------------------------------------------------------------
    ldrugexp | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |    .146367   .0281682     5.20   0.000     .0911519    .2015821
    ssiratio |   .2373913   .0377152     6.29   0.000     .1634624    .3113203
   lowincome |  -.0252177   .0354682    -0.71   0.477    -.0947422    .0443069
      firmsz |  -.0174801   .0063417    -2.76   0.006    -.0299112   -.0050491
      multlc |  -.2235016   .0579994    -3.85   0.000    -.3371915   -.1098117
       _cons |    6.32106   .0276358   228.73   0.000     6.266888    6.375231
------------------------------------------------------------------------------

. hi_empunion = preco de saude
command hi_empunion is unrecognized
r(199);

. reg ldrugexp hi_empunion ssiratio lowincome firmsz multlc, robust

Linear regression                               Number of obs     =     10,391
                                                F(5, 10385)       =      17.60
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0086
                                                Root MSE          =     1.3578

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |    .146367   .0280793     5.21   0.000     .0913261    .2014079
    ssiratio |   .2373913   .0379005     6.26   0.000     .1630991    .3116836
   lowincome |  -.0252177   .0358187    -0.70   0.481    -.0954292    .0449939
      firmsz |  -.0174801   .0065216    -2.68   0.007    -.0302636   -.0046966
      multlc |  -.2235016   .0598219    -3.74   0.000    -.3407639   -.1062392
       _cons |    6.32106   .0275428   229.50   0.000     6.267071    6.375049
------------------------------------------------------------------------------

. reg ldrugexp hi_empunion totchr age female blhisp linc, robust

Linear regression                               Number of obs     =     10,089
                                                F(6, 10082)       =     376.85
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1770
                                                Root MSE          =      1.236

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |   .0738788   .0259848     2.84   0.004     .0229435    .1248141
      totchr |   .4403807   .0093633    47.03   0.000     .4220268    .4587346
         age |  -.0035295    .001937    -1.82   0.068    -.0073264    .0002675
      female |   .0578055   .0253651     2.28   0.023     .0080848    .1075262
      blhisp |  -.1513068   .0341264    -4.43   0.000    -.2182013   -.0844122
        linc |   .0104815   .0137126     0.76   0.445    -.0163979     .037361
       _cons |   5.861131   .1571037    37.31   0.000     5.553176    6.169085
------------------------------------------------------------------------------

. hi_empunion = preco de saude complementar privada
command hi_empunion is unrecognized
r(199);

. chronic cond = condicoes cronicas
command chronic is unrecognized
r(199);

. ivreg 2sls ldrugexp (hi_empunion - ssiratio) totchr age female blhisp linc, robust first
invalid syntax
syntax is "(all instrumented variables = instrument variables)"
the equal sign "=" is required
r(198);

.  ivregress 2sls ldrugexp (hi_empunion = ssiratio) totchr age female blhisp linc, robust first

First-stage regressions
-----------------------

                                                        Number of obs = 10,089
                                                        F(6, 10082)   = 119.18
                                                        Prob > F      = 0.0000
                                                        R-squared     = 0.0761
                                                        Adj R-squared = 0.0755
                                                        Root MSE      = 0.4672

------------------------------------------------------------------------------
             |               Robust
 hi_empunion | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      totchr |   .0127865   .0036655     3.49   0.000     .0056015    .0199716
         age |  -.0086323   .0007087   -12.18   0.000    -.0100216   -.0072431
      female |    -.07345   .0096392    -7.62   0.000    -.0923448   -.0545552
      blhisp |    -.06268   .0122742    -5.11   0.000      -.08674   -.0386201
        linc |   .0483937   .0066075     7.32   0.000     .0354417    .0613456
    ssiratio |  -.1916432   .0236326    -8.11   0.000    -.2379678   -.1453186
       _cons |   1.028981   .0581387    17.70   0.000     .9150172    1.142944
------------------------------------------------------------------------------


Instrumental variables 2SLS regression            Number of obs   =     10,089
                                                  Wald chi2(6)    =    2000.86
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.0640
                                                  Root MSE        =     1.3177

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |  -.8975913   .2211268    -4.06   0.000    -1.330992   -.4641908
      totchr |   .4502655   .0101969    44.16   0.000       .43028     .470251
         age |  -.0132176   .0029977    -4.41   0.000    -.0190931   -.0073421
      female |   -.020406   .0326114    -0.63   0.531    -.0843232    .0435113
      blhisp |  -.2174244   .0394944    -5.51   0.000     -.294832   -.1400167
        linc |   .0870018   .0226356     3.84   0.000     .0426368    .1313668
       _cons |    6.78717   .2688453    25.25   0.000     6.260243    7.314097
------------------------------------------------------------------------------
Instrumented: hi_empunion
 Instruments: totchr age female blhisp linc ssiratio

. ivregress = variavel instrumental
= not a valid estimator
r(198);

. 2sls help
2sls is not a valid command name
r(199);

. help 2sls

. 2 sls
2 is not a valid command name
r(199);

. 2 sls = 2 quadrados 2 estagios
2 is not a valid command name
r(199);

. ldrugexp - variavel dependente
command ldrugexp is unrecognized
r(199);

. entre parentes seu regressor endogeneo e o instrumento
command entre is unrecognized
r(199);

. e dps as outras variaveis exogenas
dps not found
r(111);

. primeiro estagio eu estpu estimando o hi_empunion chapeu
command primeiro is unrecognized
r(199);

. ivregress 2sls ldrugexp (hi_empunion = ssiratio multlc) totchr age female blhisp linc, robust first

First-stage regressions
-----------------------

                                                        Number of obs = 10,089
                                                        F(7, 10081)   = 113.96
                                                        Prob > F      = 0.0000
                                                        R-squared     = 0.0794
                                                        Adj R-squared = 0.0788
                                                        Root MSE      = 0.4664

------------------------------------------------------------------------------
             |               Robust
 hi_empunion | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      totchr |   .0132573   .0036603     3.62   0.000     .0060825    .0204322
         age |  -.0080531   .0007123   -11.31   0.000    -.0094493   -.0066569
      female |  -.0727472   .0096209    -7.56   0.000    -.0916061   -.0538883
      blhisp |     -.0679   .0122426    -5.55   0.000    -.0918979   -.0439021
        linc |   .0444476   .0065546     6.78   0.000     .0315993    .0572959
    ssiratio |  -.1823381   .0232885    -7.83   0.000    -.2279882   -.1366879
      multlc |   .1209113    .020779     5.82   0.000     .0801804    .1616422
       _cons |   .9834068   .0586275    16.77   0.000     .8684852    1.098328
------------------------------------------------------------------------------


Instrumental variables 2SLS regression            Number of obs   =     10,089
                                                  Wald chi2(6)    =    1955.36
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.0414
                                                  Root MSE        =     1.3335

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |  -.9899269   .2045907    -4.84   0.000    -1.390917   -.5889365
      totchr |   .4512051   .0103088    43.77   0.000     .4310001      .47141
         age |  -.0141384      .0029    -4.88   0.000    -.0198223   -.0084546
      female |  -.0278398   .0321743    -0.87   0.387    -.0909002    .0352207
      blhisp |  -.2237087   .0395848    -5.65   0.000    -.3012934   -.1461239
        linc |   .0942748   .0218841     4.31   0.000     .0513828    .1371668
       _cons |   6.875188   .2578855    26.66   0.000     6.369741    7.380634
------------------------------------------------------------------------------
Instrumented: hi_empunion
 Instruments: totchr age female blhisp linc ssiratio multlc

. * agr há dois variaveis intrumentais

. * efeito de hi_empinion cresce com mais intrumentos

. hi_empunion é uma dummiy que o indiivudo possuia um plan ode saude privado quando ele foi contratao
command hi_empunion is unrecognized
r(199);

. estat endogenous hi_empunion

  Tests of endogeneity
  H0: Variables are exogenous

  Robust score chi2(1)            =  35.4571  (p = 0.0000)
  Robust regression F(1,10081)    =  37.0514  (p = 0.0000)

.  ivregress 2sls ldrugexp (hi_empunion = ssiratio) totchr age female blhisp linc, robust first

First-stage regressions
-----------------------

                                                        Number of obs = 10,089
                                                        F(6, 10082)   = 119.18
                                                        Prob > F      = 0.0000
                                                        R-squared     = 0.0761
                                                        Adj R-squared = 0.0755
                                                        Root MSE      = 0.4672

------------------------------------------------------------------------------
             |               Robust
 hi_empunion | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      totchr |   .0127865   .0036655     3.49   0.000     .0056015    .0199716
         age |  -.0086323   .0007087   -12.18   0.000    -.0100216   -.0072431
      female |    -.07345   .0096392    -7.62   0.000    -.0923448   -.0545552
      blhisp |    -.06268   .0122742    -5.11   0.000      -.08674   -.0386201
        linc |   .0483937   .0066075     7.32   0.000     .0354417    .0613456
    ssiratio |  -.1916432   .0236326    -8.11   0.000    -.2379678   -.1453186
       _cons |   1.028981   .0581387    17.70   0.000     .9150172    1.142944
------------------------------------------------------------------------------


Instrumental variables 2SLS regression            Number of obs   =     10,089
                                                  Wald chi2(6)    =    2000.86
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.0640
                                                  Root MSE        =     1.3177

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |  -.8975913   .2211268    -4.06   0.000    -1.330992   -.4641908
      totchr |   .4502655   .0101969    44.16   0.000       .43028     .470251
         age |  -.0132176   .0029977    -4.41   0.000    -.0190931   -.0073421
      female |   -.020406   .0326114    -0.63   0.531    -.0843232    .0435113
      blhisp |  -.2174244   .0394944    -5.51   0.000     -.294832   -.1400167
        linc |   .0870018   .0226356     3.84   0.000     .0426368    .1313668
       _cons |    6.78717   .2688453    25.25   0.000     6.260243    7.314097
------------------------------------------------------------------------------
Instrumented: hi_empunion
 Instruments: totchr age female blhisp linc ssiratio

. estat endogenous hi_empunion

  Tests of endogeneity
  H0: Variables are exogenous

  Robust score chi2(1)            =   24.935  (p = 0.0000)
  Robust regression F(1,10081)    =  26.4333  (p = 0.0000)

. doedit

. toda vez que o p valor e menor que o nivel de significancia, voce rejeita H0
command toda is unrecognized
r(199);

. ivregress 2sls ldrugexp (hi_empunion = ssiratio multlc) totchr age female blhisp linc, robust first

First-stage regressions
-----------------------

                                                        Number of obs = 10,089
                                                        F(7, 10081)   = 113.96
                                                        Prob > F      = 0.0000
                                                        R-squared     = 0.0794
                                                        Adj R-squared = 0.0788
                                                        Root MSE      = 0.4664

------------------------------------------------------------------------------
             |               Robust
 hi_empunion | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      totchr |   .0132573   .0036603     3.62   0.000     .0060825    .0204322
         age |  -.0080531   .0007123   -11.31   0.000    -.0094493   -.0066569
      female |  -.0727472   .0096209    -7.56   0.000    -.0916061   -.0538883
      blhisp |     -.0679   .0122426    -5.55   0.000    -.0918979   -.0439021
        linc |   .0444476   .0065546     6.78   0.000     .0315993    .0572959
    ssiratio |  -.1823381   .0232885    -7.83   0.000    -.2279882   -.1366879
      multlc |   .1209113    .020779     5.82   0.000     .0801804    .1616422
       _cons |   .9834068   .0586275    16.77   0.000     .8684852    1.098328
------------------------------------------------------------------------------


Instrumental variables 2SLS regression            Number of obs   =     10,089
                                                  Wald chi2(6)    =    1955.36
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.0414
                                                  Root MSE        =     1.3335

------------------------------------------------------------------------------
             |               Robust
    ldrugexp | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
 hi_empunion |  -.9899269   .2045907    -4.84   0.000    -1.390917   -.5889365
      totchr |   .4512051   .0103088    43.77   0.000     .4310001      .47141
         age |  -.0141384      .0029    -4.88   0.000    -.0198223   -.0084546
      female |  -.0278398   .0321743    -0.87   0.387    -.0909002    .0352207
      blhisp |  -.2237087   .0395848    -5.65   0.000    -.3012934   -.1461239
        linc |   .0942748   .0218841     4.31   0.000     .0513828    .1371668
       _cons |   6.875188   .2578855    26.66   0.000     6.369741    7.380634
------------------------------------------------------------------------------
Instrumented: hi_empunion
 Instruments: totchr age female blhisp linc ssiratio multlc

. ESTAT OVERID
command ESTAT not defined by ESTAT.ado
r(199);

. estat overid

  Test of overidentifying restrictions:

  Score chi2(1)          =  1.04754  (p = 0.3061)
