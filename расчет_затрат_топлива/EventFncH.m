% Функция отслеживает момент прерывания процесса интегрирования
function [value,isterminal,direction] = EventFncH (t, q, p)

  r = q(7);
  Rz = 6371000;

  value = [r-Rz-100000]; % отслеживание на равенство 0
  isterminal =  [1]; % Остановить процесс интегрирования
  direction  = [0]; % с - и с +

end

