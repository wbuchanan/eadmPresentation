// Store current directory
loc startdir `"`c(pwd)'"'

// Download example dataset files to the data subdirectory
copy "https://stats.idre.ucla.edu/wp-content/uploads/2016/02/stata_data.zip" ///   
data/data.zip

// Move into the data subdirectory
cd data

// Decompress the zip archive
unzipfile data.zip, replace

// Remove the zip file
erase data.zip

// Move back to the original directory
cd `"`startdir'"'
