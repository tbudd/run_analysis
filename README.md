---
title: "README"
author: "tbudd"
date: "November 13, 2015"
output: html_document
---

Inertial data was not included from the dataset, because it was not necessary to calculate the averages of the means and standard deviations.

Only columns ending in mean() and std() were included in the result, because the assignment requested means and standard deviations. MeanFreq() is defined in the frequency_infot.txt file as "the Weighted average of the frequency components to obtain a mean frequency," which is not exactly the same as mean.

The column names were taken from the features.txt files verbatim. While longer column names could have been used, shorter names make for narrower columns, allowing more to be viewed at once. It is a trade off. The original data author did a reasonably good job with the acronyms, and the code book contains complete descriptions if there is any confusion.

The tidy data output is in the wide form (unstacked), where each variable attribute for a subject is in a separate column. Subject and activity do not have meaningful averages, so those averaged columns were removed.

The out can be perused using this code.
data <- read.table(file_path, header = TRUE)
View(data)


This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
