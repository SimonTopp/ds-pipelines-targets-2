## Clean up the site data and join it to the site information.  Format it all
## for figure 1.

process_data <- function(site_data_csv, site_info){
  nwis_data <- read_csv(site_data_csv)
  #site_info <- read_csv(site_info_csv)
  
  nwis_data_clean <- nwis_data %>%
    rename(water_temperature = X_00010_00000) %>% 
    select(-agency_cd, -X_00010_00000_cd, -tz_cd) %>%
    left_join(site_info) %>%
    select(station_name = station_nm, site_no, dateTime, water_temperature, latitude = dec_lat_va, longitude = dec_long_va) %>%
    mutate(station_name = as.factor(station_name))
  
  return(nwis_data_clean)
}