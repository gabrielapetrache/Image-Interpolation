function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: calculeaza derivata
    [m n aux] = size(f);
    if x == n || x == 1 || y == m || y == 1
      r = 0;
      return;
    endif
    
    r = (f(y - 1, x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1, x - 1)) / 4;
    
endfunction