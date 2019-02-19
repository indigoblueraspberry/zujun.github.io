<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <!-- include virtual="header.inc" -->

 <head>
  <title>IDP tutorial</title>
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

    <p>This tutorial will help you get started with IDP by demonstrating how to identify gene isoforms using PacBio long reads and short mappable short reads of length 50bp.  This tutorial will provide two options in data sets.  One full sized dataset, for executing a realistic run of the IDP pipeline, and a much smaller example if you want to quickly go through the steps and verify error-free execution.  If you experience any problems 
    following these steps, please don't hesitate to <a href="IDP_contact.asp">contact</a> us. </p>

    <h3>Requirements</h3>
    <p>Please note the requiremed software and data files to run IDP (<a heref="http://www.healthcare.uiowa.edu/labs/au/IDP-fusion/IDP_requirements.asp">requirements</a>).  For the purpose of the tutorial we will make the required files available to you.<br>
    Please note when using your own data, that <font color="red">IDP does not use the output of IsoSeq as long read inputs</font>.  The prefered method used by IDP is to use the original long reads error corrcted when appropraite.  See <a href="http://www-stage.healthcare.uiowa.edu/labs/au/IDP/IDP_long_read_file_guide.html">(long read generation)</a> for help.
    
    <h3><img src="images/dna.png">  <b>Step 1</b> - Download and extract the example files</h3>
    <p>You need to download:</p>
    <ul>
   <a href="IDP_download_current.asp"><img src="images/download.png"><b>The latest release of IDP</b></a><br>
   <p>Uncompress and extract the directory in a location of your choice to get a directory containing IDP executable files.</p>
    <blockquote>
    <pre>
      $ tar -xzvf IDP_0.1.8.tar.gz
    </pre>
    </blockquote>   
    Download either the <a href="files/example.tar.gz" onClick="ga('send', 'event', 'file download', 'click', 'IDP large example download');"><img src="images/download.png"><b>full size example data</b></a> or alternatively the <a href="files/small_example_0.1.8.tar.gz" onClick="ga('send', 'event', 'file download', 'click', 'IDP small example download');"><img src="images/download.png"><b>small example data</b></a>.<br>
    <h3><b>For the full sized example data:</b></h3>
   <p>Uncompress and extract the directory in a location of your choice to get an example working directory containing a data subfolder and configuration files.</p>
    <blockquote>
    <pre>
      $ tar -xzvf example.tar.gz
</pre>
    </blockquote>
    <p>After extracting the folder, it should contain the following files and folders:
    </p>
    <blockquote>
    <pre>
      $ ls small_example_0.1.8/
      data  run_LRfa.cfg  run_LRgpd.cfg  run_LRpsl.cfg
      $ cd small_example_0.1.8/
      $ ls data/
      genome.fa  
      hg19.all.gene_est.refFlat.txt  
      junction_color.bed  
      LR.fa  
      LR.gpd  
      LR_notailspolyA.fa.bestpsl  
      multiexon_refFlat.txt_positive_exp_len  
      normal_ref.gpd  
    </pre>
    </blockquote>
    <p><b>Option 1 for getting SR.sam</b></p>
    <p>One file is still needed in the data directory, and that is the sam file containing the alignments of the short reads: SR.sam</p>
    <p>If you are using a 64 bit linux computer, while in the example directory you can try to use the included script to retrieve the file</p>
    <blockquote>
      $ ./fetch_SR.sh
    </blockquote>
    <p>That script will retrieve the sra file from NCBI, convert it using sratools and place it into the data directory as SR.sam.</p>
    <p><b>Option 2 for getting SR.sam</b></p>
    <p>Alternatively, you can download the archive and convert it yourself by getting these 
    <a href="ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP032%2FSRP032367/SRR1020625/SRR1020625.sra" onClick="ga('send', 'event', 'file download', 'click', 'IDP big example download');"><img src="images/download.png"><b>short read alignments</b></a>.</p>
   
   <p>You can then use the module sam-dump in <a href="http://eutils.ncbi.nih.gov/Traces/sra/?view=software">SRA Toolkits</a> to extract the SRA file to short read alignment file(SR.sam):</p>
   <blockquote>
   $ ./sratoolkit.2.3.3-4-ubuntu64/bin/sam-dump SRR1020625.sra  > data/SR.sam
 </blockquote>
    <h3><b>For the small example data:</b></h3>
   <p>Uncompress and extract the directory in a location of your choice to get an example working directory containing a data subfolder and configuration files.</p>
    <blockquote>
    <pre>
      $ tar -xzvf small_example_0.1.8.tar.gz
