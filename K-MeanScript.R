# Load libraries
library(ggplot2)
library(stats) # For kmeans()
library(dplyr)

# --- 1. Prepare Data ---
# We'll use your 'All' dataframe and rename the column for easier use.
# We only need the one column for clustering.
df_cluster <- All %>%
  rename(pct_proficient = `% Level 3+4`) %>%
  select(pct_proficient)

# --- 2. Find Optimal k (Elbow Method) ---
# This helps confirm if 3 clusters is a good choice.
set.seed(123) # for reproducible results
wss <- numeric(10) # Within-sum-of-squares

for (i in 1:10) {
  km_model <- kmeans(df_cluster$pct_proficient, centers = i, nstart = 25)
  wss[i] <- km_model$tot.withinss
}

# Create a dataframe for plotting the elbow curve
wss_df <- data.frame(k = 1:10, wss = wss)

# Plot the elbow curve
# Look for the "elbow" - the point where the line starts to bend less.
# This often suggests the best number of clusters.
print(
  ggplot(wss_df, aes(x = k, y = wss)) +
    geom_line() +
    geom_point() +
    scale_x_continuous(breaks = 1:10) +
    labs(
      title = "Elbow Method for Optimal k",
      x = "Number of Clusters (k)",
      y = "Total Within-Sum-of-Squares"
    ) +
    theme_minimal()
)


# --- 3. Run k-means with k=3 ---
# Based on your request for "low, medium, high", we will set k=3.
set.seed(123)
k <- 3
km_final <- kmeans(df_cluster$pct_proficient, centers = k, nstart = 25)


# --- 4. Analyze Cluster Results ---
# This is the main answer. We add the cluster assignment back to the data.
all_with_clusters <- All %>%
  rename(pct_proficient = `% Level 3+4`) %>%
  mutate(cluster = km_final$cluster)

# Now, let's find the "decision lines" (boundaries)
# We group by cluster and find the min and max of each.
cluster_summary <- all_with_clusters %>%
  group_by(cluster) %>%
  summarise(
    min_pct = min(pct_proficient),
    max_pct = max(pct_proficient),
    avg_pct = mean(pct_proficient), # This is the cluster "center"
    count = n()
  ) %>%
  arrange(avg_pct) # Sort by the average to see "Low", "Medium", "High"

# Print the summary table. This shows your new data-driven categories!
print("K-Means Cluster Summary:")
print(cluster_summary)

# --- 5. Visualize the Clusters ---
# This histogram shows the distribution of your data, colored by the new clusters.
# The vertical lines show the "center" of each cluster.
print(
  ggplot(all_with_clusters, aes(x = pct_proficient, fill = factor(cluster))) +
    geom_histogram(binwidth = 2, color = "white", alpha = 0.8) +
    geom_vline(
      data = as.data.frame(km_final$centers),
      aes(xintercept = V1, color = factor(1:k)),
      linetype = "dashed",
      linewidth = 1.5,
      show.legend = FALSE
    ) +
    labs(
      title = "K-Means Clustering of Proficiency (% Level 3+4)",
      x = "% Proficient (Level 3+4)",
      y = "Count of District-Years",
      fill = "Cluster"
    ) +
    theme_minimal()
)
