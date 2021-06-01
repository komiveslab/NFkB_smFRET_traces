close all
clear

files = dir('*.dat');

for i = 1:length(files)
    file = files(i).name;
    data = importdata(file);
    [path, name, ext] = fileparts(file);
    len = length(data);
    
    fig = figure('position',[100 100 2000 400]);

    hA(1)=subplot(2,1,1);
    plot(data(:,1),data(:,2),'Color',[145,207,80]/256)
    ylabel 'Fl (a.u.)'
    hold on
    plot(data(:,1),data(:,3),'Color',[178,0,0]/256)
    axis([-inf inf -100 750])
    set(gca,'XTick',[],'FontSize',2)
    set(gca,'Fontname','Arial','FontSize',20)
    
    hA(2)=subplot(2,1,2);
    plot(data(:,1),data(:,3)./(data(:,3)+data(:,2)),'Color',[24,24,141]/256)
    ylabel 'FRET'
    xlabel 'Time (s)'
    axis([-inf inf -0.1 1.1])
    set(gca,'FontName','Arial','FontSize',20)
    p=cell2mat(get(hA,'position'));     % get the positions
    ptop=p(1,2)+p(1,4);                 % and compute to fit, adjust...
    htavg=(ptop-p(2,2))/2;
    p(:,4)=0.9*htavg;
    p(2,2)=p(1,2)-0.9*htavg;
    for i=1:2,set(hA(i),'position',p(i,:)),end
    for i=1:2,set(hA(i),'box','on'),end
    
    set(hA,'linewidth',0.5)
    
    saveas(fig, name, 'png');
    close
end

