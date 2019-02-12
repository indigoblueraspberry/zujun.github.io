<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>Long read files</title>
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
  Download and install IDP-denovo, read "readme" in code package for details. 
  <pre>
   make
  </pre>

<b> For impatient people </b>
<pre> 
   ./idpdenovo  <options>
   </pre>
e.g, 
./idpdenovo scaffold=/user/shuhua/idpdenovo/test_data/scaffold.fa lr=/user/shuhua/idpdenovo/test_data/lr.fa leftSr=/user/shuhua/idpdenovo/test_data/leftSr.fa rightSr=/user/shuhua/idpdenovo/test_data/rightSr.fa

For test (in directory "test_data"): 
"scaffold.fa", "lr.fa" "leftSr.fa" "rightSr.fa"

  <h3><img src="images/dna.png">  <b>Step 1</b> - SR-scaffold extension and k-mer cluster</h3>
  <pre>
        scaffoldExtend <LR align to scaffold.sam> <scaffold.fa> <LR.fa>
         </pre>
    scaffold.fa is from Oases output (transcripts.fa), In "LR.fa", tags of sequences format are "lr1,lr2..."
  <pre>
       kCluster <seq.fa> <k-length> <k-mer percentage cutoff>
        </pre>
   To cluster unaligned LRs with k-mer clustering method
   Output includes a TXT file and a Log file

  <h3><img src="images/dna.png">  <b>Step 2</b> - Isoform annotation</h3>
  <pre> kCluster <unaligned LR.fa> kmer_size > clusterOutput 2> clusterLog
         </pre>

  To cluster unaligned LRs with k-mer clustering method, output a TXT file and a log file to track progress of clustering

  <h3><img src="images/dna.png">  <b>Step 3</b> - Quantification </h3>
  <pre> MLE <SR align to pseudo-ref SAM output> <GPD file> python_path code_path SR_length  </pre>
   Output file is "refSeq_MLE_output1.tab" to tell SR coverage for each transcript.
  IDP-denovo will outupt LR coverage.

  SR align to pseudo-reference with HISAT 
  LR align to transcripts with GMAP
  
  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
