function loc_agt=extract_local_agents(cpos,spd,typ_flag)

%Extracts array representing distribution of food available in the local
%area of an agent at position cpos [x,y] and with search radius =spd.
%This function also makes corrections in the case that the agent is close
%to the model edge

global ENV_DATA MESSAGES

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

if cpos(1)>ENV_DATA.bm_size-spd
    xmax=ENV_DATA.bm_size;
else
    xmax=cpos(1)+spd;
end
if cpos(1)<spd+1
    xmin=1;
else
    xmin=cpos(1)-spd;
end
if cpos(2)>ENV_DATA.bm_size-spd
    ymax=ENV_DATA.bm_size;
else
    ymax=cpos(2)+spd;
end
if cpos(2)<spd+1
    ymin=1;
else
    ymin=cpos(2)-spd;
end

typ = MESSAGES.atype;
agt = find(typ==typ_flag);
agt_pos = MESSAGES.pos(agt,:);
agt_pos = round(agt_pos);
loc_agt=agt_pos==xmin:xmax;    %extract distribution of agents within the local search radius

