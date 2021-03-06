
# ============================================
# 5. Reduce the data set 
# ----------------------
# Script to reduce the size of the data set 
# by eliminating word ties.  For word choices
# where the word counts are the same, this script 
# arbitrarily selects the first 4 matches by 
# descending count.   
# This script was applied to the individual 
# alphabetically ordered data sets generated by 
# the n# scripts.
# ============================================

library(dplyr)

# Get list of each file in dir
rdsFileList <- dir()
rdsFileListCnt <- length(rdsFileList)

# Outer for loop to repeat for each file
for (rdsFileN in 1:rdsFileListCnt) {

# Open rdsFile as "df"  
rdsFile <- rdsFileList[rdsFileN]
df <- readRDS(rdsFile)  

# Create a temporary matrix to hold matched rows  
dfSize = dim(df)[1]
mSize = (dfSize * 2) + 2
mSzHalf = mSize/2

# Create temp matrix large enough to hold df matches
m <- matrix(numeric(mSize),nrow=mSzHalf,ncol=2)
mRow <- 1

# Set initial booleans
foundMatch <- FALSE
firstMatch <- TRUE

# Create logical vector for rows to delete
tfDel <- logical(dfSize)

# For each row in df
for (i in 2:nrow(df)) {

  # Remove NAs
  if (is.na(df[i,1])) {df[i,1] <- ""} 
  if (is.na(df[i-1,1])) {df[i-1,1] <- ""}
  if (is.na(df[i,2])) {df[i,2] <- ""} 
  if (is.na(df[i-1,2])) {df[i-1,2] <- ""} 
  
  # If last wrd2 same as current wrd2, and,
  # last wrd1 same as current wrd1, 
  # store last row# and cnt cols in m,
  # increment mRow
  if (df[i,1] == df[i - 1,1] & df[i,2] == df[i - 1,2]){
    
    # Match was initially false, so prev row is first
    if (foundMatch == FALSE) {
      if (i == 2) {
        firstMatchRow <-  1
      }
      else if (firstMatch) {
        firstMatchRow <- (mRow)
      }
      else{
        firstMatchRow <- (mRow - 1)
      }
    }
    
    # Set match true
    foundMatch <- TRUE
    
    m[mRow,1] <- as.integer(i - 1)
    m[mRow,2] <- as.integer(df[(i - 1),4])
    
    mRow <- mRow + 1
  
  } # end if
  
  # If foundMatch is true,
  # but no match found this time,
  # set foundMatch to false, 
  # store last row# and count cols 
  # in m, get the maximum count in m, 
  # get the last row # of m, 
  #   If count of df rows in m > 4, 
  #   remove the rows > 4.
  # reset matrix m, set mRow back to 1
  
  else if (foundMatch == TRUE) {
    foundMatch <- FALSE
    
    m[mRow,1] <- (i - 1)
    m[mRow,2] <- as.integer(df[(i - 1),4])
    
    # Find last matrix row
    maxMatrixRow <- mRow

    # Allow 4 rows of matches
    skipN <- 0
    if (maxMatrixRow >= 4){
      skipN <- 4
    } else {
      skipN <- maxMatrixRow
    }
    
    # Remove all but first 4 rows of a match
    for (n in firstMatchRow + skipN:maxMatrixRow){
      x <- m[n,1]
      # Mark row for deletion
      tfDel[x] <- TRUE
    } # end for
      
    mRow <- mRow + 1
    
  } # end else if
  
} # end for loop

# --------
# Final if
# --------
# if you end on a matched list, find max
if (foundMatch == TRUE){
  m[mRow,1] <- as.integer(i)
  m[mRow,2] <- as.integer(df[i,4])

  # Find last matrix row
  maxMatrixRow <- mRow
  
  # Allow 4 rows of matches  
  skipN <- 0
  if (maxMatrixRow >= 4){
    skipN <- 4
  } else {
    skipN <- maxMatrixRow
  }
  
  # Remove all but first 4 rows of a match
  for (n in firstMatchRow + skipN:maxMatrixRow){
    x <- m[n,1]
    # Mark row for deletion
    tfDel[x] <- TRUE
  } # end for
  
} # end final if

# Delete rows that exceed 4 matches
df <- df[!tfDel,]

# Save the reduced size data set
saveRDS(df, rdsFile)

} # end outer for loop

# -------------
# End of Script
# -------------

