%function create_messages(nt,nr,nf,agent
function create_messages(nr,nf,agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=elk, 2-wolf, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
 global MESSAGES
 
 for an=1:length(agent)
     %if isa(agent{an},'fir_tree')
     %   MESSAGES.attype(an)=3;
     %   MESSAGES.pos(an,:)=get(agent{an},'pos');
     %   MESSAGES.food(an,:)=get(agent{an},'food');
     if isa(agent{an},'elk')
        MESSAGES.atype(an)=1;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.age(an,:)=get(agent{an},'age');
     elseif isa(agent{an},'wolf')
        MESSAGES.atype(an)=2;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
     else
        MESSAGES.atype(an)=0; 
        MESSAGES.pos(an,:)=[-1 -1];
     end
     MESSAGES.dead(an)=0;
 end
