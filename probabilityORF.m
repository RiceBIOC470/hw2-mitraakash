function prob = probabilityORF(N, N_ORF)
% sequence length (N) and an length  of an ORF (N_ORF) and
% returns the probability that that a sequence of length N contains an ORF
% of at least length N_ORF

rand_seq = randdnaseq(N);
    
    start_pos = strfind(rand_seq, 'ATG'); 
    stop_pos = [strfind(rand_seq, 'TAA') strfind(rand_seq, 'TAG') strfind(rand_seq, 'TGA')]; 
    
    if ~isempty(start_pos) && ~isempty(stop_pos)
        
        firstStopCodon = zeros(1,length(start_pos)); 
        for ii = 1:length(start_pos) 
            ORFlengths = stop_pos - start_pos(ii); 
            high_length = 1e8; 
            low_index = 0; 
            for jj = 1:length(ORFlengths)
                if ORFlengths(jj) > 0 && mod(ORFlengths(jj),3) == 0 && ORFlengths(jj) < high_length
                    high_length = ORFlengths(jj);
                    low_index = jj;
                    
                end
            end
            if low_index > 0 
                firstStopCodon(ii) = stop_pos(low_index); 
                
            else
                firstStopCodon(ii) = start_pos(ii); 
            end
        end
        ORFSizes = firstStopCodon - start_pos + 3; 
        
        if sum(ORFSizes > 3) > 0  && sum(ORFSizes > N_ORF) > 0 
            num = sum(ORFSizes > N_ORF);
        end
        
    end

prob = num/length(rand_seq);
