<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <!-- include virtual="header.inc" -->

 <head>
  <title>GenoClone tutorial</title>
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
    <h2>Tutorial</h2>

    <p>This tutorial will help you get started with GenoClone by demonstrating how to perform <i>subclone inference</i> from exome or whole genome sequencing. If you experience any problems 
    following these steps, please don't hesitate to <a href="GenoClone_contact.asp">contact</a> us. </p>

    <h3>Requirements</h3>
    <p>Please note the required software and data files to run GenoClone (<a href="GenoClone_requirements.asp">requirements</a>). For the purpose of the tutorial we will make the required files available to you.<br>
    
    <h3><img src="images/dna.png">  <b>Download</b></h3>
    <p>You need to download:</p>
    <ul>
   <a href="GenoClone_download_current.asp"><img src="images/download.png"><b>GenoClone-0.1</b></a><br>
   <p>Uncompress and extract the directory in a location of your choice to get a directory containing GenoClone executable files.
   </p>
    <blockquote>
    <pre>
         $ tar -xzvf GenoClone-0.1.tar.gz
	 $ ls GenoClone/bin/
	 GenoClone
    </pre>
    </blockquote> 
	
	<p>Then check the commond of GenoClone.
   </p>
    <blockquote>
    <pre>
     $ GenoClone/bin/GenoClone -h
     <b>usage</b>: GenoClone [-h] -o OUTPUT
                 [--tempdir TEMPDIR | --specific_tempdir SPECIFIC_TEMPDIR]
                 varscan bam

     Detect the linkage information between somatic mutation(SNV) and germline
     mutation(SNP)

     <b>positional arguments</b>:
     varscan               REQUIRED Input the output file from Varscan
     bam                   REQUIRED Input the alignment tumor bam file

     <b>optional arguments</b>:
     -h, --help            show this help message and exit
     -o OUTPUT, --output OUTPUT
                        REQUIRED Output filename, totally it produce two
                        files, one '.csv' file for the composition of subclone
                        and the other '.pdf' file for the evaluation of
                        different number of subclones (default: None)
     --tempdir TEMPDIR  The temporary directory is made and destroyed here.
                        (default: /tmp)
     --specific_tempdir SPECIFIC_TEMPDIR
                        This temporary directory will be used, but will remain
                        after executing. (default: None)
    </pre>
    </blockquote
	
    <h3><img src="images/dna.png">  <b>Input data</b></h3>
    <p> GenoClone depends on the output of VarScan, the two softwares require: </p>
    <li>1. <b>Reference.fasta</b>: the indexed reference genome FASTA file.</li>
	<li>2. <b>Tumor.bam </b> and <b> Normal.bam </b>: the binary sequence alignment/map formatted (BAM) sequence data from tumor and matched normal DNA sample.</li>
	<p>
	</p>
	<p> VarScan needs the BAM file of tumor and matched normal and reference genome to obtain the total mutations (germline and somatic mutations). Then GenoClone uses the tumor bam file and total mutations
	to infer the subclones.</p>
	<p> The bam files for tumor and matched normal could be downloaded from <a href="https://gdc-portal.nci.nih.gov/search/s?facetTab=cases" >National Cancer Institute</a>
	and corresponding <a href="https://gdc.cancer.gov/about-data/data-harmonization-and-generation/gdc-reference-files" >Reference.fasta</a> </p>
    
    <h3><img src="images/dna.png">  <b>Example commonds</b></h3>
    <p><b> Step 1.</b> Use VarScan to obtain the total mutations:
	</p>
	<blockquote>
    <pre>
          $ samtools mpileup -q 1 -f Reference.fasta Tumor.bam >tumor.pileup
	  $ samtools mpileup -q 1 -f Reference.Genome Normal.bam >tumor.pileup
	  $ java -jar varScan somatic normal.pileup tumor.pileup --output-vcf 1 --output-snp total_mutations.vcf
    </pre>
    </blockquote> 
	<p><b> Step 2.</b> Use GenoClone to infer subclones:
	</p>
	<blockquote>
    <pre>
          $ /GenoClone/bin/GenoClone total_mutations.vcf Tumor.bam -o Tumor
    </pre>
    </blockquote> 
	
	
    <h3><img src="images/dna.png"> <b>Output files</b></h3>
   <p>GenoClone output two files:</p>
   <li> <b>Tumor.csv</b>: the number of subclones and the compositon of each subclones and the goodness value varies with number of subclones.
   </li>
   <li> <b>Tumor.pdf</b>: the difference between true and observed VAF and goodness varies with number of subclones.
   </li>
    
  </div>
  

 
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->


<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
