function [data1, data2] = Beta (gama, the_number_of_bit_data)

    %Default : beta*the_number_of_bit_data+1*(s0) = .025, beta*the_number_of_bit_data+1*(s1) = .025
    %Default : beta*the_number_of_bit_data+1*(s2) = .025, beta*the_number_of_bit_data+1*(s3) = .025
    beta0 = [.25,0.25,0.25,0.25];
    
    %Make matrix for saving 4 gama and working according to Trelis
    the_number_of_state = 4;
    d = 0;
    gama_new = zeros (4, 4, 8);
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
                gama_new(j,1,t)=0;
                gama_new(j,2,t)=gama(j,2,t);
                gama_new(j,3,t)=0;
                gama_new(j,4,t)=gama(j,1,t);
            end
            
            if (j==4  )
                gama_new(j,1,t)=0;
                gama_new(j,2,t)=gama(j,1,t);
                gama_new(j,3,t)=0;
                gama_new(j,4,t)=gama(j,2,t);
            end
        end 
    end
    
    %Product Betas for every state
    beta = zeros (4,1,9);   
    for j = 1 : the_number_of_state
        beta(j,1,the_number_of_bit_data+1) = beta0(j);
    end 
    
    for i = 1 : the_number_of_state
        for j = 1 : the_number_of_state
            d = d+gama_new(i,j,the_number_of_bit_data)*beta0(j);
        end
        beta(i,1,the_number_of_bit_data) = d;
        d = 0;
    end
    
    for t = the_number_of_bit_data-1 : -1 : 1
        d = 0;
        for i = 1 : the_number_of_state
            for j = 1 : the_number_of_state
                d = d+gama_new(i,j,t)*beta(j,1,t+1);
            end
            beta(i,1,t) = d;
            d = 0;
        end
    end
    
    %Beta Normalized
    h = 0;
    for t = 1 : the_number_of_bit_data+1
        for j = 1 : the_number_of_state
            h = h+beta(j,1,t);
        end
    
        for j = 1 : the_number_of_state
            beta(j,1,t) = beta(j,1,t)/h;
        end 
        h = 0;
    end  
    data1 = beta;
    data2 = gama_new;
end