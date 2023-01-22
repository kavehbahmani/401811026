function [mised_input_data] = Interlevear_decoder (vector_input_data, the_number_of_data)
     
    mised_input_data = zeros (1, the_number_of_data);
    mised_input_data(1,:) = [vector_input_data(1,2), vector_input_data(1,3), vector_input_data(1,5), vector_input_data(1,6), vector_input_data(1,7), vector_input_data(1,4), vector_input_data(1,8), vector_input_data(1,1)];     
end