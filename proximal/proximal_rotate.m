function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplic�nd Interpolare Proximala.
    % rotation_angle este exprimat �n radiani.
    % =========================================================================
    [m n nr_colors] = size(I);

    I = cast(I, "double");
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci c�nd se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % �n Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza �n indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici �n intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
	cos_angle = cos(rotation_angle);
	sin_angle = sin(rotation_angle);

    % TODO: Initializeaza matricea finala.
	R = zeros(m, n);

    % TODO: Calculeaza matricea de transformare.
	T = [cos_angle, -sin_angle; sin_angle, cos_angle];

    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
	T_inv = inv(T);


    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
			v = T_inv * [x; y];
            x_p = v(1);
            y_p = v(2);

            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] �n
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
			x_p = x_p + 1;
			y_p = y_p + 1;


            % TODO: Daca xp sau yp se afla �n exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.

			if (x_p > n || y_p > m || x_p < 1 || y_p < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif

			x1 = fix(x_p);
			x2 = x1 + 1;
			y1 = fix(y_p);
			y2 = y1 + 1;
		
			if y_p == m
			  y2 = m;
			  y1 = y2 - 1;
			endif
		  
			if x_p == n
			  x2 = n;
			  x1 = x2 - 1;
			endif

            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara �n care sau se calculeze coeficientii,
            % conform formulei.
			coef = proximal_coef(I, x1, y1, x2, y2);

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
			R(y + 1, x + 1) = coef(1) + coef(2) * x_p + coef(3) * y_p + coef(4) * x_p * y_p;

        endfor
    endfor

    % TODO: Transforma matricea rezultata �n uint8 pentru a fi o imagine valida.
    
	R = cast(R, "uint8");

endfunction
