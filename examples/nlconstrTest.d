import std.stdio;
import core.stdc.stdio;
import nlopt.nlopt;
import std.math;
import std.conv;

/*
* Example translated from: http://ab-initio.mit.edu/wiki/index.php/NLopt_Tutorial
*/

T round_dp(T)(T x, int dp = 0){
  T factor = pow(10, dp + 1);
  x *= factor;
  x += 1.;
  x /= 10.;
  factor /= 10.;
  return round(x)/factor;
}

T[] amap(T)(T[] x, T function(T) fun){
  foreach(ref el; x){
    el = fun(el);
  }
  return x;
}

void main(){
  
  extern (C) double myfunc(uint n, const(double)* x, double* grad, void* my_func_data)
  {
    if (grad) {
        grad[0] = 0.0;
        grad[1] = 0.5 / sqrt(x[1]);
    }
    return sqrt(x[1]);
  }
  
  struct my_constraint_data {
    double a, b;
  };
  
  extern (C) double myconstraint(uint n, const(double)* x, double* grad, void* data)
  {
    my_constraint_data *d = cast(my_constraint_data *) data;
    double a = (*d).a, b = (*d).b;
    if (grad) {
        grad[0] = 3 * a * (a*x[0] + b) * (a*x[0] + b);
        grad[1] = -1.0;
    }
    return ((a*x[0] + b) * (a*x[0] + b) * (a*x[0] + b) - x[1]);
   }
  
  double lb[2] = [-double.infinity, 0];
  nlopt_opt opt;
  auto algorithm = nlopt_algorithm.NLOPT_LD_MMA;

  opt = nlopt_create(algorithm, 2);
  nlopt_set_lower_bounds(opt, lb.ptr);
  nlopt_set_min_objective(opt, &myfunc, null);
  my_constraint_data data[2] = [{2,0}, {-1,1}];
  nlopt_add_inequality_constraint(opt, &myconstraint, &data[0], 1e-8);
  nlopt_add_inequality_constraint(opt, &myconstraint, &data[1], 1e-8);
  
  nlopt_set_xtol_rel(opt, 1e-4);
  
  double x[2] = [1.234, 5.678];
  double minf;
  
  nlopt_optimize(opt, x.ptr, &minf);
  
  nlopt_destroy(opt);
  
  amap!(double)(x, (x) => round_dp(x, 3));
  assert(x == [0.333, 0.296]);
}

