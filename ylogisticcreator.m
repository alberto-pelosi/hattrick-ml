function [ydq] = ylogisticcreator(Xdq)

rs = rows(Xdq);
ydq = [];
for i = 1: rs
	if(Xdq(i,25) == Xdq(i, 26))
		ydq = [ydq, 1];
	elseif (Xdq(i,25) > Xdq(i, 26))
		ydq = [ydq, 2];
	else 
		ydq = [ydq, 3];
	endif
end

end