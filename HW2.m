%Akash Mitra
%am132

%% Problem 1. 
% in the repository you will find the meannonan.m function we discussed in
% class which produced the mean of a vector of numbers that ignores values
% of NaN or Inf. 

% Part 1. Run the following code:

xx = rand(5); % random 5x5 matrix
xx(3,2) = NaN; %put a NaN in
yy = mean(xx); 
zz = meannonan(xx);

%compare the size of yy and zz. Notice that yy produces a row vector (the
%average of the rows) and has a NaN in the column that contained the NaN whereas 
%zz is a single number (the average of all non-NaN entries in xx). Explain
%this behavior. 

% The output of yy produces the a row of numbers which contain the average
% of each of the columns, and produces a NaN as the sum when it encounters
% a NaN.
% In the functon meannonan, notin checks whether a particular a particular element is
% a NaN value or if it infinity and returns a logical vector. This logical
% vector is then used to guide and build an array without the NaN values
% and infinite values. The function finally returns one mean after removing all the
% NaN and infinite values.

% Part 2. Modify the meannonan code so that it behaves as the mean function
% and produces a row vector where each entry is the average of each column
% and in the column with a NaN, this NaN is ignored. 


% Coudlnt strictly understand question. First attempt ignores nan and finds
% mean of all columns. Second attempt produces same output as the only mean
% function

ww = updated_meannonan(xx); 
disp('Mean Ignoring NaN =');
disp(ww);
ss = updated1_meannonan(xx);
disp('Producing same output as first mean function = ');
disp(ss);


%% Problem 2. ORFs using functions
% In this problem we will use functions to simplify and extend our code from HW1, prob 2 

% Part 1. Fill in the function randdnaseq.m in this repository so that it returns a random sequence
% of length N. 

rand_seq = randdnaseq(500);

% Part 2. Fill in the function findORF.m in this repository so that takes any dna
% sequence as an input and returns the length of the longest open
% reading frame and the positions of the start and stop codons. 
% Decide what your code should do when no ORF is found and
% implement this. Your function should also work whether the entered dna
% sequence is uppercase, lowercase, or some mixture. The builtin MATLAB functions
% lower and upper could be useful for this. 

[ORF_length, start_codon, stop_codon] = findORF(rand_seq);
disp(['Length of ORF = '  int2str(ORF_length)]);
disp(['Start Codon = ' int2str(start_codon)]);
disp(['Stop Codon = ' int2str(stop_codon)]);

% Part 3. Write another function called probabilityORF that utilizes the functions from 
% Parts 1 and 2. It should take two inputs - a sequence length (N) and an length  of an ORF (N_ORF) and
% returns the probability that that a sequence of length N contains an ORF
% of at least length N_ORF

prob = probabilityORF(500,30);
disp(['Probability = '  num2str(prob)]);

% Part4. Write  a final function called plotProbabilityORF.m which takes
% N_ORF as an argument and makes a plot of the probabily of having an
% ORF at least this long as a function of the dnasequence length. Decide how the
% code should determine the lengths of dna sequence to test and implement
% your decision. 

plotProbabilityORF(30);


% Part 5. Write code that uses your function from part 4 to make a single
% plot with separate curves for ORF lengths 100,200,300,and 400. Make sure
% your plot has appropriate axis labels and legend. 

figure;
plotProbabilityORF(100); hold on;
plotProbabilityORF(200); hold on;
plotProbabilityORF(300); hold on;
plotProbabilityORF(400); hold on;
legend('100','200','300','400');


%% Problem 3. Codon translation and optimization

% DNA sequence gets translated into protein through a code known as the
% genetic code. Every sequence of 3 base pairs (a codon) is translated into
% 1 amino acid. The first two columns of the file codons.csv file in this repository 
% give the correspondence between codons and amino acids. 

% Part 1. Fill in the function dna2protein.m so that it takes any
% dnasequence and translates it to protein. The second argument -  frame -
% should take on values of 1,2, or 3 and should refer to whether the
% translation should start from the 1st, 2nd or 3rd base pair (that is,
% which reading frame to use). Make your code returns an error and
% appropriate message if frame isn't 1,2, or 3. 


trans_seq = dna2protein(rand_seq,2);
disp(['Given sequence is ' strcat(rand_seq)]);
disp(['Translated sequence is ' strcat(trans_seq)]);

% Part 2. Write code to turn your protein sequence back into DNA sequence.
% Call your function protein2dna.m
% Notice that there isn't a unique way to do this. For example, there are 4
% different codons that correspond to the amino acid Gly. For a first pass,
% choose one of these codons at random.

dnaseq = protein2dna(trans_seq);
disp(['Given protein sequence is ' strcat(trans_seq)]);
disp(['DNA sequence is ' strcat(dnaseq)]);

%
% Part 3. The third column of the codons.csv file contains the frequency of
% this codon's use in the human proteome in units of number of appearances per
% thousand codons. Some codons are used more than others. For example,
% for the amino acid Gln, the codon CAG is used nearly 3 times as often as
% CAA. When researchers add DNA to human cells, if it contains CAG rather than
% CAA for Gln, it will be translated  more efficiently. The process of
% taking a protein seqeunce and finding the DNA sequence that will be
% translated most efficiently in a particular organism is called codon
% optimization. Copy your function protein2dna.m from part 2 to a new
% function called protein2dnaOptimized.m that produces a codon-optimized DNA sequence using the 
% information in the third column of codons.csv. 
% In other words, for any amino acid, it always uses the codon that appears
% most frequently in the human proteome. 
%
optimized_dna = protein2dnaOptimized(trans_seq);
disp(['Given protein sequence is ' strcat(trans_seq)]);
disp(['Optimized DNA sequence is ' strcat(optimized_dna)]);