function T=codifica(P)
	actual=P(1);
	veces=0;
	vecesold=0;
	%total=0;
	seccion=1;
	prim=[2 3 5 7 11];
	T=0;Told=0;
    for i=1:10
    %-----------------------P1
    	if actual == 0 && P(i) ~=0 || P(i) == 0 && actual~=0 %Actual y P son distintos
        	if(veces>3) %Es largo
            	if(actual~=0) %Es blanco
            		Told=T;
                	T=T+(prim(seccion)*1);
            	else   %Es negro
            		Told=T;
                	T=T+(prim(seccion)*2);
            	end
            	actual=P(i);
        		vecesold=veces;
        		veces=1;
        		seccion=seccion+1;
        	else %es corto
        		if(veces>0 && actual~=0 || veces>1 && actual==0)
        			if (actual~=0) %Es blanco
        				Told=T;
        				T=T+(prim(seccion)*3);
        			else	%Es negro
        				Told=T;
        				T=T+(prim(seccion)*4);
        			end
        			actual=P(i);
        			vecesold=veces;
        			veces=1;
        			seccion=seccion+1;
        		else
        			veces=vecesold+1;
        			T=Told;
        			actual=P(i);
        			if(seccion>1)
        				seccion=seccion-1;
        			end
        		end	
        	end
        else
        	veces=veces+1;
		end
    end
    %#########################Ultimo tramo
    if seccion==5
    	%<<<<<<<<<<<<<<<< Valor para la única combinación de 5 >>>>>>>>>>>>>>>>%
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
