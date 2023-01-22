function [data, parity1,parity2] = Demultiplex (received, the_number_of_bit_data)
    data = zeros (1, the_number_of_bit_data);
    parity1 = zeros (1, the_number_of_bit_data);
    parity2 = zeros (1, the_number_of_bit_data);
    g = the_number_of_bit_data*3;
    j = 1;
    for i = 1 : 3 : g    
        data(1,j) = received(1,i);
        j = j+1;
    end
    
    j = 1;
    for i = 2 : 3 : g    
        parity1(1,j) = received(1,i);
        j = j+1; 
    end
    
    j = 1;
    for i = 3 : 3 : g   
        parity2(1,j) = received(1,i);
        j = j+1;
    end
end