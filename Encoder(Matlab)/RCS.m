function [new_outputs_flipflops, output_bit_encod] = RCS (lenght_meymory, input_bit_data, old_outputs_flipflops)
    
    new_outputs_flipflops = zeros (1, lenght_meymory);
    k=0;

    for i = lenght_meymory : -1:1
        k = xor (k, old_outputs_flipflops(1,i));
    end

    input_data_the_first_flipflop = xor (k, input_bit_data);
    output_bit_encod = xor (input_data_the_first_flipflop, old_outputs_flipflops(1, lenght_meymory));

    for i = 1 : lenght_meymory-1
        if (i==1)
            new_outputs_flipflops(1,1) = input_data_the_first_flipflop;
            new_outputs_flipflops(1,2) = old_outputs_flipflops(1,1);
        else
            new_outputs_flipflops(1,i+1) = old_outputs_flipflops(1,i);
        end
    end
end