</pre>
    </blockquote>
    <p>After extracting the folder, it should contain the following files and folders:
    </p>
    <blockquote>
    <pre>
      $ ls small_example_0.1.8/
      data  run_LRfa.cfg  run_LRgpd.cfg  run_LRpsl.cfg
      $ cd small_example_0.1.8/
      $ ls data/
      chr1_chr19.fa  
      hg19.chr1_chr19.gene_est.refFlat.txt  
      junction_color.chr1_chr19.bed  
      LRsmall.fa  
      LRsmall.gpd  
      LRsmall_notailspolyA.fa.bestpsl  
      multiexon_refFlat.chr1_chr19.txt_positive_exp_len  
      normal_ref.chr1_chr19.gpd  
      SRsmall.sam
    </pre>
    </blockquote>

    <h3><img src="images/dna.png">  <b>Step 2</b> - Examine the example directory contents</h3>
    Before we continue, it will be helpful to learn the purpose of each file in this example. When you 
    run IDP on your data, all of these files can be in separate locations if you wish. 
     <dl>
      <dt>run_LRfa.cfg, run_LRfa_psl.cfg, run_LRfa_gpd.cfg</dt>
      <dd>These are the configuration files for three types of <a href="IDP_manual.asp#longreads">long read input data</a>. Thus, you can use each of them to run the example data. The configuration file is a text file that contains the path to your data and the configuration settings. Please see <a href="IDP_cfg.asp">.cfg file format</a> for 
      details. It is simple to edit and you will need to edit it once for each data set.  </dd>
      <dt>data directory</dt>
      <dd>This directory contains all of the long read data and short read data in the example, and the directory may located anywhere and may be read-only. These examples contain the following files:</dd>
    <table>
      <tr><td><b>Full Example</b></td><td><b>Small Example</b></td><td><b>Description</b></td></tr>
      <tr><td>genome.fa</td><td>chr1_chr19.fa</td><td>Genomic fasta file</td></tr>
      <tr><td>hg19.all.gene_est.refFlat.txt</td><td>hg19.chr1_chr19.gene_est.refFlat.txt</td><td><a href="IDP_gpd_format.asp">genepred (GPD)</a> format file for the whole genome splicing data from multiple sources including ESTs and reference genome databases.  For hg19 you may or you may <a href="http://www.stanford.edu/group/wonglab/SpliceMap/hg19.all.gene_est.refFlat.txt">use this full genome example</a>.</td></tr>
      <tr><td>junction_color.bed</td><td>junction_color.chr1_chr19.bed</td><td>Junction .bed file reported by aligner</td></tr>
      <tr><td>LR.fa</td><td>LRsmall.fa</td><td>Long read fasta file, necessary when .gpd or .psl alignemnts need to be generated by blat.</td></tr>
      <tr><td>LR.gpd</td><td>LRsmall.gpd</td><td>Long read genepred format alignment. Helpful for skipping the alignment step.</td></tr>
      <tr><td>LR_notailspolyA.fa.bestpsl</td><td>LRsmall_notailspolyA.fa.bestpsl</td><td>Long read alignment in .psl format.  Generated by BLAT, and helpful for skipping the alignment step.</td></tr>
      <tr><td>multiexon_refFlat.txt_positive_exp_len</td><td>multiexon_refFlat.chr1_chr19.txt_positive_exp_len</td><td>Length and detection bias by PacBio from observed PacBio reads.  Generation requires many long reads, and can be generated emperically by not defining detected_exp_len in the .cfg file, or you can <a href="files/multiexon_refFlat.txt_positive_exp_len.zip">use this full genome example</a>.</td></tr>
      <tr><td>normal_ref.gpd</td><td>normal_ref.chr1_chr19.gpd</td><td>Genomic genepred (GPD) file with splice junction information</td></tr>
      <tr><td>SR.sam</td><td>SRsmall.sam</td><td>Short Read sam file of mapped short reads produced by the aligner.  The small set of reads here are made up of sequences contained in <a href="files/SRsmall.fasta.gz">this gzip compressed fasta file</a>.</td></tr>
    </table>


   
      <dt>bin directory</dt>
      <dd>This is directory stores all of the IDP binaries. It is important that 
      all the binaries are in the same location. No installation is required! Simply copy this
      directory to a location convenient for you. 	  
      </dd>
      <br>
      <h3>During execution, as defined in the .cfg file, the following directoires will be created</h3>
      <dt>temp directory</dt>
      <dd>This is a temporary directory created during the execution of IDP. The results of
      the isoform candidate construction and quantification are stored here, so this directory can be quite large. 
      <dt>output directory</dt>
      <dd>This is directory stores all the useful <a href="IDP_manual.asp#output">output files</a> after executing IDP. It is also 
      created during the execution of IDP.</dd>

    </dl>
    
    <h3><img src="images/dna.png"> <b>Step 4</b> - Run IDP on the example data</h3>
    <p>Only one command is need to to initiate IDP. 
    </p>
    <p>Make sure your terminal is pointed to the small_example/ folder.  These examples of commands assumes your IDP executables download was extracted into your home directory, but any location will be fine. Type one of the following commands:</p>
    <blockquote>
    $ ~/IDP_0.1.8/runIDP.py run_LRfa.cfg 0
    </blockquote>
	or
	<blockquote>
    $ ~/IDP_0.1.8/runIDP.py run_LRpsl.cfg 0
    </blockquote>
	or
	<blockquote>
    $ ~/IDP_0.1.8/runIDP.py run_LRgpd.cfg 0
    </blockquote>
    <p>These three runs are for three different types of long reads. The second argument is set to 0, because the example data runs end-to-end. 
	You can change the <a href="IDP_manual.asp#runIDP">mode</a> (the second argument) according to your need.</p>
    <blockquote>
 
    </blockquote>
    <p>At this point, feel free to take a break. After a few minutes, IDP will be completed.</p>
    
    <h3><img src="images/dna.png">  <b>Step 5</b> - Examining the output</h3>
    All of the output from IDP is automatically copied to the "output" directory. After
    this execution, it should contain:

    Each output file is descired on <a href="IDP_manual.asp#output">maual page</a> in more details:
    <dl>
      <dt>&nbspisoform.gpd</dt>
      <dd>This file contains all gene isoforms identified from detection or prediction. There are overlap between detection and prediction, so isoform.gpd removes the redundant ones. 
	It is in <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">gpd format</a>.</dd>
      <dt>&nbspisoform.exp</dt>
      <dd>This file contains the gene/gene isoform abundance. Three columns are seperated by tab: isoform ID, isoform abundance and gene abundance.
	  The novel isoforms uses their gene loci as the ID, such as chr2:204193002-204296891.1. The last number is the index of the isoform in this gene locus. </dd>
      <dt>&nbspisoform_detection.gpd</dt>
      <dd>This file contains the detections of gene isoforms annotated in the reference annotation (ref_annotation_pathfilename in run.cfg). 
	It is in <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">gpd format</a>.</dd>
	  <dt>&nbspisoform_detection.gpd</dt>
	  <dd>This file contains the gene isoform predictions. The gene name is denoted as the gene locus (such as chr2:204193002-204296891) and the isoform name is the gene locus with an index (such as chr2:204193002-204296891.1).
	If an predicted isoform shares junctions with an annotated gene, then this predicted isoform is assigned to this gene as a novel isoform.</dd>

    </dl>
	
    <h3><img src="images/dna.png"> <b>Step 6</b> - Learning how to apply this tutorial to your own data</h3>
   See the <a href="IDP_manual.asp#using">Using IDP</a> section of the manual. 
    
  </div>
  

 
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->


<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
