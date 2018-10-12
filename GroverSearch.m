% Elementary Grover's Search algorithm simulation:

nqubits=6;                        %number of q-bits
n=2^nqubits;                      %number of elements in database
desired=mod(round(n*rand+1),n);   %desired element selected randomly using inbuilt rand function of matlab

d=-eye(n)+2/n;                    %diffusion transform
oracle=eye(n);                    %oracle
oracle(desired,desired)=-1;       %--calculate the optimal number of iterations---
finish=round(pi/4*sqrt(n));

%----step-1 of GroverSearch - Initialization----

psistart=ones(n, 1)/sqrt(n);
psi=psistart*exp(i*rand);

%----step-2 of GroverSearch - Algorithm body----
probability = [1:2*finish];
for steps=1:finish
steps; 
psi=d*oracle*psi;
probability(steps)=psi(desired).*conj(psi(desired));
end

%see the result distribution
figure(1);
plot(psi.*conj(psi)), xlabel('States'), ylabel('Probability'), title('Prob. vs States'), grid on;


% see below the probability dynamics to verify the accurate number of the iterations required for grover's algorithm to reach maximum probability for correctness 
% For experimentation we run the loop for more iterations to see the trend and notice the probability going down as the steps increase past pi/4*sqrt(n).

for steps=finish:2*finish
steps; 
psi=d*oracle*psi;
probability(steps)=psi(desired).*conj(psi(desired));
end

figure(2);
plot(probability), xlabel('Number of Iterations'), ylabel('Probability')
title('Probability improvement with the iterations'), grid on, axis equal;

desired

