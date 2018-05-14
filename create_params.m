function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.R_SPD=4;         %speed of movement - units per itn (elk)
    PARAM.F_SPD=5;         %speed of movement - units per itn (wolf)
    %PARAM.T_BRDFQ=365;       %may need change 
    PARAM.R_BRDFQ=250;      %breeding frequency - iterations
    PARAM.F_BRDFQ=63;
    %PARAM.T_MAXFOOD=50;
    PARAM.R_MINFOOD=0;      %minimum food threshold before agent dies 
    PARAM.F_MINFOOD=0;
    PARAM.R_FOODBRD=5;     %minimum food threshold for breeding
    PARAM.F_FOODBRD=5;
    %PARAM.T_MAXAGE=50;      %may need change
    PARAM.R_MAXAGE=(365*10);      %maximum age allowed 
    PARAM.F_MAXAGE=(365*7);