#' sc_atac_remove_duplicates()
#'
#' @return 
#'
#' @examples
#' \dontrun{
#' 
#' 
#' }
#'
#' @export
#' 

<<<<<<< HEAD
sc_atac_remove_duplicates = function(inbam, output_folder = ""){
=======
sc_atac_remove_duplicates <- function(inbam, output_folder = ""){
>>>>>>> master
  
  # Check if samtools is installed
  samtools.installed <<- TRUE
  
  samtools <- "samtools"
<<<<<<< HEAD
  # samtools <- "/stornext/System/data/apps/samtools/samtools-1.10/bin/samtools"
=======
>>>>>>> master
  # Check if samtools is installed
  tryCatch(
    {
      system2(samtools, stdout = NULL, stderr = NULL)
      message("samtools was located")
    },
    
    warning = function(w) {
      samtools.installed <<- FALSE
<<<<<<< HEAD
      message("samtools was not located. Please make sure it is installed.")
=======
      message("samtools was not located, so can't remove duplicates. Please make sure it is installed.")
>>>>>>> master
    }
  )
  
  if (samtools.installed)
    tryCatch(
      {
        # Check if file exists
        if (!file.exists(inbam)) {
          stop("Couldn't locate the supplied BAM file")
        }
        
        # Check for validity of file
        system2(samtools, c("quickcheck", inbam), stderr = NULL, stdout = NULL)
        
        
        # Check if output directory exists
        if(output_folder == ''){
<<<<<<< HEAD
          output_folder = file.path(getwd(), "output")
=======
          output_folder = file.path(getwd(), "scPipe-atac-output")
>>>>>>> master
        }
        
        if (!dir.exists(output_folder)){
          dir.create(output_folder,recursive=TRUE)
          cat("Output Directory Does Not Exist. Created Directory: ", output_folder, "\n")
        }
        
        inbam.name <- substr(inbam, 0, nchar(inbam)-4)
        
        system2(samtools, c("collate", "-o", paste(inbam.name, "namecollate.bam", sep="_"), inbam))
        system2(samtools, c("fixmate", "-m", paste(inbam.name, "namecollate.bam", sep="_"), paste(inbam.name, "fixmate.bam", sep="_")))
        system2(samtools, c("sort", "-o", paste(inbam.name, "positionsort.bam", sep="_"), paste(inbam.name, "fixmate.bam", sep="_")))
        system2(samtools, c("markdup", "-s", "-r", paste(inbam.name, "positionsort.bam", sep="_"), paste(inbam.name, "markdup.bam", sep="_")))
<<<<<<< HEAD
=======
        Rsamtools::indexBam(paste(inbam.name, "markdup.bam", sep="_"))
>>>>>>> master
        
        system2("rm", paste(inbam.name, "namecollate.bam", sep="_"))
        system2("rm", paste(inbam.name, "positionsort.bam", sep="_"))
        system2("rm", paste(inbam.name, "fixmate.bam", sep="_"))
<<<<<<< HEAD
  
=======
        
        
>>>>>>> master
        if (file.exists(paste(inbam.name, "markdup.bam", sep="_"))) {
          message(paste("The output BAM file was sent to", output_folder))
          system2("mv", c(paste(inbam.name, "markdup.bam", sep="_"), output_folder))
        } else {
          message("Couldn't remove duplicates from the input BAM file. Make sure it is a valid BAM file.")
        }
<<<<<<< HEAD
  
      },
      warning = function(w) {w
        message(w)
      },
      
      error = function(e) {
        message(e)
      }
    )
}

# sc_atac_remove_duplicates("/stornext/Home/data/allstaff/y/yang.p/repos/scPipe/data/demux_testfastq_S1_L001_R1_001_aligned_sorted.bam.bai")


=======
        
      },
      warning <- function(w) {w
        message(w)
      },
      
      error <- function(e) {
        message(e)
      }
    )
}
>>>>>>> master
