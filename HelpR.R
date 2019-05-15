#backup packages
pkbp <- function(rda_file=NULL){
  if (is.null(rda_file)) {
    stop(paste("rda_file is empty, function did not execute"))
  }
  if (!grepl("\\.",rda_file)) {
    stop(paste("rda_file does not contain a file name, function did not execute"))
  }
pks <-as.data.frame(installed.packages(priority = "NA"),
                    stringsAsFactors = F)$Package
save(installedpkgs, file=rda_file)
}

#install CRAN and Bioconductor packages from a backup list

inpk <- function(pklist){
  pks <-as.data.frame(installed.packages(priority = "NA"),
                      stringsAsFactors = F)$Package
  pks2 <- load(pklist)
  pd <- setdiff(paks2,pks)
  install.packages(pd)
  pks3 <- as.data.frame(installed.packages(priority = "NA"),
                        stringsAsFactors = F)$Package
  pd2 <- setdiff(paks2,pks3)
  if(length(pd2) > 0){
    library(BiocManager)
    install(pd2)
  }
  pks4 <- as.data.frame(installed.packages(priority = "NA"),
                        stringsAsFactors = F)$Package
  pd3 <- setdiff(paks2,pks4)
  if(length(pd3)>0){
    uninstalled.packs <<- pd3
    print(paste("Could not install",length(a),
                "packages, list exported to the global environment as uninstalled.packs."))
  }
  
}


