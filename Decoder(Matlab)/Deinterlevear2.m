function [mised_input_data] = Deinterlevear2 (vector_input_data, the_number_of_bit_data)
    
    mised_input_data = zeros (1, the_number_of_bit_data);
    mised_input_data(1,:) = [vector_input_data(1,8), vector_input_data(1,1), vector_input_data(1,2), vector_input_data(1,6), vector_input_data(1,3), vector_input_data(1,4), vector_input_data(1,5), vector_input_data(1,7)];
end

