<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Utilities</title>
<!-- #include file ="asp\header.inc" -->
<!-- #include file ="asp\all_track.inc" -->
</head>


<body>

<!-- #include file ="asp\redbar.inc" -->
<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
   <div id="page_title_area">
    <!-- STANDARD PAGE TITLE; NO DECORATIVE GRAPHIC -->
    <!-- <div id="page_title_leftcontent"> -->
    <div id="page_title_leftcontent">
      <h1>Au Lab</h1>
      <ul>
    </div>



  </div>


  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->


  <!-- END PAGE TITLE AREA AND BOX -->
<div id="content">

    <h2>Utilities</h2> </p>
  
  <p></p>
    <div id="findNovelJunctions">
    <h3><img src="images/dna.png"> <a href="utilities/findNovelJunctions.zip" download><img src="images/download.png"> Module: findNovelJunctions </a></h3>
    </div>
    Finds the junctions that do not exist in a reference file.  If you wish to find the junctions that differ between two bed files, you should run this tool twice with each file as reference.<br>
    
  <br><dd>usage: findNovelJunctions &ltref_refFlat.txt&gt &ltjunction.bed&gt
          <br>or findNovelJunctions &ltjunction1.bed&gt &ltjunction2.bed&gt</dd><br>
    
    
  <p></p>


   <div id="genepred2fasta">
    <h3><img src="images/dna.png"> <a href="utilities/genepred2fasta.zip" download><img src="images/download.png"> Script: genepred2fasta.py </a></h3>
    </div>
    Convert genepred file to fasta.<br>
    
    <br><dd>usage: python genepred2FASTA.py &ltrefFlat.txt&gt &ltgenome_list_filename&gt</dd><br>
    
    
  <p></p>

  <div id="genepred2gtf">
    <h3><img src="images/dna.png"> <a href ="utilities/genepred2gtf.zip" download><img src="images/download.png"> Script: genepred2gtf.py </a></h3>
    </div>
    Convert genepred file to gtf file.<br>
    
  <br><dd>usage: python genepred2gtf.py &ltgenepred_file&gt &ltrefFlat.txt&gt</dd><br>
    
    
  <p></p>
    <div id="gpd2bed">
    <h3><img src="images/dna.png"> <a href="utilities/gpd2bed.zip" download ><img src="images/download.png"> Script: gpd2bed.py </a></h3>
    </div>
    Convert to genepred file to bed file.<br>
    
  <br><dd>usage: python gpd2bed.py &ltgpd_file&gt</dd><br>


  <p></p>
    <div id="novel_genepred">
    <h3><img src="images/dna.png"> <a href="utilities/novel_genepred.zip" download><img src="images/download.png"> Script: novel_genepred </a></h3>
    </div>
    Find novel isoforms in .gpd file (such as predicted isoforms from IDP).<br>
    
  <br><dd>usage: python novel_genepred.py &ltref_refFlat_file&gt &lttag_refFlat_file&gt &ltoutput_file&gt</dd><br>
    
    
  <p></p>



  <div id="additional_utilities">
    <h3><img src="images/dna.png"> <a href ="https://github.com/jason-weirather/Au-public"> Additional utilities on GitHub </a></h3>
    </div>
    
  <p></p>



 </div>
  
<!-- #include file ="asp\sidebar.inc" -->
  
<!-- #include file ="asp\footer.inc" -->
  
  

<!-- end #content -->
</body>


<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23879262-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


</html>
