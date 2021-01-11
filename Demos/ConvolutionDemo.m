function varargout = ConvolutionDemo(varargin)
% CONVOLUTIONDEMO M-file for ConvolutionDemo.fig
%      CONVOLUTIONDEMO, by itself, creates a new CONVOLUTIONDEMO or raises the existing
%      singleton*.
%
%      H = CONVOLUTIONDEMO returns the handle to a new CONVOLUTIONDEMO or the handle to
%      the existing singleton*.
%
%      CONVOLUTIONDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVOLUTIONDEMO.M with the given input arguments.
%
%      CONVOLUTIONDEMO('Property','Value',...) creates a new CONVOLUTIONDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ConvolutionDemo_OpeningFcn gets called.
%      An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ConvolutionDemo_OpeningFcn via
%      varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ConvolutionDemo

% Last Modified by GUIDE v2.5 30-Oct-2010 17:40:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ConvolutionDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @ConvolutionDemo_OutputFcn, ...
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


% --- Executes just before ConvolutionDemo is made visible.
function ConvolutionDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ConvolutionDemo (see VARARGIN)

% Choose default command line output for ConvolutionDemo
handles.output = hObject;

% Data
rand('state',1);
handles.data.h = rand(1,10);
handles.data.x = rand(1,10);
handles.data.tog = 0;
guidata(hObject, handles); % Store

% Update handles structure
guidata(hObject, handles);

% Draw initial figure
update(handles);

% UIWAIT makes ConvolutionDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ConvolutionDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nedit_Callback(hObject, eventdata, handles)
% hObject    handle to nedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nedit as text
%        str2double(get(hObject,'String')) returns contents of nedit as a double


% --- Executes during object creation, after setting all properties.
function nedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nnb.
function nnb_Callback(hObject, eventdata, handles)
% hObject    handle to nnb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n = round(str2double(get(handles.nedit,'String')));
if(n > -1) n = n-1; end;
str = int2str(n);
set(handles.nedit,'String',str);

update(handles);


function Pedit_Callback(hObject, eventdata, handles)
% hObject    handle to Pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pedit as text
%        str2double(get(hObject,'String')) returns contents of Pedit as a double


% --- Executes during object creation, after setting all properties.
function Pedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Pnb.
function Pnb_Callback(hObject, eventdata, handles)
% hObject    handle to Pnb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = round(str2double(get(handles.Pedit,'String')));
L = round(str2double(get(handles.Ledit,'String')));
M = round(str2double(get(handles.Medit,'String')));
if(N > max(L,M)) N = N-1; end;
str = int2str(N);
set(handles.Pedit,'String',str);

update(handles);

function Medit_Callback(hObject, eventdata, handles)
% hObject    handle to Medit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Medit as text
%        str2double(get(hObject,'String')) returns contents of Medit as a double


% --- Executes during object creation, after setting all properties.
function Medit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Medit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Mnb.
function Mnb_Callback(hObject, eventdata, handles)
% hObject    handle to Mnb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

M = round(str2double(get(handles.Medit,'String')));
if(M > 1) M = M-1; end;
str = int2str(M);
set(handles.Medit,'String',str);

update(handles);

% --- Executes on button press in Mpb.
function Mpb_Callback(hObject, eventdata, handles)
% hObject    handle to Mpb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = round(str2double(get(handles.Pedit,'String')));
M = round(str2double(get(handles.Medit,'String')));
if((M < 5) && (M < N)) M = M+1; end;
str = int2str(M);
set(handles.Medit,'String',str);

update(handles);

function Ledit_Callback(hObject, eventdata, handles)
% hObject    handle to Ledit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ledit as text
%        str2double(get(hObject,'String')) returns contents of Ledit as a double


% --- Executes during object creation, after setting all properties.
function Ledit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ledit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ppb.
function Ppb_Callback(hObject, eventdata, handles)
% hObject    handle to Ppb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = round(str2double(get(handles.Pedit,'String')));
if(N <= 14) N = N+1; end;
str = int2str(N);
set(handles.Pedit,'String',str);

update(handles);

% --- Executes on button press in npb.
function npb_Callback(hObject, eventdata, handles)
% hObject    handle to npb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n = round(str2double(get(handles.nedit,'String')));
if(n <= 14) n = n+1; end;
str = int2str(n);
set(handles.nedit,'String',str);

update(handles);


% --- Executes on button press in Lnb.
function Lnb_Callback(hObject, eventdata, handles)
% hObject    handle to Lnb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

L = round(str2double(get(handles.Ledit,'String')));
if(L > 1) L = L-1; end;
str = int2str(L);
set(handles.Ledit,'String',str);

update(handles);

% --- Executes on button press in Lpb.
function Lpb_Callback(hObject, eventdata, handles)
% hObject    handle to Lpb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = round(str2double(get(handles.Pedit,'String')));
L = round(str2double(get(handles.Ledit,'String')));
if((L < 5) && (L < N)) L = L+1; end;
str = int2str(L);
set(handles.Ledit,'String',str);


