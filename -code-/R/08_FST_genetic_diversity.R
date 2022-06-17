# transfer from the cluster
rsync -avhP -e 'ssh -p 8022' \
  barratt@localhost:/work/$USER/ddRAD-seq_workshop \
  /Users/cb76kecu/Desktop

# Read in .dat file (fstat) format needed by Adegenet package for running DAPC
populations.sumstats_summary.tsv <- read.delim("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_8/populations.sumstats_summary.tsv",
    header = FALSE)
    
    # Read in .dat file (fstat) format needed by Adegenet package for running DAPC
populations.fst_summary.tsv <- read.delim("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_8/populations.fst_summary.tsv",
    header = FALSE)