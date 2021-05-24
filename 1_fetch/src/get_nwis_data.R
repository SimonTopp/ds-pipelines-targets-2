### Create a function to pull down individual sites because our website
### is 'glitchy'.  This avoids repulling everything if an individual site fails

download_nwis_data <- function(filepath, parameterCd = '00010', 
                               startDate="2014-05-01", endDate="2015-05-01"){
  
  site_num <- basename(filepath) %>% str_extract(pattern = "(?:[0-9]+)")
  
  # readNWISdata is from the dataRetrieval package
  data_out <- readNWISdata(sites=site_num, service="iv", 
                           parameterCd = parameterCd, startDate = startDate, endDate = endDate)
  
  # -- simulating a failure-prone web-sevice here, do not edit --
  set.seed(Sys.time())
  if (sample(c(T,F,F,F), 1)){
    stop(site_num, ' has failed due to connection timeout. Try tar_make() again')
  }
  # -- end of do-not-edit block
  
  write_csv(data_out, file = filepath)
  return(filepath)
}


## Combine the site csv's
combine_sites <- function(site_files, file_out){
  site_files %>% map_dfr(read_csv, col_types = 'ccTdcc') %>%
  write_csv(file_out)
return(file_out)
}  

### Pull the site information for the full dataset
nwis_site_info <- function(site_data_csv){
  site_data <- read_csv(site_data_csv)
  site_no <- unique(site_data$site_no)
  dataRetrieval::readNWISsite(site_no)
  #write_csv(site_info, fileout)
  #return(fileout)
}
