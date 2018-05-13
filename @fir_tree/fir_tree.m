classdef fir_tree %declares fir tree object
    properties %define fir tree properties (parameters)
        age;
        pos;
        last_breed;
    end
    
    methods
        function f=fir_tree(varargin)
            switch nargin
                case 0
                    f.age=[];
                    f.pos=[];
                    f.last_breed=[];
                case 1
                    if (isa(varargin{1},'fir_tree'))
                        f=varargin{1};
                    else 
                        error('Input argument is not a fir tree')
                    end
                case 3
                    f.age=varargin{1};
                    f.pos=varargin{2};
                    f.last_breed=varargin{3};
                otherwise
                    error('Invalid no. of input arguments for fir tree')
            end
        end
    end
end

