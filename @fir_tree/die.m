function [agt,klld]=die(agt,cn)
%death function for class fir_tree
%agt=fir tree object
%cn - current agent number
%klld=1 if agent dies, =0 otherwise

%fir trees die if they are older than max_age

global PARAM IT_STATS N_IT MESSAGES

klld=0;
age=agt.age;                %get current agent age
rf = agt.rf;

if age>PARAM.R_MAXAGE||food == 0     %if age > max age then agent dies
    IT_STATS.died_r(N_IT+1)=IT_STATS.died_r(N_IT+1)+1;  %update statistics
    MESSAGES.dead(cn)=1;                %update message list
    klld=1;
end
