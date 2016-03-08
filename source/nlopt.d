/*
C->D nlopt header interface file is a direct conversion from the C header file
Authors: Chibisi Chima-Okereke
*/

module nlopt;

extern (C):

alias nlopt_func = double function(uint n, const(double)* x, double* gradient, void* func_data);
alias nlopt_mfunc = double function(uint m, double* result, uint n, const(double)* x, double* gradient, void* func_data);
alias nlopt_precond = void function(uint n, const(double)* x, const(double)* v, double* vpre, void* data);


enum nlopt_algorithm
{
     NLOPT_GN_DIRECT = 0,
     NLOPT_GN_DIRECT_L,
     NLOPT_GN_DIRECT_L_RAND,
     NLOPT_GN_DIRECT_NOSCAL,
     NLOPT_GN_DIRECT_L_NOSCAL,
     NLOPT_GN_DIRECT_L_RAND_NOSCAL,

     NLOPT_GN_ORIG_DIRECT,
     NLOPT_GN_ORIG_DIRECT_L,

     NLOPT_GD_STOGO,
     NLOPT_GD_STOGO_RAND,

     NLOPT_LD_LBFGS_NOCEDAL,

     NLOPT_LD_LBFGS,

     NLOPT_LN_PRAXIS,

     NLOPT_LD_VAR1,
     NLOPT_LD_VAR2,

     NLOPT_LD_TNEWTON,
     NLOPT_LD_TNEWTON_RESTART,
     NLOPT_LD_TNEWTON_PRECOND,
     NLOPT_LD_TNEWTON_PRECOND_RESTART,

     NLOPT_GN_CRS2_LM,

     NLOPT_GN_MLSL,
     NLOPT_GD_MLSL,
     NLOPT_GN_MLSL_LDS,
     NLOPT_GD_MLSL_LDS,

     NLOPT_LD_MMA,

     NLOPT_LN_COBYLA,

     NLOPT_LN_NEWUOA,
     NLOPT_LN_NEWUOA_BOUND,

     NLOPT_LN_NELDERMEAD,
     NLOPT_LN_SBPLX,

     NLOPT_LN_AUGLAG,
     NLOPT_LD_AUGLAG,
     NLOPT_LN_AUGLAG_EQ,
     NLOPT_LD_AUGLAG_EQ,

     NLOPT_LN_BOBYQA,

     NLOPT_GN_ISRES,

     /* new variants that require local_optimizer to be set,
	not with older constants for backwards compatibility */
     NLOPT_AUGLAG,
     NLOPT_AUGLAG_EQ,
     NLOPT_G_MLSL,
     NLOPT_G_MLSL_LDS,

     NLOPT_LD_SLSQP,

     NLOPT_LD_CCSAQ,

     NLOPT_GN_ESCH,

     NLOPT_NUM_ALGORITHMS /* not an algorithm, just the number of them */
}


