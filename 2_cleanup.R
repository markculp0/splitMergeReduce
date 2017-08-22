
# ================================================
# 2. Clean up
# -----------
# Script to clean up some of the problems observed
# in the individual "df4" files.  Words with leading
# and trailing dashes, excessive repeated characters,
# the same word repeated in wrd1 and wrd2, and # signs
# in between words are removed here.
# ================================================
# Remove dashes : wrd1
sum(grepl("^-", df4$wrd1))
dashed <- grepl("^-", df4$wrd1)
df4 <- df4[!dashed,]
rm(dashed)

# Remove dashes : wrd2
sum(grepl("^-", df4$wrd2))
dashed <- grepl("^-", df4$wrd2)
df4 <- df4[!dashed,]
rm(dashed)

# Remove dashes : wrd3
sum(grepl("^-", df4$wrd3))
dashed <- grepl("^-", df4$wrd3)
df4 <- df4[!dashed,]
rm(dashed)

# ------------------------------

# Remove #s : wrd1
sum(grepl("^##|^#-|^#$", df4$wrd1))
dashed <- grepl("^##|^#-|^#$", df4$wrd1)
df4 <- df4[!dashed,]
rm(dashed)

# Remove #s : wrd2
sum(grepl("^##|^#-|^#$", df4$wrd2))
dashed <- grepl("^##|^#-|^#$", df4$wrd2)
df4 <- df4[!dashed,]
rm(dashed)

# Remove #s : wrd3
sum(grepl("^##|^#-|^#$", df4$wrd3))
dashed <- grepl("^##|^#-|^#$", df4$wrd3)
df4 <- df4[!dashed,]
rm(dashed)

# ------------------------------

# Remove repeated chars : wrd1
sum(grepl("(.)\\1{5,}",df4$wrd1))
dashed <- grepl("(.)\\1{5,}", df4$wrd1)
df4 <- df4[!dashed,]
rm(dashed)

# Remove repeated chars : wrd2
sum(grepl("(.)\\1{5,}",df4$wrd2))
dashed <- grepl("(.)\\1{5,}", df4$wrd2)
df4 <- df4[!dashed,]
rm(dashed)

# Remove repeated chars : wrd3
sum(grepl("(.)\\1{5,}",df4$wrd3))
dashed <- grepl("(.)\\1{5,}", df4$wrd3)
df4 <- df4[!dashed,]
rm(dashed)


# ------------------------------

# Remove #s : wrd1
sum(grepl("(\\w)#(\\w)", df4$wrd1))
dashed <- grepl("(\\w)#(\\w)", df4$wrd1)
df4 <- df4[!dashed,]
rm(dashed)

# Remove #s : wrd2
sum(grepl("(\\w)#(\\w)", df4$wrd2))
dashed <- grepl("(\\w)#(\\w)", df4$wrd2)
df4 <- df4[!dashed,]
rm(dashed)

# Remove #s : wrd3
sum(grepl("(\\w)#(\\w)", df4$wrd3))
dashed <- grepl("(\\w)#(\\w)", df4$wrd3)
df4 <- df4[!dashed,]
rm(dashed)

# ------------------------------


# Remove duplicate words in wrd1 and wrd2
col1_2<- (df4$wrd1 == df4$wrd2)
colNAs <- is.na(col1_2)
col1_2[colNAs] <- FALSE
sum(col1_2)
df4 <- df4[!col1_2,]
rm(col1_2,colNAs)

# Remove duplicate words in wrd2 and wrd3
col2_3<- (df4$wrd2 == df4$wrd3)
colNAs <- is.na(col2_3)
col2_3[colNAs] <- FALSE
sum(col2_3)
df4 <- df4[!col2_3,]
rm(col2_3,colNAs)

