Q = [1 -1/2; -1/2 2];
A = [1 2; 1 -4; 5 76];
b = [-2 -3 1]';

cvx_begin
    variable x(2)
    dual variable lambda
    minimize (quad_form(x,Q) - x(1))
    subject to
        lambda: A*x <= b
cvx_end
fprintf("optimal value:\n")
disp(cvx_optval);
fprintf("optimal point:\n")
disp(x);
fprintf("optimal dual variables:\n")
disp(lambda);¦Ë