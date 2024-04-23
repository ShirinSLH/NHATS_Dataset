* ---------------------------------------------------------------------------
* Title: PHS 7020-001 Spring 2024_Do File
* Author: Shirin Saleh
* Date: April 23, 2024
* Description: This do file demonstrates Applied Exercise_7 for PHS 7020 Lab WEEK 14
* ---------------------------------------------------------------------------

** Loading the tracker dataset (the latest replenishment-round12)
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_File.dta"
tab yearsample
/*YEAR SP ENTERED|
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2011 |     12,411       45.09       45.09
           2015 |      7,119       25.86       70.95
           2022 |      7,995       29.05      100.00
----------------+-----------------------------------
          Total |     27,525      100.00
*/
* Keep only the spid and yearsample variables
keep spid yearsample 
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_File_OnlyYearSample.dta",replace

* Loading the NHATS dataset(SP round12)
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_SP_File.dta"

* Check the data quality, label variables and save
describe
codebook ss12prbbalcrd
codebook ss12prbbalcnt
codebook pa12clbmtgrac
label variable ss12prbbalcrd "Balance/coordination last month"
label variable ss12prbbalcnt "Limitattion in activities last month"
label variable pa12clbmtgrac "Participation in clubs, classes, or other organized activities"
* Check for the prevalnce of main variables of interest (i.e., exposure, outcome, and covariates)
tab ss12prbbalcrd
/*Balance/coordination |
           last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         75        1.19        1.19
                -8 DK |          5        0.08        1.26
                -7 RF |          1        0.02        1.28
      -1 Inapplicable |        352        5.56        6.84
                1 YES |      2,243       35.45       42.29
                 2 NO |      3,651       57.71      100.00
----------------------+-----------------------------------
                Total |      6,327      100.00
*/
tab ss12prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         75        1.19        1.19
                -8 DK |          1        0.02        1.20
      -1 Inapplicable |      4,009       63.36       64.56
                1 YES |      1,271       20.09       84.65
                 2 NO |        971       15.35      100.00
----------------------+-----------------------------------
                Total |      6,327      100.00
*/
tab pa12clbmtgrac
/*   Participation in |
   clubs, classes, or |
      other organized |
           activities |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         75        1.19        1.19
                -8 DK |          7        0.11        1.30
                -7 RF |          5        0.08        1.38
      -1 Inapplicable |        352        5.56        6.94
                1 YES |      1,939       30.65       37.58
                 2 NO |      3,949       62.42      100.00
----------------------+-----------------------------------
                Total |      6,327      100.00
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_SP_File.dta", replace

* Check demographic variables in the Round 12 of the data
tab r12dgender
/*R12 D GENDER OF |
             SP |      Freq.     Percent        Cum.
----------------+-----------------------------------
         1 MALE |      2,653       41.93       41.93
       2 FEMALE |      3,674       58.07      100.00
----------------+-----------------------------------
          Total |      6,327      100.00
*/
tab r12d2intvrage
/* R12 D SP CAT |
   AGE AT INTVW |      Freq.     Percent        Cum.
----------------+-----------------------------------
-1 Inapplicable |        240        3.79        3.79
     1 65 to 69 |        736       11.63       15.43
     2 70 to 74 |      1,083       17.12       32.54
     3 75 to 79 |      1,483       23.44       55.98
     4 80 to 84 |      1,258       19.88       75.87
     5 85 to 89 |        822       12.99       88.86
          6 90+ |        705       11.14      100.00
----------------+-----------------------------------
          Total |      6,327      100.00
*/
tab rl12dracehisp
/*R12 D RACE AND HISPANIC ETHNICITY WHEN |
                                  ADDED |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                  1 White, non-hispanic |      4,024       63.60       63.60
                  2 Black, non-hispanic |      1,309       20.69       84.29
 3 Other (Am Indian/Asian/Native Hawaii |        196        3.10       87.39
                             4 Hispanic |        729       11.52       98.91
           5 More than one DKRF primary |          6        0.09       99.00
                                 6 DKRF |         63        1.00      100.00
----------------------------------------+-----------------------------------
                                  Total |      6,327      100.00
*/
tab hh12martlstat
/*R12 HH1 MARITAL STATUS |
          CHANGE OR NEW |      Freq.     Percent        Cum.
------------------------+-----------------------------------
             -9 Missing |         75        1.19        1.19
                  -8 DK |          3        0.05        1.23
                  -7 RF |          2        0.03        1.26
        -1 Inapplicable |      3,194       50.48       51.75
              1 MARRIED |      1,467       23.19       74.93
2 LIVING WITH A PARTNER |        106        1.68       76.61
            3 SEPARATED |         62        0.98       77.59
             4 DIVORCED |        454        7.18       84.76
              5 WIDOWED |        790       12.49       97.25
        6 NEVER MARRIED |        174        2.75      100.00
------------------------+-----------------------------------
                  Total |      6,327      100.00
*/
tab va12ddisability
/*    R12 D VA4 |
SERVICE RELATED |
DISABILITY WHEN |
          ADDED |      Freq.     Percent        Cum.
----------------+-----------------------------------
     -9 Missing |         10        0.16        0.16
          -8 DK |          1        0.02        0.17
-1 Inapplicable |      5,116       80.86       81.03
          1 Yes |        263        4.16       85.19
           2 No |        937       14.81      100.00
----------------+-----------------------------------
          Total |      6,327      100.00
*/
* We need to create a new variable indicating the round number in each dataset sepretaly
gen round12 = 1
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_SP_File.dta", replace
* Only Keep the variables we are intrested in (we canont merge with too many variables)
keep ss12prbbalcnt ss12prbbalcrd pa12clbmtgrac spid round12
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_SP_File.dta", replace

