function varargout = Sudoku_GUI(varargin)
% SUDOKU_GUI MATLAB code for Sudoku_GUI.fig
%      SUDOKU_GUI, by itself, creates a new SUDOKU_GUI or raises the existing
%      singleton*.
%
%      H = SUDOKU_GUI returns the handle to a new SUDOKU_GUI or the handle to
%      the existing singleton*.
%
%      SUDOKU_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUDOKU_GUI.M with the given input arguments.
%
%      SUDOKU_GUI('Property','Value',...) creates a new SUDOKU_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sudoku_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sudoku_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sudoku_GUI

% Last Modified by GUIDE v2.5 20-Nov-2019 16:51:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sudoku_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Sudoku_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%-------------------------------------------------------------------------

% --- Executes just before Sudoku_GUI is made visible.
function Sudoku_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sudoku_GUI (see VARARGIN)
%plot
S = zeros(9,9); %blank martirx
i = 1:81; %assign 'i' one array indexing
[I, J] = ind2sub([9 9], i); %linear index to sub script
ref = [[1 2 3]; [4 5 6]; [7 8 9]]; %row echelon form

plot([0.3 0.3],[0 0.9],'k',[0.6 0.6],[0 0.9],'k',[0 0.9],[0.3 0.3],'k',[0 0.9],[0.6 0.6],'k');
set(gca,'XTickLabel',[]);set(gca,'YTickLabel',[]);grid on
axis([0 .9 0 .9]); axis square
hold on;iter = 0;e = 0;
title('Choose Difficulty');


% Choose default command line output for Sudoku_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sudoku_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sudoku_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in easyPush.
function easyPush_Callback(hObject, eventdata, handles)
%--------
cla reset;
set(handles.easyPush,"UserData",[]);
set(handles.mediumPush,"UserData",[]);
set(handles.hardPush,"UserData",[]);
%---------
d = 0.6;
S = generatePuzzle(d);
%---------
set(hObject,"UserData",S);

% --- Executes on button press in mediumPush.
function mediumPush_Callback(hObject, eventdata, handles)
% hObject    handle to mediumPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%---------
cla reset;
set(handles.easyPush,"UserData",[]);
set(handles.mediumPush,"UserData",[]);
set(handles.hardPush,"UserData",[]);
%---------
d = 0.4;
S = generatePuzzle(d);
%---------
set(hObject,"UserData",S);

% --- Executes on button press in hardPush.
function hardPush_Callback(hObject, eventdata, handles)
% hObject    handle to hardPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%---------
cla reset;
set(handles.easyPush,"UserData",[]);
set(handles.mediumPush,"UserData",[]);
set(handles.hardPush,"UserData",[]);
%---------
d = 0.25;
S = generatePuzzle(d);
%---------
set(hObject,"UserData",S);


% --- Executes on button press in hintPush.
function hintPush_Callback(hObject, eventdata, handles)
% hObject    handle to hintPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S = get(handles.easyPush,"UserData");
if (isempty(S) ~= 1)
x = 0.025;
    hintPuzzle(S,x)
  set(handles.easyPush,"UserData",[]);
else 
    S = get(handles.mediumPush,"UserData");
if (isempty(S) ~= 1)
x = 0.035;
    hintPuzzle(S,x)
 set(handles.mediumPush,"UserData",[]);
else
     S = get(handles.hardPush,"UserData");
if (isempty(S) ~= 1)
x = 0.045;
    hintPuzzle(S,x)
 set(handles.hardPush,"UserData",[]);
else
    S = 'error';
    if (S == 'error')
        disp(errordlg('No Hints Allowed','Error'));
end
end
end
end

% --- Executes on button press in solvePush.
function solvePush_Callback(hObject, eventdata, handles)
% hObject    handle to solvePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

answer = questdlg('Are you sure you want to solve?', ...
	'Warning', ...
'Yes','No','No');
% Handle response
switch answer
    case 'Yes'    
%----------
%IF empty... go to next, till not empty
S = get(handles.easyPush,"UserData");
if (isempty(S) ~= 1)
solvePuzzle(S);
set(handles.easyPush,"UserData",[]);
else
S = get(handles.mediumPush,"UserData");
if (isempty(S) ~= 1)
solvePuzzle(S);
set(handles.mediumPush,"UserData",[]);
else
S = get(handles.hardPush,"UserData");
if (isempty(S) ~= 1)
solvePuzzle(S);
set(handles.hardPush,"UserData",[]);
else
    S = 'error';
    if (S == 'error')
        disp(errordlg('No Puzzle to Solve','Error'));
end
end
end
end

%----------       
    case 'No'
        disp(msgbox('Ok, Continue On'));;
end

% --- Executes on button press in clearPush.
function clearPush_Callback(hObject, eventdata, handles)
% hObject    handle to clearPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
plot([0.3 0.3],[0 0.9],'k',[0.6 0.6],[0 0.9],'k',[0 0.9],[0.3 0.3],'k',[0 0.9],[0.6 0.6],'k');
set(gca,'XTickLabel',[]);set(gca,'YTickLabel',[]);grid on
axis([0 .9 0 .9]); axis square
hold on;iter = 0;e = 0;
title('Choose Difficulty');
set(handles.easyPush,"UserData",[]);
set(handles.mediumPush,"UserData",[]);
set(handles.hardPush,"UserData",[]);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles, d)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
