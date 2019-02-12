#!/usr/bin/python

import sys
import os

################################################################################

def getRNAseq(chrseq,exoniclist):
    RNAseq=""
    l=0
    for exonic in exoniclist:
        l+=exonic[1]-exonic[0]+1
        RNAseq=RNAseq+chrseq[exonic[0]:exonic[1]+1]
    print "kinfai "+str(l)
    return RNAseq

################################################################################

if len(sys.argv) >= 2:
    refFlat_filename = sys.argv[1]
    genome_list_filename =  sys.argv[2]
else:
    print("usage: python genepred2FASTA.py refFlat.txt genome_list_filename")
    print("or ./genepred2FASTA.py refFlat.txt genome_list_filename")
    sys.exit(1)

################################################################################
genome_list=open(genome_list_filename,'r')
genome_dict={}
for chr_filename in genome_list:
    chr_filename=chr_filename.strip()
    if chr_filename!="":
        chr=open(chr_filename,"r")
        chrlist=chr.readlines()
        loops=0
        chr_name=chrlist[0][1:len(chrlist[0])-1]
        del chrlist[0]
        for line in chrlist:
            chrlist[loops]=line.strip().upper()
            loops +=1
        chrline="".join(chrlist)
        genome_dict[chr_name]="X"+chrline

print "finsish genome"

genome_list.close()
################################################################################

ref=open(refFlat_filename,'r')
print "loading refFlat file: ", refFlat_filename
exondict={}
seq_output_filename = refFlat_filename + ".fasta"
seq_output = open(seq_output_filename,'w')
for refline in ref:
    refline_list=refline.strip().split()
    if not genome_dict.has_key(refline_list[2]):
        continue
    if not exondict.has_key(refline_list[2]):
        exondict[refline_list[2]]={}

    exon_start_list=refline_list[9].strip(',').split(',')
    exon_end_list=refline_list[10].strip(',').split(',')
    gene_id=refline_list[0]
    transcript_id = refline_list[1]
    exon_list=[]
    i=0
    for start in exon_start_list:
        start=int(start)
        end=int(exon_end_list[i])
        exon_list.append([start+1,end])
        i+=1
    entry_id = ">" + refline_list[3] + refline_list[0]+ "|" +refline_list[1]
    seq = getRNAseq(genome_dict[refline_list[2]],exon_list)
    seq_output.write(entry_id+"\n")
    seq_output.write(seq+"\n")
seq_output.close()
ref.close()


################################################################################
