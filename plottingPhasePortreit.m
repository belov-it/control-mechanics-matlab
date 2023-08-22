%Построение фазового портрета

hold on;
grid('on');

plot(zRes,dzRes,'linestyle', '-', 'linewidth', 1, 'color','black');
set(gca,'FontName','TimesNewRoman','fontsize',24);
%legend('z(z)');
%axis([0 22000 9.939 10.041]);
xlabel('z(t), м');
ylabel('z(t), м/с');
hold off;
