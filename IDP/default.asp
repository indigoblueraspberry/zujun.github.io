<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP - Isoform Detection and Prediction</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>

<body>

<!-- #include file="asp\redbar.inc" -->

<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->

  <!-- #include file="asp\titlearea.inc" -->

  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->


  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Getting Started</h2>
    <p>These simple steps will help you integrate IDP into your transcriptomics analysis pipeline. </p>
    <ul>
        <li>Read the <a href="IDP_requirements.asp">IDP_requirements</a> for running IDP. </li>
        <li><a href="IDP_download_current.asp">Download</a> and set-up the IDP package. </li>
        <li>Follow the <a href="IDP_tutorial.asp">tutorial</a> to see how IDP works on some example data. </li>
        <li>Read the <a href="IDP_manual.asp">manual</a> if anything is unclear. </li>
        <li>Check the <a href="IDP_long_read_file_guide.html">guide for generating long read files</a> suitable for isoform predicton or fusion detection.</li>
        <li>You're ready, Happy IDPing!</li>

    </ul>
    <h2>Latest publication</h2>
    Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> 
	<br><i>Proc. Natl. Acad. Sci. USA</i> 2013 110 (50) E4821-E4830 [<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>] 
	<br>
    <i></i>  

	<div id="SpliceMap-LSC-IDP pipeline">
    <h2>SpliceMap-LSC-IDP pipeline</h2>
    </div>
    <p>This hESC transcriptome is identified by <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP/">IDP</a> pipeline.</p>
	<p>SpliceMap takes short reads from the Second Generation Sequencing platforms, such as Illumina, to detect exon junctions.</p>
	<p>LSC makes use of the high-quality short reads to correct the long reads from PacBio platform. The output is the error-corrected long reads.</p>
	<p>IDP uses the junction detections and the alignment of error-corrected long reads to detect the relatively short isoforms at full-length and predict the very long isoforms by statistical modeling. </p>
	<p></p>
	<center><img src="images/SpliceMap-LSC-IDP_pipeline.png" width="100%" hight="100%" >&nbsp;&nbsp;&nbsp;&nbsp;</center> 
	
	
    <div id="news">
    <h2>Latest News</h2>
    </div>

 <h3><img src="images/dna.png">  08-04-2014 - Major Update to IDP</h3>
<p>This is a major update to IDP and update includes changes to software requirements, additional features, and bug fixes.</p>
<ul>
  <li> 1.  The IDP software is now licensed under Apache 2.0 (a very open license) </li>
  <li> 2.  BLAT and seqmap (part of SpliceMap) aligners are no longer bundled.  Paths to aligner executables must be specificed in the config file if they are not installed under their default names.</li>
  <li> 3.  GMAP can now be used rather than BLAT.  This is  by setting 'aligner_choice' to either 'gmap' or 'blat' in the config file. GMAP also requires the folder holding the index be specified in the config file.</li>
  <li> 4.  An option to use MLE rather than Maximum a posteriori probability (MAP) is available by setting 'estimator_choice' to 'MAP' or 'MLE' in the config file.  MAP is used by default, but in data sets with few long reads where few isoforms are detected, MLE should be used.</li>
  <li> 5.  A bug was fixed where in the previous version, where IDP should have generated the file when 'detected_exp_len' whas left blank but did not.</li>
</ul>

 <h3><img src="images/dna.png">  08-01-2014 - Preparing long read outputs of LSC for use in IDP</h3>
<p><b><font color = "red">Please concatenate the LSC outputs: corrected.fa with full.fa, and use this new fasta
file as your long read inputs for IDP.</font color></b><br><br>

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

 <h3><img src="images/dna.png">  04-24-2014 - IDP 0.1.2 minor update is released</h3>
    <p>
   This minor update fixes several bugs.  <br>

  
    </p>
<h3><img src="images/dna.png">  04-17-2014 - IDP 0.1.1 minor update is released</h3>
    <p>
   This minor update fixes several bugs and is accompanied by a convenient, small-sized, test dataset available in the tutorial.  <br>

  
    </p>

    <div id="0.1">

	

    <h3><img src="images/dna.png">  11-26-2013 - IDP 0.1 and the manual and a tutorial are released</h3>
    </div>
    <p>
   IDP integrates short reads (e.g. Illumina data) and long reads (e.g. PacBio data) to identify gene isoforms (transcripts) from transcriptome (see Figure above).<br>

  
    </p>
    <ul>
    <li> One input of IDP is the short-read RNA-seq results: junctions (bed file) AND alignments of short reads (sam file). 
	<br> Most RNA-seq tools, such as <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a> and Tophat can output these two files.</li>
    <li> The other input is the long reads: raw sequences (FASTA file) OR alignment of long reads (PSL file by BLAT or <a href="IDP_gpd_format.asp">GPD file</a>)
	<br> The error-corrected long reads from PacBio data is perferred. <a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a> is our default error-correction tool. </li>
	
	<li> The IDP output are the gene isoform identifications and quantification of genes and gene isoforms. <a href="hESC.asp"> hESC transcriptome (H1 cell line)</a> is the first one identified by this methods. 
	For more details of this transcriptome, please see its homepage <a href="hESC.asp"> <b>http://www.healthcare.uiowa.edu/labs/au/IDP/hESC.html</b> </a> and our paper <b> Characterization of the human ESC transcriptome by hybrid sequencing </b>[<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>].
	
    </ul>

	
    </p>
	<p>
   <h3><img src="images/dna.png"> 11-26-2013: Hompage of hESC transcriptome identified by SpliceMap-LSC-IDP pipline is released.</h3>

   The homepage of <a href="hESC.asp"> hESC transcriptome (H1 cell line)</a> is released. You can also find novel genes, novel isoforms of existing genes (including pluripency markers) and novel ncRNA in this website: <br>
   <center><a href="hESC.asp"> <b>http://www.healthcare.uiowa.edu/labs/au/IDP/hESC.asp</b> </a> </center><br>
   The details of this hESC transcriptome can be in our publication:
   <b> Characterization of the human ESC transcriptome by hybrid sequencing </b>[<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>]
    </p>
	
	<p>
   <h3><img src="images/dna.png"> 11-26-2013: IDP and hESC transcriptome paper is released </h3>

 Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> [<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>] 
	<br><i>In press</i> </br>
	
    </p>
	
	
	
    <p>
      For detailed information about this release, please see the <a href="IDP_download_current.asp">release notes</a>.
   </p>
   
  </div>

<!-- #include file ="asp\sidebar.inc" -->
  
<!-- #include file ="asp\footer.inc" -->
  
  

<!-- end #content -->
</body>


</html>
