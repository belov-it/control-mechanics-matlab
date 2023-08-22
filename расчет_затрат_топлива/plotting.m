%Построение двух графиков на одном
% Запустить этот скрипт после файла mainOYOZfull
hold on;
grid('on');
plot(tRes,Fd,'linestyle', '-', 'linewidth', 1, 'color','black');
plot(tResN,FdNo,'linestyle', ':', 'linewidth', 1, 'color','black');


set(gca,'FontName','TimesNewRoman','fontsize',24);
legend('Fti = u Fmax','Fti = 1');

axis([0 99000]);
xlabel('t, c');
ylabel('F(t), Н');
hold off;
