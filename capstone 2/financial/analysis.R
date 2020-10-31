
if(!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if(!require(caret)) install.packages("caret", repos = "http://cran.us.r-project.org")
if(!require(data.table)) install.packages("data.table", repos = "http://cran.us.r-project.org")
if(!require(stringr)) install.packages("stringr", repos = "http://cran.us.r-project.org")
if(!require(dplyr)) install.packages("dplyr", repos = "http://cran.us.r-project.org")
if(!require(lubridate)) install.packages("lubridate", repos = "http://cran.us.r-project.org")
if(!require(ggplot2)) install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if(!require(kableExtra)) install.packages("kableExtra", repos = "http://cran.us.r-project.org")
if(!require(RCurl)) install.packages("RCurl", repos = "http://cran.us.r-project.org")

library(tidyverse)
library(caret)
library(data.table)
library(stringr)
library(dplyr)
library(lubridate)
library(ggplot2)
library(ggrepel)
library(forcats)
library(readxl)
library(kableExtra)
library(RCurl)

options(digits = 7)
options(scipen = 999)

#----------------------------------------
# check working directory and set
#----------------------------------------

urlfile <- "https://raw.githubusercontent.com/tdp-datsci/financial/main/2014_Financial_Data.csv"
cik <- "https://raw.githubusercontent.com/tdp-datsci/financial/main/cik_ticker.xlsx"

download.file(urlfile, "2014_Financial_Data.csv")
tempfile()
tmp_filename <- tempfile()
download.file(urlfile, tmp_filename)
dat <- read_csv(tmp_filename)

download.file(cik, "cik_ticker.xlsx")
tf <- tempfile(fileext = ".xlsx")
tmp_filename1 <- tempfile()
download.file(cik, tmp_filename1)
dat1 <- read_xlsx(tmp_filename1, range = "A1:A3", col_names = TRUE, sheet = 1)

head(dat1)
spec(dat1)

dat[1890, ]$operatingCycle
dat[1890, ]$cashConversionCycle

dat[1896, ]$operatingCycle
dat[1896, ]$cashConversionCycle

names(dat)[names(dat) == "X1"] <- "ticker"
head(dat)

file_2014 <- "2014_Financial_Data.csv"
file_2015 <- "2015_Financial_Data.csv"
file_2016 <- "2016_Financial_Data.csv"
file_2017 <- "2017_Financial_Data.csv"
file_2018 <- "2018_Financial_Data.csv"

file_cik <- "cik_ticker.xlsx"

#----------------------------------------
# reading of financial data for each year
#----------------------------------------

stock_2014 <- read_csv(file_2014, n_max = 10)
names(stock_2014) [names(stock_2014) == "X1"] <- "Symbol"

stock_2014 <- stock_2014 %>% 
  mutate(report_year = 2014)

stock_2014 <- stock_2014[, c(1, 226, 2:225)]

#----------------------------------------
# reading of NASDAQ and unlisted stocks text files from NASDAQ FTP website
#----------------------------------------

filename <- "cik_ticker.xlsx"
fullpath <- file.path()

nasdaq_text <- read_xlsx(cik_ticker.xlsx, col_names = FALSE, n_max = 20)
glimpse(nasdaq_text)
head(nasdaq_text)

tickers <- read_json("tickers.json", simplifyVector = TRUE)
tickers2 <- fromJSON("tickers.json")
class(tickers)
class(tickers2)


test <- as.data.frame(tickers)
test2 <- as.data.frame(tickers2, simplifyWithNames = TRUE)
test3 <- t(test2)
rownames(test2)
test2[1, ]
test2[.2]
test2[.3]

head(test2)

pattern <- "^[A-Z]\\d{1,4}[.]?[a-z]{3,5}[_]*[a-z]{1,5}"
test3[1]
str_detect(test3, pattern)
