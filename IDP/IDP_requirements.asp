<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP requirements</title>
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
      <li>You needs free hard drive space for double size of your short read alignments data (SAM file,"SR_sam_pathfilename" in run.cfg) </li>
    </ul>
    
    <h3><img src="images/dna.png"> Software Requirements</h3>
    <ul>
      <li>Python 2.6 <b>and the argparse module</b>, or Python 2.7 (includes argparse)</li>
      <li>scipy and numpy (can do <b>apt-get install python-scipy</b> on Ubnutu to get both)</li>
      <li>seqmap (included with <a href="http://web.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>)</li>
      <li><a href="http://research-pub.gene.com/gmap/">GMAP</a> and/or <a href="http://hgdownload.cse.ucsc.edu/admin/exe/">BLAT</a></li>

    </ul>
    
    <h3><img src="images/dna.png"> Read Format</h3>
    <ul>
      <li>Raw sequences (FASTA format) or alignments (PSL format or <a href="IDP_gpd_format.asp">GPD format</a>) of long reads</li>
      <li>Junction detections (SpliceMap BED format) and alignments (SAM format) of short reads</li>
    </ul>
    
    <h3><img src="images/dna.png"> Upstream</h3>
    <ul>
	  <li>The LSC-corrected long reads are preferred. <b><font color = "red">Please concatenate the LSC outputs: corrected.fa with full.fa, and use this new fasta file as your long read inputs for IDP.</font color></b>  Do not worry about redundancies.</li>
      <li>Splicemap must be used to generate the short read alignment (.sam) file, and the junction file (junction_color.bed).</li>
      <li>If you wish to use GMAP, you need to use gmap_build to generate an index based on your reference genome and provide the location of the index in the config file.</li>
    </ul>

    
  </div>
  
  

  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
<!-- end #content -->
</body>


</html>
