close all
clear all
cd('C:\Users\vero\Desktop\Nahuel Wt\Analisis')
threshold=0;
% [roi nro_de_cell t_inicial t_final t_max f_max area ...]

%------------------WT----------------------%
[E6SF, E8SF, E9SF, E10SF, E11SF, E12SF, E13SF, SinRafagasE6SF, SinRafagasE8SF, SinRafagasE9SF, SinRafagasE10SF, SinRafagasE11SF, SinRafagasE12SF , SinRafagasE13SF]=datosWT(threshold);
%------------------WT+af-------------------%
[E6AF, E7AF, E8AF, E9AF, E10AF, E13AF, SinRafagasE6AF, SinRafagasE7AF, SinRafagasE8AF, SinRafagasE9AF, SinRafagasE10AF, SinRafagasE13AF]=datosWTAF(threshold);
%------------------vcx1--------------------%
[E1vcxSF, E2vcxSF, E3vcxSF, E4vcxSF, E5vcxSF, SinRafagasE1vcxSF, SinRafagasE2vcxSF, SinRafagasE3vcxSF, SinRafagasE4vcxSF, SinRafagasE5vcxSF]=datosVCX1(threshold);
%------------------vcx1+af-----------------%
[E1vcxAF, E2vcxAF, E3vcxAF, E4vcxAF, E5vcxAF, SinRafagasE1vcxAF, SinRafagasE2vcxAF, SinRafagasE3vcxAF, SinRafagasE4vcxAF, SinRafagasE5vcxAF]=datosVCX1AF(threshold);
%------------------yvc1--------------------%
[E1yvcSF, E2yvcSF, E3yvcSF, E4yvcSF, E5yvcSF, SinRafagasE1yvcSF, SinRafagasE2yvcSF, SinRafagasE3yvcSF, SinRafagasE4yvcSF, SinRafagasE5yvcSF]=datosYVC1(threshold);
%------------------yvc1+af-----------------%
[E1yvcAF, E5yvcAF, E6yvcAF, E7yvcAF, E8yvcAF, E9yvcAF, E10yvcAF, SinRafagasE1yvcAF, SinRafagasE5yvcAF, SinRafagasE6yvcAF, SinRafagasE7yvcAF, SinRafagasE8yvcAF, SinRafagasE9yvcAF, SinRafagasE10yvcAF]=datosYVC1AF(threshold);
%------------------mid1--------------------%
[E1mid, E2mid, E3mid, E4mid, SinRafagasE1mid, SinRafagasE2mid, SinRafagasE3mid, SinRafagasE4mid]=datosMID1(threshold);
%------------------mid1+af-----------------%
[E1midAF, E2midAF, E3midAF, E4midAF, E5midAF,SinRafagasE1midAF, SinRafagasE2midAF, SinRafagasE3midAF, SinRafagasE4midAF, SinRafagasE5midAF]=datosMID1AF(threshold);
%------------------fig1--------------------%
[E1fig, E2fig, E3fig, E4fig, SinRafagasE1fig, SinRafagasE2fig, SinRafagasE3fig, SinRafagasE4fig]=datosFIG1(threshold);
%------------------fig1+af-----------------%
[E1figAF, E2figAF, E3figAF, E4figAF, E5figAF, SinRafagasE1figAF, SinRafagasE2figAF, SinRafagasE3figAF, SinRafagasE4figAF, SinRafagasE5figAF]=datosFIG1AF(threshold);
%------------------fig1mid1----------------%
[E1figmid, E2figmid, E4figmid, SinRafagasE1figmid, SinRafagasE2figmid, SinRafagasE4figmid]=datosFIG1MID1(threshold);
%------------------fig1mid1+af-------------%
[E1figmidAF, E2figmidAF, E3figmidAF, E5figmidAF, SinRafagasE1figmidAF, SinRafagasE2figmidAF, SinRafagasE3figmidAF, SinRafagasE5figmidAF]=datosFIG1MID1AF(threshold);
%------------------pmc1--------------------%
[E1pmc1SF, E2pmc1SF, E3pmc1SF, E4pmc1SF, E5pmc1SF, SinRafagasE1pmc1SF, SinRafagasE2pmc1SF, SinRafagasE3pmc1SF, SinRafagasE4pmc1SF, SinRafagasE5pmc1SF]=datosPMC1(threshold);
%------------------pmc1+af-----------------%
[E1pmc1AF, E2pmc1AF, E5pmc1AF, E6pmc1AF, E7pmc1AF, E8pmc1AF,SinRafagasE1pmc1AF, SinRafagasE2pmc1AF, SinRafagasE5pmc1AF, SinRafagasE6pmc1AF, SinRafagasE7pmc1AF, SinRafagasE8pmc1AF]=datosPMC1AF(threshold);
%------------------pmr1--------------------%
[E1pmr1SF, E2pmr1SF, E3pmr1SF, E4pmr1SF, E5pmr1SF, E6pmr1SF, E7pmr1SF, E8pmr1SF, E9pmr1SF, SinRafagasE1pmr1SF, SinRafagasE2pmr1SF, SinRafagasE3pmr1SF, SinRafagasE4pmr1SF, SinRafagasE5pmr1SF, SinRafagasE6pmr1SF, SinRafagasE7pmr1SF, SinRafagasE8pmr1SF, SinRafagasE9pmr1SF]=datosPMR1(threshold);
%------------------pmr1+af-----------------%
[E1pmr1AF, E2pmr1AF, E3pmr1AF, E4pmr1AF, E5pmr1AF, E6pmr1AF, E7pmr1AF, E8pmr1AF, E9pmr1AF, E10pmr1AF, E11pmr1AF, E12pmr1AF, SinRafagasE1pmr1AF, SinRafagasE2pmr1AF, SinRafagasE3pmr1AF, SinRafagasE4pmr1AF, SinRafagasE5pmr1AF, SinRafagasE6pmr1AF, SinRafagasE7pmr1AF, SinRafagasE8pmr1AF, SinRafagasE9pmr1AF, SinRafagasE10pmr1AF, SinRafagasE11pmr1AF, SinRafagasE12pmr1AF]=datosPMR1AF(threshold);
%------------------mid1yvc1----------------%
[E1midyvc, E2midyvc, E3midyvc, E4midyvc, E5midyvc, SinRafagasE1midyvc, SinRafagasE2midyvc, SinRafagasE3midyvc, SinRafagasE4midyvc, SinRafagasE5midyvc]=datosMID1YVC1(threshold);
%------------------mid1yvc1+af-------------%
[E1midyvcAF, E2midyvcAF, E3midyvcAF, E4midyvcAF, E5midyvcAF, SinRafagasE1midyvcAF, SinRafagasE2midyvcAF, SinRafagasE3midyvcAF, SinRafagasE4midyvcAF, SinRafagasE5midyvcAF]=datosMID1YVC1AF(threshold);
%------------------pmc1yvc1----------------%
[E1pmcyvc, E2pmcyvc, E3pmcyvc, E5pmcyvc, E6pmcyvc, E8pmcyvc, SinRafagasE1pmcyvc, SinRafagasE2pmcyvc, SinRafagasE3pmcyvc, SinRafagasE5pmcyvc, SinRafagasE6pmcyvc, SinRafagasE8pmcyvc]=datosPMC1YVC1(threshold);
%------------------pmc1yvc1+af-------------%
[E2pmcyvcAF, E4pmcyvcAF, E6pmcyvcAF, E7pmcyvcAF, E8pmcyvcAF, E9pmcyvcAF, E10pmcyvcAF, SinRafagasE2pmcyvcAF, SinRafagasE4pmcyvcAF, SinRafagasE6pmcyvcAF, SinRafagasE7pmcyvcAF, SinRafagasE8pmcyvcAF, SinRafagasE9pmcyvcAF, SinRafagasE10pmcyvcAF]=datosPMC1YVC1AF(threshold);
%------------------vcx1yvc1----------------%
[E2vcxyvc, E3vcxyvc, E4vcxyvc, SinRafagasE2vcxyvc, SinRafagasE3vcxyvc, SinRafagasE4vcxyvc]=datosVCX1YVC1(threshold);
%------------------vcx1yvc1+af-------------%
[E1vcxyvcAF, E2vcxyvcAF, E3vcxyvcAF, E4vcxyvcAF, E5vcxyvcAF, SinRafagasE1vcxyvcAF, SinRafagasE2vcxyvcAF, SinRafagasE3vcxyvcAF, SinRafagasE4vcxyvcAF, SinRafagasE5vcxyvcAF]=datosVCX1YVC1AF(threshold);
%------------------fig1yvc1----------------%
[E1figyvc, E2figyvc, E3figyvc, E4figyvc, SinRafagasE1figyvc, SinRafagasE2figyvc, SinRafagasE3figyvc, SinRafagasE4figyvc]=datosFIG1YVC1(threshold);
%------------------fig1yvc1+af-------------%
[E1figyvcAF, E2figyvcAF, E3figyvcAF, E4figyvcAF, E5figyvcAF, SinRafagasE1figyvcAF, SinRafagasE2figyvcAF, SinRafagasE3figyvcAF, SinRafagasE4figyvcAF, SinRafagasE5figyvcAF]=datosFIG1YVC1AF(threshold);
%------------------fig1mid1yvc1------------%
[E1figmidyvc, E2figmidyvc, E3figmidyvc, E5figmidyvc, SinRafagasE1figmidyvc, SinRafagasE2figmidyvc, SinRafagasE3figmidyvc, SinRafagasE5figmidyvc]=datosFIG1MID1YVC1(threshold);
%------------------fig1mid1yvc1+af---------%
[E1figmidyvcAF, E2figmidyvcAF, E3figmidyvcAF, E4figmidyvcAF, E5figmidyvcAF, SinRafagasE1figmidyvcAF, SinRafagasE2figmidyvcAF, SinRafagasE3figmidyvcAF, SinRafagasE4figmidyvcAF, SinRafagasE5figmidyvcAF]=datosFIG1MID1YVC1AF(threshold);
%------------------WT+af+BAPTA-------------%
[E1BAF, E2BAF, E3BAF, E4BAF, E5BAF, E6BAF, SinRafagasE1BAF, SinRafagasE2BAF, SinRafagasE3BAF, SinRafagasE4BAF, SinRafagasE5BAF, SinRafagasE6BAF]=datosWTBAPTAAF(threshold);
%------------------fig1mid1yvc1+af+BAPTA---%
[E1figmidyvcAFBAPTA, E2figmidyvcAFBAPTA, E3figmidyvcAFBAPTA, SinRafagasE1figmidyvcAFBAPTA, SinRafagasE2figmidyvcAFBAPTA, SinRafagasE3figmidyvcAFBAPTA]=datosFIG1MID1YVC1AFBAPTA(threshold);
%------------------WT+BAPTA----------------%
[E1BSF, E2BSF, E3BSF, SinRafagasE1BSF, SinRafagasE2BSF, SinRafagasE3BSF]=datosWTBAPTASF(threshold);
%------------------fig1+BAPTA--------------%
[E1figSFBAPTA, E2figSFBAPTA, E3figSFBAPTA, SinRafagasE1figBSF, SinRafagasE2figBSF, SinRafagasE3figBSF]=datosFIG1BAPTASF(threshold);
%------------------fig1+af+BAPTA-----------%
[E1figAFBAPTA, SinRafagasE1figAFBAPTA]=datosFIG1AFBAPTA(threshold);