% --- Executes on button press in ToggleButton.
function ToggleButton_Callback(hObject, eventdata, handles)
% hObject    handle to ToggleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.data.tog == 0)
    handles.data.tog = 1;
else
    handles.data.tog = 0;
end;

% Update handles structure
guidata(hObject, handles);

% Plot new schene
update(handles);

function update(handles)

% TODO
n = round(str2double(get(handles.nedit,'String')));
N = round(str2double(get(handles.Pedit,'String')));
M = round(str2double(get(handles.Medit,'String')));
L = round(str2double(get(handles.Ledit,'String')));
tog = handles.data.tog;

% General data
m = -5:15;

% Plot h
a = handles.haxes;
h = handles.data.h;
h(M+1:end) = 0;
d = h(mod(m,N)+1);
if(tog == 0) % Null out when doing linear convolution
    d = d.*((m >= 0) & (m < N));
end;
cla(a); hold(a,'on'); axes(a);
rectangle('Position',[-5 0 20 1.1],'FaceColor',[1 1 1]);
if(tog == 1)
    rectangle('Position',[-5 0 5 1.1],'FaceColor',0.9*[1 1 1]);
    rectangle('Position',[N-1 0 16-N 1.1],'FaceColor',0.9*[1 1 1]);
end;
stem(a,m,d,'k','MarkerFaceColor','k','LineWidth',1.5);
axis(a,[-5 15 0 1.1]);
box(a,'on');
set(a,'XTick',m);
if(tog == 0)
    han = ylabel(a,'h(m)');
    Pos = get(han,'Position');
    Pos(1) = -5.6843 + 0.0;
    set(han,'Position',Pos);
else
    han = ylabel(a,'h((m)_N)');
    Pos = get(han,'Position');
    Pos(1) = -5.6843 + 0.1;
    set(han,'Position',Pos);
end;
xlabel('m');
hold(a,'off');

% Plot x
a = handles.xaxes;
x = handles.data.x;
x(L+1:end) = 0;
d = x(mod(n-m,N)+1);
if(tog == 0) % Null out when doing linear convolution
    d = d.*(((n-m) >= 0) & ((n-m) < N));
end;
cla(a); hold(a,'on'); axes(a);
rectangle('Position',[-5 0 20 1.1],'FaceColor',[1 1 1]);
if(tog == 1)
    rectangle('Position',[-5 0 5 1.1],'FaceColor',0.9*[1 1 1]);
    rectangle('Position',[N-1 0 16-N 1.1],'FaceColor',0.9*[1 1 1]);
end;
stem(a,m,d,'k','MarkerFaceColor','k','LineWidth',1.5);
axis(a,[-5 15 0 1.1]);
box(a,'on');
set(a,'XTick',m);
if(tog == 0)
    han = ylabel(a,'x(n-m)');
    Pos = get(han,'Position');
    Pos(1) = -5.6843 + 0.0;
    set(han,'Position',Pos);
else
    han = ylabel(a,'x((n-m)_N)');
    Pos = get(han,'Position');
    Pos(1) = -5.6843 + 0.1;
    set(han,'Position',Pos);
end;
xlabel('m');
hold(a,'off');

% Plot y
a = handles.yaxes;
h = handles.data.h(1:M);
x = handles.data.x(1:L);
if(tog == 0) % Linear convolution
    y = conv(x,h);
    d = y(mod(m,M+L-1)+1);
    d = d.*((m >= 0) & (m < (M+L-1)));
else
    if((M > 1) && (L > 1)) 
        y = cconv(x,h,N);
    else % Fix as cconv does not work for lenght 1
        y = zeros(1,N);
        y(1:max(M,L)) = x*h;
    end;
    d = y(mod(m,N)+1);
end;
cla(a); hold(a,'on'); axes(a);
rectangle('Position',[-5 0 20 3.1],'FaceColor',[1 1 1]);
if(tog == 1)
    rectangle('Position',[-5 0 5 3.1],'FaceColor',0.9*[1 1 1]);
    rectangle('Position',[N-1 0 16-N 3.1],'FaceColor',0.9*[1 1 1]);
end;
stem(a,m,d,'k','MarkerFaceColor','k','LineWidth',1.5);
if((n >= 0) && (n < M+L-1))
    stem(a,n,y(n+1),'k','LineWidth',6.5,'MarkerSize',5);
else
    stem(a,n,0,'k','LineWidth',6.5,'MarkerSize',5);
end;
axis(a,[-5 15 0 3.1]);
%plot(a,[0 0],[0 1.1],'k');
%plot(a,[M-1 M-1],[0 1.1],'k');
box(a,'on');
set(a,'XTick',m);
ylabel(a,'y(n)');
xlabel('n');
hold(a,'off');

% Set Text
if(tog == 0)
    set(handles.togtext,'String','Linear Convolution');
else
    set(handles.togtext,'String','N-point Cicular Conv.');
end;    
