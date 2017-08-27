# ===========================================
# n6 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows - 1st run
# Total 36,804,676 rows - 2nd run

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[23500000:27000000,]  # "s"
#df <- dfAll[26500000:30500000,]  # "t"

# ------------------------------
# s
dL <- grepl("^s",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[s]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

dL <- grepl("^s-|^s[a-i]",DF$wrd2)
s1DF <- DF[dL,]

dL <- grepl("^s[j-p]",DF$wrd2)
s2DF <- DF[dL,]

dL <- grepl("^s[q-z]",DF$wrd2)
s3DF <- DF[dL,]

saveRDS(s1DF,"s1.rds")
saveRDS(s2DF,"s2.rds")
saveRDS(s3DF,"s3.rds")


# ------------------------------
# t

dL <- grepl("^t",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[t]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

# Subset "t"
dL <- grepl("^t-|^t[a-g]|^tha",DF$wrd2)
t1DF <- DF[dL,]

dL <- grepl("^the",DF$wrd2)
t2DF <- DF[dL,]

dL <- grepl("^th[i-z]|^t[i-n]",DF$wrd2)
t3DF <- DF[dL,]

dL <- grepl("^t[o-z]",DF$wrd2)
t4DF <- DF[dL,]

saveRDS(t1DF,"t1.rds")
saveRDS(t2DF,"t2.rds")
saveRDS(t3DF,"t3.rds")
saveRDS(t4DF,"t4.rds")