* Merge the SP file with tracker12 file
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_File_OnlyYearSample.dta"
merge 1:1 spid using "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_SP_File.dta"
tab _merge
/* Matching result from |
                  merge |      Freq.     Percent        Cum.
------------------------+-----------------------------------
        Master only (1) |     21,198       77.01       77.01
            Matched (3) |      6,327       22.99      100.00
------------------------+-----------------------------------
                  Total |     27,525      100.00
*/				 
drop _merge
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_SP_Combined.dta", replace
**--------------------------------------------------------------------------------------------------

*** Loading the NHATS dataset(the round10)
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_SP_File.dta"
describe
codebook ss10prbbalcrd
codebook ss10prbbalcnt
codebook pa10clbmtgrac
* Label variables
label variable ss10prbbalcrd "Balance/coordination last month"
label variable ss10prbbalcnt "Limitattion in activities last month"
label variable pa10clbmtgrac "Participation in clubs, classes, or other organized activities"
* Check for the prevalnce of main variables of interest (i.e., exposure, outcome, and covariates)
tab ss10prbbalcrd
/*Balance/coordination|
           last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         77        1.75        1.75
                -8 DK |         17        0.39        2.14
      -1 Inapplicable |        351        8.00       10.14
                1 YES |      1,492       33.99       44.13
                 2 NO |      2,452       55.87      100.00
----------------------+-----------------------------------
                Total |      4,389      100.00
*/
tab ss10prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         77        1.75        1.75
                -8 DK |          3        0.07        1.82
      -1 Inapplicable |      2,820       64.25       66.07
                1 YES |        826       18.82       84.89
                 2 NO |        663       15.11      100.00
----------------------+-----------------------------------
                Total |      4,389      100.00
