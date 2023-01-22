function [data] = Alfa (gama, the_number_of_bit_data)
    
    % <<Default>> :alfa0(s0)=1, alfa1(s1)=0, alfa0(s2)=0, alfa0(s3)=0
    alfa0 = [1,0,0,0];
    
    %Make matrix for saving 4 gama and working according to Trelis
    the_number_of_state = 4;
    gama_new = zeros(4, 4, 8);
    d = 0;
    for t = 1 : the_number_of_bit_data
        for j = 1 : the_number_of_state
            if (j==1)
                gama_new(j,1,t) = gama(j,1,t);
                gama_new(j,2,t) = 0;
                gama_new(j,3,t) = gama(j,2,t);
                gama_new(j,4,t) = 0;
            end
            
            if (j==2)
                gama_new(j,1,t) = gama(j,2,t);
                gama_new(j,2,t) = 0;
                gama_new(j,3,t) = gama(j,1,t);
                gama_new(j,4,t) = 0;
             end
            
             if (j==3)
                gama_new(j,1,t) = 0;
                gama_new(j,2,t) = gama(j,2,t);
                gama_new(j,3,t) = 0;
                gama_new(j,4,t) = gama(j,1,t);
             end
    
             if (j==4  )
                gama_new(j,1,t) = 0;
                gama_new(j,2,t) = gama(j,1,t);
                gama_new(j,3,t) = 0;
                gama_new(j,4,t) = gama(j,2,t);
             end
        end 
    end
    
    %Product Alfas for every state
    alfa = zeros (4,1,1);
    for j = 1 :  the_number_of_state
        alfa(j,1,1)=alfa0(j);
    end 
    
    for i = 1 : the_number_of_state
        for j = 1 : the_number_of_state
            d = d+gama_new(j,i,1)*alfa0(j);
        end
        alfa(i,1,2)=d;
        d=0;
    end
    
    for t = 2 : the_number_of_bit_data
        for i = 1 : the_number_of_state
            for j = 1 : the_number_of_state
                d = d+gama_new(j,i,t)*alfa(j,1,t);
            end
            alfa(i,1,t+1) = d;
            d = 0;
        end
    end
    
    %Alfa Normalized
    h = 0;
    for t = 1 : the_number_of_bit_data+1
        for j = 1 : the_number_of_state
            h = h+alfa(j,1,t);
        end 
        for j = 1 : the_number_of_state
            alfa(j,1,t) = alfa(j,1,t)/h;
        end 
        h = 0;
    end  
    data = alfa; 
end