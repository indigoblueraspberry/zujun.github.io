<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP requirements</title>
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
    <h2>Requirements</h2>
    IDP aims to fully integrate into a variety of analysis pipelines. If any of the
    following requirements conflict with your lab's set up, please <a href="IDP_contact.asp">contact</a> us. 
    
    <h3><img src="images/dna.png"> System Requirements</h3>
    <ul>
      <li>Linux operating system</li>
      <li>You needs free hard drive space for double size of your short read alignments data (SAM file,"SR_sam_pathfilename" in run.cfg) </li>
    </ul>
    
    <h3><img src="images/dna.png"> Software Requirements</h3>
    <ul>
      <li>Python 2.6</li>
      <li>scipy and numpy (can do <b>apt-get install python-scipy</b> on Ubnutu to get both)</li>
      <li>seqmap (included with <a href="http://web.stanford.edu/group/wonglab/SpliceMap/">SpliceMap</a>)</li>
      <li><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">Bowtie2</a></li>
      <li><a href="https://github.com/alexdobin/STAR/releases">STAR</a></li>
      <li><a href="http://research-pub.gene.com/gmap/">GMAP</a> and/or <a href="http://hgdownload.cse.ucsc.edu/admin/exe/">BLAT</a></li>

    </ul>
    
    <h3><img src="images/dna.png">Long Reads</h3>
    <ul>
      <li><b>LR_pathfilename - </b>Raw sequences (FASTA format)</li>
      <li>(optionaly) <b>LR_psl_pathfilename - </b>Alignments (PSL format) of long reads</li>
    </ul>
    <h3><img src="images/dna.png">Short Reads</h3>
    <ul>
      <li><b>SR_pathfilename - </b>Raw sequences (FASTA format)</li>
      <li><b>SR_jun_pathfilename - </b>Junction detections (SpliceMap BED format).</li>
      <li><b>SR_sam_pathfilename - </b>Alignments (SAM format) of short reads</li>
    </ul>
    <h3><img src="images/dna.png">Reference files</h3>
    <ul>
      <li><b>genome_pathfilename - </b>genome FASTA file</li>
      <li><b>ref_annotation_pathfilename - </b>refFlat genePred file.  See our <a href="http://www.healthcare.uiowa.edu/labs/au/IDP/IDP_gpd_format.asp">detailed description of the genePred file format</a>.  This is the main primary set of refernece transcripts used define known transcripts, and to annotate </li>
      <li>(optional) Ensembl transcripts genePred file.  This will be used for adding additional annotations to a fusion report when your primary reference set does not have an annotation.</li>
      <li><b>allref_annotation_pathfilename - </b>genePred file with comprehensive known transcritps (EST, genecode, knowngene, refFlat, Ensembl etc..).  This file is used to hunt for a set of true negative isoforms.</li>
      <li><b>uniqueness_bedGraph_pathfilename - </b>Duke Uniqueness track from UCSC genome browser in bedGraph format.  This file is used to add uniqueness annotations to fusion reports</li>
    </ul>
    <h3><img src="images/dna.png">Aligner index files</h3>
    <ul>
      <li><b>genome_bowtie2_index_pathfilename - </b>bowtie2 genome index</li>
      <li>(optional) <b>transcriptome_bowtie2_index_pathfilename - </b> bowtie2 transcriptome index (based on the refFlat primary set of reference transcripts).  Precomuting it can save time, otherwise it will be generated on the fly, based on the reference transcriptome and the genome.</li>
      <li><b>gmap_index_pathfoldername - </b>GMAP genome index (if using GMAP).  gmap_build can be sued to create this.</li>
    </ul>

    <h3><img src="images/dna.png"> Upstream</h3>
    <ul>
	  <li>The LSC-corrected long reads are preferred. See our <a href="IDP-fusion_long_read_file_guide.asp">guide creating a set of long reads</a> for more information.</li>
      <li><a href="http://web.stanford.edu/group/wonglab/SpliceMap/">Splicemap</a> must be used to generate the short read alignment (.sam) file, and the junction file (junction_color.bed).</li>
    </ul>

    
  </div>
  
  

  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

  
<!-- end #content -->
</body>


</html>
