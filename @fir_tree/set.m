function c = set(c,prop_name,val) 

%standard function to allow insertion of memory parameters from fir tree object

switch prop_name
   
case 'age'
    c.age=val;
case 'pos'
    c.pos=val;
case 'last_breed'
    c.last_breed=val; 
otherwise 
    error('invalid field name')     
end

