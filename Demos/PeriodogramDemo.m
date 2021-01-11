function varargout = PeriodogramDemo(varargin)
% PERIODOGRAMDEMO M-file for PeriodogramDemo.fig
%      PERIODOGRAMDEMO, by itself, creates a new PERIODOGRAMDEMO or raises the existing
%      singleton*.
%
%      H = PERIODOGRAMDEMO returns the handle to a new PERIODOGRAMDEMO or the handle to
%      the existing singleton*.
%
%      PERIODOGRAMDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERIODOGRAMDEMO.M with the given input arguments.
%
%      PERIODOGRAMDEMO('Property','Value',...) creates a new PERIODOGRAMDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PeriodogramDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PeriodogramDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PeriodogramDemo

% Last Modified by GUIDE v2.5 07-Nov-2012 08:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PeriodogramDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @PeriodogramDemo_OutputFcn, ...
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


% --- Executes just before PeriodogramDemo is made visible.
function PeriodogramDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PeriodogramDemo (see VARARGIN)

% Choose default command line output for PeriodogramDemo
handles.output = hObject;

% Data
handles.data.x = randn(1,100);
guidata(hObject, handles); % Store

% Update handles structure
guidata(hObject, handles);

% Draw initial figure
update(handles);

% UIWAIT makes PeriodogramDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PeriodogramDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in generate.
function generate_Callback(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Data
handles.data.x = randn(1,100);
guidata(hObject, handles); % Store

% Update figures
update(handles);

function seqlen_Callback(hObject, eventdata, handles)
% hObject    handle to seqlen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Handle (to object)
edit = hObject;

% Format edit box input (input control)
minval = 5;
maxval = 100;
str = get(edit,'String');
x = str2double(str);
x = round(min(max(x,minval),maxval));
str = num2str(x,3);
set(edit,'String',x);

% Set slider value
set(handles.blockslider,'Value',x);

% Update figures
update(handles);

% Hints: get(hObject,'String') returns contents of seqlen as text
%        str2double(get(hObject,'String')) returns contents of seqlen as a double


% --- Executes during object creation, after setting all properties.
function seqlen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seqlen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function seqlenslider_Callback(hObject, eventdata, handles)
% hObject    handle to seqlenslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x = get(handles.seqlenslider,'Value');
str = int2str(x);
set(handles.seqlen,'String',str);

update(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function seqlenslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seqlenslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in dftcheck.
function dftcheck_Callback(hObject, eventdata, handles)
% hObject    handle to dftcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Update figures
update(handles);

% Hint: get(hObject,'Value') returns toggle state of dftcheck


% --- Executes on button press in sinecheck.
function sinecheck_Callback(hObject, eventdata, handles)
% hObject    handle to sinecheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sinecheck

% Update figure
update(handles);

function update(handles)

% Data
N = round(str2double(get(handles.seqlen,'String')));
dc = get(handles.dftcheck,'Value');
sn = get(handles.sinecheck,'Value');

% Obtain data
n = 0:(N-1);
x = handles.data.x(1:N);

% Add sine component
if(sn)
    x = x + sin(2*pi*0.1*n);
end;
    
% Time plot
a = handles.timeaxes;
cla(a); hold(a,'on');
stem(a,n,x,'k','MarkerFaceColor','k','LineWidth',1.5);
hold(a,'off');

% Format timeplot
set(a,'XLim',[0 N]);
set(a,'YLim',[-4 4]);
if(sn)
    title(a,'Realization of sine in white additive noise of unit variance');
else
    title(a,'Realization of white noise of unit variance');
end
    
% Frequency plot
a = handles.freqaxes;
w = ones(1,N); w = w./ norm(w);
if(dc)
    M = 1024;
    X = fft(w.*x,M);
    Px = abs(X).^2;
    f = (0:M/2)/M;

    % Plot
    cla(a); hold(a,'on');
    plot(a,f,10*log10(Px(1:M/2+1)),'k','LineWidth',1.5);
    plot([0 1/2],[0 0],'k--','LineWidth',1.5);
    hold(a,'off');
    
    % Formatting
    set(a,'XLim',[0 1/2]);
    set(a,'YLim',[-30 20]); 
    set(a,'XGrid','on');
    set(a,'YGrid','on');    
    title(a,'Periodogram (continuous frequency view)');
    ylabel('Magnitude [dB]');
    xlabel('Normalized frequency (units of 2pi)');
else
    X = fft(w.*x);
    Px = abs(X).^2;
    k = 0:N-1;
    
    % Plot
    stem(a,k,Px(k+1),'k','MarkerFaceColor','k','LineWidth',0.5);
    
    % Formatting
    set(a,'XLim',[0 N]);
    set(a,'YLim',[0 8]);
    title('Periodogram (squared N-point DFT)');
    ylabel('Magnitude');
    xlabel('k');
end;
