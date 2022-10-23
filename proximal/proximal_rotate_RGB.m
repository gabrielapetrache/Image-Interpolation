function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % Extrage canalul rosu al imaginii.
    R = img(:,:,1);

    % Extrage canalul verde al imaginii.
    
	G = img(:,:,2);
    % Extrage canalul albastru al imaginii.
    
	B = img(:,:,3);
    % Aplica rotatia pe fiecare canal al imaginii.
    
	R = proximal_rotate(R, rotation_angle);
	G = proximal_rotate(G, rotation_angle);
	B = proximal_rotate(B, rotation_angle);

    % Formeaza imaginea finala concaten�nd cele 3 canale de culori.
	
	out = cat(3, R, G, B);
endfunction
