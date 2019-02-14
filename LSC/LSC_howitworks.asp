<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>How does LSC work</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>

<body>


<!-- #include file ="asp\redbar.inc" -->


<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file ="asp\titlearea.inc" -->


  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->

  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>How does LSC work?</h2>
    <p>
    LSC is a pure implementation of the long read error correction algorithm. Long reads and high-quality short reads are homopolyer-compressed.
	Then, compressed short reads are mapped to compressed long reads with Bowtie2. 
    Then the concensus sequences for short reads will replace the mapped regions in the long reads. 
    </p>
    <p>
    LSC is geared towards any long reads, as long as they are generated from the same(at least similar) source with the short reads. If you are having trouble running LSC, please <a href="LSC_contact.asp">let us know</a>. 
    </p>
    

  
  </div>
    

<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
  
<!-- end #content -->
</body>


</html>