enum NLOPT_GN_DIRECT = nlopt_algorithm.NLOPT_GN_DIRECT;
enum NLOPT_GN_DIRECT_L = nlopt_algorithm.NLOPT_GN_DIRECT_L;
enum NLOPT_GN_DIRECT_L_RAND = nlopt_algorithm.NLOPT_GN_DIRECT_L_RAND;
enum NLOPT_GN_DIRECT_NOSCAL = nlopt_algorithm.NLOPT_GN_DIRECT_NOSCAL;
enum NLOPT_GN_DIRECT_L_NOSCAL = nlopt_algorithm.NLOPT_GN_DIRECT_L_NOSCAL;
enum NLOPT_GN_DIRECT_L_RAND_NOSCAL = nlopt_algorithm.NLOPT_GN_DIRECT_L_RAND_NOSCAL;
enum NLOPT_GN_ORIG_DIRECT = nlopt_algorithm.NLOPT_GN_ORIG_DIRECT;
enum NLOPT_GN_ORIG_DIRECT_L = nlopt_algorithm.NLOPT_GN_ORIG_DIRECT_L;
enum NLOPT_GD_STOGO = nlopt_algorithm.NLOPT_GD_STOGO;
enum NLOPT_GD_STOGO_RAND = nlopt_algorithm.NLOPT_GD_STOGO_RAND;
enum NLOPT_LD_LBFGS_NOCEDAL = nlopt_algorithm.NLOPT_LD_LBFGS_NOCEDAL;
enum NLOPT_LD_LBFGS = nlopt_algorithm.NLOPT_LD_LBFGS;
enum NLOPT_LN_PRAXIS = nlopt_algorithm.NLOPT_LN_PRAXIS;
enum NLOPT_LD_VAR1 = nlopt_algorithm.NLOPT_LD_VAR1;
enum NLOPT_LD_VAR2 = nlopt_algorithm.NLOPT_LD_VAR2;
enum NLOPT_LD_TNEWTON = nlopt_algorithm.NLOPT_LD_TNEWTON;
enum NLOPT_LD_TNEWTON_RESTART = nlopt_algorithm.NLOPT_LD_TNEWTON_RESTART;
enum NLOPT_LD_TNEWTON_PRECOND = nlopt_algorithm.NLOPT_LD_TNEWTON_PRECOND;
enum NLOPT_LD_TNEWTON_PRECOND_RESTART = nlopt_algorithm.NLOPT_LD_TNEWTON_PRECOND_RESTART;
enum NLOPT_GN_CRS2_LM = nlopt_algorithm.NLOPT_GN_CRS2_LM;
enum NLOPT_GN_MLSL = nlopt_algorithm.NLOPT_GN_MLSL;
enum NLOPT_GD_MLSL = nlopt_algorithm.NLOPT_GD_MLSL;
enum NLOPT_GN_MLSL_LDS = nlopt_algorithm.NLOPT_GN_MLSL_LDS;
enum NLOPT_GD_MLSL_LDS = nlopt_algorithm.NLOPT_GD_MLSL_LDS;
enum NLOPT_LD_MMA = nlopt_algorithm.NLOPT_LD_MMA;
enum NLOPT_LN_COBYLA = nlopt_algorithm.NLOPT_LN_COBYLA;
enum NLOPT_LN_NEWUOA = nlopt_algorithm.NLOPT_LN_NEWUOA;
enum NLOPT_LN_NEWUOA_BOUND = nlopt_algorithm.NLOPT_LN_NEWUOA_BOUND;
enum NLOPT_LN_NELDERMEAD = nlopt_algorithm.NLOPT_LN_NELDERMEAD;
enum NLOPT_LN_SBPLX = nlopt_algorithm.NLOPT_LN_SBPLX;
enum NLOPT_LN_AUGLAG = nlopt_algorithm.NLOPT_LN_AUGLAG;
enum NLOPT_LD_AUGLAG = nlopt_algorithm.NLOPT_LD_AUGLAG;
enum NLOPT_LN_AUGLAG_EQ = nlopt_algorithm.NLOPT_LN_AUGLAG_EQ;
enum NLOPT_LD_AUGLAG_EQ = nlopt_algorithm.NLOPT_LD_AUGLAG_EQ;
enum NLOPT_LN_BOBYQA = nlopt_algorithm.NLOPT_LN_BOBYQA;
enum NLOPT_GN_ISRES = nlopt_algorithm.NLOPT_GN_ISRES;
enum NLOPT_AUGLAG = nlopt_algorithm.NLOPT_AUGLAG;
enum NLOPT_AUGLAG_EQ = nlopt_algorithm.NLOPT_AUGLAG_EQ;
enum NLOPT_G_MLSL = nlopt_algorithm.NLOPT_G_MLSL;
enum NLOPT_G_MLSL_LDS = nlopt_algorithm.NLOPT_G_MLSL_LDS;
enum NLOPT_LD_SLSQP = nlopt_algorithm.NLOPT_LD_SLSQP;
enum NLOPT_LD_CCSAQ = nlopt_algorithm.NLOPT_LD_CCSAQ;
enum NLOPT_GN_ESCH = nlopt_algorithm.NLOPT_GN_ESCH;
enum NLOPT_NUM_ALGORITHMS = nlopt_algorithm.NLOPT_NUM_ALGORITHMS;


extern(System) const(char)* nlopt_algorithm_name(nlopt_algorithm a);

enum nlopt_result
{
     NLOPT_FAILURE = -1, /* generic failure code */
     NLOPT_INVALID_ARGS = -2,
     NLOPT_OUT_OF_MEMORY = -3,
     NLOPT_ROUNDOFF_LIMITED = -4,
     NLOPT_FORCED_STOP = -5,
     NLOPT_SUCCESS = 1, /* generic success code */
     NLOPT_STOPVAL_REACHED = 2,
     NLOPT_FTOL_REACHED = 3,
     NLOPT_XTOL_REACHED = 4,
     NLOPT_MAXEVAL_REACHED = 5,
     NLOPT_MAXTIME_REACHED = 6
};

