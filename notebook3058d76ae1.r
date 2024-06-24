{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "b661b6a0",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-06-24T20:42:37.964678Z",
     "iopub.status.busy": "2024-06-24T20:42:37.962580Z",
     "iopub.status.idle": "2024-06-24T20:42:39.112287Z",
     "shell.execute_reply": "2024-06-24T20:42:39.110496Z"
    },
    "papermill": {
     "duration": 1.15727,
     "end_time": "2024-06-24T20:42:39.114795",
     "exception": false,
     "start_time": "2024-06-24T20:42:37.957525",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(caTools)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "cfd48304",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-06-24T20:42:39.151759Z",
     "iopub.status.busy": "2024-06-24T20:42:39.121825Z",
     "iopub.status.idle": "2024-06-24T20:42:39.684049Z",
     "shell.execute_reply": "2024-06-24T20:42:39.681964Z"
    },
    "papermill": {
     "duration": 0.569046,
     "end_time": "2024-06-24T20:42:39.686546",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.117500",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m262\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m18\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (5): Month, Decision_domestic_VS_external, Decsion_icrease_decrease_DOME...\n",
      "\u001b[32mdbl\u001b[39m (7): Year, Per_DOMESTIC, Per_EXTERNAL, Percentage_Incresea_decresea_DOME...\n",
      "\u001b[32mnum\u001b[39m (6): Domestic Debt, External Debt, Total, AMOUNT_Increase_decrese_DOMEST...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "url =\"https://raw.githubusercontent.com/jakkkc/Kenya_financial_debts/main/kenya%20debt.csv\"\n",
    "kenya_debt <- read_csv(url)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c15a4e1f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-06-24T20:42:39.696239Z",
     "iopub.status.busy": "2024-06-24T20:42:39.694547Z",
     "iopub.status.idle": "2024-06-24T20:42:39.714679Z",
     "shell.execute_reply": "2024-06-24T20:42:39.712869Z"
    },
    "papermill": {
     "duration": 0.027626,
     "end_time": "2024-06-24T20:42:39.717228",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.689602",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Year'</li><li>'Month'</li><li>'Domestic Debt'</li><li>'External Debt'</li><li>'Total'</li><li>'Per_DOMESTIC'</li><li>'Per_EXTERNAL'</li><li>'Decision_domestic_VS_external'</li><li>'AMOUNT_Increase_decrese_DOMESTIC'</li><li>'Percentage_Incresea_decresea_DOMESTIC'</li><li>'Decsion_icrease_decrease_DOMESTIC'</li><li>'AMOUNT_Increase_decrese_EXTERNAL'</li><li>'Percentage_Incresea_decresea_EXTERNAL'</li><li>'Decsion_icrease_decrease_EXTERNAL'</li><li>'AMOUNT_Increase_decrese_TOTAL'</li><li>'Percentage_Incresea_decresea_TOTAL'</li><li>'Decsion_icrease_decrease_TOTAL'</li><li>'SN'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Year'\n",
       "\\item 'Month'\n",
       "\\item 'Domestic Debt'\n",
       "\\item 'External Debt'\n",
       "\\item 'Total'\n",
       "\\item 'Per\\_DOMESTIC'\n",
       "\\item 'Per\\_EXTERNAL'\n",
       "\\item 'Decision\\_domestic\\_VS\\_external'\n",
       "\\item 'AMOUNT\\_Increase\\_decrese\\_DOMESTIC'\n",
       "\\item 'Percentage\\_Incresea\\_decresea\\_DOMESTIC'\n",
       "\\item 'Decsion\\_icrease\\_decrease\\_DOMESTIC'\n",
       "\\item 'AMOUNT\\_Increase\\_decrese\\_EXTERNAL'\n",
       "\\item 'Percentage\\_Incresea\\_decresea\\_EXTERNAL'\n",
       "\\item 'Decsion\\_icrease\\_decrease\\_EXTERNAL'\n",
       "\\item 'AMOUNT\\_Increase\\_decrese\\_TOTAL'\n",
       "\\item 'Percentage\\_Incresea\\_decresea\\_TOTAL'\n",
       "\\item 'Decsion\\_icrease\\_decrease\\_TOTAL'\n",
       "\\item 'SN'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Year'\n",
       "2. 'Month'\n",
       "3. 'Domestic Debt'\n",
       "4. 'External Debt'\n",
       "5. 'Total'\n",
       "6. 'Per_DOMESTIC'\n",
       "7. 'Per_EXTERNAL'\n",
       "8. 'Decision_domestic_VS_external'\n",
       "9. 'AMOUNT_Increase_decrese_DOMESTIC'\n",
       "10. 'Percentage_Incresea_decresea_DOMESTIC'\n",
       "11. 'Decsion_icrease_decrease_DOMESTIC'\n",
       "12. 'AMOUNT_Increase_decrese_EXTERNAL'\n",
       "13. 'Percentage_Incresea_decresea_EXTERNAL'\n",
       "14. 'Decsion_icrease_decrease_EXTERNAL'\n",
       "15. 'AMOUNT_Increase_decrese_TOTAL'\n",
       "16. 'Percentage_Incresea_decresea_TOTAL'\n",
       "17. 'Decsion_icrease_decrease_TOTAL'\n",
       "18. 'SN'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Year\"                                 \n",
       " [2] \"Month\"                                \n",
       " [3] \"Domestic Debt\"                        \n",
       " [4] \"External Debt\"                        \n",
       " [5] \"Total\"                                \n",
       " [6] \"Per_DOMESTIC\"                         \n",
       " [7] \"Per_EXTERNAL\"                         \n",
       " [8] \"Decision_domestic_VS_external\"        \n",
       " [9] \"AMOUNT_Increase_decrese_DOMESTIC\"     \n",
       "[10] \"Percentage_Incresea_decresea_DOMESTIC\"\n",
       "[11] \"Decsion_icrease_decrease_DOMESTIC\"    \n",
       "[12] \"AMOUNT_Increase_decrese_EXTERNAL\"     \n",
       "[13] \"Percentage_Incresea_decresea_EXTERNAL\"\n",
       "[14] \"Decsion_icrease_decrease_EXTERNAL\"    \n",
       "[15] \"AMOUNT_Increase_decrese_TOTAL\"        \n",
       "[16] \"Percentage_Incresea_decresea_TOTAL\"   \n",
       "[17] \"Decsion_icrease_decrease_TOTAL\"       \n",
       "[18] \"SN\"                                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(kenya_debt)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "67287cc7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-06-24T20:42:39.726922Z",
     "iopub.status.busy": "2024-06-24T20:42:39.725397Z",
     "iopub.status.idle": "2024-06-24T20:42:39.748887Z",
     "shell.execute_reply": "2024-06-24T20:42:39.747068Z"
    },
    "papermill": {
     "duration": 0.031151,
     "end_time": "2024-06-24T20:42:39.751602",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.720451",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "S <- sample.split(kenya_debt$Year, SplitRatio = 0.8)\n",
    "Train_logit <- subset(kenya_debt, S==T)\n",
    "Test_logit <- subset(kenya_debt, S==F)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d70739bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-06-24T20:42:39.761517Z",
     "iopub.status.busy": "2024-06-24T20:42:39.759878Z",
     "iopub.status.idle": "2024-06-24T20:42:39.802779Z",
     "shell.execute_reply": "2024-06-24T20:42:39.800917Z"
    },
    "papermill": {
     "duration": 0.05076,
     "end_time": "2024-06-24T20:42:39.805472",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.754712",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = `Domestic Debt` ~ `External Debt`, data = kenya_debt)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-205949 -102223  -15805   87108  324831 \n",
       "\n",
       "Coefficients:\n",
       "                 Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)     1.307e+04  1.188e+04     1.1    0.272    \n",
       "`External Debt` 9.511e-01  7.250e-03   131.2   <2e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 129400 on 260 degrees of freedom\n",
       "Multiple R-squared:  0.9851,\tAdjusted R-squared:  0.9851 \n",
       "F-statistic: 1.721e+04 on 1 and 260 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Linear <- lm(`Domestic Debt`~ `External Debt`, data=kenya_debt)\n",
    "summary(Linear)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a33964eb",
   "metadata": {
    "papermill": {
     "duration": 0.003313,
     "end_time": "2024-06-24T20:42:39.812140",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.808827",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Discussion"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b709a41c",
   "metadata": {
    "papermill": {
     "duration": 0.003346,
     "end_time": "2024-06-24T20:42:39.819167",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.815821",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "These statistics provide an idea of the spread and distribution of the residuals. The median residual is close to zero, indicating that the model is relatively unbiased. However, the large range of residuals (from -205,949 to 324,831) suggests that there are some significant errors in the predictions. This variability indicates that while the model performs well on average, it does have substantial deviations in certain cases.\n",
    "\n",
    "\n",
    "The intercept (13,070) represents the estimated value of Domestic Debt when External Debt is zero. However, the p-value of 0.272 suggests that this estimate is not statistically significant, meaning it is not reliably different from zero. Also,the slope (0.9511) indicates that for every one-unit increase in External Debt, Domestic Debt increases by approximately 0.9511 units. The extremely small p-value (< 2e-16) shows that this relationship is highly significant, implying a strong and reliable association between External Debt and Domestic Debt.\n",
    "\n",
    "\n",
    "R-squared which is the coefficient of determination measures how well the model explains the variability of domestic debt. An R-squared of 0.9851 means that approximately 98.51% of the variability in Domestic Debt is explained by External Debt. The adjusted R-squared, which accounts for the number of predictors in the model, is nearly identical to the multiple R-squared, indicating that the model is not overfitting. On the other hand, the significant F-statistic result(p <0.05) indicates that the model is highly significant overall, providing strong evidence that External Debt is a significant predictor of Domestic Debt.\n",
    "\n",
    "\n",
    "From this result, every domestic debt that will be incure can be predicted by the equation below\n",
    "\n",
    "\n",
    "# Domestic debt = 0. 9511* External debt\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "eaabef1d",
   "metadata": {
    "papermill": {
     "duration": 0.003145,
     "end_time": "2024-06-24T20:42:39.825438",
     "exception": false,
     "start_time": "2024-06-24T20:42:39.822293",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "databundleVersionId": 8872837,
     "datasetId": 5229706,
     "sourceId": 8719241,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.24082,
   "end_time": "2024-06-24T20:42:39.950633",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-06-24T20:42:34.709813",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
