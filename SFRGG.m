N = 10000;
x=rand(1,N);
y=rand(1,N);

A = zeros(N);
%d = 0.05;
d_ij = zeros(N);
for i = 1:N
   for j = 1:N
      d_ij(i,j) = sqrt(((x(i)-x(j))^2) + ((y(i)-y(j))^2));
      a_i = 1.0/(2.0*(double(i)-rand));
      if d_ij(i,j) < a_i % && not(i==j)
          A(i,j) = 1;
      end
   end
end
coord = [x ; y]';
figure;gplot(A,coord, '-.');

