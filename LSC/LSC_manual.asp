<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>LSC manual</title>
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
    <li><a href="LSC_manual.asp#install">Installation</a></li>
    <li><a href="LSC_manual.asp#using">Using LSC</a></li>
    <li>Module descriptions
    <ul>
        <li><a href="LSC_manual.asp#runLSC">runLSC.py</a></li>
        <li><a href="LSC_manual.asp#filter_corrected_reads">filter_corrected_reads.py</a></li>

    </ul>
    </li><li><a href="LSC_manual.asp#input">Input files</a></li>
    </li><li><a href="LSC_manual.asp#output">Output files</a></li>
    <li><a href="LSC_manual.asp#aligner">Short read - Long read aligner</a></li>
    <li><a href="LSC_manual.asp#SCD">Short-read coverage depth (SCD)</a></li>

    <li><a href="LSC_manual.asp#time">Execution Time</a></li>
    </ul>
    
    <div id="install">
    <h3><img src="images/dna.png"> Installation</h3>
    </div>
    <p>No explicit installation is required for LSC. You may save the LSC code
    to any location, and you are welcome to add the bin/ directory to your path if you want.
	</p><p>You need to Python 2.7 installed in your computer which should be included by default with most linux distributions. Please see LSC <a href="LSC_requirements.asp">requirements</a> for more details </p>
    <p></p>
    
    
    <div id="using">
    <h3><img src="images/dna.png">Using LSC</h3>
    </div>
    <p>Firstly, see the <a href="LSC_tutorial.asp">tutorial</a> on how to use LSC on some example data.</p>
    <p>
    In order to use LSC on your own data, you will need to decide if doing a full run or a parallelized run would be more efficient.  If you are running a large data set (Tens of millions of short reads, and hundreds of thousands of long reads or bigger), we highly recommend doing a parallelized run.  A step by step guide for both normal and parallized execution can be found in the tutorial.  Too access the help regarding the command line options, you can used -h option with runLSC.py.
   
    
    <div id="runLSC">
    <h3><img src="images/dna.png">Executing runLSC.py</h3>
    </div>
    <p>"runLSC.py" is the main program in the LSC package. Output is written to the "--output" folder. 
    Details of the output files are described in <a href="LSC_manual.asp#fileformats">file formats</a>.
    Its options are described here and can be accssed using the -h option when running runLSC.py:
    <blockquote>
    <pre>$ LSC-2.0/bin/runLSC.py -h</pre>
    <font color="blue"><pre>
usage: runLSC.py [-h] [--long_reads LONG_READS]
                 [--short_reads [SHORT_READS [SHORT_READS ...]]]
                 [--short_read_file_type {fa,fq,cps}] [--threads THREADS]
                 [--tempdir TEMPDIR | --specific_tempdir SPECIFIC_TEMPDIR]
                 [-o OUTPUT]
                 [--mode {0,1,2,3} | --parallelized_mode_2 PARALLELIZED_MODE_2]
                 [--aligner {hisat,bowtie2}] [--sort_mem_max SORT_MEM_MAX]
                 [--minNumberofNonN MINNUMBEROFNONN] [--maxN MAXN]
                 [--error_rate_threshold ERROR_RATE_THRESHOLD]
                 [--short_read_coverage_threshold SHORT_READ_COVERAGE_THRESHOLD]
                 [--long_read_batch_size LONG_READ_BATCH_SIZE]
                 [--samtools_path SAMTOOLS_PATH]

LSC 2.0: Correct errors (e.g. homopolymer errors) in long reads, using short
read data

