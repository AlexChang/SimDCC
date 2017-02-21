function varargout = dcc_sim(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dcc_sim_OpeningFcn, ...
                   'gui_OutputFcn',  @dcc_sim_OutputFcn, ...
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

function dcc_sim_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = dcc_sim_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function N_input_Callback(hObject, eventdata, handles)

function N_input_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function K_input_Callback(hObject, eventdata, handles)

function K_input_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function F_input_Callback(hObject, eventdata, handles)

function F_input_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ITER_input_Callback(hObject, eventdata, handles)

function ITER_input_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushButton_Callback(hObject, eventdata, handles)
N = str2double(get(handles.N_input, 'String'));
K = str2double(get(handles.K_input, 'String'));
F = str2double(get(handles.F_input, 'String'));
ITERATIONS = str2double(get(handles.ITER_input, 'String'));
K = 4;
x = [1:N];
y = zeros(N, 1);
z = zeros(N, 1);
for M = 1:N
    rd = calculateTheoremRate(M, N, K, F);
    rsAvg = 0;
    for i = 1:ITERATIONS
        s = generateFiles(N, F);
        p = placeFiles(M, N, K, F);
        ss = partitionFiles(N, K, F, p);
        u = requestFiles(N, K);
        rs = calculateSimulationRate(K, ss, u);
        rsAvg = rsAvg + rs;
    end
    rsAvg = rsAvg/ITERATIONS;
    y(M) = rsAvg;
    z(M) = rd*F;
    sprintf('%s%g', 'rd = ', rd*F)
    sprintf('%s%g', 'rs = ', rsAvg)
end
axes(handles.myAxe);
plot(x,y,'.-b',x,z,'-r');
xlabel('M');
ylabel('R*F(bits)');
title('Decentralized Coded Caching Simulation');
axis([0 N max(0,min(y)-3) max(y)+3]);
