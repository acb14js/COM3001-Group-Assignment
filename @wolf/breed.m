function [agt,new]=breed(agt,cn)

%breeding function for class wolf
%agt=wolf object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both wolfes and elks

   
flim=PARAM.F_FOODBRD;       %minimum food level required for breeding
tlim=PARAM.F_BRDFQ;         %minimum interval required for breeding
cfood=agt.food;             %get current agent food level
age=agt.age;                %get current agent age
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;                %current position
cpos=round(pos);     %round up position to nearest grid point
spd=agt.speed;       %elk migration speed in units per iteration - this is equal to the female elks search radius
mig=0; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function reduces the computational overhead. Only LOCAL area
%is searched for food, as opposed to entire environment
%loc_food is food distribution in local search area
%xmin in minimum x co-ord of this area
%ymin is minimum y co-ord of this area
[loc_f_wolves,xmin,ymin]=extract_local_agents(cpos,spd);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mig=0;  
[xf,yf]=find(loc_f_wolves);
if ~isempty(xf) %check if the coordinate is empty - this will show whether or not there are elks in this area
    xa=xmin+xf-1;                  %x co-ordiantes of all squares containing the elks
    ya=ymin+yf-1;                  %y co-ordiantes of all squares containing the elks
    csep=sqrt((xa-pos(:,1)).^2+(ya-pos(:,2)).^2);   %calculate distance to all the elks
    [d,nrst]=min(csep);          %d is distance to closest elks, nrst is index of elks
    if d<=spd
        nx=xa(nrst)+rand-0.5;
        ny=ya(nrst)+rand-0.5;
        npos=[nx ny];
        %if agent has left edge of model, then adjust slightly
        shft=find(npos>=ENV_DATA.bm_size);
        npos(shft)=ENV_DATA.bm_size-rand;
        shft=find(npos<=1);
        npos(shft)=1+rand;
        mig=1;
        if cfood>=flim&last_breed>=tlim  %if food > threshold and age > interval, then create offspring
            new=wolf(0,cfood/2,pos,PARAM.F_SPD,0);   %new wolf agent
            agt.food=cfood/2; %divide food level between 2 agents
            agt.last_breed=0;
            agt.age=age+1;
            IT_STATS.div_f(N_IT+1)=IT_STATS.div_f(N_IT+1)+1;             %update statistics
        else
            agt.age=age+1;          %not able to breed, so increment age by 1
            agt.last_breed=last_breed+1;
            new=[];
        end
    end
end