# splitMergeReduce

The splitMergeReduce repo contains the scripts used to process the term document matrices (TDM) generated for use in the textPredict app.  This was part of the Coursera - Johns Hopkins Data Science Capstone Project.  A series of 2 and 3 term TDMs was generated using R's tm and RWeka packages.  The TDMs were created from a large text collection of blogs, news articles, and tweets provided by the SwiftKey company. 

The English version of SwiftKey's data set was over 400 MBs in size.  It contained approximately 2.2 million tweets, 900K blogs and 77K news articles.  Due to size of the data set and the memory limitations of the computer used in the project, 21 sets of TDMs were created and then merged to form a single data frame with over 36 million rows of terms.  

The final TDM was then split into 42 separate data sets, arranged alphabetically according to the second word in each 2 or 3 term TDM.  Rows where the first and second terms matched were compared by word counts, and the sets with the smaller word counts were eliminated to reduce the size of the data set, and to identify the most commonly predicted word choice for the third word predicted by each TDM.  

# Scripts and their purpose:

1_tokenizer.R: N-gram tokenizer used to generate TDMs.
2_merge.R:
  - Joins the 2 and 3 term TDMs.
  - Removes certain anomalities from TDMs.
  - Merges TDMs into one data frame.
3_reduce.R - Eliminates word choices with lower counts.
4_reduce2.R - Eliminates more than 4 word choices.
n1.R - n7.R - Separates the TDMs alphabetically.



