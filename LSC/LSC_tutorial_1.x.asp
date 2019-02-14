<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>LSC tutorial</title>
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
    <h2>Tutorial</h2>
    <p>This tutorial will help you get started with LSC by demonstrating how to error correct 500k sample PacBio long reads with 1 million short reads of length 75bp. If you experience any problems 
    following these steps, please don't hesitate to <a href="LSC_contact.asp">contact</a> us. </p>
    
    <h3><img src="images/dna.png">  <b>Step 1</b> - Download and extract the example files</h3>
    <p>Download the example:</p>
    <ul>
   <a href="files/example.rar" onClick="ga('send', 'event', 'file download', 'click', 'LSC example download');><img src="images/download.png"><b>example</b></a>
   </ul>

    <p>Extract the example to an empty folder of your choice. After extracting the folder should contain
    the following files and folders:</p>
    <blockquote>
    <pre>dn800c9107:example moo$ ls
data	bin		run.cfg
</pre>
    </blockquote>
    
    <p>
    The tutorial will be given with the OSX version. However, the steps are the same for all versions. 
    </p>

    
    <h3><img src="images/dna.png">  <b>Step 2</b> - Examine the example directory contents</h3>
    Before we continue, it will be helpful to learn the purpose of each file in this example. When you 
    run LSC on your data, all of these files can be in separate locations if you wish. 
     <dl>
      <dt>run.cfg</dt>
      <dd>This is the most important file. It is a text file that contains the path to your sequencer
      reads and the configuration settings. Please see <a href="LSC_cfg.asp">.cfg file format</a> for 
      details. It is simple to edit and you will need to edit it once for each data-set.  </dd>
      <dt>data directory</dt>
      <dd>This directory contains all of the sequencer reads in the example. In your case, this directory 
      could be anywhere and it may be read-only. In this example, you have a long read file: LR.fa and a short reads file: SR.fa</dd>
      <dt>bin directory</dt>
      <dd>This is directory stores all of the LSC binaries. It is important that 
      all the binaries are in the same location. No installation is required! Simply copy this
      directory to a location convenient for you. 	  
      </dd><dt>temp directory</dt>
      <dd>This is a temporary directory created during the execution of LSC. The results of
      the initial short reads mapping is stored here, so this directory can be quite large. 
	  <br> Note: You can use '-clean_up' option in run.cfg file to limit useful intermediate files that LSC keeps after run-time for later reference. </dd>
      <dt>output directory</dt>
      <dd>This is directory stores all the useful <a href="LSC_manual.asp#output">output files</a> after executing LSC. It is also 
      created during the execution of LSC</dd>

    </dl>
    
    <h3><img src="images/dna.png"> <b>Step 3</b> - Run LSC on the example data</h3>
    <p>Only one command is need to to initiate LSC. 
    </p>
    <p>Make sure your terminal is pointed to the example folder and type the following in one line:</p>
    <blockquote>
    ./bin/runLSC.py run.cfg
    </blockquote>
    <p>You should then see some output: </p>
    <blockquote>
    <pre>