enum NLOPT_FAILURE = nlopt_result.NLOPT_FAILURE;
enum NLOPT_INVALID_ARGS = nlopt_result.NLOPT_INVALID_ARGS;
enum NLOPT_OUT_OF_MEMORY = nlopt_result.NLOPT_OUT_OF_MEMORY;
enum NLOPT_ROUNDOFF_LIMITED = nlopt_result.NLOPT_ROUNDOFF_LIMITED;
enum NLOPT_FORCED_STOP = nlopt_result.NLOPT_FORCED_STOP;
enum NLOPT_SUCCESS = nlopt_result.NLOPT_SUCCESS;
enum NLOPT_STOPVAL_REACHED = nlopt_result.NLOPT_STOPVAL_REACHED;
enum NLOPT_FTOL_REACHED = nlopt_result.NLOPT_FTOL_REACHED;
enum NLOPT_XTOL_REACHED = nlopt_result.NLOPT_XTOL_REACHED;
enum NLOPT_MAXEVAL_REACHED = nlopt_result.NLOPT_MAXEVAL_REACHED;
enum NLOPT_MAXTIME_REACHED = nlopt_result.NLOPT_MAXTIME_REACHED;

extern(System)
{
	void nlopt_srand(ulong seed);
	void nlopt_srand_time();
	void nlopt_version(int* major, int* minor, int* bugfix);
}

struct nlopt_opt_s; /* opaque structure, defined internally */
alias nlopt_opt = nlopt_opt_s*;

/* the only immutable parameters of an optimization are the algorithm and
   the dimension n of the problem, since changing either of these could
   have side-effects on lots of other parameters */
extern(System)
{
	nlopt_opt nlopt_create(nlopt_algorithm algorithm, uint n);
	void nlopt_destroy(nlopt_opt opt);
	nlopt_opt nlopt_copy(const(nlopt_opt) opt);

	nlopt_result nlopt_optimize(nlopt_opt opt, double* x, double* opt_f);

	nlopt_result nlopt_set_min_objective(nlopt_opt opt, nlopt_func f, void* f_data);
	nlopt_result nlopt_set_max_objective(nlopt_opt opt, nlopt_func f, void* f_data);

	nlopt_result nlopt_set_precond_min_objective(nlopt_opt opt, nlopt_func f, nlopt_precond pre, void* f_data);
	nlopt_result nlopt_set_precond_max_objective(nlopt_opt opt, nlopt_func f, nlopt_precond pre, void* f_data);

	nlopt_algorithm nlopt_get_algorithm(const(nlopt_opt) opt);
	uint nlopt_get_dimension(const(nlopt_opt) opt);

/* constraints: */

	nlopt_result nlopt_set_lower_bounds(nlopt_opt opt, const(double)* lb);
	nlopt_result nlopt_set_lower_bounds1(nlopt_opt opt, double lb);
	nlopt_result nlopt_get_lower_bounds(const(nlopt_opt) opt, double* lb);
	nlopt_result nlopt_set_upper_bounds(nlopt_opt opt, const(double)* ub);
	nlopt_result nlopt_set_upper_bounds1(nlopt_opt opt, double ub);
	nlopt_result nlopt_get_upper_bounds(const(nlopt_opt) opt, double* ub);

	nlopt_result nlopt_remove_inequality_constraints(nlopt_opt opt);
	nlopt_result nlopt_add_inequality_constraint(nlopt_opt opt, nlopt_func fc, void* fc_data, double tol);
	nlopt_result nlopt_add_precond_inequality_constraint(nlopt_opt opt, nlopt_func fc, nlopt_precond pre, void* fc_data, double tol);
	nlopt_result nlopt_add_inequality_mconstraint(nlopt_opt opt, uint m, nlopt_mfunc fc, void* fc_data, const(double)* tol);

	nlopt_result nlopt_remove_equality_constraints(nlopt_opt opt);
	nlopt_result nlopt_add_equality_constraint(nlopt_opt opt, nlopt_func h, void* h_data, double tol);
	nlopt_result nlopt_add_precond_equality_constraint(nlopt_opt opt, nlopt_func h, nlopt_precond pre, void* h_data, double tol);
	nlopt_result nlopt_add_equality_mconstraint(nlopt_opt opt, uint m, nlopt_mfunc h, void* h_data, const(double)* tol);

/* stopping criteria: */

	nlopt_result nlopt_set_stopval(nlopt_opt opt, double stopval);
	double nlopt_get_stopval(const(nlopt_opt) opt);

	nlopt_result nlopt_set_ftol_rel(nlopt_opt opt, double tol);
	double nlopt_get_ftol_rel(const(nlopt_opt) opt);
	nlopt_result nlopt_set_ftol_abs(nlopt_opt opt, double tol);
	double nlopt_get_ftol_abs(const(nlopt_opt) opt);

	nlopt_result nlopt_set_xtol_rel(nlopt_opt opt, double tol);
	double nlopt_get_xtol_rel(const(nlopt_opt) opt);
	nlopt_result nlopt_set_xtol_abs1(nlopt_opt opt, double tol);
	nlopt_result nlopt_set_xtol_abs(nlopt_opt opt, const(double)* tol);
	nlopt_result nlopt_get_xtol_abs(const(nlopt_opt) opt, double* tol);

	nlopt_result nlopt_set_maxeval(nlopt_opt opt, int maxeval);
	int nlopt_get_maxeval(const(nlopt_opt) opt);

	nlopt_result nlopt_set_maxtime(nlopt_opt opt, double maxtime);
	double nlopt_get_maxtime(const(nlopt_opt) opt);

	nlopt_result nlopt_force_stop(nlopt_opt opt);
	nlopt_result nlopt_set_force_stop(nlopt_opt opt, int val);
	int nlopt_get_force_stop(const(nlopt_opt) opt);

/* more algorithm-specific parameters */

	nlopt_result nlopt_set_local_optimizer(nlopt_opt opt, const(nlopt_opt) local_opt);

	nlopt_result nlopt_set_population(nlopt_opt opt, uint pop);
	uint nlopt_get_population(const(nlopt_opt) opt);

	nlopt_result nlopt_set_vector_storage(nlopt_opt opt, uint dim);
	uint nlopt_get_vector_storage(const(nlopt_opt) opt);

	nlopt_result nlopt_set_default_initial_step(nlopt_opt opt, const(double)* x);
	nlopt_result nlopt_set_initial_step(nlopt_opt opt, const(double)* dx);
	nlopt_result nlopt_set_initial_step1(nlopt_opt opt, double dx);
	nlopt_result nlopt_get_initial_step(const(nlopt_opt) opt, const(double)* x, double* dx);
}

