classdef fir_tree %declares fir tree object
    properties %define fir tree properties (parameters)
        age;
        pos;
        last_breed;
        food;
    end
    
    methods
        function f=fir_tree(varargin)
            switch nargin
                case 0
                    f.age=[];
                    f.last_breed=[];
                    f.food=[];
                    f.pos=[];
                case 1
                    if (isa(varargin{1},'fir_tree'))
                        f=varargin{1};
                    else 
                        error('Input argument is not a fir tree')
                    end
                case 4
                    f.age=varargin{1};
                    f.pos=varargin{2};
                    f.last_breed=varargin{3};
                    f.food = varargin(4);
                otherwise
                    error('Invalid no. of input arguments for fir tree')
            end
        end
    end
end

