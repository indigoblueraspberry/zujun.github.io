<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>AlignQC requirements</title>
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
    <h2>Requirements</h2>
    AlignQC aims to provide useful quality control information based on an Alignment file. If any of the
    following requirements conflict with your lab's set up, please <a href="AlignQC_contact.asp">contact</a> us. 
    
    <h3><img src="images/dna.png"> System Requirements</h3>
    <ul>
      <li>Linux operating system (Linux's coreutils must be 8.6 or better)</li>
    </ul>
    
    <h3><img src="images/dna.png"> Software Requirements</h3>
    <ul>
      <li>Python 2.7+</li>
      <li>R</li>
    </ul>
    
    <h3><img src="images/dna.png">Alignment file</h3>
    <ul>
      <li><b>BAM alignment - </b>If you analyze a transcriptome we recommend aligning with GMAP using the 'samse' format option and using samtools to convert this output to a BAM format.  The ideal format outputs multiple alignment paths for each read, and includes the query sequence.</li>
    </ul>
    <h3><img src="images/dna.png">Reference files</h3>
    <p>Only the alignment in BAM formant is necessary but to acheive all the analyses you should specify reference fasta and a reference genepred transcriptome</p>
    <ul>
      <li><b>--reference - </b>genome FASTA file (optional, but must be included to have error pattern analysis)</li>
      <li><b>--annotation - </b>refFlat genePred file.  See our <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">detailed description of the genePred file format</a>.  This is the main primary set of refernece transcripts used define known transcripts, and to annotate. (optional, but must be included to use annotations and genomic features in the report) </li>
    </ul>
    
  </div>
  
  

  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
<!-- end #content -->
</body>


</html>
