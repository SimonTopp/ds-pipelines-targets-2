source("3_visualize/src/plot_timeseries.R")

p3_targets_list <- list(
  tar_target(
    p3_figure_1_temp_ts_png,
    plot_nwis_timeseries(fileout = "3_visualize/out/figure_1_temp_ts.png", p2_site_data_munged),
    format = "file"
  )
)