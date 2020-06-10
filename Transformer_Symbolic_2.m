% 3 Port Transformer Symbolic Analysis 
% Dick Benson June 2020 
%
% Note that this script requires MATLAB's Symbolic Math Toolbox and
% RF Toolbox as well as Dick's "Function Based Symbolic Circuit Analysis"
% package of scripts (etc.) available for download from the
% Mathworks MATLAB Central File Exchange site.
% - Jeff, k6jca
%
clear; close; clc;

syms N Z Zo real
    
    % S11 = (Z-Zo)/(Z+Zo);   Ports 2 and 3 terminated in Zo 
    % Port 1  Z =  (Zo*N^2)  +  Zo 
     Z = Zo*(N^2) + Zo;
     S11 =  simplify((Z-Zo)/(Z+Zo)); 
     S22 =  S11; % by inspection 
     
     % Port 3  Z = (Zo+Zo)/(N^2) 
     Z   =  2*Zo/(N^2);
     S33 =  simplify((Z-Zo)/(Z+Zo)); 
     
     % S21 = Power delivered to Port 2 from Port 1 
     %       with Port 3 terminated in Zo.
     %   This is equivalent to having a series resistor ----Zo*N^2---- 
     %   between ports 1 and 2.  
     Y_series_R = [1 -1; -1 1]/(Zo*N^2); % Y parameters for a series R
     S = y2s_symbolic(Y_series_R,Zo);
     S21 = S(2,1);
     S12 = S21; 
     
     % S13 = power delivered to port 1 from port 3 
     %       with port 2 terminated in Zo
     % This is equivalent to having a 1:N transformer with a series Zo 
     % on the secondary side. 
     abcd_trans = [1/N 0; 0 N];
     abcd_series_Zo = [1 Zo; 0 1]; 
     abcd_cascade = abcd_trans*abcd_series_Zo;
     S_cascade = simplify(abcd2s_symbolic(abcd_cascade,Zo));
     S13 = S_cascade(1,2);
     S31 = S13;
     
     % S23 is simply S13 with 180 degree phase shift
     S23 = -S13;
     S32 = S23; 
     
     S_Result =   [S11  S12  S13;
                   S21  S22  S23;
                   S31  S32  S33]
     
     
               
     
     
     
     
     
     
     
     
     
     
     
     
     
