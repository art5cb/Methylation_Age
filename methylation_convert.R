getwd()
temp <- read.table("SRR3465523_Mixed-1_1_trimmed_GRCm38_bismark_bt2.bismark.csv", header = FALSE, sep="\t", stringsAsFactors=TRUE)
temp
str(temp)
length(temp)
nrow(temp)
selected <- ('4')
chr4_data <- temp[temp$V1 %in% selected,]
chr4_data
chr4_data_meth_sites <- chr4_data$V2
chr4_data_meth_sites

data = read.table("HPC_1_S26746_epilog.csv", header = FALSE, sep="\t", stringsAsFactors = TRUE)
str(data)
length(data)
nrow(data)
selected2 <- ('chr4')
chr4_data2 <- data[data$V1 %in% selected2,]
chr4_data2
selected_pos <- ('+')
chr4_data2_pos <- chr4_data2[chr4_data2$V3 %in% selected_pos,]
chr4_data2_pos

selected_neg <- ('-')
chr4_data2_neg <- chr4_data2[chr4_data2$V3 %in% selected_neg,]
chr4_data2_neg

meth_sites_pos_data <- chr4_data2_pos$V2
meth_sites_pos_data

meth_sites_neg_data <- chr4_data2_neg$V2
meth_sites_neg_data 

length(chr4_data_meth_sites)
i <- 0
pos_overlap <- 0
site <- 0
site <- chr4_data_meth_sites[1]
site
for(row in 1:length(chr4_data_meth_sites)) {
  site <- chr4_data_meth_sites[row]
  #site <- meth_sites_pos_data[1]
  site
  if(site %in% meth_sites_pos_data){
    #print('true')
    i<- i+1
    pos_overlap[i] <- site
  }
    
}
pos_overlap
length(pos_overlap)

i <- 0
neg_overlap <- 0
site <- 0

for(row in 1:length(chr4_data_meth_sites)) {
  site <- chr4_data_meth_sites[row]
  #site <- meth_sites_pos_data[1]
  site
  if(site %in% meth_sites_neg_data){
    #print('true')
    i<- i+1
    neg_overlap[i] <- site
  }
  
}
neg_overlap
length(neg_overlap)

chr4_data2
chr4_data

out <- data_convert(data)
t <- data[1,]
t
diff()
  
data_convert <- function(input){
  c <- 1
  update <- input
  temp_df <- 0
  store <- 0
  selected_pos <- ('+')

  for(row in 1:(length(update)-1)){
    store <- update[row,]
    print(store)
    if(selected_pos == store$V3){
      val <- store$V2
      val <- val + 1
      if(update[row+1,]$V2 == val){
        row <- row + 1
        store <- update[row,]
      }
      else
      {
        store <- update[row,]
        store$V2 <- val
      }
    }
    temp_df[c] <- store
    c <- c+1 
  }
  return(temp_df)
  
}




#count_Pos <- meth_sites_pos_data[meth_sites_pos_data %in% chr4_data_meth_sites,]
#count_Pos <- chr4_data_meth_sites[chr4_data_meth_sites %in% meth_sites_pos_data,]
#length(unique(count_Pos))




