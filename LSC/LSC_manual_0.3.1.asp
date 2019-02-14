<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Old LSC manual</title>
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
    <h2>Manual</h2>
    <ul>
    <li><a href="LSC_manual_0.3.1.asp#install">Installation</a></li>
    <li><a href="LSC_manual_0.3.1.asp#using">Using LSC</a></li>
    <li>Module descriptions
    <ul>
        <li><a href="LSC_manual_0.3.1.asp#runLSC">runLSC.py</a></li>
        <li><a href="LSC_manual_0.3.1.asp#filter_corrected_reads">filter_corrected_reads.py</a></li>

    </ul>
    </li><li><a href="LSC_manual_0.3.1.asp#input">Input files</a></li>
    </li><li><a href="LSC_manual_0.3.1.asp#output">Output files</a></li>
    <li><a href="LSC_manual_0.3.1.asp#aligner">Short read - Long read aligner</a></li>
    <li><a href="LSC_manual_0.3.1.asp#time">Execution Time</a></li>
    </ul>
    
    <div id="install">
    <h3><img src="images/dna.png"> Installation</h3>
    </div>
    <p>No explicit installation is required for LSC. You may copy the LSC binaries
    to any location as long as all the binaries (including Novoalign) are in the same directory or path. 
	</p><p>But you need to Python2.6 installed in your computer. The modules "numpy" and "scipy" are also required. Please see LSC <a href="LSC_requirements.asp">requirements</a> for more details </p>
    <p></p>
    
    
    <div id="using">
    <h3><img src="images/dna.png"> Using LSC</h3>
    </div>
    <p>Firstly, see the <a href="LSC_tutorial_0.3.1.asp">tutorial</a> on how to use LSC on some example data.</p>
    <p>
    In order to use LSC on your own data:
    </p><ol>
    <li>Create an empty directory, this will be the working directory.</li>
    
    <li>Copy "run.cfg" from the LSC package to the working directory. </li>
    
    <li><a href="LSC_cfg.asp">Edit run.cfg</a> to include paths to your python binary directory, data files and the paths of the temp folder and the output folder. 
	You may also want to configure the default settings. LSC uses external aligner to find short reads to long reads mappings. Latest LSC version supports <a href="http://bio-bwa.sourceforge.net/">BWA</a>, 
	<a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">Bowtie2</a>, <a href="http://www.novocraft.com/main/index.php">Novoalign</a> and <a href="http://www.seqan.de/projects/razers/">RazerS (v3)</a> aligners. 
	The aligner and its setting options could be modified through run.cfg file. The path to selected aligner should be set in your PATH env variable.</li>
    
    <li>Execute "<a href="LSC_manual_0.3.1.asp#runLSC">/home/user/LSC_path/runLSC.py run.cfg</a>" while in your working directory. or Execute "<a href="LSC_manual_0.3.1.asp#runLSC">runLSC.py run.cfg</a>, if all LSC executable files are in the default bin </li>
    
    <li>After <a href="LSC_manual_0.3.1.asp#time">a certain time</a> execution will conclude. You can find results in the "output" directory. </li>
    
    </ol>
    <p></p>
   
    
    <div id="runLSC">
    <h3><img src="images/dna.png"> Module: runLSC</h3>
    </div>
    <p>"runLSC.py" is the main program in the LSC package. It calls other modules 
    to run the full error correction on your data. Output is written to the "output" folder. 
    Details of the output are described in <a href="LSC_manual_0.3.1.asp#fileformats">file formats</a>.
    Its options are described in <a href="LSC_cfg.asp">run.cfg</a>. You just need to run "runLSC.py" with a configuration file "run.cfg": </p>
    <blockquote>
    /home/user/LSC_path/runLSC.py run.cfg
    </blockquote>
	&nbspor If you have put all LSC executable files in the default path:
    <blockquote>
    runLSC.py run.cfg
    </blockquote>
	In vesion 3.0 or later, you can run LSC in two steps using <i>'mode'</i> option in run.cfg. If for a reason LSC was terminated in correction step, you can restart the correction step without re-running the LR-SR mapping step.
	<ul><li>mode 0 (default): end-to-end LSC run.</li>
	    <li>mode 1: generates LR-SR mapping (LR_SR.map) file which is used in LSC correctiopn step.</li>
		<li>mode 2: runs LSC correction step. Note:  make sure LR-SR mapping (LR_SR.map) file is already generated in temp folder.
		            LSC also uses some other intermediate files in temp folder which are generated after mode 0/1 run </li>
	</ul>
	</br>
	Other LSC options:
	<pre> To check LSC version: runLSC.py -v </pre>
	<pre> To clean up temp folderpath (if you used "cleap_up=0" option): runLSC.py run.cfg -clean_up </pre>
    
	<div id="input">
    <h3><img src="images/dna.png"> Input files </h3>
    </div>
    <p>
    LSC accepts one long-read sequences file (to be corrected) and one short-read sequences file as input. The input files could be in standard fasta or fastq formats.
	Note: As part of LSC algorithm, it generates homopolyer-compressed short-read sequences before alignment. If you have already run LSC with the same SR dataeset you can skip this step by using previously generated 
	homopolyer-compressed SR files. (You can find SR.fa.cps and SR.fa.idx in temp folderpath.)
	<br> The file locations and their format should be set in run.cfg file through <i>pathfilename</i> and <i>filetype</i> options.
    </p>
	
    <div id="output">
    <h3><img src="images/dna.png"> Output files</h3>
    </div>
    <p>There are four output files: corrected_LR.fa, corrected_LR.fq, full_LR.fa, uncorrected_LR.fa in output folder:
    </p>
    <ul>
    <li><i>corrected_LR</i></li>
    
    <p>
      </p><dd>As long as there are short reads (SR) mapped to a long read, this long read can be corrected at the SR-covered regions. (Please see more details from the <a href="http://www.healthcare.uiowa.edu/labs/au/pubs/LSC.pdf">paper</a>).
	  The sequence from the left-most SR-covered base to the right-most SR-covered base is outputted in the file corrected_LR. The output readname format is <br>
	  &nbsp&nbsp&lt;original readname&gt;|&lt;percentage of corrected output sequence covered by short reads&gt;</br>
	  example:</br>
	  &nbsp&nbspm111006_202713_42141_c100202382555500000315044810141104_s1_p0/16<b>|0.81</b>
	  </dd>
	  </ul>
	  
	 <ul>
    <li><i>full_LR</i></li> 
      <dd> Although the terminus sequences are uncorrected, they are concatenated with their corrected sequence (corrected_LR) to be a "full" sequence. 
	  Thus, this sequence covers the equivalent length as the raw read and is outputted in the file full_LR.fa</dd>
	  </ul>
	  
	  
	 <ul>
    <li><i>uncorrected_LR</i></li> 
	<dd> This is the negative control. uncorrected_LR.fa contains the left-most SR-covered base to the right-most SR-covered base (equivalent region in corrected_LR) but not error corrected. 
	  Thus, it is fragments of the raw reads. </dd>
	  
	</ul>  
	  The quality (error rate) of corrected reads in corrected_LR.fq depends on its SR coverage and it uses Sanger standard encoding.
	  <br><br>
	  <table  border="1" bordercolor="#999999" cellspacing="0" cellpadding="3">
	  <caption align="bottom" style="text-align: left">Reference: <a href="http://www.healthcare.uiowa.edu/labs/au/pubs/LSC.pdf">LSC paper</a>
	                                                   <br> * Error probablity is modeled with logarithmic funtion fitted to real data error-probabilities computed in the paper.</caption>
	     <tr><td>SRs Coverage</td><td>Error Probability<sup>*</sup></td>
		 <tr><td>0</td><td>0.275</td></tr>
		 <tr><td>1</td><td>0.086</td></tr>
		 <tr><td>2</td><td>0.063</td></tr>
		 <tr><td>3</td><td>0.051</td></tr>
		 <tr><td>4</td><td>0.041</td></tr>
		 <tr><td>5</td><td>0.034</td></tr>
		 <tr><td>6</td><td>0.028</td></tr>
		 <tr><td>7</td><td>0.023</td></tr>
		 <tr><td>8</td><td>0.018</td></tr>
		 <tr><td>9</td><td>0.014</td></tr>
		 <tr><td>10</td><td>0.011</td></tr>
		 <tr><td>11</td><td>0.008</td></tr>
		 <tr><td>12</td><td>0.005</td></tr>
		 <tr><td>13</td><td>0.002</td></tr>
		 <tr><td>>=  14</td><td>~0.000</td></tr>
	  </table>
	  </br>	  
	  Note: Part of corrected_LR sequence without any short read coverage would have the default 27.5% error rate. If input LRs are in fastq format,
	  the original quality values are not used here. <br>
	  <br>
	<div id="filter_corrected_reads">
    <h3><img src="images/dna.png"> Module: filter_corrected_reads.py </h3>
    </div>
	  In addition to quality information in corrected_LR.fq file, you can also select corrected LR sequences with higher percentage of SR covered length using filter_corrected_reads.py script in the bin folder.<br>
	  <br><dd>LSC_bin_path/filter_corrected_reads.py &ltSR_covered_length_threshold&gt &ltcorrected_LR.fa or fq file&gt <b>> </b>&ltoutput_file&gt<br></dd>
	<br>exapmle: &nbsp&nbsp&nbsp&nbsppython bin/filter_corrected_reads.py 0.5 output/corrected_LR.fa > output/corrected_LR.filtered.fa<br>
		
	<br>You can also select "best" reads for your downstream analysis by mapping corrected LRs to the reference genome or annotation (for RNA-seq analysis). Then, filter the reads by mapping score or percentage of base match (e.g. "identity" in BLAT)	  
	<p></p>

	<div id="aligner">
    <h3><img src="images/dna.png"> Short read - Long read aligner</h3>
    </div>
    <p>
    LSC uses a short read aligner in the first step. By default, <a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">Bowtie2</a> is used. You can have <a href="http://bio-bwa.sourceforge.net/">BWA</a>, 
	, <a href="http://www.novocraft.com/main/index.php">Novoalign</a> or <a href="http://www.seqan.de/projects/razers/">RazerS (v3)</a> to run this step as well. 
    </p>
    <p>
	Default aligners setting are:	
	<FONT FACE="Courier New">
	<ul>Bowtie2   : -a -f -L 15 --mp 1,1 --np 1 --rdg 0,1 --rfg 0,1 --score-min L,0,-0.08 --end-to-end --no-unal</ul>
	<ul>BWA       : -n 0.08 -o 10 -e 3 -d 0 -i 0 -M 1 -O 0 -E  1 -N</ul>
	<ul>Novoalign<sup>*</sup> : -r All -F FA  -n 300 -o sam </ul>
	<ul>RazerS3   : -i  92 -mr 0 -of sam </ul>
	</FONT> 
    
	You can change these settings through <a href="LSC_cfg.asp">.cfg</a> file. Please refer to their manuals for more details. <br>
	* Note: novoalign has limitation on read length. If you are using LSC with novoalign, please make sure your short reads length do not exceed maximum threashold.
		
    <p>Following figures compare LSC correction results configured with different supported aligners.
	Identity metric is defined as number-of-matchs/error-corrected-read-length after aligning reads to reference genome using Blat.
	<center><img src="images/number_of_mappable_bases.png" width="40%" hight="30%"> <img src="images/number_of_mappable_reads.png" width="40%" hight="30%"> 
	<br> Data-set: (LR) human brain cerebellum polyA RNA processed to enrich for full-length cDNA for
		 the PacBio RS platform under C2 chemistry conditions as CLR data
		 (http://www.healthcare.uiowa.edu/labs/au/LSC/files/human_cerebellum_PacBioLR.zip) (SR) human brain data from Illumina’s Human Body
		  Map 2.0 project (GSE30611) </center>

	<br>Based on your system configuration, you can select the aligner which fits better with your CPU or Memory resources. 
	<br>The below table is derived experimentally by running LSC using different aligners on above-mentioned data-set.
	<br><br><center>
	    <table  border="1" bordercolor="#999999" cellspacing="0" cellpadding="3">
	  <caption align="bottom" style="text-align: left"></caption>
	     <tr><td></td><td>&nbspCPU&nbsp</td><td>&nbspMemory&nbsp</td>
		 <tr><td>&nbspBWA&nbsp</td><td>&nbspLess&nbsp</td><td>&nbspLess</td></tr>
		 <tr><td>&nbspBowtie2&nbsp</td><td>&nbspMore&nbsp</td><td>&nbspLess</td></tr>
		 <tr><td>&nbspRazerS3&nbsp</td><td>&nbspMore&nbsp</td><td>&nbspMore</td></tr>
	  </table></center>
	
	</p>
    
    <div id="time">
    <h3><img src="images/dna.png"> Execution Time</h3>
    </div>
    <p>
    The following execution times are guesstimates based on the running times (w/ novolaign) on our servers with eigth thread. These figures will greatly
    differ based on your system configuration. 
    </p>
    <ul>
    <li>200,000 PacBio long reads X 64 million 75bp Illumina short reads - 10 hours</li>
    </ul>
    <p>
    This speed should be faster than similar tools. 
    </p>
    
  </div>
  
  

<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->


<!-- end #content -->
</body>



</html>