# ===========================================
# n4 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows


dfAll <- readRDS("df.rds")


df <- dfAll[10500000:12000000,] # For "g"

df <- dfAll[11500000:13500000,] # For "h"

df <- dfAll[13500000:15500000,] # For "i"

df <- dfAll[15000000:16000000,] # "j,k"

df <- dfAll[15500000:17000000,] # "l"


# ------------------------------
# Create an "h" df
hL <- grepl("^h",df$wrd2)
hDF <- df[hL,]

# Remove single "h"
aout <- grepl("^[h]$",hDF$wrd2)
t <- hDF[aout,]
sum(aout)
hDF <- hDF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",hDF$wrd2)
t <- hDF[aout,]
sum(aout)
hDF <- hDF[!aout,]

hL <- grepl("^h[a-f]",hDF$wrd2)
h1DF <- hDF[hL,]

hL <- grepl("^h[g-z]",hDF$wrd2)
h2DF <- hDF[hL,]

saveRDS(h1DF,"h1.rds")
saveRDS(h2DF,"h2.rds")

# ------------------------------
# i:
# ------------------------------

dL <- grepl("^i",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  NA 
aout <- grepl("^[i]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd3)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Split into 3
dL <- grepl("^i$|^i[-|a-m]",DF$wrd2)
i1DF <- DF[dL,]

dL <- grepl("^in",DF$wrd2)
i2DF <- DF[dL,]

dL <- grepl("^i[o-z]",DF$wrd2)
i3DF <- DF[dL,]

saveRDS(i1DF,"i1.rds")
saveRDS(i2DF,"i2.rds")
saveRDS(i3DF,"i3.rds")

# ------------------------------
# jk

dL <- grepl("^j|^k",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[j]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]


# Remove single "letter"  
aout <- grepl("^[k]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

saveRDS(DF,"jk.rds")

# ------------------------------
# "l"

dL <- grepl("^l",df$wrd2)
DF <- df[dL,]

# Remove single "letter"  
aout <- grepl("^[l]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
t <- DF[aout,]
sum(aout)
DF <- DF[!aout,]

dL <- grepl("^l[a-i]",DF$wrd2)
l1DF <- DF[dL,]

dL <- grepl("^l[j-z]",DF$wrd2)
l2DF <- DF[dL,]

saveRDS(l1DF,"l1.rds")
saveRDS(l2DF,"l2.rds")



