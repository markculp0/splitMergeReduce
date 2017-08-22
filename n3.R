# ===========================================
# n3 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows


dfAll <- readRDS("df.rds")

df <- dfAll[3500001:5500000,]  # For "b"

df <- dfAll[5300001:7500000,]  # For "c"

df <- dfAll[7000000:8500000,] # For "d"

df <- dfAll[8000000:9500000,] # For "e"

df <- dfAll[9300000:11500000,] # For "f"



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
# Create an "d" df
dL <- grepl("^d",df$wrd2)
dDF <- df[dL,]

# Remove single "d"
aout <- grepl("^[d]$",dDF$wrd2)
t <- dDF[aout,]
sum(aout)
dDF <- dDF[!aout,]

aout <- grepl("^[d][-]$",dDF$wrd2)
t <- dDF[aout,]
sum(aout)
dDF <- dDF[!aout,]

aout <- grepl("[-]$",dDF$wrd2)
t <- dDF[aout,]
sum(aout)
dDF <- dDF[!aout,]

# Split d in two
dL <- grepl("^d[a-n]",dDF$wrd2)
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
t <- eDF[aout,]
sum(aout)
eDF <- eDF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",eDF$wrd2)
t <- eDF[aout,]
sum(aout)
eDF <- eDF[!aout,]

saveRDS(eDF,"e.rds")

# ------------------------------
# Create an "f" df
fL <- grepl("^f",df$wrd2)
fDF <- df[fL,]

# Remove single "f" and "f-"
aout <- grepl("^[f]$",fDF$wrd2)
t <- fDF[aout,]
sum(aout)
fDF <- fDF[!aout,]

# Remove words ending w "-"
aout <- grepl("[#]$",fDF$wrd2)
t <- fDF[aout,]
sum(aout)
fDF <- fDF[!aout,]

# Split f in two
f1L <- grepl("^f[a-n]",fDF$wrd2)
f1DF <- fDF[f1L,]

f2L <- grepl("^f[o-z]",fDF$wrd2)
f2DF <- fDF[f2L,]

saveRDS(f2DF,"f2.rds")
