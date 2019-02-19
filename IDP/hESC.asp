<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>hESC transcriptome by IDP</title>
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
    <h2>hESC transcriptome - H1 cell line</h2>
    <p>This website contains the data and the results in each section of <a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">our PNAS paper</a>. 
	You can click the section title to find the updated data, figures, tables and other results. </p>
    <ul>
        <li><b><a href="hESC_Gene_isoform_detection_and_prediction.asp">Gene isoform detection and prediction</a></b></li>
			<dd> 8,084 detections and 10,811 predictions of gene isoforms. Overall identification rate is 74%. </dd>		
        <li><b><a href="hESC_Novel_genes.asp">Novel genes</a></b></li>
			<dd> More than 100 novel isoforms are identied in the novel gene loci, which are not reported by existing annotations (RefSeq, Ensembl, KnownGen and Gencode).</dd>		
        <li><b><a href="hESC_hESC-specific_novel_genes.asp">hESC-specific novel genes</a></b></li>
			<dd> 23 novel genes (Human Pluripotent Assoiated Transcript, HPAT) have specificly high expression in hESC. </dd>		
        <li><b><a href="hESC_Novel_gene_isoforms.asp">Novel gene isoforms</a></b></li>
			<dd> 2,103 novel isoforms are idenfied and are not reported bexisting annotations (RefSeq, Ensembl, KnownGen and Gencode).</dd>		
		<li><b><a href="hESC_Quantification_of_isoform_abundance.asp">Quantification of isoform abundance</a></b></li>
			<dd> Gene isoform abundance estimation by using this identified transcriptome.</dd>		
		<li><b><a href="hESC_Isoforms_of_pluripotent_stem_cell_markers.asp">Isoforms of pluripotent stem cell markers</a></b></li>
			<dd> The expressed isoforms (including novel ones) of the pluripotent stem cell markers, such as Oct4, Sall4, Sox2 ...</dd>		
		<li><b><a href="hESC_ncRNA_identification.asp">ncRNA identification</a></b></li>
			<dd> 116 novel lncRNAs are identified and 68 have relatively high expressions in hESC.</dd>		
		<li><b><a href="hESC_Data.asp">Data</a></b></li>
			<dd> Millions of PacBio long reads and 100 million of Illumina short reads.</dd>		
        <li><b><a href="hESC_howitworks.asp">How it works? </a></b></li>
			<dd> The SpliceMap-LSC-IDP pipeline is applied to identify gene isoforms. </dd>		
			</ul>
	    <p> <font color="red"> We keep optimizing the results by running the updated LSC and IDP. More and more reliable results will be updated. If you want to subscribe our update news, please contact Kin Fai Au: <b>kinfaiau(at)gmail(dot)com</b></font></p>

    <h2>Latest publications</h2>

    <p>
    Durruthy-Durruthy J., Sebastiano V., Wossidlo M., Cepeda D., Cui J., Grow E.J., Davila J., Mall M., Wing W.H., Wysocka J., <b>Au, K.F.</b>, Pera, R.R.
     <br><b>A novel primate-specific noncoding RNA modulates human embryo- and pluripotent stem cell fate.</b><br>
     <i>Nature Genetics.</i> 2015. In press.
    </p>
<br>
    <p>
    Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> [<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>] 
	<br><i>Proc. Natl. Acad. Sci. USA</i> 2013 110 (50) E4821-E4830 [<a href="http://www.healthcare.uiowa.edu/labs/au/pubs/IDP.pdf">preprint</a>] <br>
	<br>
    <i></i>  
  </p>

	<div id="SpliceMap-LSC-IDP pipeline">
    <h2>SpliceMap-LSC-IDP pipeline</h2>
    </div>
    <p>This hESC transcriptome is identified by <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP/">IDP</a> pipeline.</p>
	<p>SpliceMap takes short reads from the Second Generation Sequencing platforms, such as Illumina, to detect exon junctions.</p>
	<p>LSC makes use of the high-quality short reads to correct the long reads from PacBio platform. The output is the error-corrected long reads.</p>
	<p>IDP uses the junction detections and the alignment of error-corrected long reads to detect the relatively short isoforms at full-length and predict the very long isoforms by statistical modeling. </p>
	<p></p>
	<center><img src="images/SpliceMap-LSC-IDP_pipeline.png" width="100%" hight="100%" >&nbsp;&nbsp;&nbsp;&nbsp;</center> 


	
    <div id="news">
    <h2>Latest News</h2>
    </div>


    <div id="0.3">

	

	<p>
   <h3><img src="images/dna.png"> 11-26-2013: hESC transcriptome and IDP paper is released </h3>
 Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> 
    </p>
	
	
     </div>

    </p>

	
    <p>
      If you want to subscribe our update news, please contact Kin Fai Au: <b>kinfaiau(at)gmail(dot)com</b>.
   </p>
   
  </div>

<!-- include virtual="sidebar.inc" -->

  

<!-- #include file="asp_hESC\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  

<!-- end #content -->
</body>


</html>
