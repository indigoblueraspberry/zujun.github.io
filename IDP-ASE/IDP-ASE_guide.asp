<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>Guide</title>
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
  This setup guide is in progress. For now see the <a href="https://github.com/bdeonovic/IDPASE.jl">Github</a>.
  <h3><img src="images/dna.png">  <b>Step 1</b> - install <a href=http://julialang.org/downloads/oldreleases.html">julia 0.47</a></h3>
  <h3><img src="images/dna.png">  <b>Step 2</b> - From Julia's command line run </h3>
    <pre> Pkg.clone("git://github.com/bdeonovic/IDPASE.jl.git") </pre>
  <h3><img src="images/dna.png">  <b>Step 3</b> - Install <a href="http://bedtools.readthedocs.io/en/latest/content/installation.html">Bedtools</a></h3>
  <h3><img src="images/dna.png">  <b>Step 4</b> - Prepare necessary input files </h3>
  <ul>
    <li> <a href="https://en.wikipedia.org/wiki/Variant_Call_Format">VCF File</a></li>
    <li> <a href="https://genome.ucsc.edu/FAQ/FAQformat.html#format9">GPD File</a> in Extended Format. You can utilize the accompanying script to convert from regular GPD to extended GPD.
      <pre> julia ~/.julia/v0.4/IDPASE/scripts/convert_gpd.jl mygpd.gpd > newgpd.gpd</pre>
    </li>
    <li> PSL alignment file of your hybrid-Seq data. You can convert from SAM/BAM to psl using libraries such as <a href="https://github.com/jason-weirather/Au-public">Au-public utilties</a> in particular the <a href="https://github.com/jason-weirather/Au-public/blob/master/iron/utilities/sam_to_psl.py">sam_to_psl.py script</a>. 
    <li> FASTQ file of your hybrid-Seq data</li> 
  </ul>

  </div>


  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
