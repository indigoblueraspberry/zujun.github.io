<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <!-- include virtual="header.inc" -->

<head>
  <title>How does IDP work</title>
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
    <h2>How does IDP-fusion work?</h2>
    <p>
    IDP-fusion prefroms isoform/transcript identification by integrating long reads and short reads.  
    <p>Isoforms from fusion-genes are included in the global analysis. </p>
	<p>Relatively short gene isoforms can be detected directly if the full junction linkage can be covered by long reads.</p>
	<p>Relatively long gene isoforms are predicted by selecting highly-expressed isoform candidates. Isoform candidates are constructed from long reads and junctions detected by short reads. </p>
	Abundance estimation is solved by Max A Posteriori of short read coverage. The priori is emprically approximated by direct-detection rate of transcripts w.r.t abundance and length.
    </p>
    <p>
    IDP-fusion is geared towards any long reads and short reads, as long as they are generated from the same (at least similar) source. If you are having trouble running IDP, please <a href="IDP-fusion_contact.asp">let us know</a>. 
    </p>
    

  
  </div>
    
<!-- #include file="asp\sidebar.inc" -->

 <!-- #include file="asp\footer.inc" --> 

  
<!-- end #content -->
</body>

</html>
