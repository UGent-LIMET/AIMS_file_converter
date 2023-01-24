# REIMS file converter microscript
###################################
# Title: Software framework for the processing and statistical analysis of multivariate MS-data
# Owner: Laboratory of Integrative Metabolomics (LIMET), Ghent university
# Creator: Dr. Marilyn De Graeve
# Maintainer: <limet@ugent.be>
# Script: REIMS file converter microscript

# this microscript runs outside the R pipeline 
# requirments: Windows OS and Dependencies folder present on computer
# to run, open in Rstudio, adjust the 'adjustments' below if needed and click "Source" to run the whole script
# no progressbars are shown, as long as red running symbol is visible, the script is calculating
# check file conversion succesful after finished (no symbols present)



#########adjustments############
#options
PATH_USER <- 'xxx/Pipeline_metabolomics/Input/bio' # example path user

#adjustments
PATH <- PATH_USER #location of folder with the .raw files

PATH_WATERSCONVERTER <- "xxx/Dependencies/WatersStringDump.exe"

#
#####################




# => DO NOT ADJUST CODE BELOW THIS POINT!
##########File_conversion##########
#time
print(Sys.time())
start_time <- Sys.time()
print("R pipeline - Part 0: File_conversion - start!")

#list all directories
setwd(PATH)
filenames <- list.files(PATH, pattern="*.raw", recursive = F, full.names = T) #not in sobfolders; give full path

#convert all files in dir to .txt
for(file_ in filenames){
  new_filename <- paste0(substr(file_, 1 ,(nchar(file_)-4)), ".txt")
  #command:
  #C:\xxx\WatersStringDump.exe C:\xxx\200323_A1_102_neg_001.raw > C:\xxx\200323_A1_102_neg_001.txt
  command <- paste0(PATH_WATERSCONVERTER, " ", file_, " > ", new_filename)
  shell(command)
}

#time2
print("R pipeline - Part 0: File_conversion - done!")
print(Sys.time())
end_time <- Sys.time()
print(end_time - start_time)

#
#####################
