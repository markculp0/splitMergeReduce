# ===========================================
# n2 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows


dfAll <- readRDS("df.rds")

df <- dfAll[3500001:5500000,]  # For "b"

df <- dfAll[5300001:7500000,]  # For "c"

# ------------------------------

# Create an "b" df
bL <- grepl("^b",df$wrd2)
bDF <- df[bL,]

# Remove single "b"
aout <- grepl("^[b]$",bDF$wrd2)
t <- bDF[aout,]
sum(aout)
bDF <- bDF[!aout,]

b1L <- grepl("^b[a-l]",bDF$wrd2)
b1DF <- bDF[b1L,]
saveRDS(b1DF,"b1DF.rds")

b2L <- grepl("^b[m-z]",bDF$wrd2)
b2DF <- bDF[b2L,]
saveRDS(b2DF,"b2DF.rds")


# ------------------------------

# Create an "c" df
cL <- grepl("^c",df$wrd2)
cDF <- df[cL,]

c1L <- grepl("^c[a-n]",cDF$wrd2)
c1DF <- cDF[c1L,]

c2L  <- grepl("^c[o-z]",cDF$wrd2)
c2DF <- cDF[c2L,]

saveRDS(c1DF,"c1DF.rds")
saveRDS(c2DF,"c2DF.rds")

# ------------------------------