% ------------Analisis------------%

WTSF  =[E6SF; E8SF; E9SF; E10SF; E11SF; E12SF; E13SF];
% ConFero=[E6AF; E7AF; E8AF; E9AF; E10AF];
WTAF   =[E6AF; E7AF; E8AF; E9AF; E13AF];%%%%%%%%%%%%
vcx1SF =[E1vcxSF; E2vcxSF; E3vcxSF; E4vcxSF; E5vcxSF];
vcx1AF =[E1vcxAF; E2vcxAF; E3vcxAF; E4vcxAF; E5vcxAF];
yvc1SF =[E2yvcSF; E3yvcSF; E4yvcSF; E5yvcSF];%%%%%%%%%%%%
% yvc1SF =[E1yvcSF; E2yvcSF; E3yvcSF; E4yvcSF; E5yvcSF];
yvc1AF =[E1yvcAF; E5yvcAF; E6yvcAF; E7yvcAF; E8yvcAF; E9yvcAF; E10yvcAF];
mid1SF =[E1mid; E2mid; E3mid; E4mid;];
mid1AF =[E1midAF; E2midAF; E3midAF; E4midAF; E5midAF];
fig1SF =[E1fig; E2fig; E3fig; E4fig];
fig1CF =[E1figAF; E2figAF; E3figAF; E4figAF; E5figAF;];
fig1mid1SF=[E1figmid; E2figmid; E4figmid;];
fig1mid1CF=[E1figmidAF; E2figmidAF; E3figmidAF; E5figmidAF];
pmc1SF =[E1pmc1SF; E2pmc1SF; E3pmc1SF; E4pmc1SF; E5pmc1SF];
pmc1AF =[E1pmc1AF; E2pmc1AF; E5pmc1AF; E6pmc1AF; E7pmc1AF; E8pmc1AF];
pmr1SF =[E1pmr1SF; E2pmr1SF; E3pmr1SF; E4pmr1SF; E5pmr1SF; E6pmr1SF; E7pmr1SF; E8pmr1SF; E9pmr1SF];
pmr1AF =[E1pmr1AF; E2pmr1AF; E3pmr1AF; E4pmr1AF; E5pmr1AF; E6pmr1AF; E7pmr1AF; E8pmr1AF; E9pmr1AF; E10pmr1AF; E11pmr1AF; E12pmr1AF];
mid1yvc1   =[E1midyvc; E2midyvc; E3midyvc; E4midyvc; E5midyvc];
mid1yvc1AF =[E1midyvcAF; E2midyvcAF; E3midyvcAF; E4midyvcAF; E5midyvcAF];
pmc1yvc1   =[E1pmcyvc; E2pmcyvc; E3pmcyvc; E5pmcyvc; E6pmcyvc; E8pmcyvc;];
pmc1yvc1AF =[E2pmcyvcAF; E4pmcyvcAF; E6pmcyvcAF; E7pmcyvcAF; E8pmcyvcAF; E9pmcyvcAF; E10pmcyvcAF;];
vcx1yvc1   =[E2vcxyvc; E3vcxyvc; E4vcxyvc;];
vcx1yvc1AF =[E1vcxyvcAF; E2vcxyvcAF; E3vcxyvcAF; E4vcxyvcAF; E5vcxyvcAF;];
fig1yvc1   =[E1figyvc; E2figyvc; E3figyvc; E4figyvc;];
fig1yvc1AF =[E1figyvcAF; E2figyvcAF; E3figyvcAF; E4figyvcAF; E5figyvcAF;];
fig1mid1yvc1  =[E1figmidyvc; E2figmidyvc; E3figmidyvc; E5figmidyvc;];
fig1mid1yvc1AF=[E1figmidyvcAF; E2figmidyvcAF; E3figmidyvcAF; E4figmidyvcAF; E5figmidyvcAF;];

WTAFbapta  =[E1BAF; E2BAF; E3BAF; E4BAF; E5BAF; E6BAF];
WTSFbapta  =[E1BSF; E2BSF; E3BSF;];
fig1mid1yvc1AFbapta=[E1figmidyvcAFBAPTA; E2figmidyvcAFBAPTA; E3figmidyvcAFBAPTA;];

fig1SFbapta=[E1figSFBAPTA; E2figSFBAPTA; E3figSFBAPTA;];
fig1AFbapta=[E1figAFBAPTA;]


disp('Datos cargados')

%% FRECUENCIAS
maximo=50;

[f6WTSF, f6_NWTSF, cfd6WTSF]=distrFrec(maximo,E6SF,SinRafagasE6SF);
[f8WTSF, f8_NWTSF, cfd8WTSF]=distrFrec(maximo,E8SF,SinRafagasE8SF);
[f9WTSF, f9_NWTSF, cfd9WTSF]=distrFrec(maximo,E9SF,SinRafagasE9SF);
[f10WTSF, f10_NWTSF, cfd10WTSF]=distrFrec(maximo,E10SF,SinRafagasE10SF);
[f11WTSF, f11_NWTSF, cfd11WTSF]=distrFrec(maximo,E11SF,SinRafagasE11SF);
[f12WTSF, f12_NWTSF, cfd12WTSF]=distrFrec(maximo,E12SF,SinRafagasE12SF);
[f13WTSF, f13_NWTSF, cfd13WTSF]=distrFrec(maximo,E13SF,SinRafagasE13SF);

[f6WTAF, f6_NWTAF, cfd6WTAF]=distrFrec(maximo,E6AF,SinRafagasE6AF);
[f7WTAF, f7_NWTAF, cfd7WTAF]=distrFrec(maximo,E7AF,SinRafagasE7AF);
[f8WTAF, f8_NWTAF, cfd8WTAF]=distrFrec(maximo,E8AF,SinRafagasE8AF);
[f9WTAF, f9_NWTAF, cfd9WTAF]=distrFrec(maximo,E9AF,SinRafagasE9AF);
[f13WTAF,f13_NWTAF,cfd13WTAF]=distrFrec(maximo,E13AF,SinRafagasE13AF);
% [f10WTAF, f10_NWTAF, cfd10WTAF]=distrFrec(maximo,E10AF,SinRafagasE10AF);

% [f1yvcSF, f1_NyvcSF, cfd1yvcSF]=distrFrec(maximo,E1yvcSF,SinRafagasE1yvcSF);
[f2yvcSF, f2_NyvcSF, cfd2yvcSF]=distrFrec(maximo,E2yvcSF,SinRafagasE2yvcSF);
[f3yvcSF, f3_NyvcSF, cfd3yvcSF]=distrFrec(maximo,E3yvcSF,SinRafagasE3yvcSF);
[f4yvcSF, f4_NyvcSF, cfd4yvcSF]=distrFrec(maximo,E4yvcSF,SinRafagasE4yvcSF);
[f5yvcSF, f5_NyvcSF, cfd5yvcSF]=distrFrec(maximo,E5yvcSF,SinRafagasE5yvcSF);

[f1yvcAF, f1_NyvcAF, cfd1yvcAF]=distrFrec(maximo,E1yvcAF,SinRafagasE1yvcAF);
[f5yvcAF, f5_NyvcAF, cfd5yvcAF]=distrFrec(maximo,E5yvcAF,SinRafagasE5yvcAF);
[f6yvcAF, f6_NyvcAF, cfd6yvcAF]=distrFrec(maximo,E6yvcAF,SinRafagasE6yvcAF);
[f7yvcAF, f7_NyvcAF, cfd7yvcAF]=distrFrec(maximo,E7yvcAF,SinRafagasE7yvcAF);
[f8yvcAF, f8_NyvcAF, cfd8yvcAF]=distrFrec(maximo,E8yvcAF,SinRafagasE8yvcAF);
[f9yvcAF, f9_NyvcAF, cfd9yvcAF]=distrFrec(maximo,E9yvcAF,SinRafagasE9yvcAF);
[f10yvcAF,f10_NyvcAF,cfd10yvcAF]=distrFrec(maximo,E10yvcAF,SinRafagasE10yvcAF);

[f1vcxSF, f1_NvcxSF, cfd1vcxSF]=distrFrec(maximo,E1vcxSF,SinRafagasE1vcxSF);
[f2vcxSF, f2_NvcxSF, cfd2vcxSF]=distrFrec(maximo,E2vcxSF,SinRafagasE2vcxSF);
[f3vcxSF, f3_NvcxSF, cfd3vcxSF]=distrFrec(maximo,E3vcxSF,SinRafagasE3vcxSF);
[f4vcxSF, f4_NvcxSF, cfd4vcxSF]=distrFrec(maximo,E4vcxSF,SinRafagasE4vcxSF);
[f5vcxSF, f5_NvcxSF, cfd5vcxSF]=distrFrec(maximo,E5vcxSF,SinRafagasE5vcxSF);

