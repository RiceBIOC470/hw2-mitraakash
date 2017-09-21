function trans_seq = dna2protein(dnaseq,frame)
% Input a dna sequence and a reading frame and returns the corresponding
% protein sequence. 

codon_nuc = readtable('codons.csv', 'delimiter', ',');
codon_nuc_dict = containers.Map(codon_nuc.Codon, codon_nuc.AmAcid);
trans_seq = [];

if ismember(frame, 1:3)
    for i=frame:3:length(dnaseq)-2
        prot=codon_nuc_dict(dnaseq(i:i+2));
        trans_seq=strcat(trans_seq,prot);
    end
else
    disp('Invalid Reading Frame');
end
