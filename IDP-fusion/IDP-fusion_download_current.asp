<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP download</title>
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
    <h2>Downloads</h2>
    <p>
    Copyright and installation instructions are contained within the package. We <b>strongly
    recommend</b> that you consult the <a href="IDP-fusion_tutorial.asp">tutorial</a> before attempting to use IDP. 
    </p>
        
    <table border="1" cellpadding="1">
    <tr>
    <td>
    <a href="files/IDP-fusion_1.1.1.tar.gz"  onClick="ga('send', 'event', 'file download', 'click', 'IDP fusion download release');"><img src="images/download.png"><b>IDP-fusion 1.1.1</b></a>
    </td>
     <td>
    Please see the <a href="IDP-fusion_download_current.asp#notes">release notes</a> for 
    more information
    </td>
    </tr>

    
    </table>
	
    <div id="notes">
    <h3><img src="images/dna.png">  <b>IDP-fusion 1.1.1</b> - Release Notes</h3>
    </div>
   <p>
    We are switching to semantic versioning. This will become 1.1.0 since we add the feature of the fusion report generation being put directly into the output folder as it becomes ready.

This version has some updates from the initial release to help avoid segmentation faults during STAR alignment, and numerous fixes to make the behaviour with the user better. An added feature is that the fusion report is automatically generated with the make fusion report script and placed into the output directory at the end of the run.
 <ul>
  
<li>The reference genome fasta should contain only one line of sequence for each sequence. I've updated the code to use an efficient parser. This should not be a problem now.
<li>The run fails if no file is specified for the uniqueness, even though uniqueness is not essential for the run. The behaviour has been changed to make this file optional.
<li>Ambiguous behaviour on setting the STAR path. The STAR path can now be left blank or set to STAR if it has already been installed to the path, or set to the the path of the STAR program, or the directory that the STAR binary is located.
STAR was throwing segmentation faults. This has been a continual problem with STAR that various datasets will be cause segmentation faults, usually when using non-default parameters. To accommodate the segmentation faults encountered here, I had to remove two parameters. It didn't like the --alignWindowsPerReadNmax and --alignTranscriptsPerReadMax.
<li>The bowtie2 transcriptome index should have been optional (since it can compute it) but it was not behaving that way. Now it should be optional.
<li>The fusion report itself was buried in the temp directory and required a script to generate it, so a basic fusion report should be offloaded into the output directory as soon as it is available without additional user action.
    
  </ul>
  
    </p>
 

  </div>
  
  
<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->
  
<!-- end #content -->
</body>

</html>