[f1vcxAF, f1_NvcxAF, cfd1vcxAF]=distrFrec(maximo,E1vcxAF,SinRafagasE1vcxAF);
[f2vcxAF, f2_NvcxAF, cfd2vcxAF]=distrFrec(maximo,E2vcxAF,SinRafagasE2vcxAF);
[f3vcxAF, f3_NvcxAF, cfd3vcxAF]=distrFrec(maximo,E3vcxAF,SinRafagasE3vcxAF);
[f4vcxAF, f4_NvcxAF, cfd4vcxAF]=distrFrec(maximo,E4vcxAF,SinRafagasE4vcxAF);
[f5vcxAF, f5_NvcxAF, cfd5vcxAF]=distrFrec(maximo,E5vcxAF,SinRafagasE5vcxAF);

[f1mid, f1_Nmid, cfd1mid]=distrFrec(maximo,E1mid,SinRafagasE1mid);
[f2mid, f2_Nmid, cfd2mid]=distrFrec(maximo,E2mid,SinRafagasE2mid);
[f3mid, f3_Nmid, cfd3mid]=distrFrec(maximo,E3mid,SinRafagasE3mid);
[f4mid, f4_Nmid, cfd4mid]=distrFrec(maximo,E4mid,SinRafagasE4mid);

[f1midAF, f1_NmidAF, cfd1midAF]=distrFrec(maximo,E1midAF,SinRafagasE1midAF);
[f2midAF, f2_NmidAF, cfd2midAF]=distrFrec(maximo,E2midAF,SinRafagasE2midAF);
[f3midAF, f3_NmidAF, cfd3midAF]=distrFrec(maximo,E3midAF,SinRafagasE3midAF);
[f4midAF, f4_NmidAF, cfd4midAF]=distrFrec(maximo,E4midAF,SinRafagasE4midAF);
[f5midAF, f5_NmidAF, cfd5midAF]=distrFrec(maximo,E5midAF,SinRafagasE5midAF);

[f1fig, f1_Nfig, cfd1fig]=distrFrec(maximo,E1fig,SinRafagasE1fig);
[f2fig, f2_Nfig, cfd2fig]=distrFrec(maximo,E2fig,SinRafagasE2fig);
[f3fig, f3_Nfig, cfd3fig]=distrFrec(maximo,E3fig,SinRafagasE3fig);
[f4fig, f4_Nfig, cfd4fig]=distrFrec(maximo,E4fig,SinRafagasE4fig);

[f1figAF, f1_NfigAF, cfd1figAF]=distrFrec(maximo,E1figAF,SinRafagasE1figAF);
[f2figAF, f2_NfigAF, cfd2figAF]=distrFrec(maximo,E2figAF,SinRafagasE2figAF);
[f3figAF, f3_NfigAF, cfd3figAF]=distrFrec(maximo,E3figAF,SinRafagasE3figAF);
[f4figAF, f4_NfigAF, cfd4figAF]=distrFrec(maximo,E4figAF,SinRafagasE4figAF);
[f5figAF, f5_NfigAF, cfd5figAF]=distrFrec(maximo,E5figAF,SinRafagasE5figAF);

[f1figmid, f1_Nfigmid, cfd1figmid]=distrFrec(maximo,E1figmid,SinRafagasE1figmid);
[f2figmid, f2_Nfigmid, cfd2figmid]=distrFrec(maximo,E2figmid,SinRafagasE2figmid);
[f4figmid, f4_Nfigmid, cfd4figmid]=distrFrec(maximo,E4figmid,SinRafagasE4figmid);

[f1figmidAF, f1_NfigmidAF, cfd1figmidAF]=distrFrec(maximo,E1figmidAF,SinRafagasE1figmidAF);
[f2figmidAF, f2_NfigmidAF, cfd2figmidAF]=distrFrec(maximo,E2figmidAF,SinRafagasE2figmidAF);
[f3figmidAF, f3_NfigmidAF, cfd3figmidAF]=distrFrec(maximo,E3figmidAF,SinRafagasE3figmidAF);
[f5figmidAF, f5_NfigmidAF, cfd5figmidAF]=distrFrec(maximo,E5figmidAF,SinRafagasE5figmidAF);

[f1pmcSF, f1_NpmcSF, cfd1pmcSF]=distrFrec(maximo,E1pmc1SF,SinRafagasE1pmc1SF);
[f2pmcSF, f2_NpmcSF, cfd2pmcSF]=distrFrec(maximo,E2pmc1SF,SinRafagasE2pmc1SF);
[f3pmcSF, f3_NpmcSF, cfd3pmcSF]=distrFrec(maximo,E3pmc1SF,SinRafagasE3pmc1SF);
[f4pmcSF, f4_NpmcSF, cfd4pmcSF]=distrFrec(maximo,E4pmc1SF,SinRafagasE4pmc1SF);
[f5pmcSF, f5_NpmcSF, cfd5pmcSF]=distrFrec(maximo,E5pmc1SF,SinRafagasE5pmc1SF);

[f1pmcAF, f1_NpmcAF, cfd1pmcAF]=distrFrec(maximo,E1pmc1AF,SinRafagasE1pmc1AF);
[f2pmcAF, f2_NpmcAF, cfd2pmcAF]=distrFrec(maximo,E2pmc1AF,SinRafagasE2pmc1AF);
[f5pmcAF, f5_NpmcAF, cfd5pmcAF]=distrFrec(maximo,E5pmc1AF,SinRafagasE5pmc1AF);
[f6pmcAF, f6_NpmcAF, cfd6pmcAF]=distrFrec(maximo,E6pmc1AF,SinRafagasE6pmc1AF);
[f7pmcAF, f7_NpmcAF, cfd7pmcAF]=distrFrec(maximo,E7pmc1AF,SinRafagasE7pmc1AF);
[f8pmcAF, f8_NpmcAF, cfd8pmcAF]=distrFrec(maximo,E8pmc1AF,SinRafagasE8pmc1AF);

[f1pmrSF, f1_NpmrSF, cfd1pmrSF]=distrFrec(maximo,E1pmr1SF,SinRafagasE1pmr1SF);
[f2pmrSF, f2_NpmrSF, cfd2pmrSF]=distrFrec(maximo,E2pmr1SF,SinRafagasE2pmr1SF);
[f3pmrSF, f3_NpmrSF, cfd3pmrSF]=distrFrec(maximo,E3pmr1SF,SinRafagasE3pmr1SF);
[f4pmrSF, f4_NpmrSF, cfd4pmrSF]=distrFrec(maximo,E4pmr1SF,SinRafagasE4pmr1SF);
[f5pmrSF, f5_NpmrSF, cfd5pmrSF]=distrFrec(maximo,E5pmr1SF,SinRafagasE5pmr1SF);
[f6pmrSF, f6_NpmrSF, cfd6pmrSF]=distrFrec(maximo,E6pmr1SF,SinRafagasE6pmr1SF);
[f7pmrSF, f7_NpmrSF, cfd7pmrSF]=distrFrec(maximo,E7pmr1SF,SinRafagasE7pmr1SF);
[f8pmrSF, f8_NpmrSF, cfd8pmrSF]=distrFrec(maximo,E8pmr1SF,SinRafagasE8pmr1SF);
[f9pmrSF, f9_NpmrSF, cfd9pmrSF]=distrFrec(maximo,E9pmr1SF,SinRafagasE9pmr1SF);

[f1pmrAF, f1_NpmrAF, cfd1pmrAF]=distrFrec(maximo,E1pmr1AF,SinRafagasE1pmr1AF);
[f2pmrAF, f2_NpmrAF, cfd2pmrAF]=distrFrec(maximo,E2pmr1AF,SinRafagasE2pmr1AF);
[f3pmrAF, f3_NpmrAF, cfd3pmrAF]=distrFrec(maximo,E3pmr1AF,SinRafagasE3pmr1AF);
[f4pmrAF, f4_NpmrAF, cfd4pmrAF]=distrFrec(maximo,E4pmr1AF,SinRafagasE4pmr1AF);
[f5pmrAF, f5_NpmrAF, cfd5pmrAF]=distrFrec(maximo,E5pmr1AF,SinRafagasE5pmr1AF);
[f6pmrAF, f6_NpmrAF, cfd6pmrAF]=distrFrec(maximo,E6pmr1AF,SinRafagasE6pmr1AF);
[f7pmrAF, f7_NpmrAF, cfd7pmrAF]=distrFrec(maximo,E7pmr1AF,SinRafagasE7pmr1AF);
[f8pmrAF, f8_NpmrAF, cfd8pmrAF]=distrFrec(maximo,E8pmr1AF,SinRafagasE8pmr1AF);
[f9pmrAF, f9_NpmrAF, cfd9pmrAF]=distrFrec(maximo,E9pmr1AF,SinRafagasE9pmr1AF);
[f10pmrAF, f10_NpmrAF, cfd10pmrAF]=distrFrec(maximo,E10pmr1AF,SinRafagasE10pmr1AF);
[f11pmrAF, f11_NpmrAF, cfd11pmrAF]=distrFrec(maximo,E11pmr1AF,SinRafagasE11pmr1AF);
[f12pmrAF, f12_NpmrAF, cfd12pmrAF]=distrFrec(maximo,E12pmr1AF,SinRafagasE12pmr1AF);

[f1midyvc, f1_Nmidyvc, cfd1midyvc]=distrFrec(maximo,E1midyvc,SinRafagasE1midyvc);
[f2midyvc, f2_Nmidyvc, cfd2midyvc]=distrFrec(maximo,E2midyvc,SinRafagasE2midyvc);
[f3midyvc, f3_Nmidyvc, cfd3midyvc]=distrFrec(maximo,E3midyvc,SinRafagasE3midyvc);
[f4midyvc, f4_Nmidyvc, cfd4midyvc]=distrFrec(maximo,E4midyvc,SinRafagasE4midyvc);
[f5midyvc, f5_Nmidyvc, cfd5midyvc]=distrFrec(maximo,E5midyvc,SinRafagasE5midyvc);