optional arguments:
  -h, --help            show this help message and exit
  --long_reads LONG_READS
                        FASTAFILE Long reads to correct. Required in mode 0 or
                        1. (default: None)
  --short_reads [SHORT_READS [SHORT_READS ...]]
                        FASTA/FASTQ FILE Short reads used to correct the long
                        reads. Can be multiple files. If choice is cps reads,
                        then there must be 2 files, the cps and the idx file
                        following --short reads. Required in mode 0 or 1.
                        (default: None)
  --short_read_file_type {fa,fq,cps}
                        Short read file type (default: fa)
  --threads THREADS     Number of threads (Default = cpu_count) (default: 0)
  --tempdir TEMPDIR     FOLDERNAME where temporary files can be placed
                        (default: /tmp)
  --specific_tempdir SPECIFIC_TEMPDIR
                        FOLDERNAME of exactly where to place temproary
                        folders. Required in mode 1, 2 or 3. Recommended for
                        any run where you may want to look back at
                        intermediate files. (default: None)
  -o OUTPUT, --output OUTPUT
                        FOLDERNAME where output is to be written. Required in
                        mode 0 or 3. (default: None)
  --mode {0,1,2,3}      0: run through, 1: Prepare homopolymer compressed long
                        and short reads. 2: Execute correction on batches of
                        long reads. Can be superseded by --parallelized_mode_2
                        where you will only execute a single batch. 3: Combine
                        corrected batches into a final output folder.
                        (default: 0)
  --parallelized_mode_2 PARALLELIZED_MODE_2
                        Mode 2, but you specify a sigle batch to execute.
                        (default: None)
  --aligner {hisat,bowtie2}
                        Aligner choice. hisat parameters have not been
                        optimized, so we recommend bowtie2. (default: bowtie2)
  --sort_mem_max SORT_MEM_MAX
                        -S option for memory in unix sort (default: None)
  --minNumberofNonN MINNUMBEROFNONN
                        Minimum number of non-N characters in the compressed
                        read (default: 40)
  --maxN MAXN           Maximum number of Ns in the compressed read (default:
                        None)
  --error_rate_threshold ERROR_RATE_THRESHOLD
                        Maximum percent of errors in a read to use the
                        alignment (default: 12)
  --short_read_coverage_threshold SHORT_READ_COVERAGE_THRESHOLD
                        Minimum short read coverage to do correction (default:
                        20)
  --long_read_batch_size LONG_READ_BATCH_SIZE
                        INT number of long reads to work on at a time. This is
                        a key parameter to adjusting performance. A smaller
                        batch size keeps the sizes and runtimes of
                        intermediate steps tractable on large datasets, but
                        can slow down execution on small datasets. The default
                        value should be suitable for large datasets. (default:
                        500)
  --samtools_path SAMTOOLS_PATH
                        Path to samtools by default assumes its installed. If
                        not specified, the included version will be used.
                        (default: samtools)
</pre></font>
</blockquote>
The required options differ depending on run mode, but the most basic way to run LSC is to do an end to end run that does not save temporary files.
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --long_reads myLR.fa --short_reads mySR.fa --output myoutputdir
    </pre></blockquote>