*/
tab pa10clbmtgrac
/*   Participation in |
   clubs, classes, or |
      other organized |
           activities |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         77        1.75        1.75
                -8 DK |         12        0.27        2.03
                -7 RF |          1        0.02        2.05
      -1 Inapplicable |        351        8.00       10.05
                1 YES |        631       14.38       24.42
                 2 NO |      3,317       75.58      100.00
----------------------+-----------------------------------
                Total |      4,389      100.00
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_SP_File.dta", replace

tab ss10prbbalcrd ss10prbbalcnt
/*Balance/coordination|          Limitattion in activities last month
           last month | -9 Missin      -8 DK  -1 Inappl      1 YES       2 NO |     Total
----------------------+-------------------------------------------------------+----------
           -9 Missing |        77          0          0          0          0 |        77 
                -8 DK |         0          0         17          0          0 |        17 
      -1 Inapplicable |         0          0        351          0          0 |       351 
                1 YES |         0          3          0        826        663 |     1,492 
                 2 NO |         0          0      2,452          0          0 |     2,452 
----------------------+-------------------------------------------------------+----------
                Total |        77          3      2,820        826        663 |     4,389 
Among the 1,492 individuals who reported "Yes" for having balance/coordination problems (prbbalcrd),826 reported that these problems did indeed limit their activities (prbbalcnt = 1 YES) and 663 reported that despite having balance/coordination problems, their activities were not limited (prbbalcnt = 2 NO)*/

* Check demographic variables in the Round 10 of the data
tab r5dgender
/*R5 D GENDER OF|
             SP |      Freq.     Percent        Cum.
----------------+-----------------------------------
         1 MALE |      1,784       40.65       40.65
       2 FEMALE |      2,605       59.35      100.00
----------------+-----------------------------------
          Total |      4,389      100.00
*/
tab r10d2intvrage
/* R10 D SP CAT |
   AGE AT INTVW |      Freq.     Percent        Cum.
----------------+-----------------------------------
-1 Inapplicable |        325        7.40        7.40
     2 70 to 74 |        646       14.72       22.12
     3 75 to 79 |      1,130       25.75       47.87
     4 80 to 84 |        949       21.62       69.49
     5 85 to 89 |        740       16.86       86.35
          6 90+ |        599       13.65      100.00
----------------+-----------------------------------
          Total |      4,389      100.00

*/
tab rl5dracehisp
/*     R5 D RACE AND HISPANIC ETHNICITY |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                  1 White, non-hispanic |      3,098       70.59       70.59
                  2 Black, non-hispanic |        889       20.26       90.84
 3 Other (Am Indian/Asian/Native Hawaii |        101        2.30       93.14
                             4 Hispanic |        235        5.35       98.50
           5 More than one DKRF primary |          2        0.05       98.54
                                 6 DKRF |         64        1.46      100.00
----------------------------------------+-----------------------------------
                                  Total |      4,389      100.00
*/
tab hh10martlstat
/*R10 HH1 MARITAL STATUS|
          CHANGE OR NEW |      Freq.     Percent        Cum.
------------------------+-----------------------------------
             -9 Missing |         77        1.75        1.75
        -1 Inapplicable |      4,190       95.47       97.22
              1 MARRIED |         13        0.30       97.52
2 LIVING WITH A PARTNER |          8        0.18       97.70
            3 SEPARATED |          5        0.11       97.81
             4 DIVORCED |          7        0.16       97.97
              5 WIDOWED |         84        1.91       99.89
        6 NEVER MARRIED |          5        0.11      100.00
------------------------+-----------------------------------
                  Total |      4,389      100.00
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_SP_File.dta", replace

* Load the SP dataset round10 and combine with the tracker12 file
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_SP_File.dta"
merge 1:1 spid using "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_File_OnlyYearSample.dta"
tab _merge
/* Matching result from |
                  merge |      Freq.     Percent        Cum.
------------------------+-----------------------------------
         Using only (2) |     23,136       84.05       84.05
            Matched (3) |      4,389       15.95      100.00
------------------------+-----------------------------------
                  Total |     27,525      100.00
*/
tab yearsample
/*YEAR SP ENTERED|
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2011 |     12,411       45.09       45.09
           2015 |      7,119       25.86       70.95
           2022 |      7,995       29.05      100.00
----------------+-----------------------------------
          Total |     27,525      100.00
*/
drop if yearsample==2011
/*(12,411 observations deleted)*/
drop if yearsample==2022
/*(7,995 observations deleted)*/
tab yearsample
/*YEAR SP ENTERED|
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2015 |      7,119      100.00      100.00
----------------+-----------------------------------
          Total |      7,119      100.00
*/
* We need to create a new variable indicating the round number in each dataset sepretaly
gen round10 = 1
* Only Keep the variables we are intrested in (we canont merge with too many variables)
keep ss10prbbalcrd ss10prbbalcnt pa10clbmtgrac spid round10
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_Tracker_SP_File_Combined.dta",replace
**-------------------------------------------------------------------------------------------------

