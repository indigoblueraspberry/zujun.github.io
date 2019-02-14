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
<h2>Steps to generate long read files suitable for isoform prediction or fusion detection</h2>
<ol>
  <br>
  <li>Generate a FASTA file of all sub reads with > .75 accuracy
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>SMRT analysis package</b></li>

  <br><li>Generate a FASTA file of all ccs reads with > .95 accuracy
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>SMRT analysis package</b></li>

  <br><li>Generate a FASTA file of all ccs reads with > .9 accuracy
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>SMRT analysis package</b></li>

  <br><li>Get the longest sub read from each molecule.  Use the outputs from <b>step #1</b> as an input.
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>Au-public/iron/utilities/
  <br>&nbsp&nbsp&nbsp&nbsp&nbsppacbio_get_longest_fasta_per_molecule.pl &ltsub75fasta&gt</b></li>

  <br><li>Construct a set of reads that excludes any ccs reads with > 0.95 accuracy but that includes ccs reads with greater than 0.9 accuracy and less than 0.95 accuracy.  And any remaining > 0.75 longest sub reads not yet considered.  Use the outputs from <b>step #2</b>, <b>step #3</b>, and <b>step #4</b> as inputs. 
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>Au-public/iron/utilities/
  <br>&nbsp&nbsp&nbsp&nbsp&nbsppacbio_make_ccs90-95_sub75_set.py &ltcc95fasta&gt &ltccs90fasta&gt &ltsub75fasta&gt</b></li>

  <br><li>Perform LSC on the FASTA output from <b>step #5</b>.  Subsequent steps will use the following outputs:
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>corrected_LR.fa
  <br>&nbsp&nbsp&nbsp&nbsp&nbspfull_LR.fa</b></li>

  <br><li>Replace <b>corrected_LR.fa</b> entries with <b>full_LR.fa</b> entries when the length of the corrected is 90% or greater the length of the <b>full_LR.fa</b>.  The purpose is to maintain the adaptor sequences when possible.
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>IDP/utilities/
  <br>&nbsp&nbsp&nbsp&nbsp&nbspreplace_LSC_corrected_with_full_when_similar_length.py &ltfull_LR.fa&gt &ltcorrected_LR.fa&gt &ltthreshold (i.e. 0.9)&gt  &ltoutput fasta&gt &ltoutput list&gt</b></li>

  <br><li>Assemble a non-redundant set of reads for fusion detection that includes the high quality ccs reads from <b>step #2</b>, the reads that were used as an input to LSC (output of <b>step #5</b>), this allows us to recover any reads that were not operated on by LSC, and finally, the swapped <b>FASTA output from step #7</b> 
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>Au-public/iron/utilities/
  <br>&nbsp&nbsp&nbsp&nbsp&nbspassemble_IDP-fusion_read_set.pl &ltccs95 fasta&gt &ltpre-LSC fasta&gt &ltLSC swapped fasta&gt</b> </li>

  <br><li>Assemble a set of reads for isoform prediction that includes both the corrected_LR.fa and full_LR.fa entries in cases when the length of the corrected is within 90% the length of the full_LR.fa.  This introduces some redundancies that will be removed during the execution of IDP isoform prediction since actual quantifications will be based on the short read counts.  Similar to <b>step #8</b>, this step requires the high quality ccs reads from <b>step #2</b>, the reads that were used as an input to LSC (output of <b>step #5)</b>, the full_LR.fa output from LSC in <b>step #6</b>, the swapped <b>FASTA output from step #7</b>, and the <b>list output from step #7</b>.
  <br>&nbsp&nbsp&nbsp&nbsp&nbsp<b>Au-public/iron/utilities/
  <br>&nbsp&nbsp&nbsp&nbsp&nbspassemble_IDP-isoform_read_set.pl &ltccs95 fasta&gt pre-LSC fasta&gt &ltfull_LR.fa&gt &ltLSC swapped fasta&gt &ltLSC swapped list&gt</b> </li>
</ol>

</div>
  
  
  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
