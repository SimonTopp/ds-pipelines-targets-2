source("2_process/src/process_and_style.R")

p2_targets_list <- list(
  tar_target(
    p2_site_data_munged, 
    process_data(p1_site_data_csv, p1_site_info)
  )
)