=== Welcome to LSC 1.alpha ===
[python_path ,   /usr/bin/python]
[mode ,  0]
[LR_pathfilename ,  data/LR.fa]
[LR_filetype ,  fa]
[SR_pathfilename ,  data/SR.fa]
[SR_filetype ,  fa]
[I_nonredundant ,  N]
[SCD ,  20]
[Nthread1 ,  10]
[Nthread2 ,  10]
[sort_max_mem ,  -1]
[temp_foldername ,  temp]
[output_foldername ,  output]
[I_RemoveBothTails ,  Y]
[MinNumberofNonN ,  39]
[MaxN ,  1]
[clean_up ,  1]
[aligner ,  bowtie2]
[novoalign_options ,   -r All -F FA  -n 300 -o sam -o]
[bwa_options ,   -n 0.08 -o 20 -e 3 -d 0 -i 0 -M 1 -O 0 -E  1 -N]
[bowtie2_options ,  --end-to-end -a -f -L 15 --mp 1,1 --np 1 --rdg 0,1 --rfg 0,1 --score-min L,0,-0.08 --no-unal]
[razers3_options ,  -i 92 -mr 0 -of sam]
=== sort and uniq SR data ===
0:00:11.900843
===split SR:===
0:00:12.437051
===compress SR.??:===
0:00:04.903726
finsish genome
0:00:04.988031
finsish genome
0:00:05.042176
finsish genome
0:00:05.021717
finsish genome
0:00:05.228565
finsish genome
0:00:05.336358
finsish genome
0:00:05.455729
finsish genome
0:00:05.460309
finsish genome
0:00:05.898855
finsish genome
0:00:05.952090
finsish genome
0:00:20.314195
===RemoveBothTails in LR:===
0:00:23.464364
/srv/nss0/software/epd_free-7.3-2-rh5-x86_64/bin/python bin/FASTA2fa.py temp/Notwotails_LR.fa temp/LR.fa
rm temp/Notwotails_LR.fa
0:00:24.133556
===compress LR:===
/srv/nss0/software/epd_free-7.3-2-rh5-x86_64/bin/python bin/compress.py -MinNonN=39 -MaxN=10000 fa temp/LR.fa temp/LR.fa.
0:00:13.059660
finsish genome
rm temp/LR.fa
0:00:37.733874
===bowtie2 index LR:===
Settings:
  Output files: "temp/pseudochr_LR.fa.cps.*.bt2"
  Line rate: 6 (line is 64 bytes)
  Lines per side: 1 (side is 64 bytes)
  Offset rate: 4 (one in 16)
  FTable chars: 10
  Strings: unpacked
 . . . . 
Total time for backward call to driver() for mirror index: 00:00:18
0:01:14.866091
===bowtie2 SR.??.cps:===
95376 reads; of these:
  . . .
0:02:57.292160
===samParser SR.??.cps.nav:===
0:03:56.211585
===cat SR.??.cps:===
0:03:56.476512
===cat SR.??.idx:===
0:03:56.794260
===cat SR.??.cps.sam :===
0:03:58.129248
===cat SR.??.cps.nav :===
0:03:59.181674
===genLR_SRmapping SR.??.cps.nav:===
Done with sorting
Done with generating LR_SR.map file
0:05:17.473774
===split LR_SR.map:===
0:05:18.686120
===correct.py LR_SR.map.??_tmp :===
0:05:18.696796
0:14:51.624187
===cat full_LR_SR.map.fa :===
===cat corrected_LR_SR.map.fa :===
===cat corrected_LR_SR.map.fq :===
===cat uncorrected_LR_SR.map.fa :===


</pre>
    </blockquote>
    <p>At this point, feel free to take a break. After about few minutes the mapping and 
    error correction will be completed.</p>
    
    <h3><img src="images/dna.png">  <b>Step 4</b> - Examining the output</h3>
    All of the output from LSC is automatically copied to the "output" directory. After
    this execution, it should contain:
    <blockquote>
    <pre>dnab4167d9:output moo$ ls
corrected_LR.fa	corrected_LR.fq uncorrected_LR.fa full_LR.fa
</pre>
    </blockquote>
    Each output file is descired on <a href="LSC_manual.asp#output">maual page</a> in more details:
    <dl>
      <dt>&nbspcorrected_LR</dt>
      <dd>As long as there are short reads (SR) mapped to a long read, this long read can be corrected at the SR-covered regions. (Please see more details from the <a href="http://www.healthcare.uiowa.edu/labs/au/pubs/LSC.pdf">paper</a>). 
	  The sequence from the left-most SR-covered base to the right-most SR-covered base is outputted in the file corrected_LR_SR.map</dd>
      <dt>&nbspfull_LR</dt>
      <dd>Although the terminus sequences are corrected, they are concatenated with their corrected sequence (corrected_LR_SR.map.fa) to be a "full" sequence. 
	  Thus, this sequence covers the equivalent length as the raw read and is outputted in the file full_LR_SR.map.fa </dd>
      <dt>&nbspuncorrected_LR</dt>
      <dd>This is the negative control. uncorrected_LR_SR.map.fa contains the left-most SR-covered base to the right-most SR-covered base (equivalent region in corrected_LR_SR.map.fa) but not error corrected. 
	  Thus, it is fragments of the raw reads.</dd>
    </dl>
	
    <h3><img src="images/dna.png"> <b>Step 5</b> - Learning how to apply this tutorial to your own data</h3>
   See the <a href="LSC_manual.asp#using">Using LSC</a> section of the manual. 
    
  </div>


<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->




<!-- end #content -->
</body>


</html>
