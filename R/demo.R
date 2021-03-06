#' Get BAM filenames for demo
#' 
#' @return A vector of BAM filenames
#' 
#' @examples
#' bam_files <- get_demo_bam_files()
#' @export
get_demo_bam_files <- function() {
    demo_bam = c("extdata/align1_rep1.bam",
                 "extdata/align1_rep2.bam",
                 "extdata/align2_rep1.bam",
                 "extdata/align2_rep2.bam",
                 "extdata/ctrl.bam")
    system.file(demo_bam, package="metagene2")
}

#' Get BAM filenames for demo
#' 
#' @return A vector of BAM filenames
#' 
#' @examples
#' bam_files <- get_demo_rna_bam_files()
#' @export
get_demo_rna_bam_files <- function() {
    demo_rna_bam = c("extdata/cyto3.bam", "extdata/nuc3.bam")
    system.file(demo_rna_bam, package="metagene2")
}

#' Get regions filenames for demo
#' 
#' @return A vector of regions filenames
#' 
#' @examples
#' regions <- get_demo_regions()
#' @export
get_demo_region_filenames <- function() {
    demo_bed = c("extdata/list1.bed", "extdata/list2.bed")
    system.file(demo_bed, package="metagene2")
}

#' Get demo regions
#' 
#' @return A vector of regions filenames
#' 
#' @examples
#' regions <- get_demo_regions()
#' @export
get_demo_regions <- function() {
    region_filenames = get_demo_region_filenames()
    names(region_filenames) = gsub(".bed", "", basename(region_filenames))
    regions_list <- lapply(region_filenames, rtracklayer::import, format="bed")
    regions_grl <- GRangesList(regions_list)
    
    # We now have a named GRangesList with two set of 50 regions.
    regions_grl    
}

#' Get demo regions
#' 
#' @return A GRangesList with two genes
#' 
#' @examples
#' regions <- get_demo_rna_regions()
#' @export
get_demo_rna_regions <- function() {
    rna_demo_bed = c("extdata/DPM1.bed", "extdata/NDUFAB1.bed")
    gene_files = system.file(rna_demo_bed, package="metagene2")
    regions_list <- lapply(gene_files, rtracklayer::import, format="bed")
    regions_grl <- GRangesList(regions_list)
    names(regions_grl) <- c("DPM1", "NDUFAB1")
    
    # We now have a named GRangesList with the exons for two genes.
    regions_grl    
}


#' Get a demo metagene object
#'
#' @return A metagene object
#'
#' @examples
#' mg <- get_demo_metagene()
#' @export
get_demo_metagene <- function() {
    regions <- get_demo_regions()
    bam_files <- get_demo_bam_files()
    metagene2$new(regions = regions, bam_files = bam_files)
}

#' Get a demo design object
#'
#' @return A \code{data.frame} corresponding to a valid design.
#'
#' @examples
#' mg <- get_demo_design()
#' @export
get_demo_design <- function() {
    return(data.frame(Samples = get_demo_bam_files(),
                      align1 = c(1L,1L,0L,0L,2L),
                      align2 = c(0L,0L,1L,1L,2L),
                      stringsAsFactors=FALSE))
}

get_not_indexed_bam_file <- function() {
    system.file("extdata/not_indexed.bam", package = "metagene2")
}

get_different_seqnames_bam_file <- function() {
    system.file("extdata/different_header.bam", package = "metagene2")
}

get_coverage_bam_file <- function() {
    system.file("extdata/coverage.bam", package = "metagene2")
}

get_coverage_region <- function() {
    system.file("extdata/list_coverage.bed", package = "metagene2")
}

get_narrowpeak_file <- function() {
    system.file("extdata/list1.narrowPeak", package = "metagene2")
}

get_broadpeak_file <- function() {
    system.file("extdata/list1.broadPeak", package = "metagene2")
}

get_gff_file <- function() {
    system.file("extdata/test.gff", package = "metagene2")
}

get_gtf_file <- function() {
    system.file("extdata/test.gtf", package = "metagene2")
}