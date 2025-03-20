chrom <- unique(maize_sorted.df$Chromosome)


write_chrom_data <- function(chrom_num)
  {
  chrom_data.df <- filter(maize_sorted.df, Chromosome == chrom_num)
  file_name <- paste0('maize_chr_',chrom_num,'.txt')
  write.table (chrom_data.df, file = file_name, quote = FALSE, sep = '\t', row.names = FALSE, col.names = TRUE)
}
 
lapply (chrom, write_chrom_data)  


maize_rev_sorted.df <- maize.df %>%
  arrange (as.numeric(Chromosome),desc(as.numeric(Position)))
maize_rev_sorted.df[maize_rev_sorted.df == '?/?'] <- '-/-'


maize_pivot.df <- pivot_longer(maize_sorted.df, cols = -c(SNP_ID,Chromosome,Position), names_to = NULL, values_to = 'Genotype')
maize_pivot.df$Chromosome <- as.numeric(maize_pivot.df$Chromosome)
maize_pivot.df$Position <- as.numeric(maize_pivot.df$Position)
maize_SNP.df <- maize_pivot.df %>% drop_na()

maize_SNP.df$Zygosity <- ifelse (maize_SNP.df$Genotype %in% c('A/A','C/C','G/G','T/T'), 'Homozygous', ifelse(maize_SNP.df$Genotype == '?/?', 'Missing','Heterzygous'))








get_column_names <- function(data, row_index, value) {
# Identify columns where the row contains the specified value
cols <- which(data[row_index, ] == value)
# Return the column names
colnames(data)[cols]
}

get_column_names(maize_transpose.df, row_index = 'Group', value = 'ZMMLR')
get_column_names(maize_transpose.df, row_index = 'Group', value = 'ZMMIL')
get_column_names(maize_transpose.df, row_index = 'Group', value = 'ZMMMR')
get_column_names(teosinte_transpose.df, row_index = 'Group', value = 'ZMPBA')
get_column_names(teosinte_transpose.df, row_index = 'Group', value = 'ZMPIL')
get_column_names(teosinte_transpose.df, row_index = 'Group', value = 'ZMPJA')