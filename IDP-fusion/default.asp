<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP-fusion - Detection and Predict Isoforms Spanning Fusion Events </title>
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
    <p>These steps will help you integrate IDP-fusion into your transcriptomics analysis pipeline. </p>
    <ul>
        <li>Read the <a href="IDP-fusion_requirements.asp">IDP-fusion requirements</a> for running IDP-fusion. </li>
        <li><a href="IDP-fusion_download_current.asp">Download</a> and set-up the IDP-fusion package. </li>
        <li>Follow the <a href="IDP-fusion_long_read_file_guide.asp">guide for generating long read files</a> suitable for isoform predicton or fusion detection.</li>
        <li>Follow the <a href="IDP-fusion_tutorial.asp">tutorial</a> to see how IDP-fusion works on some example data. </li>
        <li>Read the <a href="IDP-fusion_manual.asp">manual</a> if anything is unclear. </li>

        <li>You're ready, Happy IDPing!</li>

    </ul>
    <h2>Publication</h2>
  <p><br><b>Characterization of fusion genes and the significantly
  expressed fusion isoforms in breast cancer by hybrid
  sequencing.</b><br>
  <b><a>Weirather, J.*</a></b>, Afshar, P.T.*, Clark, T., Tseng, E., Powers, L., Underwood, J.G., Zabner, J., Korlach, J., Wong, W.H., <b><a>Au, K.F.</a></b>
  <br><i>Nucleic Acids Research.</i> 2015 [<a href="http://nar.oxfordjournals.org/content/early/2015/06/03/nar.gkv562.long">Manuscript</a>]
  <br><b>* These authors contributed equally to this work</b><br>
  </p>
<br>


	<div id="SpliceMap-LSC-IDP-fusion pipeline">
    <h2>IDP-fusion pipeline</h2>
    </div>
    <p>This fusion-transcriptome is identified by the<a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP-fusion/">IDP-fusion</a> pipeline.</p>
	<p>SpliceMap takes short reads from the Second Generation Sequencing platforms, such as Illumina, to detect exon junctions.</p>
	<p>LSC makes use of the high-quality short reads to correct the long reads from PacBio platform. The output is the error-corrected long reads.</p>
	<p>IDP-fusion uses the junction detections and the alignment of error-corrected long reads to detect the relatively short isoforms and fusion isforms at full-length and predict the very long isoforms and fusion isoforms by statistical modeling. </p>
	<p></p>
	<center><img src="images/IDP-fusion_pipeline-for-website.png" width="100%" hight="100%" >&nbsp;&nbsp;&nbsp;&nbsp;</center> 
	
	
    <div id="news">
    <h2>Latest News</h2>
    </div>

 <h3><img src="images/dna.png">  01-19-2017 - Update to the IDP-fusion code.</h3>
<p>This update addresses a number of bugs and troublesome issues with inpput files and segemenation faults when running STAR</h3>
 <h3><img src="images/dna.png">  10-24-2016 - Update to the IDP-fusion code</h3>
<p>This update addresses compatability issues with newer versions STAR and GMAP aligners and other bug fixes.</p>
 <h3><img src="images/dna.png">  02-12-2015 - First Upload of IDP-fusion code</h3>
<p>This is a the first major release of IDP-fusion, and we will build a set of manuals and tutorials based on this release, then proceed to improve with updates as it becomes helpful to users.</p>
   
  </div>

<!-- #include file ="asp\sidebar.inc" -->
  
<!-- #include file ="asp\footer.inc" -->
  
  

<!-- end #content -->
</body>


</html>
