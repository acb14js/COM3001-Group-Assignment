function [agt, new]=breed(agt,cn)

%breeding function for class RABBIT
%agt=rabbit object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT MESSAGES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits
   
flim=PARAM.F_FOODBRD;       %minimum food level required for breeding
tlim=PARAM.F_BRDFQ;         %minimum interval required for breeding
cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;         %current position
cpos=round(pos);                     %round up position to nearest grid point

typ=MESSAGES.atype;
el=find(typ==2);
gen=MESSAGES.gen(el);
elgen=find(gen==1);
elpos=MESSAGES.pos(elgen,:);

if cfood>=flim&last_breed==0&age>(365*3)&~isempty(elpos)  %if food > threshold and age > interval, then create offspring
   agt.last_breed=1;
   agt.age=age+1;
end
if agt.last_breed > 1
    new=[];
    if agt.last_breed == tlim
        agt.last_breed=0;
        agt.food=cfood/2;                          %divide food level between 2 agents
        new=elk(0,cfood/2,pos,PARAM.R_SPD,0);   %new rabbit agent
        IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
    end
    agt.last_breed = agt.last_breed + 1;
end