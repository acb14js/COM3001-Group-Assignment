function [agent]=create_agents(nr,nf)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nr - number of elks
%nf - number of wolfes

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
rloc=(bm_size-1)*rand(nr,2)+1;      %generate random initial positions for elks
floc=(bm_size-1)*rand(nf,2)+1;      %generate random initial positions for wolfes

MESSAGES.pos=[rloc;floc];

%generate all elk agents and record their positions in ENV_MAT_R
for r=1:nr
    prand=randi([1, nr], 1); %pick random point to get a random position for the elks
    pos=rloc(prand,:);
    %create elk agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.R_BRDFQ);
    gender = randi([0, 1], 1);
    agent{r}=elk(age,food,pos,PARAM.R_SPD,lbreed,gender);
end

%generate all wolf agents and record their positions in ENV_MAT_F
for f=nr+1:nr+nf
    prand=randi([1, nr], 1);%pick a random number to get a random position for the wolf
    pos=floc(f-prand,:);
    %create wolf agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.F_BRDFQ);
    gender=randi([0, 1], 1);
    agent{f}=wolf(age,food,pos,PARAM.F_SPD,lbreed,gender);
end
