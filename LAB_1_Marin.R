fix_data <- function(df) {
  format_num_column <- function(original_col) {
    if (all(length(grep("[^0-9 .-]+", original_col)) == 0)) {
      original_col <- as.numeric(sub(' ', '', original_col))
    }
    return(original_col)
  }
  return(data.frame(lapply(df, format_num_column)))
}

df = read.csv('data.csv')
print(df)
print(fix_data(df))

#----------------------------------

get_id <- function(dfs) {
  merged = Reduce(function(x, y) merge(x, y, by='id'), dfs)
  return(data.frame(id=merged$id, mean_temp=rowMeans(merged[, -c(1)])))
}

load('RData')
print(get_id(data))