---
title: "Review_Shirin"
author: "Swathi_Nadendla"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

#Overall, I was able to run the markdown file and got the plots. Great job!

#I have also liked the way you have structured and annotated the script with file names used and the process in detail! It was much easier to review.

#Data inspection part was great! It included all the details 

#I have a few comments as I have got a few errors in the markdown file, however they didn't impact the analysis 

#1. I thought it's better to load all packages at the starting rather than including in subsections this threw errors initially when I was trying to run the entire script rather than in chunks for viridislite package

#2. After applying lapply I have got NA intoduction errors multiple times and showed NULL which means it's empty but the later plots were fine. I am not sure what went wrong with lapply function.

#3. summarise()` has grouped output by 'Chromosome'. You can override using the `.groups` argument.