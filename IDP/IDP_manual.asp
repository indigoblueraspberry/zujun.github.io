<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <!-- include virtual="header.inc" -->
 
<head>
  <title>IDP manual</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>
<body>

<!-- #include file ="asp\redbar.inc" -->

<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file ="asp\titlearea.inc" -->
  
  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Manual</h2>
    <ul>
    <li><a href="IDP_manual.asp#install">Installation</a></li>
    <li><a href="IDP_manual.asp#using">Using IDP</a></li>
    <li>Module descriptions
    <ul>
        <li><a href="IDP_manual.asp#runIDP">runIDP.py</a></li>
    </ul>
    </li><li>Input files</li>
    <ul>
        <li><a href="IDP_manual.asp#longreads">Long reads</a></li>
		<li><a href="IDP_manual.asp#shortreads">Short reads</a></li>
    </ul>	
    </li><li><a href="IDP_manual.asp#output">Output files</a></li>
    <li><a href="IDP_manual.asp#time">Execution Time</a></li>
    </ul>
    
    <div id="install">
    <h3><img src="images/dna.png"> Installation</h3>
    </div>
    <p>No explicit installation is required for IDP, however it does have some pre-requistes. </p> 
    <p>Long reads should be corrected with LSC first, and the corrected.fa and full.fa files should be concatonated into a single fasta for use in IDP i.e.: <br><i>$ cat full.fa corrected.fa > LR.fa</i></p>
    <p>Short reads should be aligned to the reference genome using SpliceMap.  An alignment (.sam) file and SpliceMap format bed file is required.</p>
	<p>Please see IDP <a href="IDP_requirements.asp">requirements</a> for more details about required software.  </p>
    <p></p>
    
    
    <div id="using">
    <h3><img src="images/dna.png"> Using IDP</h3>
    </div>
    <p>Firstly, see the <a href="IDP_tutorial.asp">tutorial</a> on how to use IDP on some example data.</p>
    <p>
    In order to use IDP on your own data:
    </p><ol>
    <li>Create an empty directory, this will be the working directory.  An example directory with a manifest of necessary datafiles can be downloaded here:<a href="files/example_directory.tar.gz"><img src="images/download.png">Example working directory</a>.</li>
    
    <li>Copy "run.cfg" from the IDP package to the working directory. </li>
    
    <li><a href="IDP_cfg.asp">Edit run.cfg</a> to include paths to data files and the paths of the temp folder and the output folder. 
	You may also want to configure the default settings. Reference annotation can be used in IDP for isoform candidate constructions. In this construction process, a few parameters are needed as well. 
    For these parameters, the example run.cfg contained in the bin/ directory of the program contains the optimal setting for human transcriptome.
	If you want to run the other species, please <a href="IDP_contact.asp">contact</a> Kin Fai for suggestion.
	</li>
    <li>Edit "constants.py" for a few "data parameters". Please see the section "Module: constants.py" below for more details</li>	
    <li>Execute "<a href="IDP_manual.asp#runIDP">/home/user/IDP_path/runIDP.py run.cfg mode_number</a>" while in your working directory. or Execute "<a href="IDP_manual.asp#runIDP">runIDP.py run.cfg mode_number</a>, if all IDP executable files are in the default bin.
"mode_number" can be 1,2,3. Please see how to select mode_number in the section "Module: runIDP.py" below.</li>

    <li>After <a href="IDP_manual.asp#time">a certain time</a> execution will conclude. You can find results in the "output" directory. </li>
    
    </ol>
    <p></p>
   
    
    <div id="runIDP">
    <h3><img src="images/dna.png"> Module: runIDP.py</h3>
    </div>
    <p>"runIDP.py" is the main program in the IDP package. It calls other modules 
    to run the full isoform identification and quantification on your data. Output is written to the "output" folder. 
    Details of the output are described in <a href="IDP_manual.asp#fileformats">file formats</a>.
    Its options are described in <a href="IDP_cfg.asp">run.cfg</a>. You just need to run "runIDP.py" with a configuration file "run.cfg" and a mode_number: </p>
    <blockquote>
    /home/user/IDP_path/runIDP.py run.cfg mode_number
    </blockquote>
	Please always type the full path of the bin folder in the command line. In this example, you need "/home/user/IDP_path/runIDP.py" instead of "./runIDP.py" or "runIDP.py".
	<ul><li>Mode_number</li>
	You can run IDP in two steps by setting the second argument in the command line. 
	If for a reason IDP finished isoform candidate construction step but was terminated in candidate selection step, you can restart the candidate selection step without re-running the isoform candidate construction.
	<ul><li>mode 0 (default): end-to-end IDP run.</li>
	    <li>mode 1: generates isoform candidate pool (file: isoform_construction.NisoXX.gpd) which is used in candidate selection step. "XX" is Niso_limit you set in the run.cfg</li>
		<li>mode 2: runs candidate selection step. Note:  make sure isoform candidate pool (file: isoform_construction.NisoXX.gpd) file is already generated in temp folder.
		            IDP also uses some other intermediate files in temp folder which are generated after mode 0/1 run </li>
	</ul>
    </ul>
	
    <div id="longreads">
    <h3><img src="images/dna.png"> Input files: long reads</h3>
    </div>
    <p>
    IDP accepts long-read sequences/alignment files and short-read alignment file as input. 
	<br> The file locations and their format should be set in run.cfg file.
    </p>
    <br>
    <p>Using long reads corrected by LSC first is advised.<br>
        <b><font color = "red">Please see our <a href="http://www-stage.healthcare.uiowa.edu/labs/au/IDP/IDP_long_read_file_guide.html">guide on creating a long read set</a>.</font color></b><br>