[f1midyvcAF, f1_NmidyvcAF, cfd1midyvcAF]=distrFrec(maximo,E1midyvcAF,SinRafagasE1midyvcAF);
[f2midyvcAF, f2_NmidyvcAF, cfd2midyvcAF]=distrFrec(maximo,E2midyvcAF,SinRafagasE2midyvcAF);
[f3midyvcAF, f3_NmidyvcAF, cfd3midyvcAF]=distrFrec(maximo,E3midyvcAF,SinRafagasE3midyvcAF);
[f4midyvcAF, f4_NmidyvcAF, cfd4midyvcAF]=distrFrec(maximo,E4midyvcAF,SinRafagasE4midyvcAF);
[f5midyvcAF, f5_NmidyvcAF, cfd5midyvcAF]=distrFrec(maximo,E5midyvcAF,SinRafagasE5midyvcAF);

[f1pmcyvc, f1_Npmcyvc, cfd1pmcyvc]=distrFrec(maximo,E1pmcyvc,SinRafagasE1pmcyvc);
[f2pmcyvc, f2_Npmcyvc, cfd2pmcyvc]=distrFrec(maximo,E2pmcyvc,SinRafagasE2pmcyvc);
[f3pmcyvc, f3_Npmcyvc, cfd3pmcyvc]=distrFrec(maximo,E3pmcyvc,SinRafagasE3pmcyvc);
[f5pmcyvc, f5_Npmcyvc, cfd5pmcyvc]=distrFrec(maximo,E5pmcyvc,SinRafagasE5pmcyvc);
[f6pmcyvc, f6_Npmcyvc, cfd6pmcyvc]=distrFrec(maximo,E6pmcyvc,SinRafagasE6pmcyvc);
[f8pmcyvc, f8_Npmcyvc, cfd8pmcyvc]=distrFrec(maximo,E8pmcyvc,SinRafagasE8pmcyvc);

[f2pmcyvcAF, f2_NpmcyvcAF, cfd2pmcyvcAF]=distrFrec(maximo,E2pmcyvcAF,SinRafagasE2pmcyvcAF);
[f4pmcyvcAF, f4_NpmcyvcAF, cfd4pmcyvcAF]=distrFrec(maximo,E4pmcyvcAF,SinRafagasE4pmcyvcAF);
[f6pmcyvcAF, f6_NpmcyvcAF, cfd6pmcyvcAF]=distrFrec(maximo,E6pmcyvcAF,SinRafagasE6pmcyvcAF);
[f7pmcyvcAF, f7_NpmcyvcAF, cfd7pmcyvcAF]=distrFrec(maximo,E7pmcyvcAF,SinRafagasE7pmcyvcAF);
[f8pmcyvcAF, f8_NpmcyvcAF, cfd8pmcyvcAF]=distrFrec(maximo,E8pmcyvcAF,SinRafagasE8pmcyvcAF);
[f9pmcyvcAF, f9_NpmcyvcAF, cfd9pmcyvcAF]=distrFrec(maximo,E9pmcyvcAF,SinRafagasE9pmcyvcAF);
[f10pmcyvcAF,f10_NpmcyvcAF,cfd10pmcyvcAF]=distrFrec(maximo,E10pmcyvcAF,SinRafagasE10pmcyvcAF);

[f2vcxyvc, f2_Nvcxyvc, cfd2vcxyvc]=distrFrec(maximo,E2vcxyvc,SinRafagasE2vcxyvc);
[f3vcxyvc, f3_Nvcxyvc, cfd3vcxyvc]=distrFrec(maximo,E3vcxyvc,SinRafagasE3vcxyvc);
[f4vcxyvc, f4_Nvcxyvc, cfd4vcxyvc]=distrFrec(maximo,E4vcxyvc,SinRafagasE4vcxyvc);

[f1vcxyvcAF, f1_NvcxyvcAF, cfd1vcxyvcAF]=distrFrec(maximo,E1vcxyvcAF,SinRafagasE1vcxyvcAF);
[f2vcxyvcAF, f2_NvcxyvcAF, cfd2vcxyvcAF]=distrFrec(maximo,E2vcxyvcAF,SinRafagasE2vcxyvcAF);
[f3vcxyvcAF, f3_NvcxyvcAF, cfd3vcxyvcAF]=distrFrec(maximo,E3vcxyvcAF,SinRafagasE3vcxyvcAF);
[f4vcxyvcAF, f4_NvcxyvcAF, cfd4vcxyvcAF]=distrFrec(maximo,E4vcxyvcAF,SinRafagasE4vcxyvcAF);
[f5vcxyvcAF, f5_NvcxyvcAF, cfd5vcxyvcAF]=distrFrec(maximo,E5vcxyvcAF,SinRafagasE5vcxyvcAF);

[f1figyvc, f1_Nfigyvc, cfd1figyvc]=distrFrec(maximo,E1figyvc,SinRafagasE1figyvc);
[f2figyvc, f2_Nfigyvc, cfd2figyvc]=distrFrec(maximo,E2figyvc,SinRafagasE2figyvc);
[f3figyvc, f3_Nfigyvc, cfd3figyvc]=distrFrec(maximo,E3figyvc,SinRafagasE3figyvc);
[f4figyvc, f4_Nfigyvc, cfd4figyvc]=distrFrec(maximo,E4figyvc,SinRafagasE4figyvc);

[f1figyvcAF, f1_NfigyvcAF, cfd1figyvcAF]=distrFrec(maximo,E1figyvcAF,SinRafagasE1figyvcAF);
[f2figyvcAF, f2_NfigyvcAF, cfd2figyvcAF]=distrFrec(maximo,E2figyvcAF,SinRafagasE2figyvcAF);
[f3figyvcAF, f3_NfigyvcAF, cfd3figyvcAF]=distrFrec(maximo,E3figyvcAF,SinRafagasE3figyvcAF);
[f4figyvcAF, f4_NfigyvcAF, cfd4figyvcAF]=distrFrec(maximo,E4figyvcAF,SinRafagasE4figyvcAF);
[f5figyvcAF, f5_NfigyvcAF, cfd5figyvcAF]=distrFrec(maximo,E5figyvcAF,SinRafagasE5figyvcAF);

[f1figmidyvc, f1_Nfigmidyvc, cfd1figmidyvc]=distrFrec(maximo,E1figmidyvc,SinRafagasE1figmidyvc);
[f2figmidyvc, f2_Nfigmidyvc, cfd2figmidyvc]=distrFrec(maximo,E2figmidyvc,SinRafagasE2figmidyvc);
[f3figmidyvc, f3_Nfigmidyvc, cfd3figmidyvc]=distrFrec(maximo,E3figmidyvc,SinRafagasE3figmidyvc);
[f5figmidyvc, f5_Nfigmidyvc, cfd5figmidyvc]=distrFrec(maximo,E5figmidyvc,SinRafagasE5figmidyvc);

[f1figmidyvcAF, f1_NfigmidyvcAF, cfd1figmidyvcAF]=distrFrec(maximo,E1figmidyvcAF,SinRafagasE1figmidyvcAF);
[f2figmidyvcAF, f2_NfigmidyvcAF, cfd2figmidyvcAF]=distrFrec(maximo,E2figmidyvcAF,SinRafagasE2figmidyvcAF);
[f3figmidyvcAF, f3_NfigmidyvcAF, cfd3figmidyvcAF]=distrFrec(maximo,E3figmidyvcAF,SinRafagasE3figmidyvcAF);
[f4figmidyvcAF, f4_NfigmidyvcAF, cfd4figmidyvcAF]=distrFrec(maximo,E4figmidyvcAF,SinRafagasE4figmidyvcAF);
[f5figmidyvcAF, f5_NfigmidyvcAF, cfd5figmidyvcAF]=distrFrec(maximo,E5figmidyvcAF,SinRafagasE5figmidyvcAF);

[f1WTAFbapta, f1_NWTAFbapta, cfd1WTAFbapta]=distrFrec(maximo,E1BAF,SinRafagasE1BAF);
[f2WTAFbapta, f2_NWTAFbapta, cfd2WTAFbapta]=distrFrec(maximo,E2BAF,SinRafagasE2BAF);
[f3WTAFbapta, f3_NWTAFbapta, cfd3WTAFbapta]=distrFrec(maximo,E3BAF,SinRafagasE3BAF);
[f4WTAFbapta, f4_NWTAFbapta, cfd4WTAFbapta]=distrFrec(maximo,E4BAF,SinRafagasE4BAF);
[f5WTAFbapta, f5_NWTAFbapta, cfd5WTAFbapta]=distrFrec(maximo,E5BAF,SinRafagasE5BAF);
[f6WTAFbapta, f6_NWTAFbapta, cfd6WTAFbapta]=distrFrec(maximo,E6BAF,SinRafagasE6BAF);

[f1figmidyvcAFbapta, f1_NfigmidyvcAFbapta, cfd1figmidyvcAFbapta]=distrFrec(maximo,E1figmidyvcAFBAPTA,SinRafagasE1figmidyvcAFBAPTA);
[f2figmidyvcAFbapta, f2_NfigmidyvcAFbapta, cfd2figmidyvcAFbapta]=distrFrec(maximo,E2figmidyvcAFBAPTA,SinRafagasE2figmidyvcAFBAPTA);
[f3figmidyvcAFbapta, f3_NfigmidyvcAFbapta, cfd3figmidyvcAFbapta]=distrFrec(maximo,E3figmidyvcAFBAPTA,SinRafagasE3figmidyvcAFBAPTA);

[f1WTSFbapta, f1_NWTSFbapta, cfd1WTSFbapta]=distrFrec(maximo,E1BSF,SinRafagasE1BSF);
[f2WTSFbapta, f2_NWTSFbapta, cfd2WTSFbapta]=distrFrec(maximo,E2BSF,SinRafagasE2BSF);
[f3WTSFbapta, f3_NWTSFbapta, cfd3WTSFbapta]=distrFrec(maximo,E3BSF,SinRafagasE3BSF);

[f1figSFbapta, f1_NfigSFbapta, cfd1figSFbapta]=distrFrec(maximo,E1figSFBAPTA,SinRafagasE1figBSF);
[f2figSFbapta, f2_NfigSFbapta, cfd2figSFbapta]=distrFrec(maximo,E2figSFBAPTA,SinRafagasE2figBSF);
[f3figSFbapta, f3_NfigSFbapta, cfd3figSFbapta]=distrFrec(maximo,E3figSFBAPTA,SinRafagasE3figBSF);

