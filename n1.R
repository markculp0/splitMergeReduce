# ===========================================
# n1 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows

dfAll <- readRDS("df.rds")

df <- dfAll[1:3600000,]

# Create hashTag df
hashTagL <- grepl("^#",df$wrd2)
hashTag <- df[hashTagL,]
rm(hashTagL)

saveRDS(hashTag, "hashTag.rds")

# ------------------------------
# Create "aa" df
aaL <- grepl("^a$|^a-",df$wrd2)
aa <- df[aaL,]

saveRDS(aa,"aa.rds")

# Create an "a1" df
amL <- grepl("^a[a-m]",df$wrd2)
a1 <- df[amL,]

aout <- grepl("^aa\\b",a1$wrd2)
t <- a1[aout,]
sum(aout)
a1 <- a1[!aout,]

aout <- grepl("^aaa+",a1$wrd2)
a1 <- a1[!aout,]

saveRDS(a1,"a1.rds")

# ------------------------------

# Create an "a2" df
anL <- grepl("^an",df$wrd2)
a2 <- df[anL,]

saveRDS(a2,"a2.rds")

# ------------------------------

# Create an "a3" df
aoL <- grepl("^a[o-z]",df$wrd2)
a3 <- df[aoL,]

saveRDS(a3,"a3.rds")
# ------------------------------