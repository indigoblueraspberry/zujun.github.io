<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP-ASE requirements</title>
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
    IDP aims to fully integrate into a variety of analysis pipelines. If any of the
    following requirements conflict with your lab's set up, please <a href="IDP_contact.asp">contact</a> us. 
    
    <h3><img src="images/dna.png"> System Requirements</h3>
    <ul>
      <li>Linux operating system</li>
      <li>You needs free hard drive space for double size of your read alignments data. </li>
    </ul>
    
    <h3><img src="images/dna.png"> Software Requirements</h3>
    <ul>
      <li><a href="http://julialang.org/downloads/">Julia 0.4</a></li>
      <li><a href="http://bedtools.readthedocs.io/en/latest/content/installation.html">Bedtools</a></li>

    </ul>
    
    <h3><img src="images/dna.png">Hybrid-Seq data</h3>
    <ul>
      <li>Raw sequences for short read and long read data (in FASTQ format)</li>
      <li>PSL alignment files</li>
    </ul>
    <h3><img src="images/dna.png">Reference files</h3>
    <ul>
      <li><b>Annotation file</b>Genepred file in <a href="https://genome.ucsc.edu/FAQ/FAQformat.html#format9">extended format</a></li>
      <li><b>VCF file</b>List of biallelic, exonic SNPs in <a href="https://en.wikipedia.org/wiki/Variant_Call_Format">VCF format</a></li>
    </ul>
  </div>
  
  

  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
<!-- end #content -->
</body>


</html>