The reason is that corrected.fa will lose some flanking sequences on
the long reads that were not corrected by short reads, and there still
may be some informative junctions in that region.  If we used only
corrected.fa, we could lose this information.  full.fa includes those
flanking regions in addition to the corrections that were made.
However, if we used only full.fa, it is likely the IDP algorithm could
throw out many of those long reads for failing to find short read
support for junctions in those regions.  If you combine the two
datasets, you will not suffer any loss of information, and any
redundancies will be handled by IDP.</p>
<br>
	<p>Three types of long read data can be input: 1. alignment in gpd format, 2. alignment in psl format and 3. sequences of raw data and reference genome:</p>
	<dd>1. alignment in gpd format. If the long read alignment is done by BLAT and is in psl format, 
	you can select the best alignment of each long read by the IDP module blat_best.py and then use psl2genephed.py to convert the psl file to gpd file. "skip_Nine" in both modules can help you skip the header lines.
	or If you have run IDP on a given long read data, then you can copy the file "LR.gpd" from the temp folder for the other run.</dd>
	<br>
	<dd>2. alignment in psl format. You can BLAT your long reads to reference genome and the output is in psl format.
	But you need to select one (the best) alignment of each long reads. The IDP module blat_best.py can help you select the alignment with most bases mapped. "skip_Nine" in blat_best.py can help you skip the header lines.</dd>
	<br>
	<dd>3. sequences of raw data and reference genome. You can input the long read sequences (FASTA format) and the reference genome (FASTA format). IDP can do the alignment by BLAT and the remaining steps for you.
	This is much handier and just takes a bit longer running time. <b>If you know the adapter/primer sequences at 5'/3' ends, IDP can trim them. But you need to input their homopolyer-compressed sequences.</b></dd>
	
	<pre>
##
# Long reads files
# You can input one of three types of long-read data: 
	# 1. Long-read alignments on reference genome in GPD format. 
	# If you has run IDP on the same data, you can use LR.gpd in the previous temp folder.
	# For more info of GPD format, please check http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp

LR_gpd_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/no53primer_LR.gpd

	# or
	# 2. Long-read alignments on reference genome in PSL format (BLAT output format). 
	# If the PSL file only contains unique alignment for each long reads, then set psl_type = 1. Otherwise, set psl_type = 0

LR_psl_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/no53primer_LR.fa.psl
psl_type = 1
     
	# or
	# 3. Long reads in FASTA format (LSC corrected data is preferred) and reference genome in FASTA format. 
	# IDP will run BLAT to align long reads to reference genome.
	# (Optional) If primer sequence at 5' end (five_primer) or 3' end (three_primer) is input, IDP can trim the primer sequences off.
	# Primer sequence must be homopolyer compressed. E.g. the original sequence is AACCCTTGGGG, then you should input ACTG 
	
LR_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/test.fa
genome_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/genome.fa
five_primer = AGTACTCTG
three_primer = CGCAGAGTAC
	</pre>
    <div id="shortreads">
    <h3><img src="images/dna.png"> Input files: short reads</h3>
    </div>
	<p>Two short read data are REQUIRED: 1. alignment in sam format, and 2. junction detection in bed format.</p>
	<p> The file locations and their format should be set in run.cfg file. </p>
	<p>You can generate these two files very easily from <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a> or the other RNA-seq aligners, such as Tophat and MapSplice.  At the moment, IDP only supports junctions in the format produced by SpliceMap</P>

<pre>
##
# Short reads files
# You can input two short-read data: 

SR_jun_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/junction_color.bed
SR_sam_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/good_hits.sam
</pre>

<br>
    <div id="output">
    <h3><img src="images/dna.png"> Output files</h3>
    </div>
    <p>There are four output files: isoform.gpd, isoform.exp, isoform_detection.gpd, isoform_prediction.gpd in output folder:
    </p>
    <ul>
    <li><i>isoform.gpd</i></li>
    
    <dd> This file contains all gene isoforms identified from detection or prediction. There are overlap between detection and prediction, so isoform.gpd removes the redundant ones. 
	It is in <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">gpd format</a>. 
	  </dd>
	  </ul>
	  
	 <ul>
    <li><i>isoform.exp</i></li> 
      <dd> This file contains the gene/gene isoform abundance. Three columns are seperated by tab: isoform ID, isoform abundance and gene abundance.
	  The novel isoforms uses their gene loci as the ID, such as chr2:204193002-204296891.1. The last number is the index of the isoform in this gene locus. </dd>
	  </ul>
	  
	  
	 <ul>
    <li><i>isoform_detection.gpd</i></li> 
	<dd> This file contains the detections of gene isoforms annotated in the reference annotation (ref_annotation_pathfilename in run.cfg). 
	It is in <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">gpd format</a>. 
	</dd>
	  
	</ul>  
	
	 <ul>
    <li><i>isoform_prediction.gpd</i></li> 
	<dd>This file contains the gene isoform predictions. The gene name is denoted as the gene locus (such as chr2:204193002-204296891) and the isoform name is the gene locus with an index (such as chr2:204193002-204296891.1).
	If an predicted isoform shares junctions with an annotated gene, then this predicted isoform is assigned to this gene as a novel isoform.</dd>
	</ul> 
	

	<p></p>

    
    <div id="time">
    <h3><img src="images/dna.png"> Execution Time</h3>
    </div>
    <p>
    The following execution times are guesstimates based on the running times on our servers with 20 threads. These figures will greatly
    differ based on your data size and your system configuration. 
    </p>
    <ul>
    <li>2,000,000 LSC-corrected PacBio long reads X 120 million 100bp Illumina short reads - 20 hours</li>
    </ul>

    
  </div>
  
  
  
  

<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->


<!-- end #content -->
</body>


</html>