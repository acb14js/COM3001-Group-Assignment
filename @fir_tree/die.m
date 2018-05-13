function [agt,klld]=die(agt,cn)
%death function for class fir_tree
%agt=fir tree object
%cn - current agent number
%klld=1 if agent dies, =0 otherwise

%fir trees die if they are older than max_age

global IT_STATS N_IT MESSAGES

klld=0;
cfood = cell2mat(agt.food);

if cfood==0
    IT_STATS.died_t(N_IT+1)=IT_STATS.died_t(N_IT+1)+1;  %update statistics
    MESSAGES.dead(cn)=1;                %update message list
    klld=1;
end
