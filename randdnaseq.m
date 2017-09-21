function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N
Nuc = ["A","C","T","G"];
NucPos =randi(numel(Nuc),[1 N]);
randomSeq = strjoin(Nuc(NucPos), "");
randomSeq = char(randomSeq);