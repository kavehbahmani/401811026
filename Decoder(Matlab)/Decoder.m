clc;
clear;

data_input_decoder = input ('Please Enter Decoder Input Data ==');
%[1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0]

probeblity_generate_1_by_source = 0.5;
probeblity_generate_0_by_source = 0.5;
probeblity_cahnnel = 0.1;
the_number_of_bit_data = 8;

%Depated Data, Parity1, and Parity2
[data_bit, parity1, parity2] = Demultiplex (data_input_decoder, the_number_of_bit_data);
data_bit2 = data_bit;

%Data bits and parity1 matched and push to Decoder1
for iteration = 1 : 20
    data_inpt_decoder_1=Match_data_parity(data_bit, parity1, the_number_of_bit_data);
 
    %Gama Product 
    gama1 = Gama_Sr_Ss2(probeblity_generate_1_by_source, probeblity_generate_0_by_source, probeblity_cahnnel, the_number_of_bit_data, data_inpt_decoder_1);
    
    %Alfa Product
    ALfa = Alfa(gama1, the_number_of_bit_data);
    
    %Beta Product 
    [beta, gama_new] = Beta(gama1, the_number_of_bit_data);
    
    %(Gama*Alfa*Beta) for every state in the Trelis
    M_Alfa_Beta_Gama = M_alfa_beta_gama(ALfa,beta,gama_new, the_number_of_bit_data);
    
    %Probablity for every bit data in the Trelis 
    result1 = Probablity_bit_data(M_Alfa_Beta_Gama, the_number_of_bit_data);
    
    %Interlevear Decoder1 and uses as a Decoder2 input
    data_bit_interlevear = Interlevear_decoder(result1, the_number_of_bit_data);
    
    %Matched Interlevear Decoder1 and Parity2 and giving to Decoder2
    data_inpt_decoder_2 = Match_data_parity(data_bit_interlevear, parity2, the_number_of_bit_data);
    %Start BCJR
    gama2 = Gama_Sr_Ss2(probeblity_generate_1_by_source, probeblity_generate_0_by_source, probeblity_cahnnel, the_number_of_bit_data, data_inpt_decoder_2);
    ALfa2 = Alfa(gama2, the_number_of_bit_data);
    [beta2,gama_new2] = Beta(gama2, the_number_of_bit_data);
    M_Alfa_Beta_Gama22 = M_alfa_beta_gama(ALfa2, beta2, gama_new2, the_number_of_bit_data);
    result2 = Probablity_bit_data(M_Alfa_Beta_Gama22,the_number_of_bit_data);

    %Deinterleaver Decoder2 
    data_bit_deinterlevear = Deinterlevear2(result2, the_number_of_bit_data);
    data_bit = data_bit_deinterlevear;
end
disp( ' ');
disp( ' ');
disp( ' ');
disp( ' ');
disp('Received codword=')
disp( data_bit2);     
disp( ' ');
disp( ' ');
disp( ' ');
disp('Result_Decoding Codword=')   
disp(data_bit);