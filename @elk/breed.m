function [agt, new]=breed(agt,cn)

%breeding function for class RABBIT
%agt=rabbit object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits
   
flim=PARAM.R_FOODBRD;       %minimum food level required for breeding
tlim=PARAM.R_BRDFQ;         %minimum interval required for breeding
cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;         %current position
cpos=round(pos);                     %round up position to nearest grid point

el=find(typ==1&gen!=agt.gender);
elpos=MESSAGES.pos(el,:);

if cfood>=flim&last_breed==0&age>(365*3)  %if food > threshold and age > interval, then create offspring
   agt.last_breed=1;
   agt.age=age+1;
else if agt.last_breed > 1                                
    if agt.last_breed == tlim
        agt.last_breed=0;
        agt.food=cfood/2;                          %divide food level between 2 agents
        new=elk(0,cfood/2,pos,PARAM.R_SPD,0);   %new rabbit agent
        IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
    agt.last_breed = agt.last_breed + 1
    new=[];
end