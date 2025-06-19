## need to chnage nmaes to match with the landings age data and rdbes ##

generate_ALK <- function(data, count_col = "count", group_vars = c("YEAR", "Species", "AGE", "Length")) {
  # Ensure required package is available
  if (!requireNamespace("dplyr", quietly = TRUE)) stop("Please install the 'dplyr' package.")
  
  # Load dplyr functions
  library(dplyr)
  
  # Create age-length frequency table
  alk_age <- data %>%
    group_by(across(all_of(group_vars))) %>%
    summarise(N.len.age = sum(.data[[count_col]], na.rm = TRUE), .groups = "drop")
  
  # Remove AGE from group to get total length frequency (denominator)
  group_no_age <- setdiff(group_vars, "AGE")
  
  alk_total <- data %>%
    group_by(across(all_of(group_no_age))) %>%
    summarise(N.len = sum(.data[[count_col]], na.rm = TRUE), .groups = "drop")
  
  # Merge and calculate proportion
  alk <- merge(alk_age, alk_total, by = group_no_age)
  alk$ppn <- alk$N.len.age / alk$N.len
  alk <- subset(alk, select = -c(N.len.age,N.len))
  # Ensure AGE is numeric
  if ("AGE" %in% names(alk)) {
    alk$AGE <- as.numeric(as.character(alk$AGE))
  }
  
  return(alk)
}

## function to drop columns
drop_cols <- function(df, cols) {
  df[, !(names(df) %in% cols), drop = FALSE]
}

# Function to merge with ALK and remove missing AGE
apply_alk <- function(data, alk, alk_name, verbose = TRUE) {
  merged <- merge(data, alk, all.x = TRUE)
  missing <- merged[is.na(merged$AGE), ]
  assigned <- merged[!is.na(merged$AGE), ]
  if (verbose) {
    cat("\n---", alk_name, "---\n")
    print(summary(merged))
  }
  missing <- drop_cols(missing, c("AGE", "N.len.age", "ppn", "N.len"))
  return(list(assigned = assigned, missing = missing))
}

