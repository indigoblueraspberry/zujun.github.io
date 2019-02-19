<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>Gene isoform detection and prediction</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>


<body>

<!-- #include file ="asp_hESC\redbar.inc" -->



<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file ="asp_hESC\titlearea.inc" -->


  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->


  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2> Detection + Prediction = Identification</h2>
    <p>You can download the different part of the gene isoform identification from this webpage. All isoforms are divided as the figures below. The download links of different parts are highlighted in the same colors of the piechart</p>
	
	
	<center><img src="images/figure1A.png" width="100%" hight="100%"> </center>
    <h2>Gene isoform detection</h2>
    If there is a perfect junction linkage match of an exisiting annotated gene isoform (RefSeq in this study).in the the long reads, we call this isoform detected and this isoform is a <b>DETECTION</b>.
<br>

    <ul>
        <li><img src="images/download.png"><b><a href="data/hESC_detection_v1.zip"><font color="4CAEE3"> Gene isoform detection (8,084)</font></a></b></li>
			<dd> These 8,084 (2,732 + 5,352) detections are the gene isoforms annotated by RefSeq.</dd>	
	</ul>
	    
    <h2>Gene isoform prediction</h2>
    These relatively long isoforms are not detected directly (see Gene isoform detection). But we find their fragments from long reads. Based on these long reads, we applied Max A Posterior on short read coverage and then predict these isoforms at the FPR<0.05. Details are in <b><a href="hESC_howitworks.asp">How it works?</a></b>
<br>
   <ul>
        <li><img src="images/download.png"><b><a href="data/hESC_Prediction_v1.zip"><font color="black"> Prediction (10,811)</font></a> = <font color="#728FCE"> Overlap of Prediction and Detection </font> + <font color="#FFD801"> Prediction only</font> </b></li>
			<dd> There are 10,811 (5,352 + 5,459) gene isoform predictions with FPR <0.1. 5,352 predictions are detected directly and 5,459 predictions are not detected by full-length. </dd>		
        <li><img src="images/download.png"><b><a href="data/hESC_RefSeqAnnotated_Prediction_NotDetection_v1.zip"><font color="#5D478B"> RefSeqAnnotated, Prediction only (1,785)</font></a></b></li>
			<dd> Out of 5,459 "<b><font color="#FFD801"> Prediction only</font></b>" isoforms, 1,785 are RefSeq annotated.</dd>	
		<li><img src="images/download.png"><b><a href="data/hESC_NonRefSeqAnnotated_Prediction_NotDetection_v1.zip"><font color="#3090C7"> NonRefSeqAnnotated, Prediction only (1,027)</font></a></b></li>
			<dd> Out of 5,459 "<b><font color="#FFD801"> Prediction only</font></b>" isoforms, 1,027 are not RefSeq annotated but annotated in Ensembl, KnownGen or Gencode. "NonRefSeq" is denoted as the combination of Ensembl, KnownGen and Gencode. </dd>		
        <li><img src="images/download.png"><b><a href="data/hESC_Novel_Isoform_v1.zip"><font color="#89C35C"> Novel isoform (2,103)</font></a></b></li>
			<dd> Out of 5,459 "<b><font color="#FFD801"> Prediction only</font></b>" isoforms, 2,103 are not reported by EST or annotated by RefSeq, Ensembl, KnownGen or Gencode. <a href="hESC_Novel_gene_isoforms.asp">Please see more details in the section of "<b>Novel gene isoforms</b>"</a></dd>		

	</ul>
	    <p>  We keep optimizing the results by running the updated LSC and IDP. More and more reliable results will be updated. If you want to subscribe our update news, please contact Kin Fai Au: <b>kinfaiau(at)gmail(dot)com</b></p>

 
   
  </div>

<!-- #include file ="asp_hESC\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->


<!-- end #content -->
</body>



</html>
