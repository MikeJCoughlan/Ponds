N = 1500;
x=rand(1,N);
y=rand(1,N);

A = zeros(N);
d = 0.05;
d_ij = zeros(N);
for i = 1:N
   for j = 1:N
      d_ij(i,j) = sqrt(((x(i)-x(j))^2) + ((y(i)-y(j))^2));
      if d_ij(i,j) <= d && not(i==j)
          A(i,j) = 1;
      end
   end
end
coord = [x ; y]';
figure;gplot(A,coord, '-.');