* Loading the NHATS dataset(round11)
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_SP_File_V2.dta"
codebook ss11prbbalcrd
codebook ss11prbbalcnt
codebook pa11clbmtgrac
* Label variables
label variable ss11prbbalcrd "Balance/coordination last month"
label variable ss11prbbalcnt "Limitattion in activities last month"
label variable pa11clbmtgrac "Participation in clubs, classes, or other organized activities"
* Check for the prevalnce of main variables of interest (i.e., exposure, outcome, and covariates)
tab ss11prbbalcrd
/*Balance/coordination|
           last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         64        1.68        1.68
                -8 DK |         10        0.26        1.94
                -7 RF |          1        0.03        1.96
      -1 Inapplicable |        365        9.56       11.53
                1 YES |      1,318       34.53       46.06
                 2 NO |      2,059       53.94      100.00
----------------------+-----------------------------------
                Total |      3,817      100.00
*/
tab ss11prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         64        1.68        1.68
                -8 DK |          9        0.24        1.91
      -1 Inapplicable |      2,435       63.79       65.71
                1 YES |        717       18.78       84.49
                 2 NO |        592       15.51      100.00
----------------------+-----------------------------------
                Total |      3,817      100.00
*/
tab pa11clbmtgrac
/*   Participation in |
   clubs, classes, or |
      other organized |
           activities |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         64        1.68        1.68
                -8 DK |          1        0.03        1.70
      -1 Inapplicable |        365        9.56       11.27
                1 YES |      1,048       27.46       38.72
                 2 NO |      2,339       61.28      100.00
----------------------+-----------------------------------
                Total |      3,817      100.00
*/
tab ss11prbbalcrd ss11prbbalcnt
/*Balance/coordination|          Limitattion in activities last month
           last month | -9 Missin      -8 DK  -1 Inappl      1 YES       2 NO |     Total
----------------------+-------------------------------------------------------+----------
           -9 Missing |        64          0          0          0          0 |        64 
                -8 DK |         0          0         10          0          0 |        10 
                -7 RF |         0          0          1          0          0 |         1 
      -1 Inapplicable |         0          0        365          0          0 |       365 
                1 YES |         0          9          0        717        592 |     1,318 
                 2 NO |         0          0      2,059          0          0 |     2,059 
----------------------+-------------------------------------------------------+----------
                Total |        64          9      2,435        717        592 |     3,817 
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_SP_File_V2.dta", replace

* Check demographic variables in the Round 11 of the data
tab r5dgender
/*R R5 D GENDER OF|
             SP |      Freq.     Percent        Cum.
----------------+-----------------------------------
         1 MALE |      1,567       41.05       41.05
       2 FEMALE |      2,250       58.95      100.00
----------------+-----------------------------------
          Total |      3,817      100.00
*/
tab r11d2intvrage
/* R11 D SP CAT |
   AGE AT INTVW |      Freq.     Percent        Cum.
----------------+-----------------------------------
-1 Inapplicable |        351        9.20        9.20
     2 70 to 74 |        445       11.66       20.85
     3 75 to 79 |        987       25.86       46.71
     4 80 to 84 |        847       22.19       68.90
     5 85 to 89 |        651       17.06       85.96
          6 90+ |        536       14.04      100.00
----------------+-----------------------------------
          Total |      3,817      100.00
*/
tab rl5dracehisp
/*     R5 D RACE AND HISPANIC ETHNICITY |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                  1 White, non-hispanic |      2,717       71.18       71.18
                  2 Black, non-hispanic |        770       20.17       91.35
 3 Other (Am Indian/Asian/Native Hawaii |         92        2.41       93.76
                             4 Hispanic |        184        4.82       98.59
           5 More than one DKRF primary |          2        0.05       98.64
                                 6 DKRF |         52        1.36      100.00
----------------------------------------+-----------------------------------
                                  Total |      3,817      100.00
*/
tab hh11martlstat
/*R11 HH1 MARITAL STATUS |
          CHANGE OR NEW |      Freq.     Percent        Cum.
------------------------+-----------------------------------
             -9 Missing |         64        1.68        1.68
        -1 Inapplicable |      3,648       95.57       97.25
              1 MARRIED |         13        0.34       97.59
2 LIVING WITH A PARTNER |          8        0.21       97.80
            3 SEPARATED |          4        0.10       97.90
             4 DIVORCED |          5        0.13       98.04
              5 WIDOWED |         72        1.89       99.92
        6 NEVER MARRIED |          3        0.08      100.00
------------------------+-----------------------------------
                  Total |      3,817      100.00
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_SP_File_V2.dta", replace

* Load the SP dataset round11 and combine with the tracker12 file
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_File_OnlyYearSample.dta"
merge 1:1 spid using "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_SP_File_V2.dta"
tab _merge
/* Matching result from |
                  merge |      Freq.     Percent        Cum.
------------------------+-----------------------------------
         Using only (2) |     23,708       86.13       86.13
            Matched (3) |      3,817       13.87      100.00
------------------------+-----------------------------------
                  Total |     27,525      100.00
*/
drop _merge
tab yearsample
/*YEAR SP ENTERED |
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2011 |     12,411       45.09       45.09
           2015 |      7,119       25.86       70.95
           2022 |      7,995       29.05      100.00
----------------+-----------------------------------
          Total |     27,525      100.00
*/
drop if yearsample==2011
/*(12,411 observations deleted)*/
drop if yearsample==2022
/*(7,995 observations deleted)*/
tab yearsample
/*YEAR SP ENTERED|
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2015 |      7,119      100.00      100.00
----------------+-----------------------------------
          Total |      7,119      100.00
*/
* We need to create a new variable indicating the round number in each dataset sepretaly
gen round11 = 1
* Only Keep the variables we are intrested in (we canont merge with too many variables)
keep  ss11prbbalcrd ss11prbbalcnt pa11clbmtgrac spid yearsample round11
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_Tracker_SP_File_Combined.dta", replace

