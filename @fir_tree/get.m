function val=get(c,prop_name)

%standard function to allow extraction of memory parameters from fir tree object
switch prop_name
    
case 'age'
    val=c.age;
case 'pos'
    val=c.pos;
case 'last_breed'
    val=c.last_breed; 
otherwise
    error('invalid field name')
end

