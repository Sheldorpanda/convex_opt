import simple_portfolio_data.*

r_min = (pbar)' * x_unif;

fprintf("Risk of uniform portfolio:")
disp(quad_form(x_unif, S))
fprintf("__________________________")

% original formulation

cvx_begin
    variable x1(n)
    minimize(quad_form(x1, S))
    subject to
        ones(1, n)*x1 == 1;
        (pbar)' * x1 == r_min;
        % long only:
        % x1 >= 0;
        % short limited:
        % ones(1,n)*(max(-x1, zeros(n, 1))) <= 0.5;
cvx_end