* Combinig all Rounds of datasets(append) 
* Append datasets
clear
use "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R12_Final_Release_STATA_V2\NHATS_Round_12_Tracker_SP_Combined.dta"
merge 1:1 spid using "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R11_Final_Release_STATA_V2\NHATS_Round_11_Tracker_SP_File_Combined.dta"
tab _merge
/* Matching result from |
                  merge |      Freq.     Percent        Cum.
------------------------+-----------------------------------
        Master only (1) |     20,406       74.14       74.14
            Matched (3) |      7,119       25.86      100.00
------------------------+-----------------------------------
                  Total |     27,525      100.00
*/
drop _merge
merge 1:1 spid using "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10_Final_Release_STATA\NHATS_Round_10_Tracker_SP_File_Combined.dta"
tab _merge
/* Matching result from |
                  merge |      Freq.     Percent        Cum.
------------------------+-----------------------------------
        Master only (1) |     20,406       74.14       74.14
            Matched (3) |      7,119       25.86      100.00
------------------------+-----------------------------------
                  Total |     27,525      100.00
*/
drop _merge
drop if yearsample==2011
/*(12,411 observations deleted)*/
drop if yearsample==2022
/*(7,995 observations deleted)*/
tab yearsample
/*YEAR SP ENTERED|
         SAMPLE |      Freq.     Percent        Cum.
----------------+-----------------------------------
           2015 |      7,119      100.00      100.00
----------------+-----------------------------------
          Total |      7,119      100.00
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10to12_Combined.dta", replace

*Generate a sum variable that it is in all 3 rounds = round10+ round11+ round12
* Assuming round10, round11, and round12 are binary (./1) indicators of presence in each round
egen rounds_present = rowtotal(round10 round11 round12)
tab rounds_present
/*rounds_pres|
        ent |      Freq.     Percent        Cum.
------------+-----------------------------------
          2 |      5,521       77.55       77.55
          3 |      1,598       22.45      100.00
------------+-----------------------------------
      Total |      7,119      100.00
*/
* Identify participants who are present in exactly two rounds
gen in_two_rounds = rounds_present == 2
* Tabulate to see the distribution
tab in_two_rounds
/*in_two_roun|
         ds |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      1,598       22.45       22.45
          1 |      5,521       77.55      100.00
------------+-----------------------------------
      Total |      7,119      100.00
*/