[f1figAFbapta, f1_NfigAFbapta, cfd1figAFbapta]=distrFrec(maximo,E1figAFBAPTA,SinRafagasE1figAFBAPTA);

fWT    =f6WTSF+f8WTSF+f9WTSF+f10WTSF+f11WTSF+f12WTSF+f13WTSF;                           fWT_N=fWT/sum(fWT);
fWTAF  =f6WTAF+f7WTAF+f8WTAF+f9WTAF+f13WTAF;                                            fWTAF_N=fWTAF/sum(fWTAF);
fYVC1  =f2yvcSF+f3yvcSF+f4yvcSF+f5yvcSF;                                                fYVC1_N=fYVC1/sum(fYVC1);
fYVC1AF=f1yvcAF+f5yvcAF+f6yvcAF+f7yvcAF+f8yvcAF+f9yvcAF+f10yvcAF;                       fYVC1AF_N=fYVC1AF/sum(fYVC1AF);
fVCX1  =f1vcxSF+f2vcxSF+f3vcxSF+f4vcxSF+f5vcxSF;                                        fVCX1_N=fVCX1/sum(fVCX1);
fVCX1AF=f2vcxAF+f3vcxAF+f4vcxAF+f5vcxAF;                                                fVCX1AF_N=fVCX1AF/sum(fVCX1AF);
fMID1  =f1mid+f2mid+f3mid+f4mid;                                                        fMID1_N  =fMID1/sum(fMID1);
fMID1AF=f1midAF+f2midAF+f3midAF+f4midAF+f5midAF;                                        fMID1AF_N=fMID1AF/sum(fMID1AF);
fFIG1  =f1fig+f2fig+f3fig+f4fig;                                                        fFIG1_N  =fFIG1/sum(fFIG1);
fFIG1AF=f1figAF+f2figAF+f3figAF+f4figAF+f5figAF;                                        fFIG1AF_N=fFIG1AF/sum(fFIG1AF);
fFIG1MID1  =f1figmid+f2figmid+f4figmid;                                                 fFIG1MID1_N=fFIG1MID1/sum(fFIG1MID1);
fFIG1MID1AF=f1figmidAF+f2figmidAF+f3figmidAF+f5figmidAF;                                fFIG1MID1AF_N=fFIG1MID1AF/sum(fFIG1MID1AF);
fPMC1YVC1  =f1pmcyvc+f2pmcyvc+f3pmcyvc+f5pmcyvc+f6pmcyvc+f8pmcyvc;                      fPMC1YVC1_N=fPMC1YVC1/sum(fPMC1YVC1);
fPMC1YVC1AF=f2pmcyvcAF+f4pmcyvcAF+f6pmcyvcAF+f7pmcyvcAF+f8pmcyvcAF+f9pmcyvcAF+f10pmcyvcAF;      fPMC1YVC1AF_N=fPMC1YVC1AF/sum(fPMC1YVC1AF);
fPMC1  =f1pmcSF+f2pmcSF+f3pmcSF+f4pmcSF+f5pmcSF;                                        fPMC1_N=fPMC1/sum(fPMC1);
fPMC1AF=f1pmcAF+f2pmcAF+f5pmcAF+f6pmcAF+f7pmcAF+f8pmcAF;                                fPMC1AF_N=fPMC1AF/sum(fPMC1AF);
fPMR1  =f1pmrSF+f2pmrSF+f3pmrSF+f4pmrSF+f5pmrSF+f6pmrSF+f7pmrSF+f8pmrSF+f9pmrSF;        fPMR1_N=fPMR1/sum(fPMR1);
fPMR1AF=f1pmrAF+f2pmrAF+f3pmrAF+f4pmrAF+f5pmrAF+f6pmrAF+f7pmrAF+f8pmrAF+f9pmrAF+f10pmrAF+f11pmrAF+f12pmrAF;  fPMR1AF_N=fPMR1AF/sum(fPMR1AF);
fMIDYVC=f1midyvc+f2midyvc+f3midyvc+f4midyvc+f5midyvc;                                   fMID1YVC1_N=fMIDYVC/sum(fMIDYVC);
fMIDYVCAF=f1midyvcAF+f2midyvcAF+f3midyvcAF+f4midyvcAF+f5midyvcAF;                       fMID1YVC1AF_N=fMIDYVCAF/sum(fMIDYVCAF);
fVCX1YVC1  =f2vcxyvc+f3vcxyvc+f4vcxyvc;                                                 fVCX1YVC1_N=fVCX1YVC1/sum(fVCX1YVC1);
fVCX1YVC1AF=f1vcxyvcAF+f2vcxyvcAF+f3vcxyvcAF+f4vcxyvcAF+f5vcxyvcAF;                     fVCX1YVC1AF_N=fVCX1YVC1AF/sum(fVCX1YVC1AF);
fFIGYVC=f1figyvc+f2figyvc+f3figyvc+f4figyvc;                                            fFIG1YVC1_N=fFIGYVC/sum(fFIGYVC);
fFIGYVCAF=f1figyvcAF+f2figyvcAF+f3figyvcAF+f4figyvcAF+f5figyvcAF;                       fFIG1YVC1AF_N=fFIGYVCAF/sum(fFIGYVCAF);
fFIGMIDYVC=f1figmidyvc+f2figmidyvc+f3figmidyvc+f5figmidyvc;                             fFIG1MID1YVC1_N=fFIGMIDYVC/sum(fFIGMIDYVC);
fFIGMIDYVCAF=f1figmidyvcAF+f2figmidyvcAF+f3figmidyvcAF+f4figmidyvcAF+f5figmidyvcAF;     fFIG1MID1YVC1AF_N=fFIGMIDYVCAF/sum(fFIGMIDYVCAF);
fWTAFBATPA=f1WTAFbapta+f2WTAFbapta+f3WTAFbapta+f4WTAFbapta+f5WTAFbapta+f6WTAFbapta;     fWTAFBATPA_N=fWTAFBATPA/sum(fWTAFBATPA);
ffigmidyvcAFBATPA=f1figmidyvcAFbapta+f2figmidyvcAFbapta+f3figmidyvcAFbapta;             ffigmidyvcAFBATPA_N=ffigmidyvcAFBATPA/sum(ffigmidyvcAFBATPA);
fWTSFBATPA=f1WTSFbapta+f2WTSFbapta+f3WTSFbapta;                                         fWTSFBATPA_N=fWTSFBATPA/sum(fWTSFBATPA);

ffigSFBATPA=f1figSFbapta+f2figSFbapta+f3figSFbapta;                                     ffigSFBATPA_N=ffigSFBATPA/sum(ffigSFBATPA);
ffigAFBATPA=f1figAFbapta;                                                               ffigAFBATPA_N=ffigAFBATPA/sum(ffigAFBATPA);

