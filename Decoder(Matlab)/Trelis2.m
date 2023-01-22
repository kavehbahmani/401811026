function [ data_trilis,trelis_full] = Trelis2(state_old,input_data_encoder,iteration)
%%data_out_trilis=[c1,c2,new_state];
a1=[0,0,1];
a2=[0,0,3];
b1=[0,1,4];
b2=[0,1,2];
c1=[1,0,2];
c2=[1,0,4];
d1=[1,1,3];
d2=[1,1,1];
L1=[a1,d1;a2,d2;b1,c1;b2,c2];
L2=[a1,d1;a2,d2;b1,c1;b2,c2];
L3=[a1,d1;a2,d2;b1,c1;b2,c2];
L4=[a1,d1;a2,d2;b1,c1;b2,c2];
L5=[a1,d1;a2,d2;b1,c1;b2,c2];
L6=[a1,d1;a2,d2;b1,c1;b2,c2];
L7=[a1,d1;a2,d2;b1,c1;b2,c2];
L8=[a1,d1;a2,d2;b1,c1;b2,c2];
L9=[a1,d1;a2,d2;b1,c1;b2,c2];
 
trilis(:,:,1)=L1;
trilis(:,:,2)=L2;
trilis(:,:,3)=L3;
trilis(:,:,4)=L4;
trilis(:,:,5)=L5;
trilis(:,:,6)=L6;
trilis(:,:,7)=L7;
trilis(:,:,8)=L8;
trilis(:,:,9)=L9;


    if(input_data_encoder==0)
     for i=1:3    
    
data(i)=trilis(state_old,i,iteration)
     end
     
  
    end
     if(input_data_encoder==1)
    
          for i=4:6    
    
data(i-3)=trilis(state_old,i,iteration);
          end
    end
    

data_trilis=data;
trelis_full=trilis;


end