* Generate a variable that flags participants who completed all three rounds
gen completed_all = rounds_present == 3

* Keep only participants who completed all three rounds
keep if completed_all == 1
/*(5,521 observations deleted)*/
tab completed_all
/*completed_a|
         ll |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,598      100.00      100.00
------------+-----------------------------------
      Total |      1,598      100.00
*/

** Calculate the incidence of of activity limitations due to balance or coordination problems
* First we calculate the denominator we will drop all the cases in R10
tab ss10prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         14        0.88        0.88
                -8 DK |          1        0.06        0.94
      -1 Inapplicable |      1,072       67.08       68.02
                1 YES |        251       15.71       83.73
                 2 NO |        260       16.27      100.00
----------------------+-----------------------------------
                Total |      1,598      100.00
*/
drop if ss10prbbalcnt==-9
(14 observations deleted)
drop if ss10prbbalcnt==-8
(1 observation deleted)
drop if ss10prbbalcnt==1
(251 observations deleted)

tab ss11prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         23        1.44        1.44
                -8 DK |          3        0.19        1.63
      -1 Inapplicable |      1,032       64.58       66.21
                1 YES |        300       18.77       84.98
                 2 NO |        240       15.02      100.00
----------------------+-----------------------------------
                Total |      1,598      100.00
*/
drop if ss11prbbalcnt==-9
(0 observations deleted)
drop if ss11prbbalcnt==-8
(1 observation deleted)
drop if ss11prbbalcnt==1
(139 observations deleted)/*We know that there are 139 cases in round 11*/

tab ss12prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
           -9 Missing |         19        1.19        1.19
      -1 Inapplicable |        985       61.64       62.83
                1 YES |        317       19.84       82.67
                 2 NO |        277       17.33      100.00
----------------------+-----------------------------------
                Total |      1,598      100.00
*/
drop if ss12prbbalcnt==-9
(2 observations deleted)
drop if ss12prbbalcnt==-8
(0 observation deleted)
drop if ss12prbbalcnt==1
(112 observations deleted)/*We know that there are 112 cases in round 11*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10to12_Combined.dta", replace

* to know the denominator in round10
tab ss10prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
      -1 Inapplicable |        927       86.55       86.55
                 2 NO |        144       13.45      100.00
----------------------+-----------------------------------
                Total |      1,071      100.00
*/
* to know the denominator in round11
tab ss11prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
      -1 Inapplicable |        917       85.62       85.62
                 2 NO |        154       14.38      100.00
----------------------+-----------------------------------
                Total |      1,071      100.00
*/
* to know the denominator in round12
tab ss12prbbalcnt
/*     Limitattion in |
activities last month |      Freq.     Percent        Cum.
----------------------+-----------------------------------
      -1 Inapplicable |        859       80.21       80.21
                 2 NO |        212       19.79      100.00
----------------------+-----------------------------------
                Total |      1,071      100.00
*/

* Calculate the total number of new cases in Round 11 and Round 12
* This assumes 139 and 112 are the correct counts of new cases from the data manipulation above


* Calculate the total person-years at risk based on the adjusted counts from each round
* Adding the number of persons at risk from each round (those who did not have the condition initially)
display 112+139 /*251*/ 

