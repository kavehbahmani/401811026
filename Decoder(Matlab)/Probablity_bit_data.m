function [data, h] = Probablity_bit_data (M_Alfa_Beta_Gama, the_number_of_bit_data)

    k = 1;
    d = 0;
    the_number_of_state = 4;
    probability_data = zeros (4, 2, the_number_of_bit_data);
    probability_zero = zeros (1, the_number_of_bit_data);
    probability_one = zeros (1, the_number_of_bit_data);
    result_decoding = zeros(1, the_number_of_bit_data);
     
     %%product probability baraye 0 ya 1 bodane every  bit data 
    for t=1:the_number_of_bit_data 
        for j=1:the_number_of_state;
      for i=1:4
      d=M_Alfa_Beta_Gama(j,i,t) ; 
      
        if(j==1&i==1)
            probability_data(j,k,t)= probability_data(j,k,t)+d;
        end 
         if(j==1&i==3)
              probability_data(j,k+1,t)= probability_data(j,k+1,t)+d;
              
         end 
         
          if(j==2&i==1)
              probability_data(j,k+1,t)= probability_data(j,k+1,t)+d;
             
          end 
          if(j==2&i==3)
              probability_data(j,k,t)= probability_data(j,k,t)+d;
             
          end 
         
           if(j==3&i==2)
              probability_data(j,k+1,t)= probability_data(j,k+1,t)+d;
             
           end 
          if(j==3&i==4)
              probability_data(j,k,t)= probability_data(j,k,t)+d;
             
          end 
         
           if(j==4&i==4)
              probability_data(j,k+1,t)= probability_data(j,k+1,t)+d;
             
           end 
          if(j==4&i==2)
              probability_data(j,k,t)= probability_data(j,k,t)+d;
             
         end 
         
         d=0;
      end
        end
    end 
      
    
     for t=1:the_number_of_bit_data
     
    for j=1:the_number_of_state
    
     for k=1:2
         if(k==1)
         
      probability_zero(1,t)= probability_zero(1,t)+ probability_data(j,k,t);
         
         else 
            probability_one(1,t) = probability_one(1,t) + probability_data(j,k,t);
         end
     end
    end
     end
     
     
     %%%hard decesion:
     for (t=1:the_number_of_bit_data)
         if ( probability_zero(1,t)> probability_one(1,t) )
             
             
         result_decoding(1,t)=0;
         else
              result_decoding(1,t)=1;
              
              
         end
     end
     %result
     data= result_decoding;
      h= probability_data;
 
     
end