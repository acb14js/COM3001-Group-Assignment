function [agt, new]=breed(agt,cn)
%breeding function for class wolf
%agt=wolf object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT

tlim=PARAM.T_BRDFQ;         %minimum interval required for breeding
age=agt.age;                %get current agent age
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;                %current position

if last_breed>=tlim  %if age > interval, then create offspring
   new=fir_tree(0,pos,0);   %new fir_tree agent
   agt.last_breed=0;
   agt.age=age+1;
   IT_STATS.div_t(N_IT+1)=IT_STATS.div_t(N_IT+1)+1;             %update statistics
else                            
    agt.age=age+1;          %not able to breed, so increment age by 1
    agt.last_breed=last_breed+1;
    new=[];
end

