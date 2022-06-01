---
title: "Codebook"
output:
  html_document:
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: 'hide'
    self_contained: true
  pdf_document:
    toc: yes
    toc_depth: 4
    latex_engine: xelatex
---

variables :

activityLabels - table with activity numbers and corresponding acitivty
featureNames - name of all different features
features - combined feature data table of test and train data sets
activity - combined activity data table of test and train data sets
subject - combined subject data table of test and train data sets
d - combined data table with all the data with features that include mean and std
tidy - combined data table with mean for each feature for each subject and activity



Here, we're just setting a few options.

```{r setup}
knitr::opts_chunk$set(
	echo = TRUE,
	error = TRUE,
	message = TRUE,
	warning = TRUE
)
ggplot2::theme_set(ggplot2::theme_bw())

```

Now, we're preparing our data for the codebook.

```{r prepare_codebook}
library(codebook)
codebook_data <- codebook::bfi
# to import an SPSS file from the same folder uncomment and edit the line below
# codebook_data <- rio::import("mydata.sav")
# for Stata
# codebook_data <- rio::import("mydata.dta")
# for CSV
# codebook_data <- rio::import("mydata.csv")

# omit the following lines, if your missing values are already properly labelled
codebook_data <- detect_missing(codebook_data,
    only_labelled = TRUE, # only labelled values are autodetected as
                                   # missing
    negative_values_are_missing = FALSE, # negative values are missing values
    ninety_nine_problems = TRUE,   # 99/999 are missing values, if they
                                   # are more than 5 MAD from the median
    )

# If you are not using formr, the codebook package needs to guess which items
# form a scale. The following line finds item aggregates with names like this:
# scale = scale_1 + scale_2R + scale_3R
# identifying these aggregates allows the codebook function to
# automatically compute reliabilities.
# However, it will not reverse items automatically.
codebook_data <- detect_scales(codebook_data)
```


Create codebook

```{r codebook}
codebook(codebook_data)
```
