(in-package :cram)
;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% Case number deleted. X treated as the class attribute.
;%
;% As used by Kilpatrick, D. & Cameron-Jones, M. (1998). Numeric prediction
;% using instance-based learning with encoding length selection. In Progress
;% in Connectionist-Based Information Systems. Singapore: Springer-Verlag.
;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% NAME:  PBC Data
;% SIZE:  418 observations, 20 variables
;%
;%
;%
;% DESCRIPTIVE ABSTRACT:
;%
;% Below is a description of the variables recorded from the Mayo Clinic trial
;% in primary biliary cirrhosis (PBC) of the liver conducted between 1974 and
;% 1984.  A total of 424 PBC patients, referred to Mayo Clinic during
;% that ten-year interval, met eligibility criteria for the randomized placebo
;% controlled trial of the drug D-penicillamine. The first 312 cases in the data
;% set participated in the randomized trial, and contain largely complete data.
;% The additional 112 cases did not participate in the clinical trial, but
;% consented to have basic measurements recorded and to be followed for survival.
;% Six of those cases were lost to follow-up shortly after diagnosis, so there
;% are data here on an additional 106 cases as well as the 312 randomized
;% participants. Missing data items are denoted by ".".  At least one space
;% separates each variable in the .DAT file.  Censoring was due to liver
;% transplantation for twenty-five subjects with the following case numbers:
;% 5, 105, 111, 120, 125, 158, 183, 241, 246, 247, 254, 263, 264, 265, 274,
;% 288, 291, 295, 297, 345, 361, 362, 375, 380, 383.
;%
;%
;%
;% SOURCE:  Counting Processes and Survival Analysis by T. Fleming &
;%          D. Harrington, (1991),  published by John Wiley & Sons.
;%
;%
;%
;% VARIABLE DESCRIPTIONS:
;%
;% The data are in free format.  That is, at least one blank space separates
;% each variable.  The variables contained in the .DAT are:
;%
;%
;% N:   Case number.
;% X:   The number of days between registration and the earlier of
;%      death, liver transplantation, or study analysis time in July, 1986.
;% D:   1 if X is time to death, 0 if time to censoring
;% Z1:  Treatment Code, 1 = D-penicillamine, 2 = placebo.
;% Z2:  Age in years. For the first 312 cases, age was calculated by
;%      dividing the number of days between birth and study registration by 365.
;% Z3:  Sex, 0 = male, 1 = female.
;% Z4:  Presence of ascites, 0 = no, 1 = yes.
;% Z5:  Presence of hepatomegaly, 0 = no, 1 = yes.
;% Z6:  Presence of spiders 0 = no, 1 = Yes.
;% Z7:  Presence of edema, 0 = no edema and no diuretic therapy for
;%      edema; 0.5 = edema present for which no diuretic therapy was given, or
;%      edema resolved with diuretic therapy; 1 = edema despite diuretic therapy
;% Z8:  Serum bilirubin, in mg/dl.
;% Z9:  Serum cholesterol, in mg/dl.
;% Z10: Albumin, in gm/dl.
;% Z11: Urine copper, in mg/day.
;% Z12: Alkaline phosphatase, in U/liter.
;% Z13: SGOT, in U/ml.
;% Z14: Triglycerides, in mg/dl.
;% Z15: Platelet count; coded value is number of platelets
;%      per-cubic-milliliter of blood divided by 1000.
;% Z16: Prothrombin time, in seconds.
;% Z17: Histologic stage of disease, graded 1, 2, 3, or 4.
;%
;%
;%
;%
;% STORY BEHIND THE DATA:
;%
;% Between January, 1974 and May, 1984, the Mayo Clinic conducted a
;% double-blinded randomized trial in primary biliary cirrhosis of the liver
;% (PBC), comparing the drug D-penicillamine (DPCA) with a placebo. There
;% were 424 patients who met the eligibility criteria seen at the Clinic while
;% the trial was open for patient registration. Both the treating physician and
;% the patient agreed to participate in the randomized trial in 312 of the 424
;% cases. The date of randomization and a large number of clinical, biochemical,
;% serologic, and histologic parameters were recorded for each of the 312
;% clinical trial patients. The data from the trial were analyzed in 1986 for
;% presentation in the clinical literature. For that analysis, disease and
;% survival status as of July, 1986, were recorded for as many patients as
;% possible.  By that date, 125 of the 312 patients had died, with only 11
;% not attributable to PBC.  Eight patients had been lost to follow up, and 19
;% had undergone liver transplantation.
;%
;% PBC is a rare but fatal chronic liver disease of unknown cause,
;% with a prevalence of about 50-cases-per-million population. The primary
;% pathologic event appears to be the destruction of interlobular bile ducts,
;% which may be mediated by immunologic mechanisms. The data discussed here are
;% important in two respects. First, controlled clinical trials are difficult to
;% complete in rare diseases, and this case series of patients uniformly
;% diagnosed, treated, and followed is the largest existing for PBC. The
;% treatment comparison in this trial is more precise than in similar trials
;% having fewer participants and avoids the bias that may arise in comparing
;% a case series to historical controls. Second, the data present an
;% opportunity to study the natural history of the disease. We will see that,
;% despite the immunosuppressive properties of DPCA, there are no detectable
;% differences between the distributions of survival times for the DPCA and
;% placebo treatment groups. This suggests that these groups can be combined
;% in studying the association between survival time from randomization and
;% clinical and other measurements. In the early to mid 1980s, the rate of
;% successful liver transplant increased substantially, and transplant has
;% become an effective therapy for PBC. The Mayo Clinic data set is therefore
;% one of the last allowing a study of the natural history of PBC in patients
;% who were treated with only supportive care or its equivalent. The PBC data
;% can be used to: estimate a survival distribution; test for differences
;% between two groups; and estimate covariate effects via a regression
;% model.
;%
(defun pbc ()
  (data
    :name 'pbc
    :columns '(D Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9 Z10 Z11 Z12 Z13 Z14 Z15 Z16 Z17 class)
    :egs
    '(
      (1 1 58.7652 1 1 1 1 1 14.5 261 2.6 156 1718 137.95 172 190 12.2 4 400)
      (0 1 56.4463 1 0 1 1 0 1.1 302 4.14 54 7394.8 113.52 88 221 10.6 3 4500)
      (1 1 70.0726 0 0 0 0 0.500000 1.4 176 3.48 210 516 96.1 55 151 12 4 1012)
      (1 1 54.7406 1 0 1 1 0.500000 1.8 244 2.54 64 6121.8 60.63 92 183 10.3 4 1925)
      (0 2 38.1054 1 0 1 1 0 3.4 279 3.53 143 671 113.15 72 136 10.9 3 1504)
      (1 2 66.2587 1 0 1 0 0 0.8 248 3.98 50 944 93 63 ? 11 3 2503)
      (0 2 55.5346 1 0 1 0 0 1 322 4.09 52 824 60.45 213 204 9.7 3 1832)
      (1 2 53.0568 1 0 0 0 0 0.3 280 4 52 4651.2 28.38 189 373 11 3 2466)
      (1 1 42.5079 1 0 0 1 0 3.2 562 3.08 79 2276 144.15 88 251 11 2 2400)
      (1 2 70.5599 1 1 0 1 1 12.6 200 2.74 140 918 147.25 143 302 11.5 4 51)
      (1 2 53.7139 1 0 1 1 0 1.4 259 4.16 46 1104 79.05 79 258 12 4 3762)
      (1 2 59.1376 1 0 0 1 0 3.6 236 3.52 94 591 82.15 95 71 13.6 4 304)
      (0 2 45.6893 1 0 0 0 0 0.7 281 3.85 40 1181 88.35 130 244 10.6 3 3577)
      (1 2 56.2218 0 1 1 0 1 0.8 ? 2.27 43 728 71 ? 156 11 4 1217)
      (1 1 64.6461 1 0 0 0 0 0.8 231 3.87 173 9009.8 127.71 96 295 11 3 3584)
      (0 2 40.4435 1 0 0 0 0 0.7 204 3.66 28 685 72.85 58 198 10.8 3 3672)
      (1 2 52.1834 1 0 1 0 0 2.7 274 3.15 159 1533 117.8 128 224 10.5 4 769)
      (1 1 53.9302 1 0 1 1 1 11.4 178 2.8 588 961 280.55 200 283 12.4 4 131)
      (0 1 49.5606 1 0 1 0 0.500000 0.7 235 3.56 39 1881 93 123 209 11 3 4232)
      (1 2 59.9535 1 0 1 0 0 5.1 374 3.51 140 1919 122.45 135 322 13 4 1356)
      (0 2 64.1889 0 0 1 1 0 0.6 252 3.83 41 843 65.1 83 336 11.4 4 3445)
      (1 1 56.2765 1 0 0 1 0 3.4 271 3.63 464 1376 120.9 55 173 11.6 4 673)
      (1 2 55.9671 1 1 1 1 1 17.4 395 2.94 558 6064.8 227.04 191 214 11.7 4 264)
      (1 1 44.5202 0 0 1 0 0 2.1 456 4 124 5719 221.88 230 70 9.9 2 4079)
      (0 2 45.0732 1 0 0 0 0 0.7 298 4.1 40 661 106.95 66 324 11.3 2 4127)
      (1 2 52.0246 1 0 1 1 0 5.2 1128 3.68 53 3228 165.85 166 421 9.9 3 1444)
      (1 2 54.4394 1 1 1 1 0.500000 21.6 175 3.31 221 3697.4 101.91 168 80 12 4 77)
      (1 2 44.9473 1 1 1 1 1 17.2 222 3.23 209 1975 189.1 195 144 13 4 549)
      (0 2 63.8768 1 0 0 0 0 0.7 370 3.78 24 5833 73.53 86 390 10.6 2 4509)
      (1 2 41.3854 1 0 1 1 0 3.6 260 2.54 172 7277 121.26 158 124 11 4 321)
      (1 2 41.5524 1 0 1 0 0 4.7 296 3.44 114 9933.2 206.4 101 195 10.3 2 3839)
      (0 2 53.9959 1 0 1 0 0 1.8 262 3.34 101 7277 82.56 158 286 10.6 4 4523)
      (1 2 51.2827 1 0 0 0 0 0.8 210 3.19 82 1592 218.55 113 180 12 3 3170)
      (0 1 52.0602 1 0 0 0 0 0.8 364 3.7 37 1840 170.5 64 273 10.5 2 3933)
      (1 2 48.6188 1 0 0 0 0 1.2 314 3.2 201 12258.8 72.24 151 431 10.6 3 2847)
      (0 2 56.4107 1 0 0 0 0 0.3 172 3.39 18 558 71.3 96 311 10.6 2 3611)
      (1 1 61.7276 1 1 1 0 1 7.1 334 3.01 150 6931.2 180.6 118 102 12 4 223)
      (1 2 36.627 1 0 1 1 0 3.3 383 3.53 102 1234 137.95 87 234 11 4 3244)
      (1 1 55.3922 1 0 1 0 0 0.7 282 3 52 9066.8 72.24 111 563 10.6 4 2297)
      (0 1 46.6694 1 0 0 0 0 1.3 ? 3.34 105 11046.6 104.49 ? 358 11 4 4467)
      (1 1 33.6345 1 0 1 0 0 6.8 ? 3.26 96 1215 151.9 ? 226 11.7 4 1350)
      (0 2 33.6947 1 0 1 1 0 2.1 ? 3.54 122 8778 56.76 ? 344 11 4 4453)
      (0 1 48.8706 1 0 0 0 0 1.1 361 3.64 36 5430.2 67.08 89 203 10.6 2 4556)
      (1 2 37.5825 1 0 1 1 1 3.3 299 3.55 131 1029 119.35 50 199 11.7 3 3428)
      (0 2 41.7933 1 0 0 0 0 0.6 ? 3.93 19 1826 71.3 ? 474 10.9 2 4025)
      (1 1 45.7988 1 0 1 0 0 5.7 482 2.84 161 11552 136.74 165 518 12.7 3 2256)
      (0 2 47.4278 1 0 0 0 0 0.5 316 3.65 68 1716 187.55 71 356 9.8 3 2576)
      (0 2 49.1362 0 0 0 0 0 1.9 259 3.7 281 10396.8 188.34 178 214 11 3 4427)
      (1 2 61.1526 1 0 1 0 0 0.8 ? 3.82 58 678 97.65 ? 233 11 4 708)
      (1 1 53.5086 1 0 1 0 0 1.1 257 3.36 43 1080 106.95 73 128 10.6 4 2598)
      (1 2 52.0876 1 0 0 0 0 0.8 276 3.6 54 4332 99.33 143 273 10.6 2 3853)
      (1 1 50.5407 0 0 0 0 0 6 614 3.7 158 5084.4 206.4 93 362 10.6 1 2386)
      (1 1 67.4086 1 0 1 0 0 2.6 ? 3.1 94 6456.2 56.76 ? 214 11 4 1000)
      (1 1 39.1978 1 1 1 1 1 1.3 288 3.4 262 5487.2 73.53 125 254 11 4 1434)
      (1 1 65.7632 0 0 0 0 0 1.8 416 3.94 121 10165 79.98 219 213 11 3 1360)
      (1 2 33.6181 1 0 1 1 0 1.1 498 3.8 88 13862.4 95.46 319 365 10.6 2 1847)
      (1 1 53.5715 1 0 1 0 0.500000 2.3 260 3.18 231 11320.2 105.78 94 216 12.4 3 3282)
      (0 1 44.5695 0 0 0 0 0 0.7 242 4.08 73 5890 56.76 118 ? 10.6 1 4459)
      (1 1 40.3943 1 0 1 1 0 0.8 329 3.5 49 7622.8 126.42 124 321 10.6 3 2224)
      (0 1 58.3819 1 0 0 0 0 0.9 604 3.4 82 876 71.3 58 228 10.3 3 4365)
      (0 2 43.8987 0 0 0 0 0 0.6 216 3.94 28 601 60.45 188 211 13 1 4256)
      (1 2 60.7064 1 1 0 0 0 1.3 302 2.75 58 1523 43.4 112 329 13.2 4 3090)
      (1 2 46.6283 1 0 0 1 1 22.5 932 3.12 95 5396 244.9 133 165 11.6 3 859)
      (1 2 62.9076 1 0 1 0 0 2.1 373 3.5 52 1009 150.35 188 178 11 3 1487)
      (0 1 40.2026 1 0 0 0 0 1.2 256 3.6 74 724 141.05 108 430 10 1 3992)
      (1 1 46.4531 0 0 1 0 0 1.4 427 3.7 105 1909 182.9 171 123 11 3 4191)
      (1 2 51.2882 1 0 0 0 0 1.1 466 3.91 84 1787 328.6 185 261 10 3 2769)
      (0 1 32.6133 1 0 0 0 0 0.7 174 4.09 58 642 71.3 46 203 10.6 3 4039)
      (1 1 49.3388 1 0 1 1 0.500000 20 652 3.46 159 3292 215.45 184 227 12.4 3 1170)
      (0 1 56.3997 1 0 0 0 0 0.6 ? 4.64 20 666 54.25 ? 265 10.6 2 3458)
      (0 2 48.846 1 0 1 0 0 1.2 258 3.57 79 2201 120.9 76 410 11.5 4 4196)
      (0 2 32.4928 1 0 0 0 0 0.5 320 3.54 51 1243 122.45 80 225 10 3 4184)
      (0 2 38.4942 1 0 0 0 0 0.7 132 3.6 17 423 49.6 56 265 11 1 4190)
      (1 1 51.9206 1 0 1 1 0 8.4 558 3.99 280 967 89.9 309 278 11 4 1827)
      (1 1 43.5181 1 1 1 1 0.500000 17.1 674 2.53 207 2078 182.9 598 268 11.5 4 1191)
      (1 1 51.9425 1 0 1 1 0.500000 12.2 394 3.08 111 2132 155 243 165 11.6 4 71)
      (1 2 49.8261 1 0 1 1 0.500000 6.6 244 3.41 199 1819 170.5 91 132 12.1 3 326)
      (1 1 47.9452 1 0 1 0 0 6.3 436 3.02 75 2176 170.5 104 236 10.6 4 1690)
      (0 1 46.5161 1 0 1 0 0 0.8 315 4.24 13 1637 170.5 70 426 10.9 3 3707)
      (1 2 67.4114 0 0 1 0 0 7.2 247 3.72 269 1303 176.7 91 360 11.2 4 890)
      (1 1 63.2635 1 0 1 1 0 14.4 448 3.65 34 1218 60.45 318 385 11.7 4 2540)
      (1 1 67.3101 1 0 0 0 0 4.5 472 4.09 154 1580 117.8 272 412 11.1 3 3574)
      (0 1 56.0137 1 0 1 0 0.500000 1.3 250 3.5 48 1138 71.3 100 81 12.9 4 4050)
      (0 2 55.8303 1 0 0 0 0 0.4 263 3.76 29 1345 137.95 74 181 11.2 3 4032)
      (1 2 47.217 1 0 1 0 0 2.1 262 3.48 58 2045 89.9 84 225 11.5 4 3358)
      (1 1 52.7584 1 0 1 1 0 5 1600 3.21 75 2656 82.15 174 181 10.9 3 1657)
      (1 1 37.2786 1 0 0 0 0 1.1 345 4.4 75 1860 218.55 72 447 10.7 3 198)
      (0 2 41.3936 1 0 0 0 0.500000 0.6 296 4.06 37 1032 80.6 83 442 12 3 2452)
      (1 1 52.4435 1 0 1 0 0 2 408 3.65 50 1083 110.05 98 200 11.4 2 1741)
      (1 1 33.4757 0 0 0 0 0 1.6 660 4.22 94 1857 151.9 155 337 11 2 2689)
      (1 2 45.6071 1 0 1 1 0.500000 5 325 3.47 110 2460 246.45 56 430 11.9 4 460)
      (1 1 76.7091 1 1 0 0 1 1.4 206 3.13 36 1626 86.8 70 145 12.2 4 388)
      (0 1 36.5339 1 0 0 0 0 1.3 353 3.67 73 2039 232.5 68 380 11.1 2 3913)
      (1 1 53.9165 1 0 1 1 0 3.2 201 3.11 178 1212 159.65 69 188 11.8 4 750)
      (1 2 46.3901 1 1 1 1 1 17.4 ? 2.64 182 559 119.35 ? 401 11.7 2 130)
      (0 1 48.846 1 0 0 0 0 1 ? 3.7 33 1258 99.2 ? 338 10.4 3 3850)
      (1 2 71.8932 0 0 1 0 0.500000 2 420 3.26 62 3196 77.5 91 344 11.4 3 611)
      (0 1 28.8843 1 0 0 0 0 1 239 3.77 77 1877 97.65 101 312 10.2 1 3823)
      (0 2 48.4682 0 0 0 0 0 1.8 460 3.35 148 1472 108.5 118 172 10.2 2 3820)
      (1 2 51.4689 0 0 1 0 0 2.3 178 3 145 746 178.25 122 119 12 4 552)
      (0 2 44.95 1 0 0 0 0 0.9 400 3.6 31 1689 164.3 166 327 10.4 3 3581)
      (0 1 56.5695 1 0 0 0 0 0.9 248 3.97 172 646 62 84 128 10.1 1 3099)
      (1 2 48.9637 1 1 1 1 1 2.5 188 3.67 57 1273 119.35 102 110 11.1 4 110)
      (1 1 43.0171 1 0 0 0 0 1.1 303 3.64 20 2108 128.65 53 349 11.1 2 3086)
      (0 2 34.0397 1 0 1 0 0 1.1 464 4.2 38 1644 151.9 102 348 10.3 3 3092)
      (1 1 68.5092 1 1 1 0 0 2.1 ? 3.9 50 1087 103.85 ? 137 10.6 2 3222)
      (0 2 62.5216 1 0 0 0 0 0.6 212 4.03 10 648 71.3 77 316 17.1 1 3388)
      (1 1 50.3573 1 0 0 0 0 0.4 127 3.5 14 1062 49.6 84 334 10.3 2 2583)
      (0 2 44.063 1 0 0 0 0 0.5 120 3.61 53 804 110.05 52 271 10.6 3 2504)
      (1 1 38.9103 1 0 1 1 0 1.9 486 3.54 74 1052 108.5 109 141 10.9 3 2105)
      (0 1 41.1526 1 0 0 0 0 5.5 528 4.18 77 2404 172.05 78 467 10.7 3 2350)
      (1 2 55.4579 1 0 1 1 0 2 267 3.67 89 754 196.85 90 136 11.8 4 3445)
      (1 1 51.2334 1 0 1 1 0 6.7 374 3.74 103 979 128.65 100 266 11.1 4 980)
      (1 2 52.8268 0 0 0 0 0 3.2 259 4.3 208 1040 110.05 78 268 11.7 3 3395)
      (0 2 42.6393 1 0 0 1 0 0.7 303 4.19 81 1584 111.6 156 307 10.3 3 3422)
      (0 1 61.0705 1 0 0 1 0.500000 3 458 3.63 74 1588 106.95 382 438 9.9 3 3336)
      (1 1 49.6564 1 0 1 1 0 6.5 950 3.11 111 2374 170.5 149 354 11 4 1083)
      (1 1 48.8542 1 0 1 0 0 3.5 390 3.3 67 878 137.95 93 207 10.2 3 2288)
      (1 1 54.256 1 0 0 1 0 0.6 636 3.83 129 944 97.65 114 306 9.5 3 515)
      (0 1 35.1513 0 0 0 0 0 3.5 325 3.98 444 766 130.2 210 344 10.6 3 2033)
      (1 2 67.9069 0 1 1 0 1 1.3 151 3.08 73 1112 46.5 49 213 13.2 4 191)
      (0 1 55.436 1 0 0 0 0 0.6 298 4.13 29 758 65.1 85 256 10.7 3 3297)
      (1 1 45.8207 1 0 1 1 1 5.1 ? 3.23 18 790 179.8 ? 104 13 4 971)
      (0 1 52.8898 0 0 1 0 0 0.6 251 3.9 25 681 57.35 107 182 10.8 4 3069)
      (0 2 47.1814 1 0 1 0 0 1.3 316 3.51 75 1162 147.25 137 238 10 4 2468)
      (1 1 53.5989 1 1 1 1 0 1.2 269 3.12 ? 1441 165.85 68 166 11.1 4 824)
      (0 2 44.104 1 0 0 0 0 0.5 268 4.08 9 1174 86.8 95 453 10 2 3255)
      (1 1 41.9493 1 0 1 1 0 16.2 ? 2.89 42 1828 299.15 ? 123 12.6 4 1037)
      (0 1 63.614 1 0 1 0 0 0.9 420 3.87 30 1009 57.35 232 ? 9.7 3 3239)
      (1 2 44.2272 1 0 1 1 0 17.4 1775 3.43 205 2065 165.85 97 418 11.5 3 1413)
      (1 2 62.0014 1 0 1 1 0 2.8 242 3.8 74 614 136.4 104 121 13.2 4 850)
      (0 1 40.553 1 0 0 0 0 1.9 448 3.83 60 1052 127.1 175 181 9.8 3 2944)
      (1 2 62.6448 0 0 0 0 0 1.5 331 3.95 13 577 128.65 99 165 10.1 4 2796)
      (0 2 42.3354 1 0 0 0 0 0.7 578 3.67 35 1353 127.1 105 427 10.7 2 3149)
      (0 1 42.9678 1 0 0 0 0 0.4 263 3.57 123 836 74.4 121 445 11 2 3150)
      (0 1 55.9617 1 0 0 0 0 0.8 263 3.35 27 1636 116.25 69 206 9.8 2 3098)
      (0 1 62.8611 1 0 0 0 0 1.1 399 3.6 79 3472 155 152 344 10.1 2 2990)
      (1 1 51.2498 0 0 1 0 0 7.3 426 3.93 262 2424 145.7 218 252 10.5 3 1297)
      (0 2 46.7625 1 0 1 0 0 1.1 328 3.31 159 1260 94.55 134 142 11.6 4 2106)
      (0 1 54.0753 1 0 1 0 0 1.1 290 4.09 38 2120 186 146 318 10 3 3059)
      (0 1 47.0363 1 0 0 0 0 0.9 346 3.77 59 794 125.55 56 336 10.6 2 3050)
      (1 2 55.7262 1 0 1 0 0 1 364 3.48 20 720 134.85 88 283 9.9 2 2419)
      (1 2 46.1027 1 0 1 0 0 2.9 332 3.6 86 1492 134.85 103 277 11 4 786)
      (1 2 52.2875 1 0 1 0 0.500000 28 556 3.26 152 3896 198.4 171 335 10 3 943)
      (0 2 51.2005 1 0 0 1 0 0.7 309 3.84 96 858 41.85 106 253 11.4 3 2976)
      (0 2 33.8645 1 0 0 0 0.500000 1.2 ? 3.89 58 1284 173.6 ? 239 9.4 3 2615)
      (0 1 75.0116 1 0 0 0 0.500000 1.2 288 3.37 32 791 57.35 114 213 10.7 2 2995)
      (1 2 30.8638 1 0 1 0 0 7.2 1015 3.26 247 3836 198.4 280 330 9.8 3 1427)
      (1 1 61.8042 0 0 1 1 0.500000 3 257 3.79 290 1664 102.3 112 140 9.9 4 762)
      (0 2 34.987 1 0 0 1 0 1 ? 3.63 57 1536 134.85 ? 233 10 1 2891)
      (0 1 55.0418 1 0 0 0 0 0.9 460 3.03 57 721 85.25 174 301 9.4 2 2870)
      (1 1 69.9411 0 0 1 0 0 2.3 586 3.01 243 2276 114.7 126 339 10.9 3 1152)
      (0 1 49.6044 1 0 0 0 0 0.5 217 3.85 68 453 54.25 68 270 11.1 1 2863)
      (1 1 69.3771 0 0 0 1 1 2.4 168 2.56 225 1056 120.9 75 108 14.1 3 140)
      (0 2 43.5565 1 0 1 1 0.500000 0.6 220 3.35 57 1620 153.45 80 311 11.2 4 2666)
      (1 2 59.4086 1 0 1 0 0 25.5 358 3.52 219 2468 201.5 205 151 11.5 2 853)
      (0 2 48.7584 1 0 0 0 0 0.6 286 3.42 34 1868 77.5 206 487 10 2 2835)
      (0 1 36.4928 1 0 0 0 0 3.4 450 3.37 32 1408 116.25 118 313 11.2 2 2475)
      (1 2 45.7604 0 0 0 0 0 2.5 317 3.46 217 714 130.2 140 207 10.1 3 1536)
      (0 2 57.3717 1 0 0 0 0 0.6 217 3.62 13 414 75.95 119 224 10.5 3 2772)
      (0 2 42.7433 1 0 0 0 0 2.3 502 3.56 4 964 120.9 180 269 9.6 2 2797)
      (1 2 58.8172 1 0 1 1 0 3.2 260 3.19 91 815 127.1 101 160 12 4 186)
      (1 1 53.4976 1 0 0 0 0 0.3 233 4.08 20 622 66.65 68 358 9.9 3 2055)
      (1 2 43.4141 1 0 1 1 0.500000 8.5 ? 3.34 161 1428 181.35 ? 88 13.3 4 264)
      (1 1 53.306 0 0 1 0 0 4 196 3.45 80 2496 133.3 142 212 11.3 4 1077)
      (0 2 41.3552 1 0 1 0 0 5.7 1480 3.26 84 1960 457.25 108 213 9.5 2 2721)
      (1 1 60.9582 0 0 1 0 0 0.9 376 3.86 200 1015 83.7 154 238 10.3 4 1682)
      (0 2 47.7536 1 0 1 0 0 0.4 257 3.8 44 842 97.65 110 ? 9.2 2 2713)
      (1 2 35.4908 1 0 0 0 0 1.3 408 4.22 67 1387 142.6 137 295 10.1 3 1212)
      (0 1 48.6626 1 0 0 0 0 1.2 390 3.61 32 1509 88.35 52 263 9 3 2692)
      (0 1 52.668 1 0 0 0 0 0.5 ? 4.52 31 784 74.4 ? 361 10.1 3 2574)
      (0 2 49.87 1 0 0 1 0 1.3 205 3.34 65 1031 91.45 126 217 9.8 3 2301)
      (0 1 30.2752 1 0 1 1 0 3 236 3.42 76 1403 89.9 86 493 9.8 2 2657)
      (0 1 55.5674 1 0 0 0 0 0.5 ? 3.85 63 663 79.05 ? 311 9.7 1 2644)
      (0 2 52.1533 1 0 0 0 0 0.8 283 3.8 152 718 108.5 168 340 10.1 3 2624)
      (1 1 41.6099 1 0 1 1 0 3.2 ? 3.56 77 1790 139.5 ? 149 10.1 4 1492)
      (0 2 55.4524 1 0 0 0 0 0.9 258 4.01 49 559 43.4 133 277 10.4 2 2609)
      (0 1 70.0041 1 0 0 0 0 0.6 ? 4.08 51 665 74.4 ? 325 10.2 4 2580)
      (0 2 43.9425 1 0 1 0 0 1.8 396 3.83 39 2148 102.3 133 278 9.9 4 2573)
      (0 2 42.5681 1 0 0 0 0 4.7 478 4.38 44 1629 237.15 76 175 10.4 3 2563)
      (0 1 44.5695 1 0 1 1 0 1.4 248 3.58 63 554 75.95 106 79 10.3 4 2556)
      (0 1 56.9446 1 0 1 0 0 0.6 ? 3.69 161 674 26.35 ? 539 9.9 2 2555)
      (0 2 40.2601 1 0 0 0 0 0.5 201 3.73 44 1345 54.25 145 445 10.1 2 2241)
      (1 2 37.6071 1 0 1 0 0 11 674 3.55 358 2412 167.4 140 471 9.8 3 974)
      (0 1 48.3614 1 0 0 0 0 0.8 256 3.54 42 1132 74.4 94 192 10.5 3 2527)
      (1 1 70.8364 1 0 0 1 0.500000 2 225 3.53 51 933 69.75 62 200 12.7 3 1576)
      (1 2 35.7919 1 0 1 0 0 14 808 3.43 251 2870 153.45 137 268 11.5 3 733)
      (0 1 62.6229 1 0 1 0 0 0.7 187 3.48 41 654 120.9 98 164 11 4 2332)
      (0 2 50.6475 1 0 1 0 0 1.3 360 3.63 52 1812 97.65 164 256 9.9 3 2456)
      (0 1 54.527 1 0 0 1 0 2.3 ? 3.93 24 1828 133.3 ? 327 10.2 2 2504)
      (1 2 52.6927 1 1 1 1 0 24.5 1092 3.35 233 3740 147.25 432 399 15.2 4 216)
      (0 1 52.7201 1 0 1 0 0 0.9 308 3.69 67 696 51.15 101 344 9.8 4 2443)
      (1 2 56.7721 1 0 0 0 0 10.8 932 3.19 267 2184 161.2 157 382 10.4 4 797)
      (0 1 44.397 1 0 0 0 0 1.5 293 4.3 50 975 125.55 56 336 9.1 2 2449)
      (0 1 29.5551 1 0 1 0 0 3.7 347 3.9 76 2544 221.65 90 129 11.5 4 2330)
      (0 1 57.0404 1 0 1 1 0 1.4 226 3.36 13 810 72.85 62 117 11.6 4 2363)
      (0 1 44.627 1 0 0 0 0 0.6 266 3.97 25 1164 102.3 102 201 10.1 2 2365)
      (0 2 35.7974 1 0 0 1 0 0.7 286 2.9 38 1692 141.05 90 381 9.6 2 2357)
      (0 1 40.7173 1 0 0 0 0 2.1 392 3.43 52 1395 184.45 194 328 10.2 3 1592)
      (0 2 32.2327 1 0 0 1 0 4.7 236 3.55 112 1391 137.95 114 332 9.9 3 2318)
      (0 2 41.0924 1 0 1 0 0 0.6 235 3.2 26 1758 106.95 67 228 10.8 4 2294)
      (0 1 61.64 1 0 0 0 0 0.5 223 3.8 15 1044 80.6 89 514 10 2 2272)
      (0 2 37.0568 1 0 1 0 0 0.5 149 4.04 227 598 52.7 57 166 9.9 2 2221)
      (1 2 62.5791 1 0 0 0 0 0.7 255 3.74 23 1024 77.5 58 281 10.2 3 2090)
      (1 1 48.9774 1 1 0 0 0 2.5 382 3.55 108 1516 238.7 ? 126 10.3 3 2081)
      (0 1 61.9904 1 0 0 0 0 0.6 213 4.07 12 5300 57.35 68 240 11 1 2255)
      (0 1 72.7721 1 0 0 0 0.500000 0.6 ? 3.33 14 733 85.25 ? 259 10.1 4 2171)
      (1 1 61.295 1 0 1 0 0 3.9 396 3.2 58 1440 153.45 131 156 10 4 904)
      (0 2 52.6242 1 0 1 1 0 0.7 252 4.01 11 1210 72.85 58 309 9.5 2 2216)
      (0 2 49.7632 0 0 1 0 0 0.9 346 3.37 81 1098 122.45 90 298 10 2 2224)
      (0 2 52.9144 1 0 0 0 0 1.3 ? 3.76 27 1282 100.75 ? 114 10.3 3 2195)
      (0 2 47.2635 1 0 0 0 0 1.2 232 3.98 11 1074 100.75 99 223 9.9 3 2176)
      (0 1 50.204 1 0 0 1 0 0.5 400 3.4 9 1134 96.1 55 356 10.2 3 2178)
      (1 2 69.347 1 0 1 0 0 0.9 404 3.43 34 1866 79.05 224 236 9.9 3 1786)
      (1 2 41.1691 1 0 0 0 0 5.9 1276 3.85 141 1204 203.05 157 216 10.7 3 1080)
      (0 1 59.165 1 0 0 0 0 0.5 ? 3.68 20 856 55.8 ? 146 10.4 3 2168)
      (1 2 36.0794 1 0 1 0 0 11.4 608 3.31 65 1790 151.9 210 298 10.8 4 790)
      (0 1 34.5955 1 0 0 0 0 0.5 ? 3.89 29 897 66.65 ? 423 10.1 1 2170)
      (0 2 42.7132 1 0 0 0 0 1.6 215 4.17 67 936 134.85 85 176 9.6 3 2157)
      (1 1 63.6304 1 0 0 1 0 3.8 426 3.22 96 2716 210.8 113 228 10.6 2 1235)
      (0 2 56.6297 1 0 1 0 0 0.9 360 3.65 72 3186 94.55 154 269 9.7 4 2050)
      (1 2 46.2642 1 0 1 0 0 4.5 372 3.38 227 2310 167.4 135 240 12.4 3 597)
      (1 1 61.243 1 1 1 0 1 14.1 448 2.43 123 1833 134 155 210 11 4 334)
      (0 1 38.6201 1 0 0 0 0 1 309 3.66 67 1214 158.1 101 309 9.7 3 1945)
      (0 1 38.7707 1 0 0 0 0 0.7 274 3.66 108 1065 88.35 135 251 10.1 2 2022)
      (0 2 56.6954 1 0 1 0 0 0.5 223 3.7 39 884 75.95 104 231 9.6 3 1978)
      (1 1 58.9514 0 0 0 0 0 2.3 316 3.35 172 1601 179.8 63 394 9.7 2 999)
      (0 2 36.9227 1 0 0 0 0 0.7 215 3.35 41 645 93 74 165 9.6 3 1967)
      (1 1 62.4148 1 1 1 0 0.500000 4.5 191 3.05 200 1020 175.15 118 139 11.4 4 348)
      (0 2 34.6092 1 0 1 1 0 3.3 302 3.41 51 310 83.7 44 95 11.5 4 1979)
      (1 2 58.3354 1 0 1 1 0 3.4 518 1.96 115 2250 203.05 90 190 10.7 4 1165)
      (0 1 50.1821 1 0 1 0 0 0.4 267 3.02 47 1001 133.3 87 265 10.6 3 1951)
      (0 1 42.6858 1 0 1 1 0 0.9 514 3.06 412 2622 105.4 87 284 9.8 4 1932)
      (0 2 34.3792 1 0 0 0 0 0.9 578 3.35 78 976 116.25 177 322 11.2 2 1776)
      (0 2 33.1828 1 0 1 0 0 13 1336 4.16 71 3510 209.25 111 338 11.9 3 1882)
      (0 1 38.3819 1 0 1 1 0 1.5 253 3.79 67 1006 139.5 106 341 9.7 3 1908)
      (0 1 59.7618 1 0 1 0 0 1.6 442 2.95 105 820 85.25 108 181 10.1 3 1882)
      (0 2 66.412 1 0 0 0 0.500000 0.6 280 3.35 ? 1093 128.65 81 295 9.8 2 1874)
      (1 1 46.7899 1 0 1 1 0 0.8 300 2.94 231 1794 130.2 99 319 11.2 4 694)
      (0 1 56.0794 1 0 0 0 0 0.4 232 3.72 24 369 51.15 139 326 10.1 3 1831)
      (0 2 41.3744 1 0 1 1 0 4.4 316 3.62 308 1119 114.7 322 282 9.8 4 837)
      (0 1 64.5722 1 0 1 0 0 1.9 354 2.97 86 1553 196.85 152 277 9.9 3 1810)
      (1 2 67.488 1 0 1 0 0 8 468 2.81 139 2009 198.4 139 233 10 4 930)
      (1 1 44.8296 1 0 0 1 0 3.9 350 3.22 121 1268 272.8 231 270 9.6 3 1690)
      (0 2 45.7714 1 0 1 0 0 0.6 273 3.65 48 794 52.7 214 305 9.6 3 1790)
      (0 1 32.95 1 0 1 0 0 2.1 387 3.77 63 1613 150.35 33 185 10.1 4 1435)
      (0 1 41.2211 1 0 1 0 0 6.1 1712 2.83 89 3681 158.1 139 297 10 3 732)
      (0 2 55.4168 1 0 1 0 0 0.8 324 3.51 39 1237 66.65 146 371 10 3 1785)
      (0 1 47.9808 1 0 0 1 0 1.3 242 3.2 35 1556 175.15 71 195 10.6 4 1783)
      (0 2 40.7912 1 0 1 0 0 0.6 299 3.36 23 2769 220.1 85 303 10.9 4 1769)
      (0 1 56.9747 1 0 0 0 0 0.5 227 3.61 40 676 83 120 249 9.9 2 1457)
      (0 1 68.4627 1 0 1 1 0 1.1 246 3.35 116 924 113.15 90 317 10 4 1770)
      (0 1 78.4394 0 1 1 1 0 7.1 243 3.03 380 983 158.1 154 97 11.2 4 1765)
      (0 1 39.8576 1 0 1 1 0 3.1 227 3.75 121 1136 110 91 264 10 3 737)
      (0 2 35.3101 1 0 1 1 0 0.7 193 3.85 35 466 53 118 156 10.3 3 1735)
      (0 1 31.4442 1 0 0 0 0 1.1 336 3.74 48 823 84 108 242 9.7 3 1701)
      (0 1 58.2642 1 0 0 0 0 0.5 280 4.23 36 377 56 146 227 10.6 2 1614)
      (0 1 51.488 1 0 0 0 0 1.1 414 3.44 80 1003 99 55 271 9.6 1 1702)
      (0 2 59.9699 1 0 1 0 0 3.1 277 2.97 42 1110 125 126 221 9.8 3 1615)
      (0 2 74.5243 0 0 1 0 0 5.6 232 3.59 188 1120 98 128 248 10.9 4 1656)
      (0 2 52.3641 1 0 1 1 0 3.2 375 3.14 129 857 89 ? 375 9.5 3 1677)
      (0 2 42.7871 1 0 1 0 0 2.8 322 3.06 65 2562 91 209 231 9.5 3 1666)
      (0 2 34.8747 1 0 1 1 0.500000 1.1 432 3.57 45 1406 190 77 248 11.4 4 1301)
      (0 2 44.1396 1 0 1 1 0 3.4 356 3.12 188 1911 92 130 318 11.2 3 1542)
      (0 2 46.3819 1 0 1 0 0 3.5 348 3.2 121 938 120 146 296 10 4 1084)
      (0 1 56.3094 1 0 0 0 0 0.5 318 3.32 52 613 70 260 279 10.2 3 1614)
      (1 1 70.9076 1 1 1 1 1 6.6 222 2.33 138 620 106 91 195 12.1 4 179)
      (1 1 55.3949 1 1 1 0 0.500000 6.4 344 2.75 16 834 82 179 149 11 4 1191)
      (0 2 45.0842 1 0 0 0 0 3.6 374 3.5 143 1428 188 44 151 10.1 2 1363)
      (0 1 26.2779 1 0 1 1 0 1 448 3.74 102 1128 71 117 228 10.2 3 1568)
      (0 2 50.4723 1 0 1 0 0 1 321 3.5 94 955 111 177 289 9.7 3 1569)
      (0 1 38.3984 1 0 0 0 0 0.5 226 2.93 22 674 58 85 153 9.8 1 1525)
      (0 2 47.4196 1 0 0 1 0 2.2 328 3.46 75 1677 87 116 202 9.6 3 1558)
      (0 1 47.9808 1 0 0 0 0 1.6 ? 3.07 136 1995 128 ? 372 9.6 4 1447)
      (0 1 38.3162 1 0 0 0 0 2.2 572 3.77 77 2520 92 114 309 9.5 4 1349)
      (0 1 50.1081 1 0 0 0 0 1 219 3.85 67 640 145 108 95 10.7 2 1481)
      (0 2 35.0883 1 0 0 0 0.500000 1 317 3.56 44 1636 84 111 394 9.8 3 1434)
      (0 2 32.5038 1 0 0 0 0 5.6 338 3.7 130 2139 185 193 215 9.9 4 1420)
      (0 2 56.1533 1 0 0 0 0 0.5 198 3.77 38 911 57 56 280 9.8 2 1433)
      (0 1 46.1547 1 0 0 0 0 1.6 325 3.69 69 2583 142 140 284 9.6 3 1412)
      (1 1 65.8836 1 1 0 0 1 17.9 175 2.1 220 705 338 229 62 12.9 4 41)
      (0 2 33.9439 1 0 1 0 0 1.3 304 3.52 97 1622 71 169 255 9.5 4 1455)
      (0 2 62.8611 1 0 0 0 0 1.1 412 3.99 103 1293 91 113 422 9.6 4 1030)
      (0 2 48.564 1 0 0 0 0 1.3 291 3.44 75 1082 85 195 251 9.5 3 1418)
      (0 1 46.3491 1 0 0 0 0 0.8 253 3.48 65 688 57 80 252 10 1 1401)
      (0 1 38.8528 1 0 1 1 0 2 310 3.36 70 1257 122 118 143 9.8 3 1408)
      (0 1 58.6475 1 0 0 1 0 6.4 373 3.46 155 1768 120 151 258 10.1 4 1234)
      (0 2 48.9363 1 0 1 0 0.500000 8.7 310 3.89 107 637 117 242 298 9.6 2 1067)
      (1 1 67.5729 0 0 1 0 0.500000 4 416 3.99 177 960 86 242 269 9.8 2 799)
      (0 1 65.9849 1 0 0 0 0 1.4 294 3.57 33 722 93 69 283 9.8 3 1363)
      (0 1 40.9008 1 0 0 0 0 3.2 339 3.18 123 3336 205 84 304 9.9 4 901)
      (0 2 50.245 0 0 1 0 0 8.6 546 3.73 84 1070 127 153 291 11.2 3 1329)
      (0 2 57.1964 1 0 1 1 1 8.5 194 2.98 196 815 163 78 122 12.3 4 1320)
      (0 1 60.5366 0 0 1 0 0 6.6 1000 3.07 88 3150 193 133 299 10.9 4 1302)
      (0 1 35.3511 0 0 0 0 0 2.4 646 3.83 102 855 127 194 306 10.3 3 877)
      (0 2 31.3812 1 0 0 0 0 0.8 328 3.31 62 1105 137 95 293 10.9 4 1321)
      (0 1 55.9863 0 0 1 0 0 1.2 275 3.43 100 1142 75 91 217 11.3 4 533)
      (0 2 52.7255 1 0 1 0 0 1.1 340 3.37 73 289 97 93 243 10.2 3 1300)
      (0 1 38.0917 1 0 0 0 0 2.4 342 3.76 90 1653 150 127 213 10.8 3 1293)
      (1 2 58.1711 1 0 1 0 0 5.2 ? 2.23 234 601 135 ? 206 12.3 4 207)
      (0 2 45.2101 1 0 0 0 0 1 393 3.57 50 1307 74 103 295 10.5 4 1295)
      (0 1 37.7988 1 0 0 0 0 0.7 335 3.95 43 657 52 104 268 10.6 2 1271)
      (0 2 60.6598 1 0 1 1 0 1 372 3.25 108 1190 140 55 248 10.6 4 1250)
      (0 1 35.5346 1 0 0 0 0 0.5 219 3.93 22 663 45 75 246 10.8 3 1230)
      (0 2 43.0664 1 0 1 1 0 2.9 426 3.61 73 5184 288 144 275 10.6 3 1216)
      (0 2 56.3915 1 0 1 0 0 0.6 239 3.45 31 1072 55 64 227 10.7 2 1216)
      (0 2 30.5736 1 0 0 0 0 0.8 273 3.56 52 1282 130 59 344 10.5 2 1149)
      (0 1 61.1828 1 0 1 0 0 0.4 246 3.58 24 797 91 113 288 10.4 2 1153)
      (0 2 58.2998 1 0 0 0 0 0.4 260 2.75 41 1166 70 82 231 10.8 2 994)
      (0 1 62.3326 1 0 0 0 0 1.7 434 3.35 39 1713 171 100 234 10.2 2 939)
      (0 1 37.9986 1 0 0 0 0 2 247 3.16 69 1050 117 88 335 10.5 2 839)
      (0 2 33.1526 1 0 0 1 0 6.4 576 3.79 186 2115 136 149 200 10.8 2 788)
      (0 ? 60 ? ? ? ? 0 0.7 ? 3.65 ? ? ? ? 378 11 ? 4062)
      (1 ? 65 ? ? ? ? 0.500000 1.4 ? 3.04 ? ? ? ? 331 12.1 ? 3561)
      (0 ? 54 ? ? ? ? 0 0.7 ? 4.03 ? ? ? ? 226 9.8 ? 2844)
      (1 ? 75 ? ? ? ? 0.500000 0.7 ? 3.96 ? ? ? ? ? 11.3 ? 2071)
      (0 ? 62 ? ? ? ? 0 0.8 ? 2.48 ? ? ? ? 273 10 ? 3030)
      (0 ? 43 ? ? ? ? 0 0.7 ? 3.68 ? ? ? ? 306 9.5 ? 1680)
      (1 ? 46 ? ? ? ? 0 5 ? 2.93 ? ? ? ? 260 10.4 ? 41)
      (0 ? 44 ? ? ? ? 0.500000 0.4 ? 3.81 ? ? ? ? 226 10.5 ? 2403)
      (0 ? 61 ? ? ? ? 0.500000 1.3 ? 3.41 ? ? ? ? 259 10.9 ? 1170)
      (1 ? 64 ? ? ? ? 0 1.1 ? 3.69 ? ? ? ? 139 10.5 ? 2011)
      (0 ? 40 ? ? ? ? 0 0.6 ? 4.04 ? ? ? ? 130 11.2 ? 3523)
      (0 ? 63 ? ? ? ? 0 0.6 ? 3.94 ? ? ? ? 234 11.5 ? 3468)
      (0 ? 34 ? ? ? ? 0 1.8 ? 3.24 ? ? ? ? ? 18 ? 4795)
      (0 ? 52 ? ? ? ? 0 1.5 ? 3.42 ? ? ? ? 246 10.3 ? 1236)
      (0 ? 49 ? ? ? ? 0 1.2 ? 3.99 ? ? ? ? ? 11.2 ? 4214)
      (1 ? 54 ? ? ? ? 0 1 ? 3.6 ? ? ? ? ? 12.1 ? 2111)
      (1 ? 63 ? ? ? ? 0 0.7 ? 3.4 ? ? ? ? 371 10.1 ? 1462)
      (1 ? 54 ? ? ? ? 0 3.5 ? 3.63 ? ? ? ? 325 10.3 ? 1746)
      (1 ? 46 ? ? ? ? 0.500000 3.1 ? 3.56 ? ? ? ? 142 13.6 ? 94)
      (1 ? 53 ? ? ? ? 0 12.6 ? 2.87 ? ? ? ? 114 11.8 ? 785)
      (1 ? 56 ? ? ? ? 0 2.8 ? 3.92 ? ? ? ? ? 10.6 ? 1518)
      (1 ? 56 ? ? ? ? 0 7.1 ? 3.51 ? ? ? ? 721 11.8 ? 466)
      (0 ? 55 ? ? ? ? 0 0.6 ? 4.15 ? ? ? ? 280 10.1 ? 3527)
      (0 ? 65 ? ? ? ? 0 2.1 ? 3.34 ? ? ? ? 155 10.1 ? 2635)
      (1 ? 56 ? ? ? ? 0 1.8 ? 3.64 ? ? ? ? 141 10 ? 2286)
      (1 ? 47 ? ? ? ? 0 16 ? 3.42 ? ? ? ? 475 13.8 ? 791)
      (0 ? 60 ? ? ? ? 0 0.6 ? 4.38 ? ? ? ? 269 10.6 ? 3492)
      (0 ? 53 ? ? ? ? 0 5.4 ? 4.19 ? ? ? ? 141 11.2 ? 3495)
      (1 ? 54 ? ? ? ? 0 9 ? 3.29 ? ? ? ? 286 13.1 ? 111)
      (0 ? 50 ? ? ? ? 0 0.9 ? 4.01 ? ? ? ? 244 10.5 ? 3231)
      (1 ? 48 ? ? ? ? 0 11.1 ? 2.84 ? ? ? ? ? 12.2 ? 625)
      (0 ? 36 ? ? ? ? 0 8.9 ? 3.76 ? ? ? ? 209 10.6 ? 3157)
      (0 ? 48 ? ? ? ? 0 0.5 ? 3.76 ? ? ? ? 388 10.1 ? 3021)
      (1 ? 70 ? ? ? ? 0.500000 0.6 ? 3.81 ? ? ? ? 160 11 ? 559)
      (1 ? 51 ? ? ? ? 0 3.4 ? 3.92 ? ? ? ? ? 9.3 ? 2812)
      (0 ? 52 ? ? ? ? 0 0.9 ? 3.14 ? ? ? ? 191 12.3 ? 2834)
      (0 ? 54 ? ? ? ? 0 1.4 ? 3.82 ? ? ? ? 249 10.3 ? 2855)
      (1 ? 48 ? ? ? ? 0 2.1 ? 4.1 ? ? ? ? 200 9 ? 662)
      (1 ? 66 ? ? ? ? 0 15 ? 3.4 ? ? ? ? 150 11.1 ? 727)
      (0 ? 53 ? ? ? ? 0 0.6 ? 4.19 ? ? ? ? 330 9.9 ? 2716)
      (0 ? 62 ? ? ? ? 0 1.3 ? 3.4 ? ? ? ? 167 10.6 ? 2698)
      (1 ? 59 ? ? ? ? 0 1.3 ? 3.12 ? ? ? ? 125 9.6 ? 990)
      (0 ? 39 ? ? ? ? 0 1.6 ? 3.75 ? ? ? ? 145 10.4 ? 2338)
      (1 ? 67 ? ? ? ? 0.500000 2.2 ? 3.26 ? ? ? ? 171 11.1 ? 1616)
      (0 ? 58 ? ? ? ? 0 3 ? 3.46 ? ? ? ? 109 10.4 ? 2563)
      (0 ? 64 ? ? ? ? 0 0.8 ? 3.49 ? ? ? ? 314 10.3 ? 2537)
      (0 ? 46 ? ? ? ? 0 0.8 ? 2.89 ? ? ? ? 419 ? ? 2534)
      (1 ? 64 ? ? ? ? 0 1.8 ? 3.15 ? ? ? ? 183 10.4 ? 778)
      (0 ? 41 ? ? ? ? 0 5.5 ? 2.31 ? ? ? ? 517 10.4 ? 617)
      (0 ? 49 ? ? ? ? 0 18 ? 3.04 ? ? ? ? 432 9.7 ? 2267)
      (0 ? 44 ? ? ? ? 0 0.6 ? 3.5 ? ? ? ? 150 9.9 ? 2249)
      (1 ? 59 ? ? ? ? 0 2.7 ? 3.35 ? ? ? ? 142 11.5 ? 359)
      (0 ? 63 ? ? ? ? 0 0.9 ? 3.58 ? ? ? ? 224 10 ? 1925)
      (1 ? 61 ? ? ? ? 0 1.3 ? 3.01 ? ? ? ? 223 10.7 ? 249)
      (0 ? 64 ? ? ? ? 0 1.1 ? 3.49 ? ? ? ? 166 9.8 ? 2202)
      (1 ? 49 ? ? ? ? 0 13.8 ? 2.77 ? ? ? ? 388 ? ? 43)
      (1 ? 42 ? ? ? ? 0 4.4 ? 4.52 ? ? ? ? 102 10.8 ? 1197)
      (1 ? 50 ? ? ? ? 0 16 ? 3.36 ? ? ? ? 384 10 ? 1095)
      (1 ? 51 ? ? ? ? 0.500000 7.3 ? 3.52 ? ? ? ? 265 11.1 ? 489)
      (0 ? 37 ? ? ? ? 0 0.6 ? 3.55 ? ? ? ? 248 10.3 ? 2149)
      (0 ? 62 ? ? ? ? 0 0.7 ? 3.29 ? ? ? ? 190 9.8 ? 2103)
      (0 ? 51 ? ? ? ? 0 0.7 ? 3.1 ? ? ? ? 274 10.6 ? 1980)
      (0 ? 52 ? ? ? ? 0 1.7 ? 3.24 ? ? ? ? 231 10.5 ? 1347)
      (1 ? 44 ? ? ? ? 0 9.5 ? 3.63 ? ? ? ? 292 10.2 ? 1478)
      (0 ? 33 ? ? ? ? 0 2.2 ? 3.76 ? ? ? ? 253 9.9 ? 1987)
      (1 ? 60 ? ? ? ? 0.500000 1.8 ? 3.62 ? ? ? ? 225 9.9 ? 1168)
      (1 ? 63 ? ? ? ? 0.500000 3.3 ? 2.73 ? ? ? ? 224 11.1 ? 597)
      (0 ? 33 ? ? ? ? 0 2.9 ? 4.08 ? ? ? ? 418 10.5 ? 1725)
      (0 ? 41 ? ? ? ? 0 1.7 ? 3.66 ? ? ? ? 92 11 ? 1899)
      (1 ? 51 ? ? ? ? 0 14 ? 2.58 ? ? ? ? 190 11.6 ? 221)
      (0 ? 37 ? ? ? ? 0.500000 0.8 ? 3 ? ? ? ? 76 10.8 ? 1022)
      (0 ? 59 ? ? ? ? 0 1.3 ? 3.4 ? ? ? ? 243 9.7 ? 1639)
      (0 ? 55 ? ? ? ? 0 0.7 ? 2.93 ? ? ? ? 209 10.6 ? 1635)
      (0 ? 54 ? ? ? ? 0 1.7 ? 2.38 ? ? ? ? 166 9.8 ? 1654)
      (0 ? 49 ? ? ? ? 0.500000 13.6 ? 3 ? ? ? ? 233 9.9 ? 1653)
      (0 ? 40 ? ? ? ? 0 0.9 ? 3.5 ? ? ? ? 117 10.9 ? 1560)
      (0 ? 67 ? ? ? ? 0 0.7 ? 3.06 ? ? ? ? 165 10 ? 1581)
      (0 ? 68 ? ? ? ? 0 3 ? 3.15 ? ? ? ? 139 10 ? 1419)
      (0 ? 41 ? ? ? ? 0 1.2 ? 2.8 ? ? ? ? 120 11 ? 1443)
      (0 ? 69 ? ? ? ? 0 0.4 ? 3.03 ? ? ? ? 173 10.9 ? 1368)
      (1 ? 52 ? ? ? ? 0.500000 0.7 ? 2.96 ? ? ? ? 319 9.9 ? 193)
      (0 ? 57 ? ? ? ? 0.500000 2 ? 3.07 ? ? ? ? 80 12.1 ? 1367)
      (0 ? 36 ? ? ? ? 0 1.4 ? 3.98 ? ? ? ? 402 11 ? 1329)
      (0 ? 50 ? ? ? ? 0 1.6 ? 3.48 ? ? ? ? 277 10.2 ? 1343)
      (0 ? 64 ? ? ? ? 0 0.5 ? 3.65 ? ? ? ? 425 10.2 ? 1328)
      (0 ? 62 ? ? ? ? 0 7.3 ? 3.49 ? ? ? ? 189 10.9 ? 1375)
      (0 ? 42 ? ? ? ? 0 8.1 ? 2.82 ? ? ? ? 193 10.4 ? 1260)
      (0 ? 44 ? ? ? ? 0 0.5 ? 3.34 ? ? ? ? 258 10.6 ? 1223)
      (1 ? 69 ? ? ? ? 0 4.2 ? 3.19 ? ? ? ? 120 11.1 ? 935)
      (0 ? 52 ? ? ? ? 0 0.8 ? 3.01 ? ? ? ? 256 10.6 ? 943)
      (0 ? 66 ? ? ? ? 0 2.5 ? 3.33 ? ? ? ? 256 10.8 ? 1141)
      (0 ? 40 ? ? ? ? 0 4.6 ? 3.6 ? ? ? ? 337 10.4 ? 1092)
      (0 ? 52 ? ? ? ? 0 1 ? 3.64 ? ? ? ? 340 10.6 ? 1150)
      (1 ? 46 ? ? ? ? 0 4.5 ? 2.68 ? ? ? ? 219 11.5 ? 703)
      (0 ? 54 ? ? ? ? 0 1.1 ? 3.69 ? ? ? ? 220 10.8 ? 1129)
      (0 ? 51 ? ? ? ? 0.500000 1.9 ? 3.17 ? ? ? ? 162 10.7 ? 1086)
      (0 ? 43 ? ? ? ? 0 0.7 ? 3.73 ? ? ? ? 214 10.8 ? 1067)
      (0 ? 39 ? ? ? ? 0 1.5 ? 3.81 ? ? ? ? 255 10.8 ? 1072)
      (0 ? 51 ? ? ? ? 0 0.6 ? 3.57 ? ? ? ? 286 10.6 ? 1119)
      (0 ? 67 ? ? ? ? 0 1 ? 3.58 ? ? ? ? 244 10.8 ? 1097)
      (0 ? 35 ? ? ? ? 0 0.7 ? 3.23 ? ? ? ? 312 10.8 ? 989)
      (1 ? 67 ? ? ? ? 0 1.2 ? 2.96 ? ? ? ? 174 10.9 ? 681)
      (0 ? 39 ? ? ? ? 0 0.9 ? 3.83 ? ? ? ? 180 11.2 ? 1103)
      (0 ? 57 ? ? ? ? 0 1.6 ? 3.42 ? ? ? ? 143 9.9 ? 1055)
      (0 ? 58 ? ? ? ? 0 0.8 ? 3.75 ? ? ? ? 269 10.4 ? 691)
      (0 ? 53 ? ? ? ? 0 0.7 ? 3.29 ? ? ? ? 350 10.6 ? 976)
      )))