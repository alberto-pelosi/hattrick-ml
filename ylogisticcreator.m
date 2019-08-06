function [y] = ylogisticcreator(Xdq)

rs = rows(Xdq);
y = [];
for i = 1: rs
	if(Xdq(i,25) == Xdq(i, 26))
		y = [y, 0];
	elseif (Xdq(i,25) > Xdq(i, 26))
		y = [y, 1];
	else 
		y = [y, 2];
	endif
end

end