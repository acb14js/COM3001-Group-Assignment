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
   
flim=PARAM.R_FOODBRD;       %minimum food level required for breeding
tlim=PARAM.R_BRDFQ;         %minimum interval required for breeding
cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;         %current position
cpos=round(pos);                     %round up position to nearest grid point
spd=agt.speed;

<<<<<<< HEAD
%typ=MESSAGES.atype;
%el=find(typ==2);
%gen=MESSAGES.gen(el);
%elgen=find(gen==1);
%elpos=MESSAGES.pos(elgen,:);
%relpos=round(elpos);
%mate=find(relpos==cpos);
=======
% typ=MESSAGES.atype;
% el=find(typ==1);
% gen=MESSAGES.gen(el);
% elgen=find(gen==1);
% elpos=MESSAGES.pos(elgen,:);
% relpos=round(elpos);
% mate=find(relpos==cpos)
>>>>>>> 9f3352df9944c0fca30a697f12414a6572093c6f

if cfood>=flim&last_breed==0&age>(365*3)  %if food > threshold and age > interval, then create offspring
   agt.last_breed=1;
end
if agt.last_breed >= 1
    new=[];
    if agt.last_breed >= tlim-15 && agt.last_breed<=tlim+15
        
        typ=MESSAGES.atype;                                         %extract types of all agents
        rb=find(typ==1);                                            %indices of all elks
        rpos=MESSAGES.pos(rb,:);                                     %extract positions of all wolf
        csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all wolf
        loc_agt=find(csep<spd);
        if ~isempty(loc_agt)
            ind = round(rand);
            if ind == 1     
                agt.food=cfood/2;                          %divide food level between 2 agents        
                new=elk(0,cfood/2,pos,PARAM.R_SPD,0);   %new wolf agent
                IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
            end
        end
        
    end
    if agt.last_breed == tlim+15
        agt.last_breed=0;
<<<<<<< HEAD
=======
        agt.food=cfood/2;                          %divide food level between 2 agents
        new=elk(0,cfood/2,pos,PARAM.R_SPD,0);   %new rabbit agent
        IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
>>>>>>> 9f3352df9944c0fca30a697f12414a6572093c6f
    end
    agt.last_breed = agt.last_breed + 1;
else
    new=[];
    agt.age=age+1;
end