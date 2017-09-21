function mm=updated_meannonan(x)
x = num2cell(x);
x = cell2mat(x);
mm=nanmean(x);