% import data
blending_design_data;

% cvx problem
cvx_begin
    variable theta(k)
    theta >= 0;
    ones(1, k) * theta == 1;
    log(P)*theta <= log(P_spec);
    log(D)*theta <= log(D_spec);
    log(A)*theta <= log(A_spec);
 cvx_end
 
 % print design
 w = exp(log(W) * theta) 