function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % Obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % Fa cast matricii I la double
    I = cast(I, "double");

    % Calculeaza matricea cu derivate fata de x Ix
    for y = 1 : m
      for x = 1 : n
        Ix(y, x) = fx(I, x, y);
      endfor
    endfor

    % Calculeaza matricea cu derivate fata de y Iy
    for y = 1 : m
      for x = 1 : n
        Iy(y, x) = fy(I, x, y);
      endfor
    endfor
    
    % Calculeaza matricea cu derivate fata de xy Ixy
    for y = 1 : m
      for x = 1 : n
        Ixy(y, x) = fxy(I, x, y);
      endfor
    endfor
    
endfunction
