function [Xdq] = dataquality(X)

Xdq =  X(2:end, 2:end);

rs = rows(Xdq);
%remove invalid rows
toRemove = [];
for i=1: rs
	if (Xdq(i,1)==0 && Xdq(i,2)==0 && Xdq(i,3)==0 && Xdq(i,4)==0 && Xdq(i,5)==0 && Xdq(i,6)==0 && Xdq(i,7)==0 && Xdq(i,8)==0 && Xdq(i,9)==0 && Xdq(i,10)==0 && Xdq(i,11)==0 && Xdq(i,12)==0 && Xdq(i,13)==0 && Xdq(i,14)==0 && Xdq(i,15)==0 && Xdq(i,16)==0 && Xdq(i,17)==0 && Xdq(i,18)==0)
		toRemove = [toRemove, i];
	endif
end

Xdq(toRemove,:)=[];


end