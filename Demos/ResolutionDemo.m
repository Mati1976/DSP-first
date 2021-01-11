function varargout = ResolutionDemo(varargin)
% RESOLUTIONDEMO M-file for ResolutionDemo.fig
%      RESOLUTIONDEMO, by itself, creates a new RESOLUTIONDEMO or raises the existing
%      singleton*.
%
%      H = RESOLUTIONDEMO returns the handle to a new RESOLUTIONDEMO or the handle to
%      the existing singleton*.
%
%      RESOLUTIONDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESOLUTIONDEMO.M with the given input arguments.
%
%      RESOLUTIONDEMO('Property','Value',...) creates a new RESOLUTIONDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResolutionDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResolutionDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResolutionDemo

% Last Modified by GUIDE v2.5 12-Nov-2009 18:44:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ResolutionDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @ResolutionDemo_OutputFcn, ...
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


% --- Executes just before ResolutionDemo is made visible.
function ResolutionDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResolutionDemo (see VARARGIN)

% Choose default command line output for ResolutionDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Update figures
update_plots(handles);

% UIWAIT makes ResolutionDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResolutionDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in windowtype.
function windowtype_Callback(hObject, eventdata, handles)
% hObject    handle to windowtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

update_plots(handles);

% Hints: contents = get(hObject,'String') returns windowtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowtype


% --- Executes during object creation, after setting all properties.
function windowtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seqlen_Callback(hObject, eventdata, handles)
% hObject    handle to seqlen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Handle (to object)
edit = hObject;

% Format edit box input (input control)
minval = 5;
maxval = 50;
str = get(edit,'String');
x = str2double(str);
x = round(min(max(x,minval),maxval));
str = num2str(x,3);
set(edit,'String',x);

% Update figures
update_plots(handles);

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



function s2aedit_Callback(hObject, eventdata, handles)
% hObject    handle to s2aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s2aedit,handles.s2aslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s2aedit as text
%        str2double(get(hObject,'String')) returns contents of s2aedit as a double


% --- Executes during object creation, after setting all properties.
function s2aedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2fedit_Callback(hObject, eventdata, handles)
% hObject    handle to s2fedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s2fedit,handles.s2fslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s2fedit as text
%        str2double(get(hObject,'String')) returns contents of s2fedit as a double


% --- Executes during object creation, after setting all properties.
function s2fedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2fedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2pedit_Callback(hObject, eventdata, handles)
% hObject    handle to s2pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s2pedit,handles.s2pslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s2pedit as text
%        str2double(get(hObject,'String')) returns contents of s2pedit as a double


% --- Executes during object creation, after setting all properties.
function s2pedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function s2aslider_Callback(hObject, eventdata, handles)
% hObject    handle to s2aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s2aslider,handles.s2aedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2aslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s2fslider_Callback(hObject, eventdata, handles)
% hObject    handle to s2fslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s2fslider,handles.s2fedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2fslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2fslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s2pslider_Callback(hObject, eventdata, handles)
% hObject    handle to s2pslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s2pslider,handles.s2pedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2pslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2pslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function s1aedit_Callback(hObject, eventdata, handles)
% hObject    handle to s1aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s1aedit,handles.s1aslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s1aedit as text
%        str2double(get(hObject,'String')) returns contents of s1aedit as a double


% --- Executes during object creation, after setting all properties.
function s1aedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1fedit_Callback(hObject, eventdata, handles)
% hObject    handle to s1fedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s1fedit,handles.s1fslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s1fedit as text
%        str2double(get(hObject,'String')) returns contents of s1fedit as a double


% --- Executes during object creation, after setting all properties.
function s1fedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1fedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1pedit_Callback(hObject, eventdata, handles)
% hObject    handle to s1pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit2slider(handles.s1pedit,handles.s1pslider);
update_plots(handles);

% Hints: get(hObject,'String') returns contents of s1pedit as text
%        str2double(get(hObject,'String')) returns contents of s1pedit as a double


