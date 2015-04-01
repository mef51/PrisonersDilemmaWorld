population = randi([0 1], 1000, 1000);
score = matrix(1000, 1000);

function global
 for m= 1:999
     for n=1:999
         interaction(m,n);
     end
 end
end
 
function interaction(m,n)
   tmp = matrix(3,3)
   for i=-1:1
       for j=-1:1
           tmp(2+i,2+j)=game(m,n,i,j);
       end
   end
   score(m,n)=sum(tmp(:));
end

function result = game(m,n,i,j)
   if m==i & n==j
       result = 0;
   end
   
   if population(m,n)==1
       if population(i,j)==0
           result = 5;
       else
           result = 1;
       end
   end
   if population(m,n)==0
       if population(i,j)==0
           result 3;
       else
           result 0;
       end
   end
end
