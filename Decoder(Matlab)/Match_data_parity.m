function [output] = Match_data_parity (data, parity, the_number_of_bit_data)
    
    match = zeros (1, the_number_of_bit_data);
    j = 1;
    for i = 1 : the_number_of_bit_data
        match(1,j) = data(i); 
        j = j+1;
        match(1,j) = parity(i); 
        j = j+1;
    end 
    output=match;
end