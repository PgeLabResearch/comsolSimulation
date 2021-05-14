function [locationsub,figH]=figure_subplot_locations(ndiagr,ndiagc,figW,gapL,gapR,gapC,gapB,gapT,gapH)

% Size of the figure
% ==================
% ndiagr=2;  % hang
% ndiagc=2;  %lie
% nsubplot=4;
% %ffigure_size_v1(nsubplot,ndiagr)
% % figW = 19.0/2;     % [cm] figure width - one colum or two-column see journal specifications
% figW = 20;     % [cm] figure width - one colum or two-column see journal specifications
% 
% gapL=2; % gap between subplot and left boundary
% gapR=1; % gap between subplot and right boundary
% gapC=2; % gap between columns
% gapB=3; % gap between subplot and  bottom
% gapT=2; % gap between subplot and  top
% gapH=1; % gap between subplots

% calculate subplot dimensions from figure size and gaps
subW  = (figW-gapL-gapR-(ndiagc-1)*gapC)/ndiagc; % gap between columns

% ra=subW/figW;
% calculate the subplot height specifying an aspect ratio
subH = 1.0*subW;
% calculate figure heigth assuming nsubplot subplots
figH = gapB + ndiagr*subH + (ndiagr-1)*gapH + gapT;
% calculate the position of the bottom left corner of each subplot
% Note that this has to be relative to the figure size
locationsub=zeros(ndiagr,ndiagc,4);
for j=1:ndiagr %hang
    for i=1:ndiagc %lie
        xsub = (gapL+subW*(i-1)+gapC*(i-1))/figW;
        ysub = (gapB+subH*(j-1)+gapH*(j-1))/figH;
%         locationsub(ndiagr+1-j,i,:)=[xsub ysub subW/figW subH/figH
        locationsub(j,i,:)=[xsub ysub subW/figW subH/figH];
    end
end
