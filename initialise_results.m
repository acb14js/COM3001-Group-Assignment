function initialise_results(nt,nr,nf,nsteps)

 global  IT_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('div_t',[zeros(1,nsteps+1)],...
                'div_r',[zeros(1,nsteps+1)],...            %no. births per iteration
                'div_f',[zeros(1,nsteps+1)],...
                'died_t',[zeros(1,nsteps+1)],...
                'died_r',[zeros(1,nsteps+1)],...			%no. agents dying per iteration
                'died_f',[zeros(1,nsteps+1)],...		
                'eaten',[zeros(1,nsteps+1)],...              %no. elks eaten per iteration
                'mig',[zeros(1,nsteps+1)],...                %no. agents migrating per iteration
                'tot',[zeros(1,nsteps+1)],...				%total no. agents in model per iteration
                'tot_r',[zeros(1,nsteps+1)],...             % total no. elks
                'tot_f',[zeros(1,nsteps+1)],...             % total no. wolfes
                'tot_t',[zeros(1,nsteps+1)],...
                'tfood',[zeros(1,nsteps+1)]);               %remaining vegetation level
            
 
 tf=sum(sum(ENV_DATA.food));            %remaining food is summed over all squares in the environment
 IT_STATS.tot(1)=nt+nr+nf;
 IT_STATS.tot_t(1)=nt;
 IT_STATS.tot_r(1)=nr;
 IT_STATS.tot_f(1)=nf;
 IT_STATS.tfood(1)=tf;
 
