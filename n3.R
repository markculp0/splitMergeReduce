# ===========================================
# n3 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[7000000:8500000,] # For "d"
#df <- dfAll[8000000:9500000,] # For "e"
#df <- dfAll[9300000:11500000,] # For "f"

# ------------------------------
# Create an "d" df
dL <- grepl("^d",df$wrd2)
dDF <- df[dL,]

# Remove single "d"
aout <- grepl("^[d]$",dDF$wrd2)
dDF <- dDF[!aout,]

aout <- grepl("^[d][-]$",dDF$wrd2)
dDF <- dDF[!aout,]

aout <- grepl("[-]$",dDF$wrd2)
dDF <- dDF[!aout,]

# Subset "d"
dL <- grepl("^d[a-n]|^d-",dDF$wrd2)
d1DF <- dDF[dL,]

dL <- grepl("^d[o-z]",dDF$wrd2)
d2DF <- dDF[dL,]

saveRDS(d1DF,"d1.rds")
saveRDS(d2DF,"d2.rds")

# ------------------------------
# Create an "e" df
eL <- grepl("^e",df$wrd2)
eDF <- df[eL,]

# Remove single "e"
aout <- grepl("^[e]$",eDF$wrd2)
eDF <- eDF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",eDF$wrd2)
eDF <- eDF[!aout,]

saveRDS(eDF,"e.rds")

# ------------------------------
# Create an "f" df
fL <- grepl("^f",df$wrd2)
fDF <- df[fL,]

# Remove single "f" 
aout <- grepl("^[f]$",fDF$wrd2)
fDF <- fDF[!aout,]

# Remove words ending w "-"
aout <- grepl("[-]$",fDF$wrd2)
fDF <- fDF[!aout,]

# Subset "f"
f1L <- grepl("^f[a-n]",fDF$wrd2)
f1DF <- fDF[f1L,]

f2L <- grepl("^f[o-z]",fDF$wrd2)
f2DF <- fDF[f2L,]

saveRDS(f1DF,"f1.rds")
saveRDS(f2DF,"f2.rds")
