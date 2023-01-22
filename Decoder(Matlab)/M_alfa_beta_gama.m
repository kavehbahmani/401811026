function [M_Alfa_Beta_Gama] = M_alfa_beta_gama (alfa,beta,gama, the_number_of_bit_data)

    the_number_of_state = 4;
    data = zeros (the_number_of_state, 4, the_number_of_bit_data);
    
    %Gama*ALFA*BETA for every state in the Trelis
    for t = 1 : the_number_of_bit_data
        for j = 1 : the_number_of_state
            for i = 1 : 4
                data(j,i,t) = gama(j,i,t)*alfa(j,1,t)*beta(i,1,t+1);
            end 
        end
    end

    h=0;
    for t = 1 : the_number_of_bit_data     
        for j = 1 : the_number_of_state
            for i = 1 : 4
                h = h+data(j,i,t); 
            end
        end
         
         %Normalized
         for j = 1 : the_number_of_state
             for i = 1 : 4
                data(j,i,t) = data(j,i,t)/h;
             end 
         end
         h=0;
    end 

    %result
    M_Alfa_Beta_Gama = data;
end