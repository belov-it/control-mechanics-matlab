%Построение двух графиков на одном
% Запустить этот скрипт после файла mainOYOZfull
hold on;
grid('on');
plot(tRes,yRes,'linestyle', '-', 'linewidth', 1, 'color','black');
plot(tResOY,yResOY,'linestyle', ':', 'linewidth', 1, 'color','black');


set(gca,'FontName','TimesNewRoman','fontsize',24);
legend('Fti = u Fmax','Fti = 1');

axis([0 90000]);
xlabel('t, c');
ylabel('y(t), м');
hold off;
