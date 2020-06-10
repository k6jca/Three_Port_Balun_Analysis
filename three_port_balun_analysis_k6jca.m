%% Three Port Balun Analysis
% Dick Benson, June 2018, June 2020 
% Modified by k6jca June 2020

clear; close all; clc;

temp_dir = [pwd,'\temp\'];   % place for temporary files. 


% EDIT THIS:   
example_number = 10;  % Select the measurement data to be analyzed. 
              
            
switch example_number
    
     % Data from Simulink balun model
    case 1
      comment='Synthetic Lossless Data 20 uH, K= 0.99';
      [SAC,Meas_Notes,Meas_State]=spar_read('synth\','SAC_Synth_1.s2p');
      SAB  = read(rfdata.data,'synth\SAB_Synth_1.s2p');
      SBC  = read(rfdata.data,'synth\SBC_Synth_1.s2p'); 
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
      
     % VNA Measurements on physical baluns.   
    case 2
      comment='0 dBm source w1qg 1:4 Guanella Balun';
      imshow(imread('dut_pictures/w1qg_1_to_4.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/w1qg_1_to_4.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_2.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_2.s2p');
      SBC  = read(rfdata.data,'meas\SBC_2.s2p');
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
     
    case 3
      comment='Commercial 1:4 Voltage Balun #1';
      imshow(imread('dut_pictures/Commercial_1_to_1.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Commercial_1_to_1.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_3.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_3.s2p');
      SBC  = read(rfdata.data,'meas\SBC_3.s2p'); 
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
        
    case 4
      comment='KLM 1:4 Voltage Balun';
      imshow(imread('dut_pictures/KLM_1_to_4.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/KLM_1_to_4.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_4.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_4.s2p');
      SBC  = read(rfdata.data,'meas\SBC_4.s2p');  
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
     
     case 5
      comment='Commercial 1:1 Ferrite Rod Voltage Balun';
      imshow(imread('dut_pictures/Ferrite_Rod_1_to_1.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Ferrite_Rod_1_to1.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_5.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_5.s2p');
      SBC  = read(rfdata.data,'meas\SBC_5.s2p');  
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
      
    case 6
      comment='2X Yellow Core 1:1 Choke Balun';
      imshow(imread('dut_pictures/Choke_2x_Yellow_Cores.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Choke_2x_Yellow_Cores.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_6a.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_6a.s2p');
      SBC  = read(rfdata.data,'meas\SBC_6a.s2p');  
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
      
     case 7
      comment='EMI Snap on Core 1:1 Choke Balun';
      imshow(imread('dut_pictures/Choke_Snap_On_EMI.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Choke_Snap_On_EMI.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_7a.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_7a.s2p');
      SBC  = read(rfdata.data,'meas\SBC_7a.s2p');   
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
       
    case 8
      comment='1:1 Voltage Balun Large Red Core';
      imshow(imread('dut_pictures/Commercial_Red_Core_1_to_1.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Commercial_Red_Core_1_to_1.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]);  
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_8.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_8.s2p');
      SBC  = read(rfdata.data,'meas\SBC_8.s2p'); 
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
   
    case 9
      comment='1:1 Voltage Balun Taped Core with Terminals';
      imshow(imread('dut_pictures/Commercial_1_to_1_Wrapped.jpg'));
      hf=gcf; set(hf,'Name',['dut_pictures/Commercial_1_to_1_Wrapped.jpg example_number =',...
          num2str(example_number)],'position',[376 623 412 298]); 
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\','SAC_9.s2p'); 
      SAB  = read(rfdata.data,'meas\SAB_9.s2p');
      SBC  = read(rfdata.data,'meas\SBC_9.s2p'); 
      R_load = [50 75 100 150 200 300 450];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
              
    case 10  % k6jca
      comment='Nooelec 1:9 Balun, Balun Xfrmr Center-taps grounded';
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\',...
          '200603_3Port_P1_50out_P2_AntWire_Term_AntGnd.s2p'); 
      SAB  = read(rfdata.data,'meas\200603_3Port_P1_50out_P2_AntGnd_Term_AntWire.s2p');
      SBC  = read(rfdata.data,'meas\200603_3Port_P1_AntGnd_P2_AntWire_Term_50out.s2p'); 
      R_load = 600;  % series resistance
%       R_load = [ 350, 400, 450, 500, 550, 600];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
            
    case 11  % k6jca
      comment='Nooelec 1:9 Balun, Balun Xfrmr Center-taps floating';
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\',...
          '200603_3Port_CTopen_P1_50out_P2_AntWire_Term_AntGnd.s2p'); 
      SAB  = read(rfdata.data,'meas\200603_3Port_CTopen_P1_50out_P2_AntGnd_Term_AntWire.s2p');
      SBC  = read(rfdata.data,'meas\200603_3Port_CTopen_P1_AntGnd_P2_AntWire_Term_50out.s2p'); 
      R_load = [300, 350, 400, 450, 500, 550, 600, 650];  % series resistance
      N = 1;    % 1:1 turns-ratio for the "ideal" transformer
             
     case 12  % k6jca
      comment='Nooelec 1:9 Balun, Balun Xfrmr Center-taps grounded';
      [SAC,Meas_Notes,Meas_State]=spar_read('meas\',...
          '200603_3Port_P1_50out_P2_AntWire_Term_AntGnd.s2p'); 
      SAB  = read(rfdata.data,'meas\200603_3Port_P1_50out_P2_AntGnd_Term_AntWire.s2p');
      SBC  = read(rfdata.data,'meas\200603_3Port_P1_AntGnd_P2_AntWire_Term_50out.s2p'); 
%       R_load = [33.33, 38.89, 44.44, 50, 55.56, 61.11, 66.67, 72.22];  % series resistance
      R_load = 50;  % series resistance
      N = 3;    % 3:1 turns-ratio for the "ideal" transformer
             
    otherwise
       disp('Invalid example_number selection.')
       return
end;

% Calculate 3-port s-parameters from 3-sets of 2-port measurements
fv_1       = SAC.Freq;
Len        = length(fv_1);
balun_sp   = complex(zeros(3,3,Len));     % initialize 3x3 matrix with 0
balun_sp(1,1,:)=SAB.S_Parameters(1,1,:);  % 3-port s11
balun_sp(1,2,:)=SAB.S_Parameters(1,2,:);  % 3-port s12
balun_sp(1,3,:)=SAC.S_Parameters(1,2,:);  % 3-port s13
balun_sp(2,1,:)=SAB.S_Parameters(2,1,:);  % 3-port s21
balun_sp(2,2,:)=SAB.S_Parameters(2,2,:);  % 3-port s22
balun_sp(2,3,:)=SBC.S_Parameters(1,2,:);  % 3-port s23
balun_sp(3,1,:)=SAC.S_Parameters(2,1,:);  % 3-port s31
balun_sp(3,2,:)=SBC.S_Parameters(2,1,:);  % 3-port s32
balun_sp(3,3,:)=SBC.S_Parameters(2,2,:);  % 3-port s33

rf_obj=rfdata.data;
rf_obj.Freq=fv_1;
rf_obj.S_Parameters = balun_sp;


% S Parameters for an ideal (lossless) 3-port transformer.
% Ports 1 and 2 are the a floating primary (inputs), 
% Port 3 is the output port.  
%
% The ratios are transformer turns ratios, input turns to 
% output turns(thus impedance ratio is turns-ratio squared).
%
s_xformer = [   N^2/(N^2 + 2)         2/(N^2 + 2)       (2*N)/(N^2 + 2);
                2/(N^2 + 2)       N^2/(N^2 + 2)        -(2*N)/(N^2 + 2);
               (2*N)/(N^2 + 2) -(2*N)/(N^2 + 2),   -(N^2 - 2)/(N^2 + 2) ];
    
turns_ratio_text = [num2str(N),':1'];

spar_xfrmr = complex(zeros(3,3,Len));
for k=1:Len
  spar_xfrmr(:,:,k) = s_xformer(:,:);
end

% Cascade the 1-in 2-out balun with the 2-in 1-out transformer,
% the combination of which results in a 2-port network.
spar_cascade=cascadesparams(balun_sp,spar_xfrmr,2); 

% k6jca -- and reverse the cascaded matrix to calculate Gp
% when the output-port is driven (via xfrmr) and the input-port terminated.
rev_spar_cascade(1,1,:) = spar_cascade(2,2,:);
rev_spar_cascade(1,2,:) = spar_cascade(2,1,:);
rev_spar_cascade(2,1,:) = spar_cascade(1,2,:);
rev_spar_cascade(2,2,:) = spar_cascade(1,1,:);
rev_R_load = 50;  % balun input port assumed to be 50 ohms, thus, if it is
                  % now assigned to be the output port, terminate w/50 ohms

% k6jca -- write s2p file of the cascade balun + ideal xfrmr
    temp_obj = rfdata.data;
    temp_obj.S_Parameters = spar_cascade;
    temp_obj.Freq = fv_1;
    name=['spar_cascade_Example_',num2str(example_number),'.s2p'];
    spar_write(temp_dir,name,temp_obj,Meas_Notes,Meas_State);
    s2p_viewer('Load_File_Callback',{temp_dir},{name});

% Color list
     c_list= [
             1            1        0;      % yellow
             0            1        1;      % Cyan           
             0            1        0;      % Green
             0.8500    0.3250     0.0;     % Orange 
             1            0        0;      % Red
             0.9290    0.6940    0.1250;   % Tan 
             0.4940    0.1840    0.5560;   % Violet
             0.6350    0.0780    0.1840;   % Rust
             0           0        0   ];   % Black NOT USED 

% Compute the Balun Power Loss for the list of load impedances.
% Note that these load impedances could be replaced with the antenna's 
% complex impedance, if one has the appropriate s1p file and converts
% S11 to gamma.
%
% For R_load, use values assigned in the examples case statements, above.
X_load =  0.0;   % series reactance 
Zo   =  50;

figure('Position',[100 200 1000 600])
L    =  length(R_load); 
for k=1:L
   Zload   = R_load(k) + 1i*X_load;
   loss_dB = -10*log10(powergain(spar_cascade,Zo,Zload,'Gp'));
   hl=plot( fv_1*1e-6, loss_dB); hold on
   set(hl,'LineWidth',2,'color',c_list(k,:));
   s{k}=['Driven Port = 50-ohm port,      Z load @ Balanced Port (output) = ',...
       num2str(Zload),',  (turns-ratio of ideal output xfrmr = ',turns_ratio_text,')'];
end 
% reverse power loss (k6jca):
   Zload   = rev_R_load + 1i*X_load;
   loss_dB = -10*log10(powergain(rev_spar_cascade,Zo,Zload,'Gp'));
   hl=plot( fv_1*1e-6, loss_dB); hold on
   set(hl,'LineWidth',2,'color',c_list(L+1,:),'Linestyle','-.');
   s{L+1}=['Driven Port = Differential port, (turns-ratio of ideal xfrmr = ',...
       turns_ratio_text,'), Z load @ 50-ohm port (output) =  ',...
       num2str(Zload)];

hl= legend(s,'Location','northwest');
set(hl,'color',[1 1 1]*0.5,'TextColor',[1 1 1])
grid on;
ylabel('dB')
xlabel('MHz');
title(['Power Loss ',comment]);
hax = gca;
set(hax,'color',[1 1 1]*0.6,'Xcolor',[0 0 0],'Ycolor',[0 0 0]);
hold off
drawnow;


% Input Z for various load impedances
rf_obj=rfdata.data;
s1p_viewer; drawnow;
for k=1:L
   Zload   = R_load(k) + 1i*X_load;
   rf_obj.S_Parameters(1,1,:) = gammain(spar_cascade,Zo,Zload);
   rf_obj.Freq=fv_1;
   name=['Rload_',num2str(R_load(k)),'.s1p'];
   spar_write(temp_dir,name,rf_obj,Meas_Notes,Meas_State);
   s1p_viewer('Load_File_Callback',{temp_dir},{name});
   if k==1
       hf      =   findobj('Tag','s1p_view'); 
       % or 'Viewer_Figure' for s2p 
       handles  =  guidata(hf);
       set(handles.add_plots,'value',1);
   end;   
end;  
drawnow;

% To measure Common Mode Z, cascade a T connector on the balun output 
% which shorts the 2 output terminals and provides a measurement port. 
% Use gammaout to compute the common mode gamma, which gives Z_common_mode 

% A perfect coaxial "T"       
 S =   [ -1   2   2;
          2  -1   2
          2   2  -1 ]/3;      

Spar_T = complex(zeros(3,3,Len));

for k=1:Len
  Spar_T(:,:,k) = S(:,:);
end
spar_cascade_T = cascadesparams(balun_sp,Spar_T,2); % this creates a 2 port.

% Note that the common-mode connected network is driven through its 
% Output port, thus its input port must be grounded.

Zsource=0;  % Setting Zsource to 0 connects the input port to ground.

% Calculate Gamma of the driven port (i.e. the network output port).
% Thus use gammaout() in lieu of gammain().  Zsource is the termination 
% at the network input port.
rf_obj.S_Parameters(1,1,:) = gammaout(spar_cascade_T,Zo,Zsource);
name='Common_Mode_Z.s1p';
s_notes = {comment};

spar_write(temp_dir,name,rf_obj,s_notes,Meas_State);
s1p_viewer; drawnow;
s1p_viewer('Load_New_File_Callback',{temp_dir},{name});
