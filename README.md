# MATLAB_Sudoku_Solver
Purpose
	The purpose of this project was to create a program that can generate Sudoku puzzles and solve them either by giving hints, or completely solving the whole grid. To achieve this my understanding of MATLAB was tested by utilizing what I have learned this semester and learning new aspects of MATLAB by doing my own independent research when I got stuck.

Motivation
I’ve always loved sudoku ever since my mom taught me how to play at a young age and it’s a pretty simple game that seems pretty easy to randomize and keep track of what part of the script causes the program to run/ not run. I believed that since it was a game that I am very familiar with it is a great idea to use it for my project. This is because I would not want to have to learn how to play the game, then try to code it, rather I picked a game that I know strategies to solve it, and what makes it tick. 

Background 
Sudoku is a number-puzzle game in which the objective is to fill a 9x9 grid so that every row, column and 3x3 ‘sub-grid’ contains the digits 1-9. Each puzzle starts with a certain number of givens that will control the difficulty of the puzzle. Below I put two examples of solvable sudoku puzzles, and a solved puzzle. The one on the left being a “easy” unsolved puzzle and in the middle is an “expert” unsolved puzzle. Of course, the difficulties are subjective, but the main thing to note is that traditionally; the greater the amount of given numbers is, the easier the puzzle is to solve.
(puzzles from https://sudoku.com)
And on the right is a solved puzzle, notice how every row, column and 3x3 block contain only one of every digits 1-9. Puzzles usually don’t take a lot of time to solve ranging from 5 mins for an easy puzzle to 20+ mins for a more challenging one. My plan was to create 3 different difficultly settings for my program in order to give variety and accommodate for player’s varying level of skill.

Method
	How I tackled my program was something that changed throughout the process of coding. My initial thought process was just top generate one single puzzle at a time and have no way of being able to solve it. But, after spending the first few weeks on making that, and learning more in class about GUI’s I realized that there is much more I can do building off that original code. And after my project proposal was revised and I had showed Dr. Snyder my code at that point I had a bunch of new ideas to try and make possible in MATLAB, and I still had more than a month of time to make it happen. By the time the revised project proposal was due and I had made a GUI for my puzzle 
	My GUI:
 

This GUI has six separate buttons that call function to either create a new puzzle on the blank grid, or manipulate a puzzle that is already populating the grid. Three buttons are responsible for creating a fresh puzzle, these being the Easy, Medium, and Hard buttons. These three buttons correspond to three separate functions in my program that creates a different difficulty puzzle and populates it in the blank grid in the GUI. It goes without saying but the ‘Easy’ button generates an easy puzzle, ‘Medium’ creates medium, and ‘Hard’ makes hard. 
The other three buttons manipulate a puzzle that is already filling space on the grid, these buttons are Clear, Hint and Solve. Aside from the ‘Clear’ button (which was coding using the same method as the difficulty buttons) this was a part of my code that I did not originally think I was going to be able to accomplish. The problem to overcome was that I was having trouble referring back to what was already on my grid and reveling new cells in my grid that weren’t already given. This problem stems from the fact that the way the GUI was set up, it was difficult to transfer Information across each section of my GUI, I will go more in depth on this in my actual explanation section. I first figured out how to accurately solve a puzzle already given on the grid, this was a long process that involved staying two and a half hours past my class period to have help provided to me from Dr. Snyder, who herself was unfamiliar with this certain method, but we eventually figured it out and I was able to solve puzzles that were populating the grid. Using the knowledge that was I had newly acquired from Dr. Snyder and reading a ZyBook chapter that was not assigned in our curriculum (Chapter 16) I was able to get a good grasp on how we made the ‘Solve’ button work and applied my knowledge to create a functioning ‘Hint’ button. And aside from adding all of my finishing touches, and final polishing, that is all of the main features of my program.

Code Explanation
	There are four major sections that I am splitting up this code too, all of these sections are purposely saved as their own individual files in MATLAB. These sections are the generation of the puzzle, the solving of the puzzle, giving hints for the puzzle, and creating the GUI. The reason I chose to make all of these sections their own external function, (with the exception of the GUI since that’s the main program that calls for the other functions) is that I was learning about how to make each induvial section these work since most of my project is new to me and there was more trial and error to programming my project than I would like to admit, so separating each major section in it’s own external function helped me think about my code systematically and methodically solve it.

Puzzle Generation
This file is stored as ‘generatePuzzle.m’ and this is arguably the most important part of my code and was at one point what I was happy with being my final project. Of course, this has changed but this basic puzzle generator I created is the back-bone for my whole program. 
This is the first section of the ‘generatePuzzle’ function:
 

The function essentially creates a 9 x 9 matrix that is stored as ‘S’ the first part of this function creates a 9 x 9 grid and assigns all of the values to 0 and makes it so every ‘0’ in a induvial cell in the grid is instead stored as an empty cell block, this is important because it is a good way to show an empty grid while also assigning an integer slot for to be stored in each specific cell block. Another important initialization that I placed into my code was assigning variables to one for rows and one for columns, this is important because of one of the parameters of a sudoku puzzle that being that there has to be each digit 1-9 in every row and column so assigning the rows and columns to a variable is a good way to call manipulate numbers in the cells in order to fit the parameters of a sudoku puzzle, variables I and J are responsible for the rows and columns.  

Another thing to note in this section of my code is the ‘plot’ section of my code and this part has nothing to do with the actual creation of the 9 x 9 matrix of the puzzle, but rather is about the formation of the grid in which the matrix is housed. Something new that I had to work with and toy around with was the actual creation of the grid using the plot command in MATLAB since all of the plotting that we had done in class was different and I had never actually created a grid before, but it wasn’t too hard to understand since I was still working with a x and y axis but after playing around with the numbers and using the internet to help me I learned some very helpful things to make my grid look cleaner, the most helpful things I learned were the ‘grid on’ command which practically made the grid for me and the ‘axis square’ command that made my grid look square and much cleaner.

The last thing I want to note in this section was my inclusion of the ‘ind2sub’ command this essentially converts linear indices to subscripts for my matrix

This command made it simple to keep track of my matrix and enabled my method of randomization I used on the matrix. Essentially,  ‘ind2sub’ helped me store the separate variables as different arrangements of numbers 1-9 within the 9 x 9 matrix.

This is what my variables i, I and J are stored as at this current moment:
 

‘x’ is the variable assigned to represent a simple count up from 1-81 by 1 and is only included to illustrate the effects the command ‘ind2sub’, (‘x’ is not actually a part of my code at this point). 

As you can see:
-	‘i’ is stored as the same as ‘x’, increasing the same and can be represented as 
x = ‘i’
-	‘I’ is stored as an 1-9 that resets every time ‘x’ reaches a multiple of 9, for example when ‘x’ = 9, ‘I’ is stored as 1, when ‘x’ = 10, ‘I’ is stored as 2, and when ‘x’=45, ‘I’=9

-	‘J’ is stored as 1 for when ‘x’ is equal to 1-9 and stored as 2 for when ‘x’ is equal to 10-18 and so on up to when ‘x’ is equal to 72-81 where J is stored as 9.


So, with all this in mind, this separation for the different variables will help to randomize and place the numbers in the grid the way that I want them to in order to create a 9 x 9 matrix that fits the parameters of a sudoku puzzle.

The last thing I want to note for this section is the ‘ref’ command this stands for row echelon form, which makes Gaussian elimination operate on the rows and column echelon form which makes Gaussian elimination operate on the columns. So basically, it puts the arrays into matrices 

And with all of them laid out this way it is easy to see why this will be important to set up my grid like this, but at this point all we really care about is making a blank grid to place the correct numbers in later so that’s where the line ‘ S = zeros(9,9); ‘ which makes everything 0 and  ‘ e = 0 ‘ makes any cell that has the value 0 appear empty. 

So, with all of this being said, so far if we were to run the first section of the code only (refer back to figure on pg. 3) we would in return receive a plot of a blank 9x9 matrix with a title of our choice as you can see to the right. Creating this empty grid will be important to use later, as well to refreshing the grid in order to create a new puzzle.
The next section of my code is mostly all stuff that I learned on my own and it involves randomizing numbers in the grid and then making sure that the numbers work as an actual sudoku puzzle.  

The things that are new in this section are all of the commands, the main ones being ceil, unique, setdiff, isempty, and again, ref. All of these refer back to variables that I assigned back in the first section of the code, being S, I, J and the new one k which is equal to ‘i’, just assigned differently so it does not mess up the first section. 

ceil(X) rounds each element of X to the nearest integer greater than or equal to that element. This first line in the code was the hardest part of this section but this line and the next one makes sure that there are no repeating digits in each of the 3 x 3 sections of the grid.
-	difference = unique(check) returns the same data as in check, but with no repetitions. difference is in sorted order. 

-	choice = setdiff (1:9,difference);  can return Difference of 1 and 9, as a matrix, and with it referring to the unique, it makes it sure that there cannot be a number 1-9 in each row and column 
	 

-	if = isempty(choice) returns logical 1 (true) if A is empty, and logical 0 (false) otherwise. An empty array, table.  

-	With the if else statement at the end it makes sure to populate every single induvial cell until the grid is completely full. 


All of these combined with the piecing together of arrays and multiplying and dividing by the other parameters like ‘I’ and ‘J’ can construct the correct placement of different values to populate the grid in a way that does not violate the rules of sudoku. So now in our code the 9 x 9 matrix that is stored as ‘S’ is now a completely solved sudoku ‘puzzle’, the reason puzzle is in quotes is that it’s not a puzzle at this point since it is already solved, the third and last section of the ‘generatePuzzle’ function is actually only revealing certain numbers in order to make the ‘puzzle’ a puzzle. This way of creating the puzzle could definitely be improved on time wise since this is practically just guessing and checking to solve the puzzle, doing research on this topic this is known as “brute force solving” and is very inefficient relative to other ways to computerize it. But, in our case it is not a big deal since many puzzles do not need to be rapidly generated. That being said there sometimes is a noticeable input lag after requesting a puzzle and before having it actually populate the grid.  

Keep in mind that we also get a blank plot that shows up but that was from the first section of the function, to get the table that we have up above we have to open up the ‘ans’ in the workspace. If you look at the numbers though, this table is a solved 9 x 9 sudoku puzzle, now all we need to do to complete this function is to link this table to the 9 x 9 grid that we made in the first section, the third section is connecting the first and second sections

Section three is pretty much only one if statement, but this is a crucial part of the function. Keep in mind that ‘S’ represents the completed sudoku puzzle, ‘S’ will be taken out of this function later in order to solve the puzzle. 

Everything in this section was something that I had learned in class this semester, most notably, ‘rand’ and ‘num2str’. The one thing that is technically new is the ‘text’ command but it is super simple since all it does is fill the grid that was made in the first section, and links it to ‘k’ which was defined in the second section. As you can see, in the text command ‘I”,’ J’, ’k’, and ‘S’ are all referenced. Another noticeable part is the FontSize and HorizontalAlignment functions within the text command, these are changeable, but after toying around with it a little bit I am happy with a font size of 15 and center alignment. 
The most important part of this section was something that you may have noticed, and that is the input of this function (d) appears in the 38th line which is in this third section. This ‘d’ stands for difficulty as it controls how many cells are populated in the grid and remember, the less given cells, the harder the puzzle. 

Line 38 is   if rand()<d   

This d is a placeholder for a decimal between 0 and 1, the closer the decimal is to 1, the more the puzzle is completed. For example, if d was set equal to 0.8, then 80% of the cells of the puzzle would already be filled in, a puzzle that is filled in that much would be very easy to solve. To hit this point home, below are two puzzles with the now completed code, one with d equal to 0.2 and the other with d equal to 0.8. 

	So now my ‘generatePuzzle’ external function is complete and we can change the difficulty of the puzzle generated by changing the value of d before calling it into the main file, which is ‘sudoku_GUI’

GUI Creation
Now let’s look at the ‘main’ file, I call it the main file because this is where the finished project is actually ran, this file is saved as ‘sudoku_GUI.m’. I created this GUI using a method I researched online, this method was using ‘guide’. In order to use guide, ‘guide’ has to be typed into the command window, I then selected to create a blank GUI and inserted an axis and 6 buttons, basically how guide worked in my case was that the ‘axis’ was somewhere to house my blank grid, then every press of one of the buttons changed what was on the grid and guide made it very easy to keep track of all of my function call backs and made it very simple to make my GUI look appealing, I also figured out that chapter 16, which was an optional ZyBook chapter, actually was all about the guide command. With that chapter and the help of this video (https://www.youtube.com/watch?v=Ta1uhGEJFBE) I was able to make a GUI Layout 
	
From the guide window, most everything is customizable and there are a lot of functions that I did not touch during this project, but I explored the customization features with all of my buttons. The only problem with using the guide command is the fact that it completely floods your file with a bunch of crazy functions and lines and lines of commented out text that has to be sorted through to make any sense. Once all of this is sorted through, guide is a very useful tool. Basically, all that has to be worried about in using guide is the opening function which is what is in the axis by default when the GUI is first ran and a function for each of buttons that were created. 

The opening function was simple, I just copied and pasted the first section of my ‘generatePuzzle’ function, it was the part that created the blank sudoku grid, so simple enough I had a GUI that did not have functioning buttons. 

Next, I figured out how to generate the different difficulty puzzles by hitting the buttons, and again this was simple since I added the difficulty input to my ‘generatePuzzle’ function, all that had to be done was set d equal to a decimal of my choosing then call for my ‘generatePuzzle’ function. I chose to have d = 0.6 for easy, 0.4 for medium and 0.25 for hard. Something else crucial to the function was to make the output of my function equal to S, this made it possible to refer back to puzzles already on the grid in order to solve and give hints.

The thing that I had to change in each of the three puzzle generation button push functions after I had them all set up were to reset the grid and the data at the start of each button push or else I would get bugs where numbers would stack on top of each other or the solve button would solve a puzzle that was supposed to be cleared from the grid. The way I did this was using ‘cla reset’ which simply clears the grid and using the three almost identical lines:

set(handles.easyPush,"UserData",[]); 

set(handles.mediumPush,"UserData",[]);

set(handles.hardPush,"UserData",[]);

To understand these, there has to be an understanding on ‘handles’, hObject, and “UserData” basically these commands are how data is shared among different callbacks. I only know the basics on how these work with buttons but it can get very complicated, the main thing to know is that the ‘set’ command can be used to make user data equal to ‘S’ and as you might recall S is also equal to our solved puzzle, so in short, now that we can transfer data through the guide call backs it is possible to keep data cached and call it in different functions. To call it in different functions the ‘get’ command is used. But, since we want to clear this data if a new puzzle is called, the three lines from above have to be called before the new puzzle is generated to clear all of the data. 
 
	
The Clear command is set up very similarly, except the ‘generatePuzzle’ function is not used in the clear button push, this is obviously because there is no reason to generate a new puzzle when all we want to do is clear the grid, so all the clear button does is reset the grid the same way it is done in the difficulty buttons and plot a new empty grid. The plot of the empty grid was copied and pasted from the ‘generatePuzzle’ function. 

Solving Puzzles
This was probably one of the biggest hurdles I had to overcome in my program, I knew what I wanted to do it was just a struggle actually achieving it. The simple part was making a question dialogue pop up that asked whether the player actually wants the puzzle to be solved or not if yes there is a complicated if-else statement to solve the give puzzle, but if no a simple error message pops up. 

How the if-else statement works is it uses the ‘get’ UserData command discussed earlier to get ‘S’, across each function, the if-else statement worked like this, first it would get ‘S’ from the easy push function, if there is nothing there it gets the ‘S’ from the medium push function, if there is nothing there it gets the ‘S’ from the hard push function, and finally if there’s not an S in the hard push function, then a different error message will pop up saying there’s no puzzle to solve. But, of course when there is a puzzle to solve, I created another external function, called ‘solvePuzzle.m’ this is just the last section of the ‘generatePuzzle’ function except that d value that controls the number of cells filled was instead replaced with 1. This completes the puzzle if the value of ‘S’ is given before the function. So, if the line:

S = get(handles.easyPush,"UserData");

is put before the function and there is an S value given, then the puzzle will be filled in. Another feature I added to the ’solvePuzzle’ function is that I changed the color of the text to red when the solved puzzle is shown.  

Giving Hints
My method I used for giving hints was very similar to the way I solved puzzles, I created another external function, called ‘hintPuzzle’ where the only difference this function has than the solvePuzzle function is that there is another input in the hint puzzle function. This new input is x, the reason I put the x in was so that it makes the hint more helpful for the harder puzzles. The x is in the place where the d was in the original generate puzzle function, so once again we are manipulating the number of cells shown to make a puzzle harder or in this case easier. 

The hints for the puzzles are set up in another If-Else statement almost identical to the solve push function. The difference being x is set equal to a very small decimal which fills in another few cells and then clears the user data, this is so you can only be allowed one hint. So, if x is set equal to a small decimal before calling the function then a few cells will be filled red. 

Results 
	After dozens of hours of work, I have a product that I am happy with presenting. There is very little I would want to change about this program and the one major thing I am having an issue with is not even a bad feature and is very avoidable. This issue is that once a hint is asked for the UserData is cleared, which means that it is not possible to then solve that same puzzle since there is no user data to call back on. But, this is something that is very minor in the large scope and after trying numerous times to fix it, I am worried that I might mess something in my code up if I kept on tinkering with it so I decided to stop trying to fix it, since my code still is completely functional and this can even be seen as feature as opposed to a bug. Also, I believe I already went above and beyond the requirements of the project and I am happy with my project.

Conclusion
	This has been one of my favorite things to work on and just mindlessly play around with to try and see if I can get things to work or not. I feel like I learned a ton about more complex MATLAB features and how they tie in with other more basic parts of the class and I really feel like this was a very helpful project in the sense of comprehension of stuff that we learned about throughout the whole semester. At the end of the day I am proud of the program that I made and if I was told in September that I was going to be able to pull this off by the end of the semester I would not have believed it.
