<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>AlignQC - Check an alignment file, Study error patterns, and make an easy to share report</title>
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
    <p>Before you begin, you should <a href="files/example_portable.html">see an example report</a> to see if AlignQC outputs will be useful for you.</p>
    <p><a href="files/example_portable.html"><img src="files/report_example.png" width="700" alt="AlignQC_Example"></a></p>
    <p>These steps will help you integrate AlignQC into your quality control pipeline. </p>
    <ul>
        <li>Read the <a href="AlignQC_requirements.asp">Requirements</a> for running AlignQC. </li>
        <li>Visit the <a href="https://github.com/jason-weirather/AlignQC/wiki">AlignQC manual</a> on github for help getting started. </li>
        <li><a href="AlignQC_download_current.asp">Download</a> and set-up AlignQC </li>
    </ul>

    <h3>How to Cite</h3>
     Weirather JL, de Cesare M, Wang Y et al. <b>Comprehensive comparison of Pacific Biosciences and Oxford Nanopore Technologies and their applications to transcriptome analysis [version 1; referees: awaiting peer review].</b> <i>F1000Research</i> 2017, 6:100 (<a href="doi: 10.12688/f1000research.10571.1">doi: 10.12688/f1000research.10571.1</a>)
	
    <div id="news">
    <h2>Latest News</h2>
    </div>




<h3><img src="images/dna.png">  02-07-2017 - AlignQC Manuscript is released on <i>F1000research</i></h3>
<p>The initial release of the manuscript awaites peer review.  We hope the software will be of great use to many people.</p>
<p><b>Comprehensive comparison of Pacific Biosciences and Oxford Nanopore Technologies and their applications to transcriptome analysis [version 1; referees: awaiting peer review].</b>
    <br><b>Weirather, J.L.*</b>, de Cesare, M.*, <b>Wang, Y.*</b>, Piazza, P., Vittorio, S., Wang, X.J., Buck, D., <b>Au, K.F.</b>
    <br><i>F1000Research</i> 2017, 6:100 [<a href="doi: 10.12688/f1000research.10571.1">Manuscript</a>]
    <br><b>* These authors contributed equally to this work</b></p>

<h3><img src="images/dna.png">  11-29-2016 - AlignQC version 1.2</h3>
<p>This patch provides numerous performance improvements.</p>
<ul>
<li>1. Bug fixed where entire header of fasta files was read as the name.  Now first non-whitespace characters are used to improve compatability with aligners..
</li>
<li>2. Numerous performance improvements have greatly improved speeds and lowered memory requirements. 
</li>
<li>3. Fixed graphical bug in the transcript table.
</li>
<li>4. Distribution of distances of observed junction boundaries from near-by reference boundaries is shown in the "error" analysis.
</li>
</ul>
 <h3><img src="images/dna.png">  09-02-2016 - AlignQC version 1.1</h3>
<p>This patch provides graphics update minor bug fixes and additional command line interface options.</p>
<ul>
<li>1. Improved figure graphics.
</li>
<li>2. Performance improvements
</li>
<li>3. 'dump' command for accessing data URIs embedded in xhtml files in
the command line
</li>
<li>4. 'compare' command for generating comparisons between xhtml outputs.
</li>
<li>5. The coverage distribution plot is now color coded by the N highest
expressed bases in descending order. i.e., bright red means the most
expressed 50k bases.
</li>
</ul>
 <h3><img src="images/dna.png">  07-08-2016 - First version of AlignQC</h3>
<p>This is a the first release of the AlignQC software.  Please let us knnow if you have any problems so we can make the software better.</p>
   
  </div>

<!-- #include file ="asp\sidebar.inc" -->
  
<!-- #include file ="asp\footer.inc" -->
  
  

<!-- end #content -->
</body>


</html>
