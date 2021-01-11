function varargout = ARspectrumDemo(varargin)
% ARSPECTRUMDEMO M-file for ARspectrumDemo.fig
%      ARSPECTRUMDEMO, by itself, creates a new ARSPECTRUMDEMO or raises the existing
%      singleton*.
%
%      H = ARSPECTRUMDEMO returns the handle to a new ARSPECTRUMDEMO or the handle to
%      the existing singleton*.
%
%      ARSPECTRUMDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARSPECTRUMDEMO.M with the given input arguments.
%
%      ARSPECTRUMDEMO('Property','Value',...) creates a new ARSPECTRUMDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARspectrumDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARspectrumDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARspectrumDemo

% Last Modified by GUIDE v2.5 13-Nov-2012 23:07:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARspectrumDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @ARspectrumDemo_OutputFcn, ...
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


% --- Executes just before ARspectrumDemo is made visible.
function ARspectrumDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARspectrumDemo (see VARARGIN)

% Choose default command line output for ARspectrumDemo
handles.output = hObject;

% Data
set(handles.ARslider,'Value',1);
str = int2str(1);
set(handles.blockedit,'String',str);
handles = generate(handles);

% Update handles structure
guidata(hObject, handles);

% Update figures
update(handles);

% UIWAIT makes ARspectrumDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARspectrumDemo_OutputFcn(hObject, eventdata, handles) 
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
maxval = 128;
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
M = 128;
a1 = 4;
a2 = 1;
p1 = 2*pi*rand(1);
p2 = 2*pi*rand(1);

n = 0:M-1; % Sample indicees
pole = .9;
B = 1;
A = [1 -pole]; 
x = filter(B,A,randn(1,M)); % Data sequence

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
%%%% Bartlett estimate %%%%%%%%%
str = get(handles.blockedit,'String');
K = round(str2double(str));
N = length(x);

L = floor(N/K);

Pb = zeros(1,M);
for k=0:K-1 % Bartlett estimate
    Pb = Pb + abs(fft(x(k*L+1:k*L+L),M)).^2;
end;
Pb = Pb ./ N;

f = (0:M/2)/M;

%%%%%%%%%% AR estimate %%%%%%%%%%%
modelorder = round(get(handles.ARslider,'Value'));
r=xcorr(x, modelorder, 'biased')'; r=r(modelorder+1:end);
Ahat = toeplitz(r(1:modelorder))\r(2:end);
sigmahat=[1;-Ahat]'*r;
P_AR=sigmahat*abs(freqz(1,[1;-Ahat],f*2*pi)).^2;

%%%%%%%%%%% True spectrum %%%%%%%%%%%%%%%%
Ptrue=abs(freqz(B,A,f*2*pi)).^2;

plot(f,10*log10(Pb(1:M/2+1)),'k','LineWidth',1.5);
hold on
plot(f,10*log10(P_AR),'b--','LineWidth',1.5)
plot(f,10*log10(Ptrue),'r','LineWidth',1.5)
hold off
legend('Barlett estimate', 'AR estimate', 'True spectrum')

% Format figure
a = handles.freqaxes;
set(a,'XLim',[0 1/2]);
set(a,'YLim',[-40 40]); 
set(a,'XGrid','on');
set(a,'YGrid','on');
%str = sprintf('Bartlett''s method:  (K=%d, L=%d, N=%d)',K,L,N);
str = sprintf('Different spectrum estimates using %i samples of an AR(1) signal', N);
title(a,str);
xlabel(a,'Normalized frequency (units of 2*pi)');
ylabel(a,'Magnitude [dB]');




function ARslidervalue_Callback(hObject, eventdata, handles)
% hObject    handle to ARslidervalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARslidervalue as text
%        str2double(get(hObject,'String')) returns contents of ARslidervalue as a double
% Format edit box input (input control)
minval = 1;
maxval = 110;
str = get(hObject,'String');
x = str2double(str);
x = round(min(max(x,minval),maxval));
str = num2str(x,3);
set(hObject,'String',x);

% Set slider value
set(handles.ARslider,'Value',x);

% Update figures
update(handles);


% --- Executes during object creation, after setting all properties.
function ARslidervalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARslidervalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ARslider_Callback(hObject, eventdata, handles)
% hObject    handle to ARslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
x = get(handles.ARslider,'Value');
str = int2str(x);
set(handles.ARslidervalue,'String',str);

update(handles);


% --- Executes during object creation, after setting all properties.
function ARslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
