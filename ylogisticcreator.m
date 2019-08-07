function [ydq] = ylogisticcreator(Xdq)

rs = rows(Xdq);
ydq = [];
for i = 1: rs
	if(Xdq(i,25) == Xdq(i, 26))
		ydq = [ydq, 0];
	elseif (Xdq(i,25) > Xdq(i, 26))
		ydq = [ydq, 1];
	else 
		ydq = [ydq, 2];
	endif
end

end