You may also execute LSC step-by-step.  To do this we must specify a temporary directory that will not be deleted using --specific_tempdir.  
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --mode 1 --long_reads myLR.fa --short_reads mySR.fa 
    --specifc_tempdir mytempdir
    </pre></blockquote>
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --mode 2 --specifc_tempdir mytempdir
    </pre></blockquote>
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --mode 3 --specifc_tempdir mytempdir --output myoutdir
    </pre></blockquote>

	<ul><li>mode 0 (default): end-to-end LSC run.</li>
	    <li>mode 1: Homopolymer compresses long and short reads.</li>
		<li>mode 2: runs the alignment and LSC correction steps.</li>
		<li>mode 3: Combine all corrected reads to for final outputs</li>
	</ul>

	Alternatively a parallelized work flow can be done by replacing the --mode 2 paramater with --parallelized_mode_2 X, where X is the batch number.  You can execute the command for each batch.  If you need to find the number of batches, after running --mode 1, you can look in mytempdir/batch_count.  You will need to execute 1 to and including batch_count.

    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --mode 1 --long_reads myLR.fa --short_reads mySR.fa 
    --specifc_tempdir mytempdir
    </pre></blockquote>
    Now the compressed long and short reads are ready for analysis.
    <blockquote><pre>
    $ cat mytempdir/batch_count
    </pre></blockquote>
    This will tell you how many <font color="red">X</font> batches to run.  Now for 1 to <font color="red">X</font>:
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --parallized_mode_2 <font color="red">X</font> --specifc_tempdir mytempdir
    </pre></blockquote>
    Finally you can combine all the outputs back together.
    <blockquote><pre>
    $ LSC-2.0/bin/runLSC.py --mode 3 --specifc_tempdir mytempdir --output myoutdir
    </pre></blockquote>
    Please refer to <a href="LSC_tutorial.asp">the Tutorial </a> for an example.


	</br>
    
	<div id="input">
    <h3><img src="images/dna.png"> Input files </h3>
    </div>
    <p>
    LSC accepts one long-read sequences file (to be corrected) and one or more short-read sequences file as input. The input files could be in standard fasta or fastq formats.  Gzipped inputs are supported.</p>
    <p>
	Note: As part of LSC algorithm, it generates homopolyer-compressed short-read sequences before alignment. If you have already run LSC with the same SR dataeset you can skip this step by using previously generated homopolyer-compressed SR files. (You can find SR.fa.cps and SR.fa.idx in temp folderpath.)  Please keep in mind if you are using the cps and idx SR files, you will need to specify both their locations as two parameters following --short_reads</p>
	
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
	  <br><dd>LSC_bin_path/utilities/filter_corrected_reads.py &ltSR_covered_length_threshold&gt &ltcorrected_LR.fa or fq file&gt <b>> </b>&ltoutput_file&gt<br></dd>
	<br>exapmle: &nbsp&nbsp&nbsp&nbsppython bin/filter_corrected_reads.py 0.5 output/corrected_LR.fa > output/corrected_LR.filtered.fa<br>
		
	<br>You can also select "best" reads for your downstream analysis by mapping corrected LRs to the reference genome or annotation (for RNA-seq analysis). Then, filter the reads by mapping score or percentage of base match (e.g. "identity" in BLAT)	  
	<p></p>

	<div id="aligner">
    <h3><img src="images/dna.png"> Short read-Long read Aligner</h3>
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
	<br> </center>
	<div id="Dataset">
	<b><h3>Data-set:</h3></b> 
	</div>
	<ul>LongReads: human brain cerebellum polyA RNA processed to enrich for full-length cDNA for
	the PacBio RS platform under C2 chemistry conditions as CLR data 
	<a href="files/human_cerebellum_PacBioLR.zip">link</a></ul>
	<ul>ShortReads: human brain data from Illumina’s Human Body Map 2.0 project (GSE30611) </ul>

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
    
	<div id="SCD">
    <h3><img src="images/dna.png"> Short-read coverage depth (SCD)</h3>
    </div>
    <p>
    LSC uses consensus of short-read mapping results to correct long read sequences. In case of having high SR coverage, pile of SRs mapped to a LR segment would significantly 
	increase running time and memory usage in correction step, while having repetitive (redundant) information. By setting <i>SCD</i> parameter in run.cfg file,
	LSC uses a probabilistic algorithm to randomly select bounded number of SR alignemt results for each LR region in order to maintain expected SR coverage depth of <i>SCD</i> value.
	This would eliminate high memory peaks in corection step due to pile of SRs mapped in high coverage or repetitive regions.
	Based on our experiment on multilpe datasets, setting SCD = 20 gave comparable results w.r.t SCD = -1 (using all alignment results,i.e. without any bounded coverage limit). 
	</p>
    
    <div id="time">
    <h3><img src="images/dna.png"> Execution Time</h3>
    </div>
    <p>
    Following CPU and execution times are suggested-usage using LSC.0.2.2 and LSC 1.alpha on our clusters with six thread. 
	These figures will greatly differ based on your system configuration. 
    </p>
	<p>
    100,000 PacBio long reads X 64 million 75bp Illumina short reads 
	    (<a href="LSC_manual.asp#Dataset">Dataset</a>)
     </p>
	<ul>
    <li>LSC 1.alpha (w/ bowtie2, SCD=20): Time = 09:40:33, Max vmem = 8.532G
    </ul>	
    <ul>
    <li>LSC.0.2.2(w/ novoalign): Time = 16:12:00, Max vmem = 27.506G
    </ul>	
    
  </div>
  
  
  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

<!-- end #content -->
</body>



</html>