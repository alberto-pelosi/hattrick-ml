function [Xdq] = dataquality(X)

Xdq =  X(2:end, 2:end);

rs = rows(X);
%remove invalid rows
toRemove = [];
for i=1: rs
	if (X(i,1)==0 && X(i,2)==0 && X(i,3)==0 && X(i,4)==0 && X(i,5)==0 && X(i,6)==0 && X(i,7)==0 && X(i,8)==0 && X(i,9)==0 && X(i,10)==0 && X(i,11)==0 && X(i,12)==0 && X(i,13)==0 && X(i,14)==0 && X(i,15)==0 && X(i,16)==0 && X(i,17)==0 && X(i,18)==0 && X(i,19)==0 && X(i,20)==0 && X(i,21)==0 && X(i,22)==0 && X(i,23)==0 && X(i,24)==0 && X(i,25)==0 && X(i,26)==0)
		toRemove = [toRemove, i];
	endif
end


Xdq(toRemove,:)=[];


end