// ================================================================
// Computational Macroeconomics, Lectures 18-19
// Small Open Economy RBC model with a debt-elastic country premium
// Technology and risk-premium shocks
//
// Timing convention used in this Dynare file:
//   k      = end-of-period capital K_{t+1} in the lecture notation
//   k(-1)  = beginning-of-period capital K_t
//   b      = end-of-period net foreign assets B_{t+1}
//   b(-1)  = beginning-of-period net foreign assets B_t
//   ca     = b - b(-1) = current account
//
// B > 0: net creditor position; B < 0: net debtor position.
// The steady-state NFA target is set to zero only to keep the
// steady state identical to the closed-economy RBC benchmark.
// ================================================================

// Endogenous variables
var y c i k h w r z b rb ca tb rp;

// Exogenous innovations
varexo eps_z eps_rp;

// Structural parameters
parameters alpha beta delta gamma rho_z rstar phi_b bbar rho_rp;

// Derived steady-state quantities (declared as parameters for convenience)
parameters r_ss ky iy cy h_ss y_ss k_ss c_ss i_ss w_ss;

// ----------------------------------------------------------------
// Calibration: kept close to the rbc.mod used in Lecture 17
// ----------------------------------------------------------------
alpha   = 0.35;
beta    = 0.97;
delta   = 0.06;
gamma   = 0.20;
rho_z   = 0.80;

// World real interest rate chosen to satisfy the bond Euler equation
rstar   = 1/beta - 1;

// Debt-elastic country-premium slope and NFA target
phi_b   = 0.01;
bbar    = 0;

// Persistence of the exogenous risk-premium shock
rho_rp  = 0.80;

// ----------------------------------------------------------------
// Closed-economy-equivalent steady state when bbar = 0
// ----------------------------------------------------------------
r_ss = rstar + delta;
ky   = alpha/r_ss;                 // K/Y
iy   = delta*ky;                   // I/Y
cy   = 1 - iy;                     // C/Y, because Bbar = 0
h_ss = (1-alpha)/(1-alpha + gamma*cy);
y_ss = h_ss*ky^(alpha/(1-alpha));
k_ss = ky*y_ss;
i_ss = iy*y_ss;
c_ss = cy*y_ss;
w_ss = (1-alpha)*y_ss/h_ss;

// ----------------------------------------------------------------
// Model
// ----------------------------------------------------------------
model;

// Production and factor prices
y = z*k(-1)^alpha*h^(1-alpha);
r = alpha*y/k(-1);
w = (1-alpha)*y/h;

// Capital accumulation
k = (1-delta)*k(-1) + i;

// Open-economy resource / budget constraint
// In lecture notation:
// C_t + I_t + B_{t+1} = Y_t + (1+r_t^b) B_t
c + i + b = y + (1+rb)*b(-1);

// Euler equation for domestic capital
1/c = beta*(1/c(+1))*(r(+1) + 1 - delta);

// Euler equation for the internationally traded riskless bond
1/c = beta*(1/c(+1))*(1 + rb(+1));

// Labor-leisure condition, same preference specification as rbc.mod
(1-h)*w = gamma*c;

// Technology shock
log(z) = rho_z*log(z(-1)) + eps_z;

// Exogenous country/risk-premium component
rp = rho_rp*rp(-1) + eps_rp;

// Debt-elastic interest-rate premium.
// If beginning-of-period NFA b(-1) falls below bbar (more debt),
// the borrowing rate rises.
rb = rstar + phi_b*(bbar - b(-1)) + rp;

// External-account variables
ca = b - b(-1);
tb = y - c - i;

end;

// ----------------------------------------------------------------
// Steady-state starting values
// ----------------------------------------------------------------
initval;
y  = y_ss;
c  = c_ss;
i  = i_ss;
k  = k_ss;
h  = h_ss;
w  = w_ss;
r  = r_ss;
z  = 1;
b  = bbar;
rb = rstar;
ca = 0;
tb = -rstar*bbar;
rp = 0;
end;

// Check the nonlinear steady state and local equilibrium conditions
resid(non_zero);
steady;
check;

// ----------------------------------------------------------------
// Shocks
// Dynare will report separate IRFs to eps_z and eps_rp.
// ----------------------------------------------------------------
shocks;
var eps_z;  stderr 0.01;
var eps_rp; stderr 0.01;
end;

// ----------------------------------------------------------------
// First-order stochastic simulation and impulse responses
// ----------------------------------------------------------------
stoch_simul(order=1, irf=20) y c i k h b ca tb rb rp;

