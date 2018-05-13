function [agt, new]=breed(agt,cn)

%breeding function for class elk
%agt=elk object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT ENV_DATA
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both wolfes and elks
   
flim=PARAM.R_FOODBRD;       %minimum food level required for breeding
tlim=PARAM.R_BRDFQ;         %minimum interval required for breeding

%get one agent coordinates
cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
gd=agt.gender;              %get current agent gender
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;         %current position
cpos=round(pos);     %round up position to nearest grid point
spd=agt.speed;       %elk migration speed in units per iteration - this is equal to the female elks search radius


if cfood>=flim&last_breed>=tlim&age>=min_age  %if food > threshold and age > interval, then create offspring
    new=elk(0,cfood/2,pos,PARAM.R_SPD,0);   %new elk agent
    agt.food=cfood/2;                          %divide food level between 2 agents
    agt.last_breed=1;
    agt.age=age+1;
    IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
else
    agt.age=age+1;                          %not able to breed, so increment age by 1
    agt.last_breed=last_breed+1;
    new=[];
end 

end