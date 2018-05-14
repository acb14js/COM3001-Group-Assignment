function [agt,eaten,flee]=eat(agt,cn)

%eating function for class elk
%agt=elk object
%cn - current agent number
%eaten = 1 if elk finds food, =0 otherwise

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution of food
  
%SUMMARY OF elk EAT RULE
%elk search for wolf in its 1km x 1km square of the environment
%if wolf detected, elk will on move to the opposite direction of the wolf
%elk detects food level in its 1km x 1km square of the environment
%if a sapling in elk's position, cosume sapling first
%if food> 1, elk will consume food
%otherwise elk food level decremented by 1.

%Modified by D Walker 3/4/08


global  ENV_DATA MESSAGES

pos=agt.pos;                            %extract current position 
cpos=round(pos);                        %round up position to nearest grid point

typ=MESSAGES.atype;                                         %extract types of all agents
sp=find(typ==3);                                            %indices of all splings
wo = find(typ==2);
rpos=MESSAGES.pos(sp,:);                                    %extract positions of all sapling
rpos=round(rpos);
wpos = MESSAGES.pos(wo,:);
wpos=round(wpos);
iw = find(wpos == cpos);
isa = find(rpos == cpos);
cfood=agt.food;                                               %get current agent food level

if isempty(iw)     
    pfood=ENV_DATA.food(cpos(1),cpos(2));   %obtain environment food level at current location

    if ~isempty(isa)                         %if there is a sapling at the positon
        sfood = isa.food;                      %remaining food of the sapling
        if isa.age >= 15                       %if the spling is in the age renge
            if sfood>=1                         %if the spling still eatable
                MESSAGES.food(isa) = sfood-1;            %decrease agent food by one unit
                agt.food = cfood+1;             %deduce spling food store by one unit
            end
        end
    elseif pfood>=1                             %if food exists at this location
        ENV_DATA.food(cpos(1),cpos(2))=ENV_DATA.food(cpos(1),cpos(2))-1;  %reduce environment food by one unit
        agt.food=cfood+1;                    %increase agent food by one unit
        eaten=1;                             %elk has eaten - set flag to one
    else
        agt.food=cfood-1;                   %decrease agent food by one unit
        eaten=0;                            %flag tells elk to migrate
    end
else    
   agt.food=cfood-1;                   
    eaten=-1;    
end
    
   

    
   
