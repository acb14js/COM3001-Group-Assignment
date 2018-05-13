classdef wolf           %declares wolf object
    properties         %define wolf properties (parameters) 
        age; 
        food;
        pos;
        speed;
        last_breed;
        gender;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @wolf folder. 
        function f=wolf(varargin) %constructor method for wolf  - assigns values to wolf properties
                %f=wolf(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that elk has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];			
                    f.food=[];
                    f.pos=[];
                    f.speed=[];
                    f.last_breed=[];
                    f.gender=[]
                case 1                         %input is already a wolf, so just return!
                    if (isa(varargin{1},'wolf'))		
                        f=varargin{1};
                    else
                        error('Input argument is not a wolf')
                    end
                case 5                          %create a new wolf (currently the only constructor method used)
                    f.age=varargin{1};               %age of wolf object in number of iterations
                    f.food=varargin{2};              %current food content (arbitrary units)
                    f.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                    f.speed=varargin{4};             %number of kilometres wolf can migrate in 1 day
                    f.last_breed=varargin{5};        %number of iterations since wolf last reproduced.
                    f.gender=varargin{6};            %gender of a wolf
                otherwise
                    error('Invalid no. of input arguments for wolf')
            end
        end
    end
end