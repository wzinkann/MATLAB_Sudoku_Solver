function hintPuzzle(S,x)
S;
x;
title('Hope This Helps!');
i = 1:81; %assign 'i' one array indexing
[I, J] = ind2sub([9 9], i); %linear index to sub script
for k = i% font control and placement of numbers in individual boxes
if rand()<(x) %% This changes difficulty
text(I(k)/10-.05, J(k)/10-.05, num2str(S(k)),'FontSize',15,'HorizontalAlignment','center','color','r')
end
end
end