x = [0.1 0.2 -0.05 0.1]';

%cvx_begin
%   variable S(4, 4) symmetric;
%    maximize (quad_form(x, S));
%    subject to
%        S(1, 1) == 0.2; S(2, 2) == 0.1; S(3, 3) == 0.3; S(4, 4) == 0.1;
%        S(1, 2) >= 0;
%        S(1, 3) >= 0;
%        S(2, 3) <= 0;
%        S(2, 4) <= 0;
%        S(3, 4) >= 0;
%        S == semidefinite(4);
%cvx_end

S2 = [0.2 0 0 0; 0 0.1 0 0; 0 0 0.3 0; 0 0 0 0.1];
s_diag = sqrt(quad_form(x, S2))

