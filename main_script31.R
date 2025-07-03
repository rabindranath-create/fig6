# main_script11.R




# Make sure working directory is the same as the script location (implicitly handled in GitHub Actions)
# Print working directory
cat("Working directory:", getwd(), "\n")

# Set up and confirm output folder
output_dir <- file.path(getwd(), "outputs/script31")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
cat("Created directory:", output_dir, "\n")

# Confirm contents before saving
print("Files in 'outputs' before saving:")
print(list.files("outputs", recursive = TRUE))

# Save dummy test file just to verify
writeLines("test", file.path(output_dir, "test.txt"))




# Load the helper script
source("RD_and_DT_Algorithm_copy.R")  # Ensure this file is in the same directory

lambda <- 2
results_6 <- data.frame(
  Run = integer(),
  N_c = integer(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer()
)


for (i in 1:100) {
  set.seed(i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 150)
  result <- RD_Alg_O(obs_gen_para, lambda)
  
  results_6[i, ] <- list(
    Run = i,
    N_c = 150,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state)
  )
}

saveRDS(results_6, file.path(output_dir, "data_50_4_6.rds"))



results_7 <- data.frame(
  Run = integer(),
  N_c = integer(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer()
)


for (i in 1:100) {
  set.seed(i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 175)
  result <- RD_Alg_O(obs_gen_para, lambda)
  
  results_7[i, ] <- list(
    Run = i,
    N_c = 175,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state)
  )
}

saveRDS(results_7, file.path(output_dir, "data_50_4_7.rds"))




results_8 <- data.frame(
  Run = integer(),
  N_c = integer(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer()
)


for (i in 1:100) {
  set.seed(i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 200)
  result <- RD_Alg_O(obs_gen_para, lambda)
  
  results_8[i, ] <- list(
    Run = i,
    N_c = 200,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state)
  )
}

saveRDS(results_8, file.path(output_dir, "data_50_4_8.rds"))





results_9 <- data.frame(
  Run = integer(),
  N_c = integer(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer()
)


for (i in 1:100) {
  set.seed(i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 225)
  result <- (obs_gen_para, lambda)
  
  results_9[i, ] <- list(
    Run = i,
    N_c = 225,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state)
  )
}

saveRDS(results_9, file.path(output_dir, "data_50_4_9.rds"))

results <- rbind(results_6, results_7, results_8, results_9)


# Format output
results_out <- data.frame(
  Index = paste0('"', 1:nrow(results), '"'),  # Quoted index
  results[, c("N_c", "Length", "Cost", "NumDisambigs")]  # Make sure column names match
)

# Define the custom header (space-separated, quoted)
header <- '"number of obstacles" "length" "cost" "number of disambiguations"'

# Define output path
txt_path <- file.path(output_dir, "result_RD_obstacle.txt")

# Write header manually
writeLines(header, txt_path)

# Append data
write.table(
  results_out,
  file = txt_path,
  append = TRUE,
  row.names = FALSE,
  col.names = FALSE,
  quote = FALSE,
  sep = " "
)

cat("✅ Text results saved to:", txt_path, "\n")
