
# ====================================================
# Tokenizer 
# ---------
# This script is used to create the 2 term and 3 term 
# Term Document Matricies (TDMs) used by the textPredict
# application.  SwiftKey's blog, news, and tweet text files 
# are separated into approximately 15 MB chunks to avoid
# program crashes caused by "out of memory" errors.  
# Approximately 21 sets of 2 and 3 term TDMs are 
# generated using the R "tm" package (tm_map) and the 
# "RWeka" package (NGramTokenizer). 
# ====================================================

library(tm)
library(readr)

# 15 MB Max: 100K Blog lines; 80K News lines; 220K Tweet lines
# 
# blogsTxt = 899,288 lns; newsTxt = 77,259 lns; tweetsTxt = 2,360,148 lns


# Set dir to move files to
dir = "n1"

# 1st 100K lns
# blogsTxt <- read_lines("../final/en_US/en_US.blogs.txt",skip = 400000,n_max = 50000)
#blogsTxt <- read_lines("../final/en_US/en_US.blogs.txt")
#blogsTxt <- blogsTxt[800001:899288]
#blogsTxt <- iconv(blogsTxt, to = "latin1")
#blogsTxt <- (blogsTxt[!is.na(blogsTxt)])
#blogsTxt <-  paste(blogsTxt, collapse = " ")

# Read in one twitter text file directly
#tweetsTxt <- readLines("../final/en_US/en_US.twitter.txt")
#tweetsTxt <- tweetsTxt[2200001:2360148]
#tweetsTxt <- iconv(tweetsTxt, to = "latin1")
#tweetsTxt <- (tweetsTxt[!is.na(tweetsTxt)])
#tweetsTxt <- paste(tweetsTxt, collapse = " ")

# Read in one twitter text file directly
newsTxt <- readLines("../final/en_US/en_US.news.txt")
newsTxt <- newsTxt[35001:77259]
newsTxt <- iconv(newsTxt, to = "latin1")
newsTxt <- (newsTxt[!is.na(newsTxt)])
newsTxt <- paste(newsTxt, collapse = " ")

# Add text documents to corpus
docs <- VCorpus(VectorSource(newsTxt))

# ====================
# Process documents
# ====================

# Extract character vector of same file
# from the corpus & write to text file
wAll <- function(){
  allTxt <- lapply(docs[1],as.character)
  allTxt <- unlist(allTxt)
  con <- file("all.txt","w")
  writeLines(allTxt, con = con, sep = "")
  close(con)
}

# Function to remove certain punctuation
rmPunct <- function(x) {
  x <- gsub("[\x7b-\xff]","",x)
  # x <- gsub("[Ââð]","",x)
  x <- gsub("(--)+","",x)
  x <- gsub("'", "\001", x)
  x <- gsub("(\\w)-(\\w)", "\\1\002\\2", x)  # preserve intra-word dashes
  x <- gsub("#","\003", x)
  x <- gsub("[[:punct:]]+", "", x)
  x <- gsub("\001", "'", x, fixed = TRUE)
  x <- gsub("\002", "-", x, fixed = TRUE)
  x <- gsub("\003", "#", x, fixed = TRUE)
}

# Remove punctuation
docs <- tm_map(docs, content_transformer(rmPunct))

# Read in list of bad words
badWords <- readLines("../badWords/badWords.txt", encoding = "latin1", skipNul = TRUE)

# Remove bad words
docs <- tm_map(docs, removeWords, badWords)

# Remove numbers
docs <- tm_map(docs, removeNumbers)  

# Convert characters to lower case
docs <- tm_map(docs, content_transformer(tolower))  

# Strip white space 
docs <- tm_map(docs, stripWhitespace)

# Function to remove certain punctuation
rmMisc <- function(x) {
  x <- gsub("(\\s)-(\\s)","",x)
  x <- gsub("(\\s)-(\\w)","",x)
  x <- gsub("(\\s)#(\\s)","",x)
  x <- gsub("(\\w)#(\\s)","",x)
  x <- gsub("(\\w){35,}","",x)
  x <- gsub("^-","",x)
  x <- gsub("^##|^#-|^#$","",x)
  x <- gsub("(.)\\1{5,}","",x)
  x <- gsub("(\\w)#(\\w)","",x)
}

# Remove misc punctuation
docs <- tm_map(docs, content_transformer(rmMisc))  

# Treat as plain text document
docs <- tm_map(docs, PlainTextDocument)

wAll()

# ===========================================
# Create and Examine the Term-Document Matrix
# ===========================================

library(RWeka)
library(SnowballC)


# Create Tokenizer Functions
BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
TrigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))

# Create tdm2
#tdm2 <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))

# Write tdm2 to CSV file
#tdMtrx2 <- as.matrix(tdm2)
#write.csv(tdMtrx2, file = "tdm2.csv")
#saveRDS(tdm2, file = "tdm2.rds")

# Create tdm3
tdm3 <- TermDocumentMatrix(docs, control = list(tokenize = TrigramTokenizer))

# Write tdm3 to CSV file
tdMtrx3 <- as.matrix(tdm3)
write.csv(tdMtrx3, file = "tdm3.csv")
saveRDS(tdm3, file = "tdm3.rds")

# Move all files
file.copy("all.txt",dir)
file.remove("all.txt")
file.copy("tdm2.csv",dir)
file.remove("tdm2.csv")
file.copy("tdm3.csv",dir)
file.remove("tdm3.csv")
file.copy("tdm2.rds",dir)
file.remove("tdm2.rds")
file.copy("tdm3.rds",dir)
file.remove("tdm3.rds")

