# ===========================================
# n5 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows - 1st run
# Total 36,804,676 rows - 2nd run

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[16500000:19000000,] # "m"
#df <- dfAll[18500000:19500000,] # "n"
#df <- dfAll[19000000:21000000,] # "o"
#df <- dfAll[20500000:22500000,] # "p"
#df <- dfAll[22000000:24000000,] # "qr"

# ------------------------------
# m
dL <- grepl("^m",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[m]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

dL <- grepl("^m[a-i|^m-]",DF$wrd2)
m1DF <- DF[dL,]

dL <- grepl("^m[j-z]",DF$wrd2)
m2DF <- DF[dL,]

saveRDS(m1DF,"m1.rds")
saveRDS(m2DF,"m2.rds")


# ------------------------------
# n

dL <- grepl("^n",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[n]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

saveRDS(DF,"n.rds")

# ------------------------------
# o

dL <- grepl("^o",df$wrd2)
DF <- df[dL,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd3)
DF <- DF[!aout,]

# Subset "o"
dL <- grepl("^o$|^o-|^o[a-m]",DF$wrd2)
o1DF <- DF[dL,]

dL <- grepl("^o[n-z]",DF$wrd2)
o2DF <- DF[dL,]

saveRDS(o1DF,"o1.rds")
saveRDS(o2DF,"o2.rds")


# ------------------------------
# p

dL <- grepl("^p",df$wrd2)
DF <- df[dL,]

# Remove single "letter"
aout <- grepl("^[p]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

# Subset "p"
dL <- grepl("^p-|^p[a-m]",DF$wrd2)
p1DF <- DF[dL,]

dL <- grepl("^p[n-z]",DF$wrd2)
p2DF <- DF[dL,]

saveRDS(p1DF,"p1.rds")
saveRDS(p2DF,"p2.rds")

# ------------------------------
# qr

dL <- grepl("^q|^r",df$wrd2)
DF <- df[dL,]

# Remove single "letter q"  
aout <- grepl("^[q]$",DF$wrd2)
DF <- DF[!aout,]

# Remove single "letter r"  
aout <- grepl("^[r]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
DF <- DF[!aout,]

saveRDS(DF,"qr.rds")

