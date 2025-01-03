

Mus14

reg ins age hisp educyear married retire hhincome hstatusg, robust

Linear regression                               Number of obs     =      3,206
                                                F(7, 3198)        =      58.98
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0826
                                                Root MSE          =     .46711

------------------------------------------------------------------------------
             |               Robust
         ins | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |  -.0028955   .0023254    -1.25   0.213    -.0074549    .0016638
        hisp |  -.1210059   .0269459    -4.49   0.000    -.1738389    -.068173
    educyear |   .0233686   .0027081     8.63   0.000     .0180589    .0286784
     married |   .1234699   .0186521     6.62   0.000     .0868987    .1600411
      retire |   .0408508   .0182217     2.24   0.025     .0051234    .0765782
    hhincome |   .0004921   .0001874     2.63   0.009     .0001247    .0008595
    hstatusg |   .0655583   .0190126     3.45   0.001     .0282801    .1028365
       _cons |   .1270857   .1538816     0.83   0.409    -.1746309    .4288023
------------------------------------------------------------------------------

estimates store mpl

logit ins age hisp educyear married retire hhincome hstatusg, robust

Iteration 0:  Log pseudolikelihood = -2139.7712  
Iteration 1:  Log pseudolikelihood = -1996.7434  
Iteration 2:  Log pseudolikelihood = -1994.8864  
Iteration 3:  Log pseudolikelihood = -1994.8784  
Iteration 4:  Log pseudolikelihood = -1994.8784  

Logistic regression                                     Number of obs =  3,206
                                                        Wald chi2(7)  = 256.49
                                                        Prob > chi2   = 0.0000
Log pseudolikelihood = -1994.8784                       Pseudo R2     = 0.0677

------------------------------------------------------------------------------
             |               Robust
         ins | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |  -.0145955   .0110189    -1.32   0.185    -.0361921     .007001
        hisp |  -.8103059   .1936793    -4.18   0.000     -1.18991   -.4307016
    educyear |   .1142626   .0143616     7.96   0.000     .0861143    .1424108
     married |    .578636   .0941579     6.15   0.000       .39409    .7631821
      retire |   .1969297   .0849524     2.32   0.020     .0304261    .3634332
    hhincome |   .0023036   .0011485     2.01   0.045     .0000526    .0045546
    hstatusg |   .3122654   .0918378     3.40   0.001     .1322667    .4922641
       _cons |  -1.715578   .7279873    -2.36   0.018    -3.142407   -.2887495
------------------------------------------------------------------------------

estimates store logit

estimates table mpl logit, b p

----------------------------------------
    Variable |    mpl         logit     
-------------+--------------------------
_            |
         age | -.00289555               
             |     0.2132               
        hisp | -.12100593               
             |     0.0000               
    educyear |  .02336863               
             |     0.0000               
     married |  .12346988               
             |     0.0000               
      retire |  .04085082               
             |     0.0250               
    hhincome |  .00049209               
             |     0.0087               
    hstatusg |  .06555834               
             |     0.0006               
       _cons |   .1270857               
             |     0.4089               
-------------+--------------------------
ins          |
         age |              -.01459553  
             |                  0.1853  
        hisp |              -.81030593  
             |                  0.0000  
    educyear |               .11426256  
             |                  0.0000  
     married |               .57863605  
             |                  0.0000  
      retire |               .19692966  
             |                  0.0204  
    hhincome |                .0023036  
             |                  0.0449  
    hstatusg |               .31226537  
             |                  0.0007  
       _cons |              -1.7155784  
             |                  0.0184  
----------------------------------------
                             Legend: b/p

                             