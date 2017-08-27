# ===========================================
# n7 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows - 1st run
# Total 36,804,676 rows - 2nd run

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[30000000:31000000,]  # "uv"
#df <- dfAll[32000000:33000000,]  # "w"
#df <- dfAll[32000000:33496870,]  # "xyz"

# ------------------------------------
# uv

dL <- grepl("^u|^v",df$wrd2)
DF <- df[dL,]

# Remove single "letter u"  
aout <- grepl("^[u]$",DF$wrd2)
DF <- DF[!aout,]

# Remove single "letter v"  
aout <- grepl("^[v]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

saveRDS(DF,"uv.rds")

# ------------------------------
# w

dL <- grepl("^[w]",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[w]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
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

# ------------------------------
# xyz

dL <- grepl("^[xyz]",df$wrd2)
DF <- df[dL,]

# Remove single "letter x"  
aout <- grepl("^[x]$",DF$wrd2)
DF <- DF[!aout,]

# Remove single "letter y"  
aout <- grepl("^[y]$",DF$wrd2)
DF <- DF[!aout,]

# Remove single "letter z"  
aout <- grepl("^[z]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

xyz <- DF

saveRDS(xyz,"xyz.rds")

