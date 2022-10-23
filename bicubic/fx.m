function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================
	
    % Calculeaza derivata.
	[m n aux] = size(f);
    if x == n || x == 1
      r = 0;
      return;
    endif
    
    r = (f(y, x + 1) - f(y, x - 1)) / 2;
end