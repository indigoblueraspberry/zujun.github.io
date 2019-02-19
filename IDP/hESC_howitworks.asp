<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>How it works?</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>



<body>


<!-- #include file ="asp_hESC\redbar.inc" -->
<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file ="asp_hESC\titlearea.inc" -->

  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Methodology publication</h2>
    You can find the details of the <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/LSC.html">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP.html">IDP</a> pipeline in the Supporting Information of the following paper:<br><br>
	Kin Fai Au, Vittorio Sebastiano, Pegah Tootoonchi Afshar, Jens Durruthy Durruthy, Lawrence Lee, Brian A. Williams, Honoratus Van Bakel, Eric Schadt, Renee A. Reijo Pera, Jason Underwood, Wing Hung Wong
<br>
    <b> Characterization of the human ESC transcriptome by hybrid sequencing </b> [<a href="IDP.pdf">preprint</a>] 
	<br><i>In press</i> </br>
	<br>
    <i></i>  

	<div id="SpliceMap-LSC-IDP pipeline">
    <h2>SpliceMap-LSC-IDP pipeline</h2>
    </div>

    <p>This hESC transcriptome iS identified by <a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/LSC/LSC.html">LSC</a>-<a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP.html">IDP</a> pipeline.</p>

	
	
	<p></p>
	<center><img src="images/SpliceMap-LSC-IDP_pipeline.png" width="100%" hight="100%" >&nbsp;&nbsp;&nbsp;&nbsp;</center> 


	<h3><a href="http://www.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a></h3>	
	<p>SpliceMap takes short reads from the Second Generation Sequencing platforms, such as Illumina, to detect <b>exon junctions</b>. The algorithm is based on 25mer-seeding and seeding extension. </p>
	<h3></h3>
	<h3><a href="http://www.healthcare.uiowa.edu/labs/au/LSC/LSC.html">LSC</a></h3>	
	<p>LSC makes use of the high-quality short reads (such as Illumina) to correct the long reads from PacBio platform. The output is the <b>error-corrected long reads</b>. The algorithm is based on homopolyer compression and alignment of short reads to long reads.</p>
	<h3></h3>
	<h3><a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP.html">IDP</a></h3>	
	<p>IDP uses the <b>exon junction</b> detections and the alignment (by BLAT) of <b>error-corrected long reads</b> to detect the relatively short isoforms at full-length and predict the very long isoforms by statistical modeling. The prediction method contains the following steps:</p>

	<dd>
	1. Isoform candidate construction
	<dd>The long reads may only capture the fragments of relatively long isoforms. Using these fragments as seedings, IDP constructs isoform candidates by filling up the exon junctions between the fragments and the possible 5'/3' ends.</dd>
	<br>
	2. Abundance estimation of isoform candidates 
	<dd>Abundance of isoform candidates is estimated from short read coverage by MAP (Max. A Posteriori). The empirical priori is the undetection rate w.r.t isoform abudance and length.</dd>
	<br>
	3. Isoform selection at a given FPR by relative abundance with a gene
	<dd> 
	Relative abundance of an isoform is defined by:
	</dd>


      <style>
    td.upper_line { border-top:solid 1px black; }
    table.fraction { text-align: center; vertical-align: middle;
        margin-top:0.5em; margin-bottom:0.5em; line-height: 2em; }
</style>

<table class="fraction" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" nowrap="nowrap">
            <i>relative abundance</i> <b>=  </b>
        </td><td nowrap="nowrap">
            isoform abundance
        </td>
    </tr><tr>
        <td class="upper_line">
            the sum of all isoform abundances
        </td>
    </tr>
</table>


	IDP defines the "true positive" and "true negative" by:
	<dd>
	<p>
	<li>Positive: RefSeq gene isoforms that are detected directly with full-length from the other set of long read data. </li>
	<li>Negative: Isoform candidates which have two-consecutive-junction linkages that are not reported from RefSeq, Ensembl, KnownGen and EST libraries.</li>
	</p>
	Then, IDP uses relative abundance as the classifer parameter to compute the FPR (Flase Positve Rate). Finally, IDP outputs the isoform candidates above a relative abundance threshold to control FPR. </dd>
	<br>
	
	</dd>
	<h3></h3>
	
 <p>
      If you want to subscribe our update news, please contact Kin Fai Au: <b>kinfaiau(at)gmail(dot)com</b>.
   </p>	
     </div>

    

	
 
   
  
<!-- #include file ="asp_hESC\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  

<!-- end #content -->
</body>


</html>
