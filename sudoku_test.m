
function generatePuzzle(d)

d=0.3;

S = zeros(9,9); %blank martirx
i = 1:81; %assign 'i' one array indexing
[I, J] = ind2sub([9 9], i); %linear index to sub script
ref = [[1 2 3]; [4 5 6]; [7 8 9]]; %row echelon form

plot([0.3 0.3],[0 0.9],'k',[0.6 0.6],[0 0.9],'k',[0 0.9],[0.3 0.3],'k',[0 0.9],[0.6 0.6],'k');
set(gca,'XTickLabel',[]);set(gca,'YTickLabel',[]);grid on
axis([0 .9 0 .9]); axis square
hold on;iter = 0;e = 0;
title('Dr. Snyder');
%makes blank grid



while e~=81 
S = zeros(9,9);
e = 0;


%Makes sure to place #'s into spaces that actually work
for k = i
square = S(ref(ceil(I(k)/3),:),ref(ceil(J(k)/3),:));
check = [S(I(k),:) S(:,J(k))' square(:)'];
nochoice = unique(check);
choice = setdiff(1:9,nochoice);
if isempty(choice)
break;

%randomization
else
S(k) = choice(randi([1 length(choice)]));
e = e + 1;
end
end
end

%formatting numbers and placement in box 
for k = i% font control and placement of numbers in individual boxes
if rand()<(d) %% This changes difficulty
text(I(k)/10-.05, J(k)/10-.05, num2str(S(k)),'FontSize',15,'HorizontalAlignment','center')
end
end
end

