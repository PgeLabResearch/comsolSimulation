
%% nanoparticles in water phase

%  load('Data_stablization.mat');


%%
clc
close all
figW=15;
ndiagr=2;  % hang
ndiagc=2;  %lie
gapL=1.5; % gap between subplot and left boundary
gapR=0.5; % gap between subplot and right boundary
gapC=1.5; % gap between columns
gapH=1.5; % gap between subplots
gapB=1.2; % gap between subplot and  bottom
gapT=0.5; % gap between subplot and  top

% locationsub=zeros(ndiagr,ndiagc,4);
[locationsub,figH]=figure_subplot_locations(ndiagr,ndiagc,figW,gapL,gapR,gapC,gapB,gapT,gapH);
figure('units','centimeters','position',[0 2 figW figH]); hold on
fileNumber = [4, 2, 1, 0];

%% basic parameters of Breakthrough - TCE
fonts=12; tpv = 474.71; injectConcentration = 1e-6;
subplot(ndiagr,ndiagc,1,'position',locationsub(2,1,:));
for i = 1 : length(fileNumber)
    names=['E:\0 Comsol - t\Data\Permeability_contrast\TCE-BreakthroughCurve\',num2str(fileNumber(i)), '.txt'];
    tc = load(names);
    if i==5
        plot(tc(:, 1)./tpv, tc(:, 2)./injectConcentration,'linewidth',1.5,...
        'DisplayName',['log(k_2/k_1) =  ',num2str(fileNumber(i))]);
        hold on;
    else
       plot(tc(:, 2)./tpv, tc(:, 3)./injectConcentration,'linewidth',1.5,...
        'DisplayName',['log(k_2/k_1) =  ',num2str(fileNumber(i))]);
        hold on; 
    end
end

xlim([0 4.5]);set(gca,'XTick',[0:1:5]);
ylim([0 2.0]);set(gca,'YTick',[0:0.5:2.0]);
ylabel ('c$_{out}/c_{init}$, - ','Interpreter','latex');
xlabel('PV, -','Interpreter','latex');
set(gca,'FontSize',fonts,'FontName','Times New Roman');
legend1=legend(gca,'show');
box(gca,'on');
set(legend1,'box','off');




%% basic parameters of Retention
fonts=12; tpv = 474.71; initialMass = 2.3597e-4;
subplot(ndiagr,ndiagc,2,'position',locationsub(2,2,:));
for i = 1 : length(fileNumber)
    names=['E:\0 Comsol - t\Data\Permeability_contrast\TCE-Retention\',num2str(fileNumber(i)), '.txt'];
    tc = load(names);
    
    if i == 5
        plot(tc(:, 1)./tpv, tc(:, 2)./initialMass,'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    else
         plot(tc(:, 2)./tpv, tc(:, 3)./initialMass,'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    end
    hold on;

end

xlim([0 4.5]);set(gca,'XTick',[0:1:5]);
ylim([0 1.5]);set(gca,'YTick',[0:0.3:1.5]);
ylabel ('$m_{retention}/m_{init}$, - ','Interpreter','latex');
xlabel('PV, -','Interpreter','latex');
set(gca,'FontSize',fonts,'FontName','Times New Roman');
% legend1=legend(gca,'show');
% box(gca,'on');
% set(legend1,'box','off');



%% basic parameters of Reacted  TCE
fonts=12; tpv = 474.71; initialMass = 2.3597e-4;
subplot(ndiagr,ndiagc,3,'position',locationsub(1,1,:));
for i = 1 : length(fileNumber)
    names=['E:\0 Comsol - t\Data\Permeability_contrast\TCE-ReactedMass\',num2str(fileNumber(i)), '.txt'];
    tc = load(names);
    if i == 5
        plot(tc(:, 1)./tpv, (tc(:, 2) - tc(1,2))./initialMass,'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    else
        plot(tc(:, 2)./tpv, (tc(:, 3) - tc(1,3))./initialMass,'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    end
    
    hold on;

end

xlim([0 4.5]);set(gca,'XTick',[0:1:5]);
ylim([0 0.04]);set(gca,'YTick',[0:0.01:0.04]);
ylabel ('$m_{reacted}/m_{init}$, - ','Interpreter','latex');
xlabel('PV, -','Interpreter','latex');
set(gca,'FontSize',fonts,'FontName','Times New Roman');
% legend1=legend(gca,'show');
% box(gca,'on');
% set(legend1,'box','off');





%% basic parameters of Retention NP
fonts=12; tpv = 474.71; initialMass = 2.3597e-4;
subplot(ndiagr,ndiagc,4,'position',locationsub(1,2,:));
for i = 1 : length(fileNumber)
    names=['E:\0 Comsol - t\Data\Permeability_contrast\NP-RetentionMassLowPM\',num2str(fileNumber(i)), '.txt'];
    tc = load(names);
    
    if i == 5
        plot(tc(:, 1)./tpv, tc(:, 2),'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    else
         plot(tc(:, 2)./tpv, tc(:, 3),'linewidth',1.5,...
            'DisplayName',['No. ',num2str(i)]);
    end
    hold on;

end

xlim([0 4.5]);set(gca,'XTick',[0:1:5]);
ylim([0 25e-4]);
ylabel ('$m_{np}$, mol/L ','Interpreter','latex');
xlabel('PV, -','Interpreter','latex');
set(gca,'FontSize',fonts,'FontName','Times New Roman');
% legend1=legend(gca,'show');
% box(gca,'on');
% set(legend1,'box','off');



%% basic parameters of Breakthrough - np
fonts=12; tpv = 474.71; npinjectConcentration = 8e-6;


s={'(a)','(b)','(c)','(d)','(e)','(f)'};


annotation(gcf,'textbox',[0.10 0.92 0.05 0.05],...
          'FontName','Times New Roman',...
          'String','(a)','LineStyle','none','FontSize',fonts+2);

      annotation(gcf,'textbox',[0.58 0.92 0.05 0.05],...
          'FontName','Times New Roman',...
          'String','(b)','LineStyle','none','FontSize',fonts+2);

      annotation(gcf,'textbox',[0.10 0.42 0.05 0.05],...
          'FontName','Times New Roman',...
          'String','(c)','LineStyle','none','FontSize',fonts+2);

      annotation(gcf,'textbox',[0.58 0.42 0.05 0.05],...
          'FontName','Times New Roman',...
          'String','(d)','LineStyle','none','FontSize',fonts+2);

      print('Permeability_contrast','-dpng')
% for i=1:3
%           annotation(gcf,'textbox',[ (i - 1) * 0.32 + 0.08 0.85 0.05 0.05],...
%           'FontName','Times New Roman',...
%           'String',s(i),'LineStyle','none','FontSize',fonts+2);
% end

% print('Permeability_contrast','-dpng')
% 
% %% 
% subplot(ndiagr,ndiagc,1,'position',locationsub(3,1,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
% %     lt=find((xt+0.00001)*tpv>timee & timee>xt*tpv);
%     lt = floor(xt * tpv)+1;
%     ltt=lt;
% %     if sum(lt)<1
% %         lt=find((xt+0.0001)*tpv>timee & timee>xt*tpv);
% %     end
%     
%     plot(xvec./data.L,RRG(ltt,:),'linewidth',1.5,...
%         'color',colmap(i,:));
%     hold on;
% end
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% %     title('(a)','Fontsize',fonts+5)
%     ylabel 'r_g'
% %     ylim([0 1.2]); set(gca,'YTick',[0:0.2:1.2]);
%     set(gca,'XTick',[0:0.2:1]);
% %     xlabel 'x/L', 
%     set(gca,'xticklabel','');
% %     set(gca,'yticklabel','');
% %     legend1=legend('show');
%     
% %     hh(1)=gapL*0.7/figW;
% % hh(2)=1/figW+0.47;
% % hh(3)=(figW-gapL-gapR)/figW;
% % hh(4)=1/figW;
% % set(legend1,'FontSize',fonts-2,'Position',hh,'Orientation','horizontal','box','off','NumColumns',5);
% 
% 
% 
% %% 
% subplot(ndiagr,ndiagc,2,'position',locationsub(3,2,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
% %     lt=find((xt+0.00001)*tpv>timee & timee>xt*tpv);
%     lt = floor(xt * tpv)+1;
%     ltt=lt;
%     
%     plot(xvec./data.L,RRC(ltt,:),'linewidth',1.5,...
%         'color',colmap(i,:));
%     hold on;
% end
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% %     title('(a)','Fontsize',fonts+5)
%     ylabel 'r_c'
% %     ylim([0 1.2]); set(gca,'YTick',[0:0.2:1.2]);
%     set(gca,'XTick',[0:0.2:1]);
% %     xlabel 'x/L', 
%     set(gca,'xticklabel','');
% %     set(gca,'yticklabel','');
% %     legend1=legend('show');
%     
% %     hh(1)=gapL*0.7/figW;
% % hh(2)=1/figW+0.47;
% % hh(3)=(figW-gapL-gapR)/figW;
% % hh(4)=1/figW;
% % set(legend1,'FontSize',fonts-2,'Position',hh,'Orientation','horizontal','box','off','NumColumns',5);
%     
% 
% 
% %% 
% subplot(ndiagr,ndiagc,3,'position',locationsub(2,1,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
% %     lt=find((xt+0.00001)*tpv>timee & timee>xt*tpv);
%     lt = floor(xt * tpv)+1;
%     ltt=lt;
% %     if sum(lt)<1
% %         lt=find((xt+0.0001)*tpv>timee & timee>xt*tpv);
% %     end
%     
%     plot(xvec./data.L,SSW(ltt,:)./Sw0,'linewidth',1.5,...
%         'color',colmap(i,:));
%     hold on;
% end
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% %     title('(a)','Fontsize',fonts+5)
%     ylabel 'S_w/S_{w0}'
% %     ylim([0 1.2]); set(gca,'YTick',[0:0.2:1.2]);
%     set(gca,'XTick',[0:0.2:1]);
% %     xlabel 'x/L', 
%     set(gca,'xticklabel','');
% %     set(gca,'yticklabel','');
% %     legend1=legend('show');
%     
% %     hh(1)=gapL*0.7/figW;
% % hh(2)=1/figW+0.47;
% % hh(3)=(figW-gapL-gapR)/figW;
% % hh(4)=1/figW;
% % set(legend1,'FontSize',fonts-2,'Position',hh,'Orientation','horizontal','box','off','NumColumns',5);
%     
%%
% %%%
% subplot(ndiagr,ndiagc,4,'position',locationsub(2,2,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
%     lt = floor(xt * tpv)+1;
%     ltt=lt;
%     plot(xvec./data.L,NF(ltt,:),'linewidth',1.5,...
%         'color',colmap(i,:));
%     hold on, 
% end
%     ylabel 'n_f, bubble/m^3'
%     set(gca,'XTick',[0:0.2:1])
%     ylim([0 15e7]);
%     set(gca,'YTick',[0:3e7:15e7])
% %     xlabel 'x/L', 
%     set(gca,'xticklabel','');
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% %%
% %%%%%%
% subplot(ndiagr,ndiagc,5,'position',locationsub(1,1,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
%         lt = floor(xt * tpv)+1;
%     ltt=lt;
%     nc=ltt;
% %     plot(xvec./data.L,(CCW(nc,:).*UUW(nc,:))/(CCW(260000,1)*UUW(floor(tmax/dt),1)),...
% %         'linewidth',1.5,'color',mycolor(i));
%         plot(xvec./data.L,(CCW(nc,:).* SSW(nc, :))/(CCW(52,1)),...
%         'linewidth',1.5,'color',colmap(i,:));
%     hold on, 
% end
%     ylabel 'c_wS_w/c_{inj}',
%     set(gca,'XTick',[0:0.2:1]);
%        xlabel 'x/L', 
% %     set(gca,'XTick',[0:0.2:1]);
%   ylim([0 1.5]);set(gca,'YTick',[0:0.3:1.5]);
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% %     set(gca,'xticklabel','');
% %     set(gca,'yticklabel','');
%   
% % %%
% subplot(ndiagr,ndiagc,6,'position',locationsub(1,2,:));
% for i=1:length(PPVV)
%     xt=PPVV(i);
%         lt = floor(xt * tpv)+1;
%     ltt=lt;
%     nc=ltt;
%     plot(xvec./data.L,(CCG(nc,:).* SSG(nc, :))/(CCW(52,1)),...
%         'linewidth',1.5,...
%         'color',colmap(i,:));
% %         plot(xvec./data.L,(CCG(nc,:).*UUG(nc,:))/(CCW(260000,1)*UUW(floor(tmax/dt),1)),...
% %         'linewidth',1.5,...
% %         'color',mycolor(i));
%     hold on, 
% end
%     ylabel 'c_gS_g/c_{inj}',
%     set(gca,'XTick',[0:0.2:1]);
%        xlabel 'x/L', 
% %     set(gca,'XTick',[0:0.2:1]);
%     ylim([0 1.5]);set(gca,'YTick',[0:0.3:1.5]);
%     set(gca,'FontSize',fonts,'FontName','Times New Roman');
% 
% 


%   legend2=legend('show');
    
    
% hh(1)=gapL*1/figW;
% hh(2)=1/figW;
% hh(3)=(figW-gapL-gapR)/figW;
% hh(4)=1/figW*0.5;
% set(legend2,'FontSize',fonts-2,'Position',hh,'Orientation','horizontal','box','off','NumColumns',5);



% sspv=['{','''',' ','''',','];
% for kkk=1:length(PPVV)
%     sspv=[sspv,'''',num2str(PPVV(kkk)),'',''''];
%     if kkk ~=length(PPVV)
%        sspv=[sspv,','];
%     end
% end
% sspv=[sspv,'}'];
% 
% for kkk=1:length(PPVV)+1
%     TPV(kkk)=1/length(PPVV)*kkk-1/length(PPVV)*1.5;
% end
% 
% colormap(colmap);
% 
% % colormap(gca,newmap)
% color1=colorbar(gca,'southoutside','Position',hh,'FontSize',12,...
%      'Ticks',TPV,'TickDirection','out','TickLabels',eval(sspv),...
%     'FontName','Times New Roman',...
%     'Direction','normal','FontSize',fonts);
% 
% hh1(1)=gapL*0.2/figW;
% hh1(2)=1.1/figW;
% hh1(3)=(figW-gapL-gapR)/figW;
% hh1(4)=1/figW*0.5;
%  annotation(gcf,'textbox',hh1,...
%           'FontName','Times New Roman',...
%           'String','PV, (-)','LineStyle','none','FontSize',fonts);


% color1=colorbar('peer',gca,'southoutside','Position',hh,'Ticks',PPVV,...
%          'TickLabels',sspv,'FontSize',12,...
%     'FontName','Times New Roman',...
%     'Direction','reverse');

% tightfig(gcf)


% set(color1);

% print('Verification_extend','-depsc')
% print('NP_Foam_Delivery_Extend','-dpng')
%     