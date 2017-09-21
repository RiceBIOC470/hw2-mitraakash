function [ORFlength, start_pos, stop_pos] = findORF(dnaseq)
%Function to find the length of the longest open reading frame of a
%sequences called dnaseq

dnaseq = upper(dnaseq);
start_pos = strfind(dnaseq, 'ATG');
stop_pos = [strfind(dnaseq, 'TAA') strfind(dnaseq, 'TAG') strfind(dnaseq, 'TGA')];
 
if ~isempty(start_pos) && ~isempty(stop_pos)
    firststop = zeros(1, length(start_pos));
for ii = 1:length(start_pos)
    ORFlength = stop_pos - start_pos(ii);
    high_length = 1e8;
    low_index = 0;
    for jj = 1:length(ORFlength)
        if ORFlength(jj) > 0
                mod(ORFlength(jj),3) == 0;
                ORFlength(jj) < high_length;
           high_length = ORFlength(jj);
           low_index = jj;
        end
    end
    if low_index > 0
        firststop(ii) = stop_pos(low_index);
    else
        firststop(ii) = start_pos(ii);
        end
    end
    ORFsize = firststop - start_pos + 3;
    [ORFmaxlength, ind_max] = max(ORFsize);
end
 
 if exist('ORFmaxlength', 'var') && ORFmaxlength > 0
     disp('Open reading frame found');
 else
     disp('No ORF found');
 end
 
ORFlength = ORFmaxlength;
start_pos = start_pos(ind_max);
stop_pos = firststop(ind_max); 
