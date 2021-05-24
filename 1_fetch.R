source("1_fetch/src/get_nwis_data.R")

p1_targets_list <- list(
  tar_target(
    p1_site_01427207_csv,
    download_nwis_data("1_fetch/tmp/01427207.csv"),
    format = 'file'
  ),
  tar_target(
    p1_site_01432160_csv,
    download_nwis_data("1_fetch/tmp/01432160.csv"),
    format = 'file'
  ),
  tar_target(
    p1_site_01435000_csv,
    download_nwis_data("1_fetch/tmp/01435000.csv"),
    format = 'file'
  ),
  tar_target(
    p1_site_01436690_csv,
    download_nwis_data("1_fetch/tmp/01436690.csv"),
    format = 'file'
  ),
  tar_target(
    p1_site_01466500_csv,
    download_nwis_data("1_fetch/tmp/01466500.csv"),
    format = 'file'
  ),
  tar_target(
    p1_site_data_csv,
    combine_sites(
      c(p1_site_01427207_csv, p1_site_01432160_csv, p1_site_01435000_csv, 
        p1_site_01436690_csv, p1_site_01466500_csv),
      file_out = "1_fetch/out/site_data.csv"),
    format ='file'
  ),
  tar_target(
    p1_site_info,
    nwis_site_info(p1_site_data_csv),
  )
)