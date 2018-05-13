classdef elk   %declares elk object
    properties    %define elk properties (parameters) 
        age; 
        food;
        pos;
        speed;
        last_breed;
        gender;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @elk folder. 
        function r=elk(varargin) %constructor method for elk - assigns values to elk properties
                %r=elk(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that elk has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13


                switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                    case 0				%create default object
                       r.age=[];			
                       r.food=[];
                       r.pos=[];
                       r.speed=[];
                       r.last_breed=[];
                       r.gender=[];
                    case 1              %input is already a elk, so just return!
                       if (isa(varargin{1},'elk'))		
                            r=varargin{1};
                       else
                            error('Input argument is not a elk')
                            
                       end
                    case 5               %create a new elk (currently the only constructor method used)
                       r.age=varargin{1};               %age of elk object in number of iterations
                       r.food=varargin{2};              %current food content (arbitrary units)
                       r.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                       r.speed=varargin{4};             %number of kilometres elk can migrate in 1 day
                       r.last_breed=varargin{5};        %number of iterations since elk last reproduced.
                       r.gender=varargin{6};
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
