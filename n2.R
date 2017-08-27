# ===========================================
# n2 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[3500001:5500000,]  # For "b"
#df <- dfAll[5300001:7500000,]  # For "c"

# ------------------------------

# Create an "b" df
bL <- grepl("^b",df$wrd2)
bDF <- df[bL,]

# Remove single "b"
aout <- grepl("^[b]$",bDF$wrd2)
bDF <- bDF[!aout,]

# Subset "b"
b1L <- grepl("^b[a-l]|^b-",bDF$wrd2)
b1DF <- bDF[b1L,]

b2L <- grepl("^b[m-z]",bDF$wrd2)
b2DF <- bDF[b2L,]

saveRDS(b1DF,"b1.rds")
saveRDS(b2DF,"b2.rds")


# ------------------------------

# Create an "c" df
cL <- grepl("^c",df$wrd2)
cDF <- df[cL,]

# Subset "c"
c1L <- grepl("^c[a-n]|^c-",cDF$wrd2)
c1DF <- cDF[c1L,]

c2L  <- grepl("^c[o-z]",cDF$wrd2)
c2DF <- cDF[c2L,]

saveRDS(c1DF,"c1.rds")
saveRDS(c2DF,"c2.rds")

# ------------------------------


