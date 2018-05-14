function [agt,eaten]=eat(agt,cn)

%eating function for class wolf
%agt=wolf object
%cn - current agent number
%eaten = 1 if wolf successfully finds a elk, =0 otherwise

%SUMMARY OF wolf EAT RULE
%wolf calculates distance to all elks
%wolf identifies nearest elks(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of wolf killing elk =1 - distance of elk/speed of wolf
%If probability > rand, wolf moves to elk location and elk is
%killed
%If wolf does not kill elk, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=elk, 2-wolf, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES
   
pos=agt.pos;                        %extract current position 
cfood=agt.food;                     %get current agent food level
spd=agt.speed;                      %wolf migration speed in units per iteration - this is equal to the food search radius
hungry=1;
eaten=0;
%s = 100;

%nrelk = 0;

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all elks
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all elks
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all elks
[d,ind]=min(csep);                                            %d is distance to closest elk, ind is index of that elk
nrst=rb(ind);                                                 %index of nearest elk(s)


if d<=spd&length(nrst)>0    %if there is at least one  elk within the search radius        
    if length(nrst)>1       %if more than one elk located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    %pk=1-(d/spd);                       %probability that wolf will kill elk is ratio of speed to distance
    nx=MESSAGES.pos(nrst,1);    %extract exact location of this elk
    ny=MESSAGES.pos(nrst,2);
    npos=[nx ny];
    agt.food=cfood+1;           %increase agent food by one unit
    agt.pos=npos;               %move agent to position of this elk
    pk=0.05;                       %probability that wolf will kill elk is ratio of speed to distance
    if pk>rand
%         nx=MESSAGES.pos(nrst,1);    %extract exact location of this elk
%         ny=MESSAGES.pos(nrst,2);
%         npos=[nx ny];
%         agt.food=cfood+1;           %increase agent food by one unit
%         agt.pos=npos;               %move agent to position of this elk
        IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        eaten=1;
        hungry=0;
        MESSAGES.dead(nrst)=1;       %send message to elk so it knows it's dead!
    end
end
if hungry==1
    agt.food=cfood-0.2;     %if no food, then reduce agent food by 0.2
end


   
