%%Some constants
%function ponds(t)
rho = 1000; Lf = 3.3e5; a = exp(-3);
depth = 0.4;
omega = pi/90.0; day = 0.5e6;
lamda = day/(3.0*a*rho*Lf);
S = 100;
%t = 90;
N = 2000;
x=rand(1,N)*10*N;
y=rand(1,N)*10*N;

d_ij = zeros(N);
Angle = zeros(N);

%offset = rand(1,N)*pi;
for i = 1:N
   for j = 1:N
      d_ij(i,j) = sqrt(((x(i)-x(j))^2) + ((y(i)-y(j))^2));
      Angle(i,j) = atan((y(j)-y(i))/(x(j)-x(i))); %-offset(i) 
   end
end

r_0 = 1+rand(1,N)*5;
R_ = (S*lamda/omega)*(1-cos(omega*90)) + r_0;
%{
r_init = 2;
for i = 1:90
t(i) = i;    
R_(i) = (S*lamda/omega)*(1-cos(omega*i)) + r_init;
%R_(i) = r_init*exp((S*lamda/(2*omega))*(1-cos(omega*i)));
end
figure;plot(t,R_);
%}
Rs = diag(R_);
R_l = (ones(N) - eye(N))*Rs;
R_r = Rs*(ones(N) - eye(N));
D = d_ij - R_l - R_r;
A = zeros(N);
for i = 1:N
   for j = 1:N
       if D(i,j) <= 0
           A(i,j) = 1;
       else if i==j
               A(i,j) = 0;
           end
       end
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The Voronoi area function
%{
area = zeros(1,N);
[vx vy]= voronoi(x,y);
[v,c] = voronoin([vx(:) vy(:)]);
for i = 1:N
    c_1 = cell2mat(c(i));
    [l_1 l] = size(c_1);
    ver_x = zeros(1,l); ver_y = zeros(1,l);
    for j = 1:l
        ver_x(j) = v(c_1(j),1); ver_y(j) = v(c_1(j),2);
    end
    area(i) = polyarea(ver_x,ver_y);
end
%}



[comps compsize] = get_components(A);
figure; hist(compsize);
figure; hist(R_);
Ars = R_.^2;
figure; hist(Ars);
comps
%end

