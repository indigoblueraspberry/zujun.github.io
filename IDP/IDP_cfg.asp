<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>IDP cfg file</title>
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
    <h2>.cfg file format</h2>
    In order to run IDP. Now, simply edit the run.cfg file and type
    </p>
    <blockquote>
    runIDP.py run.cfg 0
    </blockquote>
    <p>
    and that's it! </p>
	<dd>The last argument in this example is "0", which asks IDP to run end to end.</dd>
	<dd>If this argument changes to 1, IDP will only finish isoform candidate construction.</dd>
	<dd>If this argument changes to 2, IDP will finish the remaining steps (following isoform candidate construction).</dd>
	<p>An example run.cfg file is included with every IDP download and decriptions
    of each field can be found in the comments within the file. Detailed descriptions of each field
    is also below. 
    </p>
    
    <h3><img src="images/dna.png"> .cfg syntax</h3>
    There are only three types of syntax in a .cfg file. 
    <dl>
      <dt>Comment</dt>
      <dd>Any line begining with <b>#</b> is a comment. # must be the first character on the line.  </dd>
      <dt>Single Value</dt>
      <dd>A single value written in the following format
      <blockquote>
        <i>tag</i> = <i>value</i>
      </blockquote>
      For example,
      <blockquote>
		LR_gpd_pathfilename = /home/kinfai/3seq/IDP_0.1/test_data/no53primer_LR.gpd
      </blockquote>
      </dd>
    </dl>
    
    <h3><img src="images/dna.png"> Example .cfg file</h3>
    <p>
    The following is an example .cfg file. It is included in every IDP download
    which you can download here <a href="IDP_download_current.asp"><img src="images/download.png"> and run.cfg will be in the expanded folder</a>. The values
    which are optional are noted in the comments and you may comment them out. 
    </p>

    <pre>##
###################################################
#
# This cofiguration file contains all settings for a run
# of IDP (Isoform Detection and Prediction).
#
# lines begining with '#' are comments
# lists begin with '> tag' and end with '<' on separate lines
#
###################################################
##

Nthread = 16
Njun_limit = 10
Niso_limit = 20
L_exon_limit = 1700
L_min_intron = 68
Bfile_Npt = 500
Bfile_Nbin = 5
exon_construction_junction_span = 1

read_length = 50

temp_foldername = temp_fa
output_foldername = output_fa

python_path = /usr/bin/python

blat_executable_pathfilename = blat
gmap_executable_pathfilename = gmap
seqmap_executable_pathfilename = seqmap

aligner_choice = blat
gmap_index_pathfoldername =

LR_gpd_pathfilename =
LR_pathfilename = ./data/LR.fa
genome_pathfilename = ./data/genome.fa
five_primer = AGTACTCTG
three_primer = CGCAGAGTAC
LR_psl_pathfilename =

ref_annotation_pathfilename = ./data/normal_ref.gpd
allref_annotation_pathfilename = ./data/hg19.all.gene_est.refFlat.txt

SR_jun_pathfilename = ./data/junction_color.bed
SR_sam_pathfilename = ./data/SR.sam

CAGE_data_filename =
detected_exp_len = ./data/multiexon_refFlat.txt_positive_exp_len

I_refjun_isoformconstruction =  1
I_ref5end_isoformconstruction = 1
I_ref3end_isoformconstruction = 1

min_junction_overlap_len = 10

estimator_choice = MAP

FPR = 0.05
#########################



    </pre>
   
  </div>
  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

    
<!-- end #content -->
</body>


</html>