datosfWT=[];datosfWTAF=[];datosfVCX=[];datosfVCXAF=[];
datosfYVC=[];datosfYVCAF=[];datosfMID=[];datosfMIDAF=[];
datosfPMC=[];datosfPMCAF=[];datosfPMR=[];datosfPMRAF=[];
datosfMIDYVC=[];datosfMIDYVCAF=[];datosfFIG1=[];datosfFIG1AF=[];
datosfFIG1MID1=[];datosfFIG1MID1AF=[];datosfPMC1YVC1=[];datosfPMC1YVC1AF=[];
datosfVCX1YVC1=[];datosfVCX1YVC1AF=[];
datosfFIG1YVC1=[];datosfFIG1YVC1AF=[];
datosfFIG1MID1YVC1=[];datosfFIG1MID1YVC1AF=[];
datosfWTbAF=[];datosfWTbSF=[];
datosffigmidyvcbAF=[];
datosffigbSF=[];datosffigbAF=[];
for i=1:(maximo+1)%en la priemra columna calculo las acumuladas %la segunda columna es para 'armar' #rafagas en cada cell
    yWTSF(i) =sum(fWT_N(1:i));       datosfWT   =cat(2,datosfWT,(i-1)*ones(1,fWT(i)));
    yWTCF(i) =sum(fWTAF_N(1:i));     datosfWTAF =cat(2,datosfWTAF,(i-1)*ones(1,fWTAF(i)));
    yVCXSF(i)=sum(fVCX1_N(1:i));     datosfVCX  =cat(2,datosfVCX,(i-1)*ones(1,fVCX1(i)));
    yVCXAF(i)=sum(fVCX1AF_N(1:i));   datosfVCXAF=cat(2,datosfVCXAF,(i-1)*ones(1,fVCX1AF(i)));
    
    yYVCSF(i)=sum(fYVC1_N(1:i));     datosfYVC  =cat(2,datosfYVC,(i-1)*ones(1,fYVC1(i)));
    yYVCAF(i)=sum(fYVC1AF_N(1:i));   datosfYVCAF=cat(2,datosfYVCAF,(i-1)*ones(1,fYVC1AF(i)));
    yMIDSF(i)=sum(fMID1_N(1:i));     datosfMID  =cat(2,datosfMID,(i-1)*ones(1,fMID1(i)));
    yMIDAF(i)=sum(fMID1AF_N(1:i));   datosfMIDAF=cat(2,datosfMIDAF,(i-1)*ones(1,fMID1AF(i)));
    
    yPMCSF(i)=sum(fPMC1_N(1:i));     datosfPMC  =cat(2,datosfPMC,(i-1)*ones(1,fPMC1(i)));
    yPMCAF(i)=sum(fPMC1AF_N(1:i));   datosfPMCAF=cat(2,datosfPMCAF,(i-1)*ones(1,fPMC1AF(i)));
    yPMRSF(i)=sum(fPMR1_N(1:i));     datosfPMR  =cat(2,datosfPMR,(i-1)*ones(1,fPMR1(i)));
    yPMRAF(i)=sum(fPMR1AF_N(1:i));   datosfPMRAF=cat(2,datosfPMRAF,(i-1)*ones(1,fPMR1AF(i)));
        
    yMIDYVC(i)=sum(fMID1YVC1_N(1:i));       datosfMIDYVC=cat(2,datosfMIDYVC,(i-1)*ones(1,fMIDYVC(i)));
    yMIDYVCAF(i)=sum(fMID1YVC1AF_N(1:i));   datosfMIDYVCAF=cat(2,datosfMIDYVCAF,(i-1)*ones(1,fMIDYVCAF(i)));
    yFIGSF(i)=sum(fFIG1_N(1:i));            datosfFIG1  =cat(2,datosfFIG1,(i-1)*ones(1,fFIG1(i)));
    yFIGAF(i)=sum(fFIG1AF_N(1:i));          datosfFIG1AF=cat(2,datosfFIG1AF,(i-1)*ones(1,fFIG1AF(i)));
    yFIGMIDSF(i)=sum(fFIG1MID1_N(1:i));     datosfFIG1MID1  =cat(2,datosfFIG1MID1,(i-1)*ones(1,fFIG1MID1(i)));
    yFIGMIDAF(i)=sum(fFIG1MID1AF_N(1:i));   datosfFIG1MID1AF=cat(2,datosfFIG1MID1AF,(i-1)*ones(1,fFIG1MID1AF(i)));
    
    yPMCYVCSF(i)=sum(fPMC1YVC1_N(1:i));     datosfPMC1YVC1  =cat(2,datosfPMC1YVC1,(i-1)*ones(1,fPMC1YVC1(i)));
    yPMCYVCAF(i)=sum(fPMC1YVC1AF_N(1:i));   datosfPMC1YVC1AF=cat(2,datosfPMC1YVC1AF,(i-1)*ones(1,fPMC1YVC1AF(i)));
    yVCXYVCSF(i)=sum(fVCX1YVC1_N(1:i));     datosfVCX1YVC1  =cat(2,datosfVCX1YVC1,(i-1)*ones(1,fVCX1YVC1(i)));
    yVCXYVCAF(i)=sum(fVCX1YVC1AF_N(1:i));   datosfVCX1YVC1AF=cat(2,datosfVCX1YVC1AF,(i-1)*ones(1,fVCX1YVC1AF(i)));
      
    yFIGYVCSF(i)=sum(fFIG1YVC1_N(1:i));     datosfFIG1YVC1  =cat(2,datosfFIG1YVC1,(i-1)*ones(1,fFIGYVC(i)));
    yFIGYVCAF(i)=sum(fFIG1YVC1AF_N(1:i));   datosfFIG1YVC1AF=cat(2,datosfFIG1YVC1AF,(i-1)*ones(1,fFIGYVCAF(i)));
    yFIGMIDYVCSF(i)=sum(fFIG1MID1YVC1_N(1:i)); datosfFIG1MID1YVC1  =cat(2,datosfFIG1MID1YVC1,(i-1)*ones(1,fFIGMIDYVC(i)));
    yFIGMIDYVCAF(i)=sum(fFIG1MID1YVC1AF_N(1:i));datosfFIG1MID1YVC1AF=cat(2,datosfFIG1MID1YVC1AF,(i-1)*ones(1,fFIGMIDYVCAF(i)));
    
    yWTbCF(i)       =sum(fWTAFBATPA_N(1:i));            datosfWTbAF        =cat(2,datosfWTbAF,(i-1)*ones(1,fWTAFBATPA(i)));
    yWTbSF(i)       =sum(fWTSFBATPA_N(1:i));            datosfWTbSF        =cat(2,datosfWTbSF,(i-1)*ones(1,fWTSFBATPA(i)));
    yfigmidyvcbCF(i)=sum(ffigmidyvcAFBATPA_N(1:i));     datosffigmidyvcbAF =cat(2,datosffigmidyvcbAF,(i-1)*ones(1,ffigmidyvcAFBATPA(i)));
    
    yfigbSF(i)=sum(ffigSFBATPA_N(1:i));                 datosffigbSF =cat(2,datosffigbSF,(i-1)*ones(1,ffigSFBATPA(i)));
    yfigbAF(i)=sum(ffigAFBATPA_N(1:i));                 datosffigbAF =cat(2,datosffigbAF,(i-1)*ones(1,ffigAFBATPA(i)));
end
disp('Frecuencias Cargadas')
%%
S={datosfWT, datosfWTAF, datosfVCX, datosfVCXAF, datosfYVC, datosfYVCAF, datosfMID, datosfMIDAF, datosfPMC, datosfPMCAF, datosfPMR, datosfPMRAF, datosfMIDYVC, datosfMIDYVCAF, datosfFIG1, datosfFIG1AF, datosfFIG1MID1, datosfFIG1MID1AF, datosfPMC1YVC1, datosfPMC1YVC1AF, datosfVCX1YVC1, datosfVCX1YVC1AF, datosfFIG1YVC1, datosfFIG1YVC1AF, datosfFIG1MID1YVC1, datosfFIG1MID1YVC1AF, datosfWTbAF, datosffigmidyvcbAF, datosfWTbSF, datosffigbSF, datosffigbAF};
h_f=zeros(length(S));
p_f=zeros(length(S));
for i=1:length(S)
    for j=i:length(S)
        [a,b]=kstest2(S{i},S{j},'Alpha',0.01);%KS de la frecuencia
        h_f(i,j)=a;p_f(i,j)=b;
    end
end

pcolor(h_f.')
%
% filename = 'C:\Users\vero\Desktop\Nahuel Wt\Analisis\patientdata2023.xlsx';
% xlswrite(filename,h_f) 
% sheet = 2;
% xlswrite(filename,p_f,sheet) 

% xlswrite('filename.xlsx',yourmatrix)
%%
% name=       {'WT' ,'WT +\alphaf','\Deltavcx1','\Deltavcx1 +\alphaf','\Deltayvc1','\Deltayvc1 +\alphaf','\Deltamid1','\Deltamid1 +\alphaf','\Deltapmc1','\Deltapmc1 +\alphaf','\Deltapmr1','\Deltapmr1 +\alphaf','\Deltamid1\Deltayvc1','\Deltamid1\Deltayvc1 +\alphaf', 'fig1', 'fig1 +af', 'fig1mid1', 'fig1mid1 +af', 'pmc1yvc1',  'pmc1yvc1 +af'};
name=       {'WT' ,'WT +af','vcx1'  ,'vcx1 +af','yvc1'  ,'yvc1 +af','mid1'  ,'mid1 +af','pmc1'  ,'pmc1 +af','pmr1'  ,'pmr1 +af','mid1yvc1'  ,'mid1yvc1 +af', 'fig1' ,'fig1 +af', 'fig1mid1' , 'fig1mid1 +af', 'pmc1yvc1' ,'pmc1yvc1 +af', 'vcx1yvc1' ,'vcx1yvc1 +af', 'fig1yvc1' , 'fig1yvc1 +af', 'fig1mid1yvc1' , 'fig1mid1yvc1 +af', 'WT+af+BAPTA', 'WT+BAPTA'  , 'fig1mid1yvc1+af+BAPTA', 'fig1+BAPTA' , 'fig1+af+BAPTA'};
datos=      {WTSF , WTAF   , vcx1SF , vcx1AF   , yvc1SF , yvc1AF   , mid1SF , mid1AF   , pmc1SF , pmc1AF   , pmr1SF , pmr1AF   , mid1yvc1   , mid1yvc1AF   , fig1SF , fig1CF   , fig1mid1SF , fig1mid1CF    , pmc1yvc1   , pmc1yvc1AF   , vcx1yvc1   , vcx1yvc1AF   , fig1yvc1   , fig1yvc1AF    , fig1mid1yvc1   , fig1mid1yvc1AF    , WTAFbapta    , WTSFbapta   , fig1mid1yvc1AFbapta    , fig1SFbapta  , fig1AFbapta};
frecuencias={fWT_N, fWTAF_N, fVCX1_N, fVCX1AF_N, fYVC1_N, fYVC1AF_N, fMID1_N, fMID1AF_N, fPMC1_N, fPMC1AF_N, fPMR1_N, fPMR1AF_N, fMID1YVC1_N, fMID1YVC1AF_N, fFIG1_N, fFIG1AF_N, fFIG1MID1_N, fFIG1MID1AF_N , fPMC1YVC1_N, fPMC1YVC1AF_N, fVCX1YVC1_N, fVCX1YVC1AF_N, fFIG1YVC1_N, fFIG1YVC1AF_N , fFIG1MID1YVC1_N, fFIG1MID1YVC1AF_N , fWTAFBATPA_N , fWTSFBATPA_N, ffigmidyvcAFBATPA_N    , ffigSFBATPA_N, ffigAFBATPA_N};
acumuladas= {yWTSF, yWTCF  , yVCXSF , yVCXAF   , yYVCSF , yYVCAF   , yMIDSF , yMIDAF   , yPMCSF , yPMCAF   , yPMRSF , yPMRAF   , yMIDYVC    , yMIDYVCAF    , yFIGSF , yFIGAF   , yFIGMIDSF  , yFIGMIDAF     , yPMCYVCSF  , yPMCYVCAF    , yVCXYVCSF  , yVCXYVCAF    , yFIGYVCSF  , yFIGYVCAF     , yFIGMIDYVCSF   , yFIGMIDYVCAF      , yWTbCF       , yWTbSF      , yfigmidyvcbCF          , yfigbSF      , yfigbAF};

close all
i=27
% cd('C:\Users\vero\Desktop\Imagenes')
subplot(2,2,1) %amplitud
cdfplot(datos{i}(:,5))
xlim([0 5])
xlabel('Amplitud F/Fo')
subplot(2,2,2) %duración
cdfplot(datos{i}(:,3)-datos{i}(:,2)) 
xlim([0 160]) 
xlabel('Duración (s)')
subplot(2,2,3) %Frecuencia
f=0:maximo;
plot(f,acumuladas{i})
xlim([0 20])
ylim([0 1]) 
grid on
xlabel('Frecuencia')
unii=1:6000;
subplot(2,2,4) %inicio
cdfplot(datos{i}(:,2))
hold on
cdfplot(unii)
legend(name{i},'Uniforme','Location','northwest')
xlim([0 6000])
xlabel('Inicio de ráfaga (s)')

%% cell%%
close all
i=2;j=14;
k=18;l=24;
mn=26;%op=26;
% qr=1;

subplot(2,2,1) %amplitud
% ksdensity(datos{i}(:,5))
cdfplot(datos{i}(:,5))
hold on
cdfplot(datos{j}(:,5))
cdfplot(datos{k}(:,5))
cdfplot(datos{l}(:,5))
cdfplot(datos{mn}(:,5))
% cdfplot(datos{op}(:,5))
% cdfplot(datos{qr}(:,5))

% ksdensity(datos{j}(:,5))
% ksdensity(datos{k}(:,5))
% ksdensity(datos{l}(:,5))
legend(name{i},name{j},name{k},name{l},name{mn})%,name{op})%,name{qr})
xlim([0 5])
xlabel('Amplitud')
hold off

