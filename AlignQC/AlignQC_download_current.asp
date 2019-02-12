<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>AlignQC download</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>

<body>

<!-- #include file="asp\redbar.inc" -->

<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->

  <!-- #include file="asp\titlearea.inc" -->

  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Downloads</h2>
    <p>
    Copyright and installation instructions are contained within the package. We
    recommend that you consult the <a href="https://github.com/jason-weirather/AlignQC"> readme</a> before attempting to use AlignQC. 
    </p>
        
    <table border="1" cellpadding="1">
    <tr>
    <td>
    <a href="files/AlignQC-1.2.tar.gz"  onClick="ga('send', 'event', 'file download', 'click', 'AlignQC download release');"><img src="images/download.png"><b>AlignQC-1.2.tar.gz</b></a>
    </td>
     <td>
    Please see the <a href="AlignQC_download_current.asp#notes">release notes</a> for 
    more information
    </td>
    </tr>

    
    </table>
	
    <div id="notes">
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

  </div>
  </div>
  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

</html>