% --- Executes during object creation, after setting all properties.
function s1pedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function s1aslider_Callback(hObject, eventdata, handles)
% hObject    handle to s1aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s1aslider,handles.s1aedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s1aslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s1fslider_Callback(hObject, eventdata, handles)
% hObject    handle to s1fslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s1fslider,handles.s1fedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s1fslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1fslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s1pslider_Callback(hObject, eventdata, handles)
% hObject    handle to s1pslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slider2edit(handles.s1pslider,handles.s1pedit);
update_plots(handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s1pslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1pslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% Custom functions

% Call function when slider is altered
function slider2edit(slider,edit)

% Transfer slider value to edit box
x = get(slider,'Value');
str = num2str(x,3);
set(edit,'String',str);


% Call function when edit box is altered
function edit2slider(edit,slider)

% Get max and minval
maxval = get(slider,'Max');
minval = get(slider,'Min');

% Format edit box input (input control)
str = get(edit,'String');
x = str2double(str);
x = min(max(x,minval),maxval);
str = num2str(x,3);
set(edit,'String',x);

% Set slider value
set(slider,'Value',x);

% Collect all data for plotting
function data = getdata(handles)

data = [];

% Sine 1
data.a1 = get(handles.s1aslider,'Value');
data.f1 = get(handles.s1fslider,'Value');
data.p1 = get(handles.s1pslider,'Value');

% Sine 2
data.a2 = get(handles.s2aslider,'Value');
data.f2 = get(handles.s2fslider,'Value');
data.p2 = get(handles.s2pslider,'Value');

% Data length
N = round(str2double(get(handles.seqlen,'String')));
data.N = N;

% Windo 
w = ones(1,N);
wtype = get(handles.windowtype,'Value');
if(wtype == 2)
    w = bartlett(N)';
end
if(wtype == 3)
    w = hanning(N)';
end;
if(wtype == 4)
    w = hamming(N)';
end;
if(wtype == 5)
    w = blackman(N)';
end;
w = w ./ norm(w); % Normalize
data.w = w;


function update_plots(handles)

data = getdata(handles);

% Parameters
N = data.N;
a1 = data.a1;
f1 = data.f1;
p1 = data.p1;
a2 = data.a2;
f2 = data.f2;
p2 = data.p2;
w = data.w;

% Signal (samples)
n = 0:N-1;
s1 = a1*cos(2*pi*f1*n+p1);
s2 = a2*cos(2*pi*f2*n+p2);
x = s1 + s2;

% Signal (time)
t = linspace(0,N,500);
s1t = a1*cos(2*pi*f1*t+p1);
s2t = a2*cos(2*pi*f2*t+p2);
xt = s1t + s2t;

% Time plot
a = handles.timeaxes;
cla(a); hold(a,'on');
if(get(handles.windowtype,'Value') > 1)
    plot(a,0:N-1,sqrt(N).*w,'r'); % Not for rectangular window
end;
plot(a,t,xt,'k');
stem(a,n,x,'k','MarkerFaceColor','k','LineWidth',1.5);
hold(a,'off');

% Format timeplot
set(a,'XLim',[0 N]);
set(a,'YLim',[-2.1 2.1]);
ylabel(a,'x(n) = s_1(n)+s_2(n)');

% Spectrum
M = 4096;
X = fft(w.*x,M);
Px = abs(X).^2;
f = (0:M/2)/M;

% Frequency plot
a = handles.freqaxes;
plot(a,f,10*log10(Px(1:M/2+1)),'k','LineWidth',1.5);

% Format frequency plot
set(a,'XLim',[0 1/2]);
set(a,'YLim',[-60 20]);
set(a,'XGrid','on');
set(a,'YGrid','on');
ylabel(a,'Magnitude [dB]');
if(get(handles.windowtype,'Value') > 1)
    title(a,'Modified Periodogram');
else
    title(a,'Periodogram');
end;
