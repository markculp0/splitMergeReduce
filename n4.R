# ===========================================
# n4 script
# ---------
# Subset the merged data frame alphabetically
# ===========================================

# Total 33,496,870 rows - 1st run
# Total 36,804,676 rows - 2nd run

df <- readRDS("df.rds")

#dfAll <- readRDS("df.rds")
#df <- dfAll[10500000:12000000,] # For "g"
#df <- dfAll[11500000:13500000,] # For "h"
#df <- dfAll[13500000:15500000,] # For "i"
#df <- dfAll[15000000:16000000,] # "j,k"
#df <- dfAll[15500000:17000000,] # "l"

# ------------------------------
# Create an "g" df

gL <- grepl("^g",df$wrd2)
gDF <- df[gL,]

# Remove single "g"
aout <- grepl("^[g]$",gDF$wrd2)
gDF <- gDF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",gDF$wrd2)
gDF <- gDF[!aout,]

saveRDS(gDF,"g.rds")

# ------------------------------
# Create an "h" df
hL <- grepl("^h",df$wrd2)
hDF <- df[hL,]

# Remove single "h"
aout <- grepl("^[h]$",hDF$wrd2)
hDF <- hDF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",hDF$wrd2)
hDF <- hDF[!aout,]

# Subset  "h"
hL <- grepl("^h[a-f]|^h-",hDF$wrd2)
h1DF <- hDF[hL,]

hL <- grepl("^h[g-z]",hDF$wrd2)
h2DF <- hDF[hL,]

saveRDS(h1DF,"h1.rds")
saveRDS(h2DF,"h2.rds")

# ------------------------------
# Create an "i" df

dL <- grepl("^i",df$wrd2)
DF <- df[dL,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd3)
DF <- DF[!aout,]

# Subset into 3 "i"
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
DF <- DF[!aout,]

# Remove single "letter"  
aout <- grepl("^[k]$",DF$wrd2)
DF <- DF[!aout,]

# Remove word ending in "-"
aout <- grepl("[-]$",DF$wrd2)
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

dL <- grepl("^l[a-i]|^l-",DF$wrd2)
l1DF <- DF[dL,]

dL <- grepl("^l[j-z]",DF$wrd2)
l2DF <- DF[dL,]

saveRDS(l1DF,"l1.rds")
saveRDS(l2DF,"l2.rds")