/* the following are functions mainly designed to be used internally
   by the Fortran and SWIG wrappers, allow us to tel nlopt_destroy and
   nlopt_copy to do something to the f_data pointers (e.g. free or
   duplicate them, respectively) */
alias nlopt_munge = void* function(void* p);
alias nlopt_munge2 = void* function(void* p, void* data);

extern(System)
{
	void nlopt_set_munge(nlopt_opt opt, nlopt_munge munge_on_destroy, nlopt_munge munge_on_copy);
	void nlopt_munge_data(nlopt_opt opt, nlopt_munge2 munge, void* data);
}

deprecated
{
	alias nlopt_func_old = double function(int n, const(double)* x, double* gradient, void* func_data);

	nlopt_result nlopt_minimize(nlopt_algorithm algorithm, int n, nlopt_func_old f, void* f_data,
		 const(double)* lb, const(double)* ub, double* x, double* minf,
		 double minf_max, double ftol_rel, double ftol_abs,
		 double xtol_rel, const(double)* xtol_abs, int maxeval, double maxtime);

	nlopt_result nlopt_minimize_constrained(
		 nlopt_algorithm algorithm,
		 int n, nlopt_func_old f, void* f_data,
		 int m, nlopt_func_old fc, void* fc_data, ptrdiff_t fc_datum_size,
		 const(double)*lb, const(double)* ub, /* bounds */
		 double* x, /* in: initial guess, out: minimizer */
		 double* minf, /* out: minimum */
		 double minf_max, double ftol_rel, double ftol_abs,
		 double xtol_rel, const(double)* xtol_abs,
		 int maxeval, double maxtime);

	nlopt_result nlopt_minimize_econstrained(
		 nlopt_algorithm algorithm,
		 int n, nlopt_func_old f, void* f_data,
		 int m, nlopt_func_old fc, void* fc_data, ptrdiff_t fc_datum_size,
		 int p, nlopt_func_old h, void* h_data, ptrdiff_t h_datum_size,
		 const(double)* lb, const(double)* ub, /* bounds */
		 double* x, /* in: initial guess, out: minimizer */
		 double* minf, /* out: minimum */
		 double minf_max, double ftol_rel, double ftol_abs,
		 double xtol_rel, const(double)* xtol_abs,
		 double htol_rel, double htol_abs,
		 int maxeval, double maxtime);

	void nlopt_get_local_search_algorithm(nlopt_algorithm* deriv,nlopt_algorithm* nonderiv, int* maxeval);
	void nlopt_set_local_search_algorithm(nlopt_algorithm deriv, nlopt_algorithm nonderiv, int maxeval);

	int nlopt_get_stochastic_population();
	void nlopt_set_stochastic_population(int pop);
}
