# ===========================================
# n7 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows

dfAll <- readRDS("df.rds")


df <- dfAll[30000000:31000000,]  # "uv"

df <- dfAll[32000000:33000000,]  # "w"

df <- dfAll[32000000:33496870,]  # "xyz"


# ------------------------------
# w

dL <- grepl("^[w]",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[w]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

dL <- grepl("^w-|^w[a-e]",DF$wrd2)
w1DF <- DF[dL,]

dL <- grepl("^w[e-h]",DF$wrd2)
w2DF <- DF[dL,]

dL <- grepl("^w[i-z]",DF$wrd2)
w3DF <- DF[dL,]

saveRDS(w1DF,"w1.rds")
saveRDS(w2DF,"w2.rds")
saveRDS(w3DF,"w3.rds")

rm(DF,df,t,aout,dL)

# ------------------------------
# xyz

dL <- grepl("^[xyz]",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[z]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

xyz <- DF

saveRDS(xyz,"xyz.rds")

rm(DF,df,t,aout,dL)
