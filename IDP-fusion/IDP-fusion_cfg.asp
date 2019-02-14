<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>IDP-fusion cfg file</title>
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
    In order to run IDP-fusion. Now, simply edit the run.cfg file and type
    </p>
    <blockquote>
    runIDP.py run.cfg 0
    </blockquote>
    <p>
    and that's it! </p>
	<dd>The last argument in this example is "0", which asks IDP-fusion to run end to end.</dd>
	<dd>If this argument changes to 1, IDP-fusion will only finish isoform candidate construction.</dd>
	<dd>If this argument changes to 2, IDP-fusion will finish the remaining steps (following isoform candidate construction).</dd>
	<p>An example run.cfg file is included with every IDP-fusion download and decriptions
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
# During some parts of IDP-fusion jobs will be split 
# and multiple threads run simultaneously.  This is 
# where you can set that number of threads.

Njun_limit = 10
# This is the maximum number of junctions to be considered 
# when detected splices are used to extend the possible 
# isoforms present. Isoform candidates extended by more 
# junctions than this limit will be excluded.

Niso_limit = 20
# The maximum number of Isoform candidates to be considered
# for isoform prediction/quantification.  Loci with more
# candidate isoforms than this limit will be excluded.

L_exon_limit = 1700
# The longest allowed exon length.

L_min_intron = 68
# The minimum intron size.

Bfile_Npt = 500
Bfile_Nbin = 5
# Binning options in Bfile construction

exon_construction_junction_span = 1

python_path = /usr/bin/python
# This is the path to your python

temp_foldername = temp_fa
# This is where the work in progress is stored, and this
# folder will require a considerable amount of disk space.

output_foldername = output_fa
# This folder will contain outputs from IDP-fusion.

aligner_choice = gmap
# The aligner of choice, either 'gmap' or 'blat'

blat_executable_pathfilename = blat
# The path to your blat executable

gmap_executable_pathfilename = gmap
# The path to your gmap executable

gmap_index_pathfoldername = ./Data/gmap_index.chr17chr20/
# The path to your gmap index folder

seqmap_executable_pathfilename = seqmap
# The path to the seqmap executable.  This is an aligner
# that is part of splicemap, and it is needed when
# primers are specified.

LR_gpd_pathfilename = 
# The genepred alignment of the long reads.  This is not
# used in IDP-fusion when fusion detection is enabled,
# so it will generally be left blank.  The PSL file which
# is created before the gpd file is more useful for
# determining possible fusions.  This file could be
# helpful if you were running without fusion detection
# and you wanted to skip PSL file processing.

LR_pathfilename = ./Data/long_reads.chr17q23-25chr20q13.fasta
# These are the long reads in fasta format.

genome_pathfilename = ./Data/genome.chr17chr20.fasta
#  The path to the genome fasta

five_primer = 
# The 5 prime primer that has been HOMOPOLYMER COMPRESSED. 
# This means that if the primer sequences was AAATTTGGGGCCT
# you need to write it as ATGCT.

three_primer = 
# The 3 prime primer that has been HOMOPOLYMER COMPRESSED. 
# This means that if the primer sequences was AAATTTGGGGCCT
# you need to write it as ATGCT.

LR_psl_pathfilename = ./Data/MCF7_ready_for_fusion_20140928.chr17q23-25chr20q13.sorted.psl

psl_type = 0
# Type zero is preferred for gmap outputs made in 'blat psl' format.

ref_annotation_pathfilename = ./Data/refFlat_20140611.chr17chr20.gpd.txt
# These annotations will be used to detect known transcripts and to name outputs.

allref_annotation_pathfilename = ./Data/hg19.chr17chr20.gene_est.refFlat.txt
# These annotations include the largest number of observed pairs of fusion
# splices possible from public databases.  Pairs of splices not found in these
# databases can be considered true negatives for the purposes of determining
# false positive rate cutoffs.  This is used for calibrating the expression 
# threshold and will keep signficantly expressed novel results.

uniqueness_bedGraph_pathfilename = ./Data/wgEncodeDukeMapabilityUniqueness35bp.chr17chr20.bedGraph
# This file is used to annotated the 'uniquness' of the region
# surrounding the fusion event


SR_jun_pathfilename = ./Data/splicemap_output/junction_color.bed
# Junctions identified in short reads by splicemap

SR_sam_pathfilename = ./Data/splicemap_output/good_hits.chr17q23-25chr20q13.tenth.sam
# Short read alignments made by splicemap

read_length = 89
# Short read length

min_junction_overlap_len = 10
# minimum overhang requirement for short reads

CAGE_data_filename =
# (optional) gene starts

detected_exp_len = 
# (optional) This will be computed at runtime if not provided,
# it gives the expression vs length.

I_refjun_isoformconstruction =  1
I_ref5end_isoformconstruction = 1
I_ref3end_isoformconstruction = 1

estimator_choice = MAP
# Can use either MAP or MLE

FPR = 0.1
# Threshold of false positive rate to report

fusion_mode = 1
# Fusion mode of 1 is to do fusion detection and fusion isoform quantification

SR_pathfilename = ./Data/short_reads.chr17q23-25chr20q13.tenth.fasta
# The path to the short reads 

SR_aligner_choice = STAR
# The choice of short read aligner for fusion site detection

mapsplice_path = 
# Mapsplcie is not currently implemented.

star_path =
# Path to STAR.  If left blank, it will assume star has been installed
# in your path

genome_bowtie2_index_pathfilename = ./Data/bowtie2/bowtie2_index.chr17chr20
# The bowtie2 index for your genome

transcriptome_bowtie2_index_pathfilename = ./Data/bowtie2/txn/chr17chr20
# The bowtie2 index for your transcriptome, based on your reference
# annotation genepred.  If you don't supply one, IDP-fusion will
# compute this on the fly.

min_LR_overlap_len = 100
# Minimum long read coverage that must be satisified to consider a 
# long read alignment as part of a fusion

LR_fusion_point_err_margin = 100
# The maximum gap or overlap of to partial alignments when considering 
# a fusion

min_LR_fusion_point_search_distance = 20
# Search at least this distance from a predicted fusion splice point
# for the true fusion splice point.

uniq_LR_alignment_margin_perc = 20

Niso_fusion_limit = 1000
# The maximum number of isoform candidates to consider for quantification
# of fusion isoforms.  Since fusion isoforms are of paramount interest in
# IDP-fusion, we give the option of setting this limit to be very large
# compared to the perhaps less interesting canonical isoforms.
#########################



    </pre>
   
  </div>
  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

    
<!-- end #content -->
</body>


</html>
