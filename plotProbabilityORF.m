function prob = plotProbabilityORF(N_ORF)

seq_num = 1;
sequence_lengths = 0:N_ORF:1000;


for N = sequence_lengths
        counter = 0;
        
        for tt = 1:1000
            
            rand_seq = randdnaseq(N);

            startcodon_pos = strfind(rand_seq, 'ATG'); 
            stopcodon_pos = [strfind(rand_seq, 'TAA') strfind(rand_seq, 'TAG') strfind(rand_seq, 'TGA')]; 

            if ~isempty(startcodon_pos) && ~isempty(stopcodon_pos)

                firstStopCodon = zeros(1,length(startcodon_pos)); 
                for ii = 1:length(startcodon_pos)
                    ORFlengths = stopcodon_pos - startcodon_pos(ii); 
                    high_length = 1e8; 
                    low_index = 0; 
                    for jj = 1:length(ORFlengths)
                        if ORFlengths(jj) > 0 && mod(ORFlengths(jj),3) == 0 && ORFlengths(jj) < high_length
                            high_length = ORFlengths(jj);
                            low_index = jj;

                        end
                    end
                    if low_index > 0 
                        firstStopCodon(ii) = stopcodon_pos(low_index); 

                    else
                        firstStopCodon(ii) = startcodon_pos(ii); 
                    end
                end
                ORFSizes = firstStopCodon - startcodon_pos + 3; 

                if sum(ORFSizes > 3) > 0  && sum(ORFSizes > N_ORF) > 0
                    counter = counter + 1;
                end

                    
            end
    
        end

        prob(seq_num) =  counter/1000;
        seq_num = seq_num +1;
        
    
end


plot(sequence_lengths, prob);
xlabel('Sequence Length');
ylabel('Probability');

ax = gca; 
ax.FontSize = 14; 
