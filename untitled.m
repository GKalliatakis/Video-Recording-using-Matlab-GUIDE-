function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 09-Apr-2014 00:51:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function fps_Callback(hObject, eventdata, handles)
% hObject    handle to fps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fps as text
%        str2double(get(hObject,'String')) returns contents of fps as a double


% --- Executes during object creation, after setting all properties.
function fps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function trigger_Callback(hObject, eventdata, handles)
% hObject    handle to trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trigger as text
%        str2double(get(hObject,'String')) returns contents of trigger as a double


% --- Executes during object creation, after setting all properties.
function trigger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function vdfilename_Callback(hObject, eventdata, handles)
% hObject    handle to vdfilename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vdfilename as text
%        str2double(get(hObject,'String')) returns contents of vdfilename as a double
handles.vdFileName=get(hObject,'String');
handles.vdFileName1=char(handles.vdFileName);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function vdfilename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vdfilename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in vdrecord.
function vdrecord_Callback(hObject, eventdata, handles)
% hObject    handle to vdrecord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tic;
fps= str2double(get(handles.fps,'String'));
project_dir=get(handles.project_name,'String');
name_of_video=get(handles.vdfilename,'String');


vid = videoinput('macvideo', 1, 'YCbCr422_1280x720');




setappdata(handles.vdrecord,'vid',vid);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir(project_dir) % create folder with the date as name
filename_string=strcat(project_dir,'/',name_of_video,'.avi'); % create filename string
aviobj = VideoWriter(filename_string);  % Create a |VideoWriter| object.
 vid.DiskLogger = aviobj;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% aviobj=VideoWriter(name_of_video);
aviobj.Quality = 50; 
aviobj.FrameRate = fps;

%  vid.DiskLogger = aviobj;
 vid.LoggingMode = 'disk';
 vid.TriggerRepeat = Inf;
 vid.FramesPerTrigger = Inf;
%  triggerconfig(vid,'manual');
% triggerconfig(vid2,'manual');
%  
% preview(vid);
% preview(vid2);


start(vid);
wait(vid,10000,'Logging')


vid.Running;
vid.Logging;
vid.DiskLoggerFrameCount;

   while (vid.DiskLoggerFrameCount ~= vid.FramesAcquired)
   pause(1);
   end
   vid.DiskLoggerFrameCount;
   

 
   close(aviobj);


   delete(vid);
   elaspsed_time=toc;
   disp(elaspsed_time);
  

% --- Executes on button press in vdstop.
function vdstop_Callback(hObject, eventdata, handles)
% hObject    handle to vdstop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
video= getappdata(handles.vdrecord,'vid');
stop(video);

guidata(hObject,handles);

function project_name_Callback(hObject, eventdata, handles)
% hObject    handle to project_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of project_name as text
%        str2double(get(hObject,'String')) returns contents of project_name as a double
% handles.project_name=get(hObject,'String');
% handles.project_name1=char(handles.project_name);
% guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function project_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to project_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
close
return


% --- Executes on button press in vdrecrod2.
function vdrecrod2_Callback(hObject, eventdata, handles)
% hObject    handle to vdrecrod2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
fps= str2double(get(handles.fps,'String'));
project_dir=get(handles.project_name,'String');
name_of_video=get(handles.vdfilename,'String');

vid = videoinput('macvideo', 1, 'YCbCr422_1280x720');
setappdata(handles.vdrecrod2,'vid2',vid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir(project_dir) % create folder with the date as name
filename_string=strcat(project_dir,'/',name_of_video); % create filename string

setappdata(handles.vdrecrod2,'filename_string',filename_string);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 vid.LoggingMode = 'memory';
 vid.TriggerRepeat = Inf;
 vid.FramesPerTrigger = Inf;
 start(vid);
 %preview(vid);
 elaspsed_time=toc;
 disp(elaspsed_time);


% --- Executes on button press in vdstop2.
function vdstop2_Callback(hObject, eventdata, handles)
% hObject    handle to vdstop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
video2= getappdata(handles.vdrecrod2,'vid2');
stop(video2);
video_data=getdata(video2);
filename_string=getappdata(handles.vdrecrod2,'filename_string');
filename_string=strcat(filename_string,'.mat'); 
save(filename_string, 'video_data');
delete(video2);
guidata(hObject,handles);

