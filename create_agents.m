%function [agent]=create_agents(nt,nr,nf)
function [agent]=create_agents(nr,nf)
 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nr - number of elks
%nf - number of wolfes
%nt - number of fir trees

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
%tloc=(bm_size-1)*rand(nt,2)+1;      %generate random initial positions for fir trees
rloc=(bm_size-1)*rand(nr,2)+1;      %generate random initial positions for elks
floc=(bm_size-1)*rand(nf,2)+1;      %generate random initial positions for wolfes



%MESSAGES.pos=[rloc;floc;tloc];
MESSAGES.pos=[rloc;floc];

%generate all fir_tree agents and record their positions in ENV_MAT_R
%for t=1:nt
%    pos=tloc(t,:);
%    %create fir_tree agents with random ages between 0 and 10 days and random
%    %food levels 20-40
%    food = 50;
%    age=ceil(rand*10);
%    lbreed=round(rand*PARAM.R_BRDFQ);
%    agent{t}=fir_tree(age,pos,lbreed,food);
%end

%generate all elk agents and record their positions in ENV_MAT_R
%for r=nt+1:nt+nr
%    pos=rloc(r-nt,:);
%    %create elk agents with random ages between 0 and 10 days and random
%    %food levels 20-40
%    age=ceil(rand*10);
%    food=ceil(rand*20)+20;
%    lbreed=0;
%    agent{r}=elk(age,food,pos,PARAM.R_SPD,lbreed);
%end

%generate all wolf agents and record their positions in ENV_MAT_F
%for f=nt+nr+1:nt+nr+nf
%    pos=floc(f-nr-nt,:);
%    %create wolf agents with random ages between 0 and 10 days and random
%    %food levels 20-40
%    age=ceil(rand*10);
%    food=ceil(rand*20)+20;
%    lbreed=0;
%    agent{f}=wolf(age,food,pos,PARAM.F_SPD,lbreed);
%end

for r=1:nr
    pos=rloc(r,:);
    %create rabbit agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*PARAM.R_MAXAGE);
    food=ceil(rand*20)+20;
    lbreed=0;
    agent{r}=elk(age,food,pos,PARAM.R_SPD,lbreed);
end

%generate all fox agents and record their positions in ENV_MAT_F
for f=nr+1:nr+nf
    pos=floc(f-nr,:);
    %create fox agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*PARAM.F_MAXAGE);
    food=ceil(rand*20)+20;
    lbreed=0;
    agent{f}=wolf(age,food,pos,PARAM.F_SPD,lbreed);
end
