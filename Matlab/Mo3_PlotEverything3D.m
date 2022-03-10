function [] = Mo3_PlotEverything3D(xStart,yStart,zStart,xPath,yPath,zPath,vHistory, thetaHistory,phiHistory, x_min, x_max, y_min, y_max,z_min,z_max)%, ObsList)
%Function plotting mobility patterns (3D case) generated by the Mo3 mobility model, as defined in
%L. De Nardis and M.-G. Di Benedetto, "Mo3: a Modular Mobility model for
%future generation mobile wireless networks", submitted to IEEE Access
figure()
scatter3(xStart,yStart,zStart,30,'filled')
hold on
for i=1:length(xStart)
 %plot(xPath(:,i),yPath(:,i),'Color',[0.929 0.694 0.125],'LineWidth',1.5)
 plot3(xPath(:,i),yPath(:,i),zPath(:,i),'LineWidth',1.5)
 %plot3(xPath(:,i),yPath(:,i),zPath(:,i),'Color','r','LineWidth',1.5)
end
axis([x_min x_max y_min y_max z_min z_max])
grid on
xlabel('x [m]', 'FontSize',12)
ylabel('y [m]', 'FontSize',12)
zlabel('z [m]', 'FontSize',12)
% hold on
% Mo3_PlotObstacles(ObsList);
% axis([x_min x_max y_min y_max])
% grid on
% xlabel('x [m]', 'FontSize',12)
% ylabel('y [m]', 'FontSize',12)
% set(gca,'FontSize',12)
xTot=[];
yTot=[];
zTot=[];
phiTot=[];
thetaTot=[];
vTot=[];

for i=1:length(xStart)
 %plot(xPath(:,i),yPath(:,i),'Color',[0.929 0.694 0.125],'LineWidth',1.5)
 xTot=[xTot;xPath(:,i)];
 yTot=[yTot;yPath(:,i)];
 zTot=[zTot;zPath(:,i)];
 phiTot=[phiTot;phiHistory(:,i)];
 thetaTot=[thetaTot;thetaHistory(:,i)];
 vTot=[vTot;vHistory(:,i)];
 figure(10)
    plot(xPath(:,i));
    hold on
    xlabel('x [m]')
    figure(11)
    plot(yPath(:,i));
    hold on
    xlabel('y [m]')
figure(12)
    plot(zPath(:,i));
    hold on
    xlabel('z [m]')

end
figure()
histogram(xTot,'Normalization','pdf')
xlabel('x [m]')
figure()
histogram(yTot,'Normalization','pdf')
xlabel('y [m]')
figure()
histogram(zTot,'Normalization','pdf')
xlabel('z [m]')
figure()
histogram(vTot,'Normalization','pdf')
xlabel('v [m/s]')
figure()
histogram(thetaTot,'Normalization','pdf')
xlabel('theta [rad]')
figure()
histogram(phiTot,'Normalization','pdf')
xlabel('phi [rad]')
end