subplot(2,2,2) %duración
% ksdensity(datos{i}(:,3)-datos{i}(:,2))
cdfplot(datos{i}(:,3)-datos{i}(:,2))
hold on
cdfplot(datos{j}(:,3)-datos{j}(:,2))
cdfplot(datos{k}(:,3)-datos{k}(:,2))
cdfplot(datos{l}(:,3)-datos{l}(:,2))
cdfplot(datos{mn}(:,3)-datos{mn}(:,2))
% cdfplot(datos{op}(:,3)-datos{op}(:,2))
% cdfplot(datos{qr}(:,3)-datos{qr}(:,2))
legend(name{i},name{j},name{k},name{l},name{mn})
xlim([0 160])
xlabel('Duración')
hold off

subplot(2,2,3) %Frecuencia
f=0:maximo;
plot(f,frecuencias{i},f,frecuencias{j},f,frecuencias{k},f,frecuencias{l},f,frecuencias{mn})%,f,frecuencias{op})%,f,frecuencias{qr})
% plot(f,frecuencias{i},f,frecuencias{j},f,frecuencias{k})
legend(name{i},name{j},name{k},name{l},name{mn})%,name{op})%,name{qr})
xlim([0 20])
xlabel('Frecuencia')

subplot(2,2,4) %Frecuencia
plot(f,acumuladas{i},f,acumuladas{j},f,acumuladas{k},f,acumuladas{l},f,acumuladas{mn})%,f,acumuladas{op})%,f,acumuladas{qr})
% plot(f,acumuladas{i},f,acumuladas{j},f,acumuladas{k})
% legend(name{i},name{j},name{k},name{l},name{mn},name{op})%,name{qr})
xlim([0 20])
ylim([0 1])
grid on
xlabel('Frecuencia')
%%
clear id
id=find(mid1SF(:,5)<1);
hist(mid1SF(id,5),100)
mean(mid1SF(id,5))
std(mid1SF(id,5))


%%
lambda=mid1SF(2:end,2)-mid1SF(1:(end-1),2);
id=find(lambda>0);
hist(lambda(id))
mean(lambda(id))
%%
lambda=fig1SF(2:end,2)-fig1SF(1:(end-1),2);
id=find(lambda>0);
hist(lambda(id))
mean(lambda(id))

%%

unii=1:6000;

subplot(2,2,1) %inicio
i=1;j=2;
k=3;l=4;
cdfplot(datos{i}(:,2))
hold on
cdfplot(datos{j}(:,2))
cdfplot(datos{k}(:,2))
cdfplot(datos{l}(:,2))
legend(name{i},name{j},name{k},name{l})
xlim([0 6000])
xlabel('Inicio de ráfaga (s)')
hold off

subplot(2,2,2) %duración
i=5;j=6;
k=7;l=8;
cdfplot(datos{i}(:,2))
hold on
cdfplot(datos{j}(:,2))
cdfplot(datos{k}(:,2))
cdfplot(datos{l}(:,2))
legend(name{i},name{j},name{k},name{l})
xlim([0 6000])
xlabel('Inicio de ráfaga (s)')
hold off

subplot(2,2,3) %Frecuencia
i=9;j=10;
k=11;l=12;
cdfplot(datos{i}(:,2))
hold on
cdfplot(datos{j}(:,2))
cdfplot(datos{k}(:,2))
cdfplot(datos{l}(:,2))
legend(name{i},name{j},name{k},name{l})
xlim([0 6000])
xlabel('Inicio de ráfaga (s)')
hold off

subplot(2,2,4)
i=13;j=14;
k=1;l=2;
cdfplot(datos{i}(:,2))
hold on
cdfplot(datos{j}(:,2))
cdfplot(datos{k}(:,2))
cdfplot(unii)
legend(name{i},name{j},name{k},'Uniforme')
xlim([0 6000])
xlabel('Inicio de ráfaga (s)')
hold off

%%
% clear h p
% for i=1:2:14
%     for j=1:2:14
% [h(i,j), p(i,j)]=kstest2(frecuencias{i},frecuencias{j},'Alpha',0.01);
%     end
% end


%%
i=2;j=4;
k=7;
l=9;
m=12;

% i=1;j=3;
% % k=5;
% l=8;
% % m=10;

subplot(2,2,1) %amplitud
cdfplot(datos{i}(:,5))
hold on
cdfplot(datos{j}(:,5))
cdfplot(datos{k}(:,5))
cdfplot(datos{l}(:,5))
cdfplot(datos{m}(:,5))
% legend(name{i},name{j},name{l})
legend(name{i},name{j},name{k},name{l},name{m})
xlim([0 5])
xlabel('Amplitud')
hold off

subplot(2,2,2) %duración
cdfplot(datos{i}(:,3)-datos{i}(:,2))
hold on
cdfplot(datos{j}(:,3)-datos{j}(:,2))
cdfplot(datos{k}(:,3)-datos{k}(:,2))
cdfplot(datos{l}(:,3)-datos{l}(:,2))
cdfplot(datos{m}(:,3)-datos{m}(:,2))
xlim([0 120])
xlabel('Duración')
hold off

subplot(2,2,3) %Frecuencia
f=0:maximo;
% plot(f,frecuencias{i},f,frecuencias{j},f,frecuencias{l})
plot(f,frecuencias{i},f,frecuencias{j},f,frecuencias{k},f,frecuencias{l},f,frecuencias{m})
xlim([0 20])
xlabel('Frecuencia')

subplot(2,2,4) %Frecuencia
% plot(f,acumuladas{i},f,acumuladas{j},f,acumuladas{l})
plot(f,acumuladas{i},f,acumuladas{j},f,acumuladas{k},f,acumuladas{l},f,acumuladas{m})
xlim([0 20])
ylim([0 1])
grid on
xlabel('Frecuencia')


%%
subplot(1,2,1)
cdfplot(datos{1}(:,2))
hold on
cdfplot(datos{3}(:,2))
cdfplot(datos{8}(:,2))
cdfplot(unifrnd(0,6000,1,1500))
legend(name{1},name{3},name{8},'Uniform','Location','northwest')
ylim([0 1])
hold off
grid on
xlabel('Ocurencia [min]')
subplot(1,2,2)
cdfplot(datos{2}(:,2))
hold on
cdfplot(datos{6}(:,2))
cdfplot(datos{7}(:,2))
cdfplot(datos{12}(:,2))
cdfplot(unifrnd(0,6000,1,2500))
ylim([0 1])
hold off
legend(name{2},name{6},name{7},name{12},'Uniform','Location','northwest')
grid on
xlabel('Ocurencia [min]')
%%
plot(datos{1}(:,2),datos{1}(:,5))
ylim([0 5])

% corrcoef(datos{1}(:,3)-datos{1}(:,2),datos{1}(:,5))

%%
h_A=zeros(length(datos));p_A=zeros(length(datos));
h_D=zeros(length(datos));p_D=zeros(length(datos));
h_o=zeros(length(datos));p_o=zeros(length(datos));
for i=1:length(datos)
    for j=i:length(datos)
        [a,b]=kstest2(datos{i}(:,5),datos{j}(:,5),'Alpha',0.01);%KS de la amplitud
        h_A(i,j)=a;p_A(i,j)=b;
        [a2,b2]=kstest2(datos{i}(:,3)-datos{i}(:,2),datos{j}(:,3)-datos{j}(:,2),'Alpha',0.01);%KS de la duracion
        h_D(i,j)=a2;p_D(i,j)=b2;
        [a,b]=kstest2(datos{i}(:,2),datos{j}(:,2),'Alpha',0.01);%KS del inicio de rafaga
        h_o(i,j)=a;p_o(i,j)=b;
    end
end

% filename = 'C:\Users\vero\Desktop\Nahuel Wt\Analisis\patientdata2023.xlsx';
% sheet = 3;
% xlswrite(filename,p_A,sheet)
% sheet = 4;
% xlswrite(filename,p_D,sheet)
% sheet = 5;
% xlswrite(filename,p_o,sheet)

% xlswrite('C:\Users\vero\Desktop\filename.xlsx',cat(1, p_f, p_A, p_D, p_o))
%%
unii=1:6000;
for i=1:length(datos)

    [a,b]=kstest2(datos{i}(:,2),unii,'Alpha',0.01);%KS de la amplitud
    h_u(i,j)=a;p_u(i,j)=b;

end 


%% 
% [h,p] = kstest2(nCF,nSF);% h=0 'iguales'
% disp(['K-S WT+AF/WT Frec=' num2str(p)])
% [h,p] = kstest2(nCF,nfyvcSF);% h=0 'iguales'
% disp(['K-S WT+AF/vcx1 Frec=' num2str(p)])
% [h,p] = kstest2(nfyvcSF,nSF);% h=0 'iguales'
% disp(['K-S WT/vcx1 Frec=' num2str(p)])
% [h,p] = kstest2(nCF,nfyvcAF);% h=0 'iguales'
% disp(['K-S vcx1+AF/WT+AF Frec=' num2str(p)])
% [h,p] = kstest2(nfyvcSF,nfyvcAF);% h=0 'iguales'
% disp(['K-S vcx1+AF/vcx1 Frec=' num2str(p)])
% [h,p] = kstest2(nSF,nfyvcAF);% h=0 'iguales', p>0,05 'iguales' 
% disp(['K-S vcx1+AF/WT Frec=' num2str(p)])



