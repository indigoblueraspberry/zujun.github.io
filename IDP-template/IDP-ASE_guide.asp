<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>Long read files</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>
<body>

<!-- #include file="asp\redbar.inc" -->
 
<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file="asp\titlearea.inc" -->


  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
  See the Github for most up to date code <a href="https://github.com/bdeonovic/IDPASE.jl">Github</a>. What follows is a brief guide to running the example data provided with the code. 

  <h3><img src="images/dna.png">  <b>Step 1</b> - Prepare Gene level data</h3>
  <pre> julia ~/.julia/v0.4/IDPASE/src/prep_runs.jl -a test_data/SGS.psl test_data/TGS.psl \
        -g test_data/TDRKH.gpd -v test_data/sim.vcf -q test_data/SGS.fq test_data/TGS.fq \
        -d temp/ -c 1 -f 1 1 -o gene_files/ -p sim </pre>
  where flag -a is space separated list of PSL files, -g is GPD file, -v is VCF file, -q is space separated list of FASTQ files, -d is a directory for intermediate output, -c is a space separated list of chromosomes of interest, -f is a space separated list of FASTQ formats corresponding to the FASTQ files of -q, where 1 indicates PHRED+33, and 2 indicates PHRED+64, and -o indicates output directory and output prefix (so in example /out/ is directory and output files will be prefixed by sim).


  <h3><img src="images/dna.png">  <b>Step 2</b> - Obtain individual run commands</h3>
  <pre> julia ~/.julia/v0.4/IDPASE/scripts/phase_by_loci.jl -a gene_files/ -o gene_out/ -n SGS TGS \
        -m 1 0 0 1 1 1 -d scripts/ -p sim > to_run_curr.sh </pre>

  where -a is the -o flag from command in step 5, -o is an output directory, -n are unique names corresponding to PSL files, -m is a vector indicating which combinations of the seq data to use with IDPASE. In the above example 3 runs of IDPASE will be issued where 1 0 indicates SGS only, 0 1 indicates TGS only, and 1 1 indicates hybrid-Seq. p is the prefix specified in step 5. The output is a list of commands to run for each gene individually. The flag -d is the directory where the IDPASE scripts are stored.


  <h3><img src="images/dna.png">  <b>Step 3</b> - Run each gene level command</h3>
  <pre> bash to_run_curr.sh </pre>


  <h3><img src="images/dna.png">  <b>Step 4</b> - Concatenate gene level results</h3>
  <pre> find gene_out/ -name "REAL*" | xargs cat > gene_out/gene_results.txt </pre>

  <h3><img src="images/dna.png">  <b>Step 5</b> - Prepare isoform level data</h3>
  <pre> julia ~/.julia/v0.4/IDPASE/src/prep_runs.jl -a test_data/SGS.psl test_data/TGS.psl \
        -g test_data/TDRKH.gpd -v test_data/sim.vcf -q test_data/SGS.fq test_data/TGS.fq \
        -d temp/ -c 1 -f 1 1 -o isoform_files/ -p sim -l 100 -i -s -e -r gene_out/gene_results.txt</pre>

  where -l is read length for short reads, -s to skip file pre-processing (if using same GPD/VCF files are gene level), -e to use estimated haplotypes from gene leve, otherwise will use information from VCF, asumming it is phased, -r is the gene level results file.

  <h3><img src="images/dna.png">  <b>Step 6</b> - Obtain individual run commands</h3>
  <pre> julia ~/.julia/v0.4/IDPASE/scripts/phase_isoforms_by_loci.jl -i isoform_files/ \
        -o isoform_out/ -b ~/.julia/v0.4/IDPASE/scripts -a -p sim > to_run_isofs.sh</pre>

  <h3><img src="images/dna.png">  <b>Step 7</b> - Run each isoform level command</h3>
  <pre> bash to_run_isofs.sh </pre>

  <h3><img src="images/dna.png">  <b>Step 8</b> - Concatenate isoform level results</h3>
  <pre> find isoform_out/ -name "EXTRA*" | xargs cat > isoform_results.txt</pre>
</div>
  
  
  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
