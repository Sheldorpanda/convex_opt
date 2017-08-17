# convex_opt
Homework written by Eric Lu for Stanford CS 334A, Convex Optimization

To run the codes, Matlab library cvx is required. Download: http://cvxr.com/cvx/download/

The convex optimization problem is generally in this form: minimize fo(x) (objective function) given a series of fi(x) <= yi (inequality constraints) and hj(x) = yj (equality constraints). For the problem to be feasible, the objective function and all constraints must be convex (simpliest proof: satisifes Jensen's Inequality). Usually, we first construct all the functions based on the problem. If any of these functions is not convex, we transform it into a convex optimization problem, usually by algebra, composite functions, or constructing a dual problem.
