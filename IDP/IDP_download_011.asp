<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP download</title>
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
    <h2>Downloads</h2>
    <p>
    Copyright and installation instructions are contained within the package. We <b>strongly
    recommend</b> that you consult the <a href="IDP_tutorial.asp">tutorial</a> before attempting to use IDP. 
    </p>

    
    
    <table border="1" cellpadding="1">
    <tr>
    <td>
    <a href="files/IDP_0.1.1.tar.gz" onClick="ga('send', 'event', 'file download', 'click', 'IDP code download');><img src="images/download.png"><b>IDP 0.1.1</b></a>
    </td>
     <td>
    Please see the <a href="IDP_download_011.asp#notes">release notes</a> for 
    more information
    </td>
    </tr>

    
    </table>

 
	
    <div id="notes">
    <h3><img src="images/dna.png">  <b>IDP 0.1.1</b> - Release Notes</h3>
    </div>
   <p>
   IDP integrates short reads (e.g. Illumina data) and long reads (e.g. PacBio data) to identify gene isoforms (transcripts) from transcriptome (see Figure above).<br>

  
    </p>
    <ul>
    <li> One input of IDP is the short-read RNA-seq results: junctions (bed file) AND alignments of short reads (sam file). 
	<br> Most RNA-seq tools, such as <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a> and Tophat can output these two files.</li>
    <li> The other input is the long reads: raw sequences (FASTA file) OR alignment of long reads (PSL file by BLAT or <a href="IDP_gpd_format.asp">GPD file</a>)
	<br> The error-corrected long reads from PacBio data is perferred. <a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a> is our default error-correction tool. </li>
	
	<li> The IDP output are the gene isoform identifications and quantification of genes and gene isoforms. <a href="hESC.asp"> hESC transcriptome (H1 cell line)</a> is the first one identified by this methods. 
	For more details of this transcriptome, please see its homepage <a href="hESC.asp"> <b>http://www.healthcare.uiowa.edu/labs/au/IDP/hESC.asp</b> </a> and our paper <b> Characterization of the human ESC transcriptome by hybrid sequencing </b>[<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>].
  </ul>
  <h3>Changes in version 0.1.1<br></h3>
    <ul>
      <li> os.path.abspath() was used in to change any relative paths into absolute paths where necessary, so now relative paths should work fine</li>
      <li> The path to blat was corrected to use the bundled version</li>
      <li> The CIGAR parser was modified to accept either ‘N’ or ‘D’ as a space indicator</li>
      <li> The way sets were declared in parseRef.py was updated </li>
	</ul>

  </div>
  
  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->


<!-- end #content -->
</body>


</html>
