### Create a function to pull down individual sites because our website
### is 'glitchy'.  This avoids repulling everything if an individual site fails

download_nwis_data <- function(site_num, parameterCd = '00010', 
                               startDate="2014-05-01", endDate="2015-05-01"){
  
  filepath <- file.path('1_fetch/tmp',paste0(site_num,'.csv'))
  
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

### Pull the site information for the full dataset
nwis_site_info <- function(fileout, site_data){
  site_no <- unique(site_data$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
  return(fileout)
}




