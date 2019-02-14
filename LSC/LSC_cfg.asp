<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>LSC -  error correction tool for long reads</title>
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
    In order to run LSC. Now, simply edit the run.cfg file and type
    </p>
    <blockquote>
    runLSC run.cfg
    </blockquote>
    <p>
    and that's it! An example run.cfg file is included with every LSC download and decriptions
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
        genome_dir = ../../genome/hg18
      </blockquote>
      </dd>
      <dt>Multiple Values</dt>
      <dd>Multiple values are grouped by &gt; and &lt; in the following format
      <blockquote>
        &gt; <i>tag</i><br>
        <i>value_1</i><br>
        <i>value_2</i><br>
        ...<br>
        &lt;
      </blockquote>
      </dd>
    </dl>
    
    <h3><img src="images/dna.png"> Example .cfg file</h3>
    <p>
    The following is an example .cfg file. It is included in every LSC download
    or you can download it here <a href="files/run.zip"><img src="images/download.png"> run.cfg</a> (right-click and save as ...). The values
    which are optional are noted in the comments and you may comment them out. 
    </p>

    <pre>
##
###################################################
#
# This cofiguration file contains all settings for a run
# of LScorr.
#
# lines begining with '#' are comments
# lists begin with '> tag' and end with '<' on separate lines
#
###################################################
##

#########################
## Required Settings
##

##
# python path 
# (single value)

python_path = /usr/bin/python

##
# Run mode 
# (single value)
# 0: end-to-end
# 1: alignment stage (generating compressed SRs to LRs alignments)
# 2: correcting stage (assuming stage 1 is already done )

mode = 0

##
# Long reads file
# (single value)

LR_pathfilename = data_path/LR.fa

##
# Long reads file type
# (single value:  fa or fq)

LR_filetype = fa


##
# Short reads file
# (single value)

SR_pathfilename = data_path/SR.fa

##
# Short reads file type
# (single value:  fa or fq or cps)
# If you have run LSC on the same SR data before, you can find the compressed SR data in temp folder (SR.fa.cps and SR.fa.idx files). 
# You can point the SR_pathfilename to SR.fa.cps file (the same folderpath should also include SR.fa.idx file) 
# In this case generating compressed short reads would be skipped
# (single value)

SR_filetype = fa


##
# Is this nonredundant SR data set? (Y or N)
# If you have run LSC on the same SR data before, you could find it in temp folder. Its name is "SR_uniq.fa".
# You can use this "SR_uniq.fa" as the short reads file and set this option to "Y"
# (single value)

I_nonredundant = N

## 
# Short-reads coverage depth (SCD)
# Generates LR-SR alignemnt file with expected SR coverage depth of SCD value.
# Note: SCD filter would be applied to LR segments with SR coverage of more than SCD value. 
# -1: All alignemnt results are used in correction step (no filtration).
# positive integer: Filters SR-LR alignment results to have expected SR coverage depth of SCD. 
# (positive integer or -1)

SCD = 20

##
# Number of threading for short reads alignment to long reads
# (single value)

Nthread1 = 10

##
# Number of threading for corrections
# (single value)

Nthread2 = 10

##
# Max memory usage for unix sort command (-S option) per thread depending on your system memory limit
# Note: This setting is per thread and number of threads is set through Nthread1 and Nthread2 parameters
# -1: no-setting (default sort option) 
# example: 4G , 100M , ...

sort_max_mem = -1

#########################

##
# Temp folder
# (single value)

temp_foldername = temp

##
# Output folder
# (single value)

output_foldername = output


##
# Remove PacBio tails sub reads? (Y or N)
# The names of PacBio long reads must be in the format of the following example: ">m111006_202713_42141_c100202382555500000315044810141104_s1_p0/16/3441_3479"
# The last two numbers (3441 and 3479 in this example) are the positions of the sub reads. 
# (single value)

I_RemoveBothTails = Y

##
# Min. number of non'N' after compressing 
# (single value)

MinNumberofNonN = 39

##
# Max 'N' are allowed after compressing
# (single value)

MaxN = 1

##
# Remove intermediate  files at the end of LSC run (for instance:  aligner sam output, LR-SR mapping files, ...)
# (0: No, 1: Yes )

clean_up = 1


#########################

##
# Aligner could be set to novoalign, bwa or bowtie2

aligner = bowtie2

# Aligner command options   
# Note: Do not specify number of threads in the command options, it is set through Nthread1

novoalign_options =  -r All -F FA  -n 300 -o sam -o 

bwa_options =  -n 0.08 -o 20 -e 3 -d 0 -i 0 -M 1 -O 0 -E  1 -N 

bowtie2_options = --end-to-end -a -f -L 15 --mp 1,1 --np 1 --rdg 0,1 --rfg 0,1 --score-min L,0,-0.08 --no-unal

razers3_options = -i 92 -mr 0 -of sam 





    </pre>
   
  </div>
  
  
<!-- #include file ="asp\sidebar.inc" -->
<!-- #include file ="asp\footer.inc" -->

    
<!-- end #content -->
</body>

  <!-- include virtual="analytics.inc" -->

</html>
