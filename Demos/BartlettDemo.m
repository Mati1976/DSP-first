function varargout = BartlettDemo(varargin)
% BARTLETTDEMO M-file for BartlettDemo.fig
%      BARTLETTDEMO, by itself, creates a new BARTLETTDEMO or raises the existing
%      singleton*.
%
%      H = BARTLETTDEMO returns the handle to a new BARTLETTDEMO or the handle to
%      the existing singleton*.
%
%      BARTLETTDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BARTLETTDEMO.M with the given input arguments.
%
%      BARTLETTDEMO('Property','Value',...) creates a new BARTLETTDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BartlettDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BartlettDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BartlettDemo

% Last Modified by GUIDE v2.5 13-Nov-2012 23:20:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BartlettDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @BartlettDemo_OutputFcn, ...
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


% --- Executes just before BartlettDemo is made visible.
function BartlettDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BartlettDemo (see VARARGIN)

% Choose default command line output for BartlettDemo
handles.output = hObject;

% Data
handles = generate(handles);

% Update handles structure
guidata(hObject, handles);

% Update figures
update(handles);

% UIWAIT makes BartlettDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BartlettDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function blockslider_Callback(hObject, eventdata, handles)
% hObject    handle to blockslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

x = get(handles.blockslider,'Value');
str = int2str(x);
set(handles.blockedit,'String',str);

update(handles);

% --- Executes during object creation, after setting all properties.
function blockslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blockslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function blockedit_Callback(hObject, eventdata, handles)
% hObject    handle to blockedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blockedit as text
%        str2double(get(hObject,'String')) returns contents of blockedit as a double

% Handle (to object)
edit = hObject;

% Format edit box input (input control)
minval = 1;
maxval = 1024;
str = get(edit,'String');
x = str2double(str);
x = round(min(max(x,minval),maxval));
str = num2str(x,3);
set(edit,'String',x);

% Set slider value
set(handles.blockslider,'Value',x);

% Update figures
update(handles);

% --- Executes during object creation, after setting all properties.
function blockedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blockedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in generatebutton.
function generatebutton_Callback(hObject, eventdata, handles)
% hObject    handle to generatebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Data
handles = generate(handles);
guidata(hObject, handles); % Store

% Update figures
update(handles);


function handles = generate(handles)

% Parameters
M = 1024;
f1 = 0.123;
f2 = 0.211;
a1 = 4;
a2 = 1;
p1 = 2*pi*rand(1);
p2 = 2*pi*rand(1);

n = 0:M-1; % Sample indicees
if get(handles.ARnoisebutton,'Value') == get(handles.ARnoisebutton,'Max')
  pole = .9;
  B = 1;
  A = [1 -pole]; 
else
  B=1;
  A=1;
end
x = a1*sin(2*pi*f1*n +p1) + a2*sin(2*pi*f2*n + p2) + filter(B,A,randn(1,M)); % Data sequence

% Store realization
handles.data.x = x;
handles.data.B = B;
handles.data.A = A; 


function update(handles)

x = handles.data.x;
A = handles.data.A;
B = handles.data.B;

% FFT length
M = 1024;

% Data
str = get(handles.blockedit,'String');
K = round(str2double(str));
N = length(x);

L = floor(N/K);

Px = zeros(1,M);
for k=0:K-1 % Bartett estimate
    Px = Px + abs(fft(x(k*L+1:k*L+L),M)).^2;
end;
Px = Px ./ N;

f = (0:M/2)/M;

plot(f,10*log10(Px(1:M/2+1)),'k','LineWidth',1.5);
hold on
plot(f,20*log10(abs(freqz(B,A,f*2*pi))),'r','LineWidth',1.5)
hold off

% Format figure
a = handles.freqaxes;
set(a,'XLim',[0 1/2]);
set(a,'YLim',[-40 40]); 
set(a,'XGrid','on');
set(a,'YGrid','on');
str = sprintf('Bartlett''s method: Two sinus signals in noise (K=%d, L=%d, N=%d)',K,L,N);
title(a,str);
xlabel(a,'Normalized frequency (units of 2*pi)');
ylabel(a,'Magnitude [dB]');


% --- Executes when selected object is changed in noiseselection.
function noiseselection_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in noiseselection 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'whitenoisebutton'
        handles.data.ARnoise=false;
    case 'ARnoisebutton'
        handles.data.ARnoise=true;
end
% Generate new realization
handles = generate(handles);
% Update the figure
update(handles);
