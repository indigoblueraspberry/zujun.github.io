<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>LSC requirements</title>
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
    LSC aims to fully integrate into a variety of analysis pipelines. If any of the
    following requirements conflict with your lab's set up, please <a href="LSC_contact.asp">contact</a> us. 
    
    <h3><img src="images/dna.png"> System Requirements</h3>
    <ul>
      <li>Linux operating system</li>
      <li>Python 2.7</li>
      <li>16GB RAM recommended (8GB minimum for 5G bp short reads)</li>
      <li>Free hard drive space exceeding 3x The uncompressed size of your short read data</il>
    </ul>
    
    <h3><img src="images/dna.png"> Read Format</h3>
    <ul>
      <li>Single-end short reads or multiple files for paired-end short reads supported</li>
      <li>Length of short reads should be greater or equal to <b>50bp</b></li>
      <li>There is <b>no</b> requirement that reads must be the same length. </li>
      <li>Input to LSC are sequencer reads in FASTA or FASTQ format. </li>
    </ul>
    
    <h3><img src="images/dna.png"> Software</h3>
    <ul>
      <li>Short read mapper:
      <ul>
        <li>Bowtie2
        <br>If you require support of another short read mapper please contact us.</li>
      </ul>
      </li>
    </ul>

    
  </div>
  
  

<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->


  
<!-- end #content -->
</body>


</html>
