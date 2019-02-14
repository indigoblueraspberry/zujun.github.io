<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>GenoClone requirements</title>
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
    GenoClone aims to provide useful tool to infer the tumor subclones and study tumor heterogeneity. If any of the
    following requirements conflict with your lab's set up, please <a href="GenoClone_contact.asp">contact</a> us. 
    
    <h3><img src="images/dna.png"> System Requirements</h3>
    <ul>
      <li>Linux operating system </li>
    </ul>
    
    <h3><img src="images/dna.png"> Software Requirements</h3>
    <ul>
      <li>Python 2.7+</li>
      <li>MATLAB 2014+</li>
	  <li>samtools 1.3.1</li>
	  <li>VarScan 2.4.2</li>
    </ul>
	<p> <b>Notes: Python, MATLAB, and samtools are available through your path environment variable.</b>
	</p>
    
    <h3><img src="images/dna.png">Alignment file</h3>
    <ul>
      <li><b>BAM alignment - </b>You need the tumor and matched normal bam file from exome or whole genome sequencing. </li>
    </ul>
    <h3><img src="images/dna.png">Reference files</h3>
    <ul>
      <li><b>--reference - </b>genome FASTA file (Input for VarScan to detect the mutations)</li>
    </ul>
    
  </div>
  
  

  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
<!-- end #content -->
</body>


</html>
