#' sc_atac_create_fragments()
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

sc_atac_create_fragments = function(inbam, output_folder = "") {
  # Need to use sinto to generate fragment file
  reticulate::use_virtualenv("scPipe-env") 
  
  # Check if output directory exists
  if(output_folder == ''){
    output_folder = file.path(getwd(), "scPipe-atac-output")
  }
  
  if (!dir.exists(output_folder)){
    dir.create(output_folder,recursive=TRUE)
    cat("Output Directory Does Not Exist. Created Directory: ", output_folder, "\n")
  }
  
  system2("sinto", c("fragments", "-b", inbam, "-f", paste0(output_folder, "/fragments.bed")))
  
}

# inbam <- "/stornext/Home/data/allstaff/y/yang.p/repos/final_repos/scPipe/data/demux_testfastq_S1_L001_R1_001_aligned_sorted_tagged_sorted.bam"
# sc_atac_create_fragments(inbam)
