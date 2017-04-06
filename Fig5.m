N = 10000;
r=rand(1,N);
theta=rand(1,N)*2.0*pi;
alpha = 1;
beta = 0.5;

A = zeros(N);
%d = 0.05;
d_ij = zeros(N);
for i = 1:N
   for j = 1:N
      d_ij(i,j) = sqrt(((x(i)-x(j))^2) + ((y(i)-y(j))^2));
      t = double(i) - rand; %can make this even if we just delete the random offset.
      a_i = alpha*(t.^(-beta))*(r(i).^(2.0-(2.0*beta)));
      if d_ij(i,j) < a_i % && not(i==j)
          A(i,j) = 1;
      end
   end
end

%{
coord = [x ; y]';
figure;gplot(A,coord, '-.');
%}
   k = sum(A,1); 
figure; hist(k);
