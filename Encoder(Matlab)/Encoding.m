clc;
close all;

vector_input_data = input ('Please Enter 8 Bits Input Vector Data=');
% % [1, 1, 0, 0, 0, 1, 1, 0]
the_number_of_bit_data = 8;
lenght_meymory = 2;
old_outputs_flipflops1 = zeros (1, lenght_meymory);
new_outputs_flipflops1 = zeros (1, lenght_meymory);
output_bit_encod1 = zeros (1, the_number_of_bit_data);
old_outputs_flipflops2 = zeros(1, lenght_meymory);
new_outputs_flipflops2 = zeros(1, lenght_meymory);
output_bit_encod2 = zeros (1, the_number_of_bit_data);
mised_input_data = zeros (1, the_number_of_bit_data);
result = zeros (the_number_of_bit_data, 3);
mised_input_data = Interlevear (vector_input_data, the_number_of_bit_data);

for i = 1 : the_number_of_bit_data
    [new_outputs_flipflops1, output_bit_encod1(i)] = RCS (lenght_meymory, vector_input_data(1,i), old_outputs_flipflops1);
    old_outputs_flipflops1 = new_outputs_flipflops1;
    [new_outputs_flipflops2, output_bit_encod2(i)] = RCS (lenght_meymory, mised_input_data(1,i), old_outputs_flipflops2);
    old_outputs_flipflops2 = new_outputs_flipflops2;
end

for i = 1 : the_number_of_bit_data
    result(i, :) = [vector_input_data(1,i), output_bit_encod1(1, i), output_bit_encod2(1, i)];
end

disp(' ');
disp(' ');
disp('iformation bits')
disp(vector_input_data);
disp(' ');
disp(' ');
disp('Packages Sent=');
disp(result); 
k = fopen ('Encoding The Number Of Bit Data.txt', 'w');
fprintf (k, '%d', result);
fclose (k);
the_number_of_bit_data = the_number_of_bit_data*2;