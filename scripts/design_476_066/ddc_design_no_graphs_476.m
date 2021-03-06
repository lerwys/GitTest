% Heavily Based on http://www.mathworks.com/help/dsp/examples/
% implementing-the-filter-chain-of-a-digital-down-converter-in-hdl.html

Fs_poly_35_in = Fs_adc; % 112.5832 MHz;
decim_factor_poly_35 = 35;
R_tbt = decim_factor_poly_35;
Hpoly_35 = polyphase_35(Fs_poly_35_in, decim_factor_poly_35);

% Analysis
%fvtool(Hpoly_35, 'Fs', Fs_poly_35_in);

%% FOFB CIC
%R_fofb = 1113;       % Decimation factor
R_fofb = 1112;       % Decimation factor
D_fofb = 2;          % Differential delay
Nsecs_fofb = 5;      % Number of sections
IWL_fofb = 16;       % Input word length
IFL_fofb = 15;       % Input fraction length
OWL_fofb = 24;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic_fofb = mfilt.cicdecim(R_fofb, D_fofb, Nsecs_fofb, IWL_fofb, OWL_fofb);
hcic_fofb.InputFracLength = IFL_fofb;
info(hcic_fofb);

Fs_cic_fofb_in = Fs_adc;

%% Normalize CIC Gain to 0 dB at baseband
hgain = dfilt.scalar(1/gain(hcic_fofb)); % Define inverse CIC gain to be compensated for
hcic_fofb_norm = cascade(hgain,hcic_fofb);     % Cascade CIC response to this gain

%% Filtering Stage for Monitoring Rate
%% CIC Filter %%
R_sec = 2500;         % Decimation factor
D_sec = 2;          % Differential delay
Nsecs_sec = 5;      % Number of sections
IWL_sec = 24;       % Input word length
IFL_sec = 22;       % Input fraction length
OWL_sec = 25;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic_sec = mfilt.cicdecim(R_sec, D_sec, Nsecs_sec, IWL_sec, OWL_sec);
hcic_sec.InputFracLength = IFL_sec;
info(hcic_sec);

%% CIC Sec analysis
Fs_cic_sec_in = Fs_cic_fofb_in/R_fofb;

%% Normalize CIC Gain to 0 dB at baseband
hgain_sec = dfilt.scalar(1/gain(hcic_sec)); % Define inverse CIC gain to be compensated for
hcicnorm_sec = cascade(hgain_sec,hcic_sec);     % Cascade CIC response to this gain

h_sec = fvtool(hcicnorm_sec, 'Fs', Fs_cic_sec_in);
set(gcf, 'Color', 'White');

%% CFIR Filter (decimate by 2)
Fs_cfir_sec_in = Fs_cic_sec_in/R_sec;
R_sec_cfir = 2;
%Fs_cfir_sec_in = Fs_cic_fofb_in/R_sec;
Apass_sec = 0.01;           % dB
Astop_sec = 60;             % dB
Aslope_sec = 60;            % 60 dB slope over half the Nyquist range
Fpass_sec = 0.005e3;         % Hz passband-edge frequency
%Fpass_sec = 0.004e6;         % Hz passband-edge frequency
Fstop_sec = 0.010e3;          % Hz stopband-edge frequency
%Fstop_sec = 0.010e6;          % Hz stopband-edge frequency

% Design decimation filter. D and Nsecs have been defined above as the
% differential delay and number of sections, respectively.
d_sec = fdesign.decimator(2, 'ciccomp', D_sec, Nsecs_sec, Fpass_sec, ...
                        Fstop_sec , Apass_sec, Astop_sec, Fs_cfir_sec_in);
hcfir_sec = design(d_sec,'equiripple',...
               'StopbandShape', 'linear',...
               'StopbandDecay', Aslope_sec);

% Now we have to define the fixed-point attributes of our multirate filter.
% By default, the fixed-point attributes of the accumulator and multipliers
% are set to ensure that full precision arithmetic is used, i.e. no
% quantization takes place.
set(hcfir_sec,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 22);
%    'InputFracLength', 24);
%    'InputFracLength', 23);

% Set to integer filtering
%set2int(hcfir_sec);

info(hcfir_sec);

%% Cascaded CIC Sec + CFIR Sec response
hcas1_sec = cascade(hcicnorm_sec,hcfir_sec);

% Plot response
h1_sec = fvtool([hcicnorm_sec,hcfir_sec,hcas1_sec], 'Fs', [Fs_cic_sec_in,Fs_cfir_sec_in,Fs_cic_sec_in]);

%% PFIR Filter (decimate by 2)
N_sec = 80;       % 81 taps
Fs_pfir_sec_in = Fs_cfir_sec_in/R_sec_cfir; 
R_sec_pfir = 2;
Fpass_sec = 0.005e3;              
%Fpass_sec = 0.004e6; 
Fstop_sec = 0.006e3;
%Fstop_sec = 0.005e6;

d_sec = fdesign.decimator(2, 'lowpass', 'N,Fp,Fst', N_sec, ...
                        Fpass_sec, Fstop_sec, Fs_pfir_sec_in);
hpfir_sec = design(d_sec,'equiripple','Wpass',2);  % Give more weight to passband
set(hpfir_sec,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 22);
%    'InputWordLength',  25,...
%    'InputFracLength', 22);

%set2int(hpfir_sec);

info(hpfir_sec);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm_sec = cascade(hcicnorm_sec,hcfir_sec,hpfir_sec);

% Plot response
h2_sec = fvtool(hcas1_sec, 'Fs', Fs_cic_sec_in);
set(h2_sec,'Filters', [hcas1_sec, hpfir_sec, hcasnorm_sec], 'Fs', ...
        [Fs_cic_sec_in, Fs_pfir_sec_in, Fs_cic_sec_in], 'NumberofPoints', NFFT*3);
ylim([-250 10]);

%% Rates for debug and testing
Fs_poly_1_sec_in = Fs_pfir_sec_in/R_sec_pfir;
R_sec_poly_1 = 10;
hpoly_sec_1 = polyphase_post_monit_1(Fs_poly_1_sec_in, R_sec_poly_1);

%set(hpoly_sec_1,...
%    'Arithmetic', 'fixed',...
%    'CoeffWordLength',  16,...
%    'InputWordLength',  26,...
%    'InputFracLength', 0);

Fs_poly_0_1_sec_in = Fs_poly_1_sec_in/R_sec_poly_1;
R_sec_poly_0_1 = 10;
hpoly_sec_0_1 = polyphase_post_monit_0_1(Fs_poly_0_1_sec_in, R_sec_poly_0_1);

%set(hpoly_sec_0_1,...
%    'Arithmetic', 'fixed',...
%    'CoeffWordLength',  16,...
%    'InputWordLength',  26,...
%    'InputFracLength', 0);