%%
datoSF=yvc1SF;FSF=nfyvcSF;
datoAF=yvc1AF;FCF=nfyvcAF;

subplot(2,2,1)
cdfplot(ConFero(:,5))
hold on 
cdfplot(SinFero(:,5))
cdfplot(datoSF(:,5))
cdfplot(datoAF(:,5))
legend('WT +\alphaf','WT','\Deltayvc1','\Deltayvc1 +\alphaf')
% legend('WT +\alphaf','WT','\Deltayvc1 +\alphaf')
xlim([0 6])
xlabel('Amplitud [\DeltaF/F_0]')
hold off

subplot(2,2,2)
% ksdensity(ConFero(:,3)-ConFero(:,2))
cdfplot(ConFero(:,3)-ConFero(:,2))
hold on 
% ksdensity(SinFero(:,3)-SinFero(:,2))
cdfplot(SinFero(:,3)-SinFero(:,2))
% ksdensity(datoSF(:,3)-datoSF(:,2))
cdfplot(datoSF(:,3)-datoSF(:,2))
% ksdensity(datoAF(:,3)-datoAF(:,2))
cdfplot(datoAF(:,3)-datoAF(:,2))
% legend('WT +\alphaf','WT','\Deltayvc1 +\alphaf')
legend('WT +\alphaf','WT','\Deltayvc1','\Deltayvc1 +\alphaf')
xlim([0 400])
xlabel('Duracion [s]')
hold off

subplot(2,2,3)
% plot(f,nCF,f,nSF,f,FCF)
plot(f,nCF,f,nSF,f,FSF,f,FCF)
xlim([0 40])
xlabel('Frecuencia')
% legend('WT +\alphaf','WT','\Deltayvc1 +\alphaf')
legend('WT +\alphaf','WT','\Deltayvc1','\Deltayvc1 +\alphaf')

subplot(2,2,4)
% plot(0:39,yWTCF,0:39,yWTSF,0:39,yYVCAF)
plot(0:39,yWTCF,0:39,yWTSF,0:39,yYVCSF,0:39,yYVCAF)
xlabel('Frecuencia')
ylim([0 1])
legend('WT +\alphaf','WT','\Deltayvc1','\Deltayvc1 +\alphaf')
% legend('WT +\alphaf','WT','\Deltamid1 +\alphaf')
%%
hist(yvc1AF(:,5),150)
hold on 
hist(WTAF(:,5),80)

hold off
%%
%%
% hist(yvc1AF(:,2))
% hist(yvc1SF(:,2))
% hist(WTAF(:,2))
cdfplot(WTAF(:,2))
hold on
cdfplot(WTSF(:,2))
cdfplot(yvc1AF(:,2))
cdfplot(yvc1SF(:,2))
cdfplot(vcx1AF(:,2))
cdfplot(vcx1SF(:,2))
cdfplot(pmc1AF(:,2))
cdfplot(pmc1SF(:,2))
cdfplot(mid1AF(:,2))
% cdfplot(vcx1AF(:,2))
% cdfplot(vcx1SF(:,2))
cdfplot(random('Uniform',0,6000,[1 3000]))
% legend('wt+af','wt','dyvc1+af','dyvc1','dvcx1+af','dvcx1','Uniforme')
% legend('wt+af','wt','dyvc1+af','dyvc1','Uniforme')
legend('wt+af','wt','dyvc1+af','dyvc1','dvcx1+af','dvcx1','dpmc1+af','dpmc1''dmid1+af','Uniforme')
xlabel('Inicio Ráfaga [s]')

hold off

[h, p]=kstest2(WTSF(:,2),yvc1AF(:,2)); disp([ 'WT AF/YVCAF h=' num2str(h) ' p=' num2str(p)])
[h, p]=kstest2(WTSF(:,2),mid1AF(:,2)); disp([ 'WT AF/MIDAF h=' num2str(h) ' p=' num2str(p)])
[h, p]=kstest2(yvc1AF(:,2),mid1AF(:,2)); disp([ 'YVCAF/MIDAF h=' num2str(h) ' p=' num2str(p)])
%% Area total

AreaWTAF(1)=WTAF(1,6);
s=1;
for i=2:size(WTAF,1)
    if WTAF(i-1,1)==WTAF(i,1)
        AreaWTAF(s)=AreaWTAF(s)+WTAF(i,6);
    else
        s=s+1;
        AreaWTAF(s)=WTAF(i,6);
    end
end
AreaWTAF=cat(2,AreaWTAF,sum([SinRafagasE6AF, SinRafagasE7AF, SinRafagasE8AF, SinRafagasE9AF, SinRafagasE10AF]));
%--
AreaWTSF(1)=WTSF(1,6);
s=1;
for i=2:size(WTSF,1)
    if WTSF(i-1,1)==WTSF(i,1)
        AreaWTSF(s)=AreaWTSF(s)+WTSF(i,6);
    else
        s=s+1;
        AreaWTSF(s)=WTSF(i,6);
    end
end
AreaWTSF=cat(2,AreaWTSF,sum([SinRafagasE6SF, SinRafagasE8SF, SinRafagasE9SF, SinRafagasE10SF, SinRafagasE11SF, SinRafagasE12SF , SinRafagasE13SF]));

%--
Areayvc1SF(1)=yvc1SF(1,6);
s=1;
for i=2:size(yvc1SF,1)
    if yvc1SF(i-1,1)==yvc1SF(i,1)
        Areayvc1SF(s)=Areayvc1SF(s)+yvc1SF(i,6);
    else
        s=s+1;
        Areayvc1SF(s)=yvc1SF(i,6);
    end
end
Areayvc1SF=cat(2,Areayvc1SF,sum([SinRafagasE1yvcSF, SinRafagasE2yvcSF, SinRafagasE3yvcSF, SinRafagasE4yvcSF, SinRafagasE5yvcSF]));
%--
Areayvc1AF(1)=yvc1AF(1,6);
s=1;
for i=2:size(yvc1AF,1)
    if yvc1AF(i-1,1)==yvc1AF(i,1)
        Areayvc1AF(s)=Areayvc1AF(s)+yvc1AF(i,6);
    else
        s=s+1;
        Areayvc1AF(s)=yvc1AF(i,6);
    end
end
Areayvc1AF=cat(2,Areayvc1AF,sum([SinRafagasE1yvcAF, SinRafagasE5yvcAF, SinRafagasE6yvcAF, SinRafagasE7yvcAF, SinRafagasE8yvcAF, SinRafagasE9yvcAF, SinRafagasE10yvcAF]));
%--

% cdfplot(AreaWTAF)
ksdensity(AreaWTSF)
hold on
ksdensity(AreaWTAF)
% cdfplot(Areayvc1AF)
ksdensity(Areayvc1SF)
ksdensity(Areayvc1AF)
hold off
xlim([-30 400])
legend('wt','wt+af','dyvc1','dyvc1+af')
xlabel('Area Total Ráfaga por célula')



[h, p]=kstest2(AreaWTAF,Areayvc1AF); disp([ 'WT AF/YVCAF h=' num2str(h) ' p=' num2str(p)])

%%
[A, IDwtAF]=sort(WTAF(:,2));
[A, IDyvc1AF]=sort(yvc1AF(:,2));

plot(WTAF(IDwtAF,2),WTAF(IDwtAF,6))
hold on
plot(yvc1AF(IDyvc1AF,2),yvc1AF(IDyvc1AF,6))
hold off

%%
% data=xlsread('C:\Users\vero\Desktop\FCS\Mediciones\2021-12-01\Parametros de ajuste.xls');

%%
name=       {'WT' ,'WT +\alphaf','\Deltavcx1','\Deltavcx1 +\alphaf','\Deltayvc1','\Deltayvc1 +\alphaf','\Deltamid1','\Deltamid1 +\alphaf','\Deltapmc1','\Deltapmc1 +\alphaf','\Deltapmr1','\Deltapmr1 +\alphaf','\Deltamid1\Deltayvc1','\Deltamid1\Deltayvc1 +\alphaf'};
datos=      {WTSF , WTAF        , vcx1SF     , vcx1AF              , yvc1SF     , yvc1AF              , mid1SF     , mid1AF              , pmc1SF     , pmc1AF              , pmr1SF     , pmr1AF              , mid1yvc1             , mid1yvc1AF};
frecuencias={fWT_N, fWTAF_N     , fVCX1_N    , fVCX1AF_N           , fYVC1_N    , fYVC1AF_N           , fMID1_N    , fMID1AF_N           , fPMC1_N    , fPMC1AF_N           , fPMR1_N    , fPMR1AF_N           , fMID1YVC1_N          , fMID1YVC1AF_N};
acumuladas= {yWTSF, yWTCF       , yVCXSF     , yVCXAF              , yYVCSF     , yYVCAF              , yMIDSF     , yMIDAF              , yPMCSF     , yPMCAF              , yPMRSF     , yPMRAF              , yMIDYVC              , yMIDYVCAF};
i=13;j=14;


subplot(2,2,1) %amplitud
% ksdensity(datos{i}(:,5))
cdfplot(datos{i}(:,5))
hold on
cdfplot(datos{j}(:,5))
legend(name{i},name{j})
xlim([0 5])
xlabel('Amplitud \DeltaF/F_o')
hold off

subplot(2,2,2) %duración
cdfplot(datos{i}(:,3)-datos{i}(:,2))
hold on
cdfplot(datos{j}(:,3)-datos{j}(:,2))
legend(name{i},name{j})
xlim([0 160])
xlabel('Duración [seg]')
hold off

subplot(2,2,3) %Frecuencia
f=0:maximo;
plot(f,frecuencias{i},f,frecuencias{j})
% plot
legend(name{i},name{j})
xlim([0 20])
xlabel('Frecuencia')

subplot(2,2,4) %Frecuencia
plot(f,acumuladas{i},f,acumuladas{j})
legend(name{i},name{j})
xlim([0 20])
ylim([0 1])
grid on
xlabel('Frecuencia')