* Sum the total person-years at risk
display 1598+1071+1071 /*3740*/

* Calculate the incidence rate per 1000 person-years
display 251/3740 /*.0671123*/
display .0671123 *1000 /*67.1123. This incidence rate means that for every 1000 years that participants were observed and at risk, approximately 67 new cases of activity limitations were reported. */ 
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10to12_Combined.dta", replace

** Task2 :estimate the risk of developing an activity limitation associated with respondents' participation in clubs, classes, or other organized activities
* Recode activity limitation to a binary outcome across all rounds
gen limitation = (ss10prbbalcnt == 1 | ss11prbbalcnt == 1 | ss12prbbalcnt == 1)

* Create a binary variable for participation in activities (1 if participated, 0 otherwise)
gen participated = (pa10clbmtgrac == 1 | pa11clbmtgrac == 1 | pa12clbmtgrac == 1)

* Logistic regression without accounting for repeated measures
logit limitation participated
/* Iteration 0:  Log likelihood = -996.88511  
Iteration 1:  Log likelihood = -984.84092  
Iteration 2:  Log likelihood = -984.80995  
Iteration 3:  Log likelihood = -984.80995  

Logistic regression                                     Number of obs =  1,598
                                                        LR chi2(1)    =  24.15
                                                        Prob > chi2   = 0.0000
Log likelihood = -984.80995                             Pseudo R2     = 0.0121

------------------------------------------------------------------------------
  limitation | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
participated |  -.5355506   .1099151    -4.87   0.000    -.7509802   -.3201211
       _cons |  -.5347412   .0710661    -7.52   0.000    -.6740281   -.3954543
------------------------------------------------------------------------------
For respondents who had limitation in their activities, the odds of participating in social activities in lower compared to those who did not have avtivity limitation. Specifically, the odds are about 0.586 times lower (exp(-0.5355506) ≈ 0.586), or a 41.4% reduction in the odds of social event participation.*/

* We want to account for the repeated observations per subject (as individuals might be surveyed in multiple rounds), so ANCOVA is appropriate. 
* First we need to recode Non-Standard Categories (Recode "Missing", "DK", and "RF" into "Unknown")

replace clbmtgrac = 99 if clbmtgrac == -9 | clbmtgrac == -8 | clbmtgrac == -7

* Recode "Inapplicable" into "No" (assuming "No" is represented by value 2)
replace clbmtgrac = 2 if clbmtgrac == -1
tab clbmtgrac
 /*  Participation in |
   clubs, classes, or |
      other organized |
           activities |      Freq.     Percent        Cum.
----------------------+-----------------------------------
                  -99 |         89        1.59        1.59
                1 YES |      1,406       25.08       26.66
                 2 NO |      4,112       73.34      100.00
----------------------+-----------------------------------
                Total |      5,607      100.00
*/
* Perform ANCOVA 
xi: logistic new_cases_activity_limitation i.clbmtgrac
/* i.clbmtgrac       _Iclbmtgrac_1-3     (_Iclbmtgrac_1 for clbmtg~c==-99 omitted)
Logistic regression                                     Number of obs =  5,607
                                                        LR chi2(2)    =   5.19
                                                        Prob > chi2   = 0.0746
Log likelihood = -1215.9696                             Pseudo R2     = 0.0021

-----------------------------------------------------------------------------------------------
new_cases_activity_limitation | Odds ratio   Std. err.      z    P>|z|     [95% conf. interval]
------------------------------+----------------------------------------------------------------
                _Iclbmtgrac_2 |   5.168661   5.232703     1.62   0.105     .7106073    37.59468
                _Iclbmtgrac_3 |   5.406284   5.448882     1.67   0.094     .7498776     38.9769
                        _cons |   .0113637    .011428    -4.45   0.000     .0015831    .0815721
-----------------------------------------------------------------------------------------------
*/
save "C:\PhD\Semester 4\Secondary data analysis\Applied Excercise_7\NHATS_R10to12_Appended.dta"replace

