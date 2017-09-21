function dnaseq=protein2dnaOptimized(proteinseq)

codons=readtable('codons.csv');
aa_unique=unique(codons.AmAcid);
codon_nuc_dict=containers.Map;
for k=1:length(aa_unique)
    all_index=find(contains(codons.AmAcid, aa_unique(k)));
    max_index=find(codons.x_1000(all_index)==max(codons.x_1000(all_index)));
    new_dict=containers.Map(codons.AmAcid(all_index(max_index)), codons.Codon(all_index(max_index)));
    codon_nuc_dict=[codon_nuc_dict; new_dict];
end
dnaseq='';
for i=1:3:length(proteinseq)/3
        dna1=codon_nuc_dict(proteinseq(i:i+2));
        dnaseq=strcat(dnaseq,dna1);
end
