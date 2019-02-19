<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>Data</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>



<body>
<!-- #include file="asp_hESC\redbar.inc" -->


<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file="asp_hESC\titlearea.inc" -->


  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->


  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Publication</h2>
    You can find the data and the results (data accession ID: <b>GSE51861</b>) from the following paper:<br><br>
	Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> [<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>] 
	<br><i>In press</i> </br>
	<br>
    <i></i>  

	<div id="SpliceMap-LSC-IDP pipeline">
    <h2>Data from SpliceMap-LSC-IDP pipeline</h2>
    </div>

    <p>This hESC transcriptome iS identified by <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP/">IDP</a> pipeline.</p>

	
	
	<p></p>
	<center><img src="images/SpliceMap-LSC-IDP_pipeline.png" width="100%" hight="100%" >&nbsp;&nbsp;&nbsp;&nbsp;</center> 


	<h3>Long reads</h3>	
	
	<dd>
	<li><img src="images/download.png"><b><a href="data/hESC_H1_PacBio.gpd_v1.zip"><font color="black"> Alignment of error-corrected long reads</a></b></li>
			<dd> This is the alignment of the error-corrected PacBio long reads (hESC_H1_PacBio.fa) by BLAT. It was converted to gpd format (genephed format, the RefSeq annotation format), which ingores the deletion shorter than 68bp. This cotains the junction linkage within long reads, because most junctions should be longer than 68bp. Please see the Method section in the Supporting Information of the paper.</dd>		
    </dd>
	
	<h3>IDP output</h3>	
	
	
	<dd>
	<li><img src="images/download.png"><b><a href="data/hESC_isoform_v1.zip"><font color="black"> Isoform identification (detection + prediction)</a></b></li>
			<dd>This is the transcriptome (isoforms) identified. </dd>
	</dd>
	<dd>
	<li><img src="images/download.png"><b><a href="data/hESC_isoform_RPKM_v1.txt"><font color="black"> Isoform abundance</a></b></li>
			<dd>It contains the isoform abundance and gene abundance. </dd>			
    </dd>
	<br>
 <p>
      If you want to subscribe our update news, please contact Kin Fai Au: <b>kinfaiau(at)gmail(dot)com</b>.
   </p>	
     </div>



<!-- #include file="asp_hESC\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->


<!-- end #content -->
</body>

</html>
