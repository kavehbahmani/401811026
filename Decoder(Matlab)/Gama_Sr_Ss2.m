function [data ] = Gama_Sr_Ss2 (probeblity_generate_1_by_source, probeblity_generate_0_by_source, probeblity_cahnnel, the_number_of_bit_data, input_data_decoder)
    the_number_of_state = 4;
    
    %Trelis Variable
    a1 = [0, 0, 1];
    a2 = [0, 0, 3];
    b1 = [0, 1, 4];
    b2 = [0, 1, 2];
    c1 = [1, 0, 2];
    c2 = [1, 0, 4];
    d1 = [1, 1, 3];
    d2 = [1, 1, 1];
    L1 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L2 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L3 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L4 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L5 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L6 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L7 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L8 = [a1, d1; a2, d2; b1, c1; b2, c2];
    L9 = [a1, d1; a2, d2; b1, c1; b2, c2];
    
    trilis(:,:,1) = L1;
    trilis(:,:,2) = L2;
    trilis(:,:,3) = L3;
    trilis(:,:,4) = L4;
    trilis(:,:,5) = L5;
    trilis(:,:,6) = L6;
    trilis(:,:,7) = L7;
    trilis(:,:,8) = L8;
    trilis(:,:,9) = L9;
    
    %Probablity Channel Matrix
    probablity_channel = [(1-probeblity_cahnnel)^2, (1-probeblity_cahnnel)*probeblity_cahnnel, (1-probeblity_cahnnel)*probeblity_cahnnel, probeblity_cahnnel*probeblity_cahnnel;
    probeblity_cahnnel*(1-probeblity_cahnnel), (1-probeblity_cahnnel)^2, probeblity_cahnnel*probeblity_cahnnel,probeblity_cahnnel*(1-probeblity_cahnnel);
    probeblity_cahnnel*(1-probeblity_cahnnel), probeblity_cahnnel*probeblity_cahnnel, (1-probeblity_cahnnel)^2, (1-probeblity_cahnnel)*probeblity_cahnnel;
    probeblity_cahnnel^2, probeblity_cahnnel*(1-probeblity_cahnnel), probeblity_cahnnel*(1-probeblity_cahnnel), (1-probeblity_cahnnel)^2];
    
    %Gama product for every  state
    gama = zeros (the_number_of_state, 2, the_number_of_bit_data);
    a = zeros (2);
    i = 1;
    for t = 1 : (the_number_of_bit_data)
        for j = 1 : the_number_of_state
            for k = 1 : 2
                if (k==1)
                    for p = 1 : 2
                        a(p) = trilis(j,p,t);
                    end
                    
                    if (~a(1) && ~a(2)==1)
                        f = 1;
                    elseif (~a(1)&& a(2)==1)
                        f = 2;
                     elseif (a(1)&&~a(2)==1)
                        f = 3;
                    else
                        f = 4;
                    end
                    
                    if (~input_data_decoder(i) && ~input_data_decoder(i+1)==1)
                        z = 1;
                    elseif (~input_data_decoder(i) && input_data_decoder(i+1)==1)
                        z = 2;
                    elseif (input_data_decoder(i) && ~input_data_decoder(i+1)==1)
                        z = 3;
                    else
                        z = 4;
                    end
                    gama(j,k,t) = probeblity_generate_0_by_source*probablity_channel(f,z);
                else
                    for p = 4 : 5
                        a(p-3) = trilis(j,p,t);
                    end
                    
                    if (~a(1) && ~a(2)==1)
                        f = 1;
                    elseif (~a(1) && a(2)==1)
                        f = 2;
                     elseif (a(1) && ~a(2)==1)
                        f = 3;
                    else
                        f = 4;
                    end
                    
                    if (~input_data_decoder(i) && (~input_data_decoder(i+1))==1)
                        z = 1;
                    elseif (~input_data_decoder(i) && input_data_decoder(i+1)==1)
                        z = 2;
                    elseif (input_data_decoder(i) && (~input_data_decoder(i+1))==1)
                        z = 3;
                    else
                        z = 4;
                    end
                    gama(j,k,t) = probeblity_generate_1_by_source*probablity_channel(f,z);
                end
            end
        end
        i=i+2;
    end
    
    for i=2:4
        gama(i,:,1)=0;
    end 
    gama(2,:,2)=0;
    gama(4,:,2)=0;
    
    %result
    data=gama;                            
end