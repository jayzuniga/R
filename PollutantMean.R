pollutantmean <- function(directory, pollutant, id = 1:332) {
	#open directory
	my_files <- list.files(path=directory, pattern="*.csv", full.names = TRUE)
	p_table <- data.frame(Date=as.Date(character()),
						sulfate=as.numeric(),
						nitrate=as.numeric(),
						ID=as.numeric())
	for (file in my_files) {
		file_id <- as.numeric(substring(file,nchar(file)-6,nchar(file)-4))
		if (is.element(file_id, id)) {
			increment <- read.csv(file)
			p_table <- rbind(p_table, increment)	
		}
	}
	if (pollutant == "nitrate") {
		bad <- is.na(p_table$nitrate)
		p_mean <- mean(p_table$nitrate[!bad])
	} else {
		bad <- is.na(p_table$sulfate)
		p_mean <- mean(p_table$sulfate[!bad])
	}
	round(p_mean, 3)
	#data <- sapply(filelist, read.csv)
}
