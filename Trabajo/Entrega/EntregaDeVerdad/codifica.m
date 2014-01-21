%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:	Luis José Quintana Bolaño
%			Javier Osuna Herrera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Función que recibe un vector de ceros y unos y devuelve un valor único que
% codifica la combinación de tramos blancos (1) y negros (0) que lo componen.
%
function T=codifica(P)
	actual=P(1);
	veces=0;
	vecesold=0;
	seccion=1;
	prim=[2 3 5 7 11];
	T=0;Told=0;
    for i=1:10
    	if actual == 0 && P(i) ~=0 || P(i) == 0 && actual~=0 %Actual y P son distintos
        	if(veces>3)	%Es largo
            	if(actual~=0)	%y blanco
            		Told=T;
                	T=T+(prim(seccion)*1);
            	else			%y negro
            		Told=T;
                	T=T+(prim(seccion)*2);
            	end
            	actual=P(i);
        		vecesold=veces;
        		veces=1;
        		seccion=seccion+1;
        	else		%Es corto
        		if(veces>0 && actual~=0 || veces>1 && actual==0)
        			if (actual~=0)%y blanco
        				Told=T;
        				T=T+(prim(seccion)*3);
        			else		  %y negro
        				Told=T;
        				T=T+(prim(seccion)*4);
        			end
        			actual=P(i);
        			vecesold=veces;
        			veces=1;
        			seccion=seccion+1;
        		else	%El anterior era un solo 0 suelto y se deshace
        			veces=vecesold+1;
        			T=Told;
        			actual=P(i);
        			if(seccion>1)
        				seccion=seccion-1;
        			end
        		end	
        	end
        else %A y P son iguales
        	veces=veces+1;
		end
    end
    %#########################Ultima seccion
    if seccion==5
    	%<<<<<<<<<<<<<<<< Valor para la única combinación de 5 >>>>>>>>>>>>>>>>%
    	T=90
    else
    if(veces>3) %Es largo
        if(actual~=0) %Es blanco
        	T=T+(prim(seccion)*1);
        else   %Es negro
            T=T+(prim(seccion)*2);
        end
    else %es corto
        if(veces>0 && actual~=0 || veces>1 && actual==0)
        	if (actual~=0) %Es blanco
        		T=T+(prim(seccion)*3);
        	else	%Es negro
        		T=T+(prim(seccion)*4);
        	end
        end
    end
    end
    %#######################################
    
end
