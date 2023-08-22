% Функция отслеживает момент прерывания процесса интегрирования
function [value,isterminal,direction] = EventFnc (t, q, p)

  z = q(3);
  dz = q(6);

  value = [z*dz]; % отслеживание на равенство 0
  isterminal =  [1]; % Остановить процесс интегрирования
  direction  = [0]; % с - и с +

end

