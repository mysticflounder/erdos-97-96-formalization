"""
producer.py -- UNTRUSTED hint generator for the FR 20-gon Krawczyk
certificate (SPEC.md Sec 2). mpmath (80-digit) multivariate Newton
polish from the Table-1 seed (system.py), producing:

  - m: rational (dyadic-truncated) midpoint vector,
  - r: box radius,
  - Y: rational approximate inverse of the midpoint Jacobian,
  - orientation_sign: hint for which strict sign C1 should expect.

Nothing this module computes is trusted. krawczyk.py independently
re-verifies every claim in exact dyadic interval arithmetic; this
module may use mpmath/sympy freely and must never be imported by the
checker (dyadic.py, krawczyk.py, or the checking half of certify.py).
"""
from __future__ import annotations

import sys
from fractions import Fraction

import mpmath as mp

import system as sysmod  # producer-only import; the checker never imports this module

mp.mp.dps = 80  # 80 decimal digits >> SPEC.md's "50+ digits"


def _frac_to_mpf(fr: Fraction) -> mp.mpf:
    return mp.mpf(fr.numerator) / mp.mpf(fr.denominator)


def eval_F_mpf(v):
    """v: list of 15 mpf. Returns list of 15 mpf (the 15 equations)."""
    x, y = sysmod.reconstruct_coords_mpf(v)
    out = []
    for (i, j) in sysmod.EDGE_LIST:
        out.append((x[i] + x[j]) ** 2 + (y[j] - y[i]) ** 2 - 1)
    return out


def eval_J_mpf(v):
    """15x15 Jacobian of F at v, as a plain list of lists of mpf."""
    n = len(v)
    x, y = sysmod.reconstruct_coords_mpf(v)
    J = [[mp.mpf(0)] * n for _ in range(n)]
    for row, (i, j) in enumerate(sysmod.EDGE_LIST):
        xi_var, _ = sysmod.COORD_X[i]
        xj_var, _ = sysmod.COORD_X[j]
        yi_var, _ = sysmod.COORD_Y[i]
        yj_var, _ = sysmod.COORD_Y[j]

        tx = 2 * (x[i] + x[j])
        J[row][xi_var] += tx
        J[row][xj_var] += tx

        ty = 2 * (y[j] - y[i])
        if yi_var is not None:
            J[row][yi_var] -= ty
        if yj_var is not None:
            J[row][yj_var] += ty
    return J


def newton_polish(v0, iters=25, tol=None):
    if tol is None:
        tol = mp.mpf(10) ** -40
    n = len(v0)
    v = list(v0)
    resid = None
    for _step in range(iters):
        Fv = eval_F_mpf(v)
        resid = mp.norm(mp.matrix(Fv))
        if resid < tol:
            break
        Jv = mp.matrix(eval_J_mpf(v))
        delta = mp.lu_solve(Jv, mp.matrix([-f for f in Fv]))
        v = [v[k] + delta[k, 0] for k in range(n)]
    Fv = eval_F_mpf(v)
    resid = mp.norm(mp.matrix(Fv))
    return v, resid


def mpf_to_dyadic_fraction(x: mp.mpf, Q: int) -> Fraction:
    """Round the mpf value x to the nearest multiple of 2**-Q,
    returned as an exact Fraction."""
    scaled = x * (mp.mpf(2) ** Q)
    n_int = int(mp.nint(scaled))
    return Fraction(n_int, 1 << Q)


def compute_orientation_sign_mpf(v_final):
    x, y = sysmod.reconstruct_coords_mpf(v_final)
    xs = [x[i] for i in range(1, 11)] + [-x[i] for i in range(10, 0, -1)]
    ys = [y[i] for i in range(1, 11)] + [y[i] for i in range(10, 0, -1)]
    n = 20
    sign = 0
    for t in range(n):
        x0, y0 = xs[t - 1], ys[t - 1]
        x1, y1 = xs[t], ys[t]
        x2, y2 = xs[(t + 1) % n], ys[(t + 1) % n]
        cross = (x1 - x0) * (y2 - y1) - (y1 - y0) * (x2 - x1)
        if cross > 0:
            s = 1
        elif cross < 0:
            s = -1
        else:
            s = 0
        if sign == 0:
            sign = s
        elif s != 0 and s != sign:
            print(f"WARNING producer: inconsistent cross-product sign at t={t}", file=sys.stderr)
    return sign


def produce(M_BITS=200, Y_BITS=100, newton_iters=25, radius_bits=100):
    seed = sysmod.seed_vector_mpf()
    v_final, resid = newton_polish(seed, iters=newton_iters)
    if resid > mp.mpf(10) ** -30:
        print(f"WARNING producer: Newton residual only {resid}", file=sys.stderr)

    m = [mpf_to_dyadic_fraction(v_final[k], M_BITS) for k in range(15)]

    # Y approximates the inverse of the MIDPOINT Jacobian J(m), per
    # SPEC.md Sec 3.2 ("Y a rational approximate inverse of the
    # midpoint Jacobian") -- evaluate J at the rounded midpoint m, not
    # at the pre-rounding high-precision v_final.
    m_mpf = [_frac_to_mpf(mi) for mi in m]
    Jm = mp.matrix(eval_J_mpf(m_mpf))
    Yinv = Jm ** -1
    Y = [[mpf_to_dyadic_fraction(Yinv[r, c], Y_BITS) for c in range(15)] for r in range(15)]

    r = Fraction(1, 1 << radius_bits)  # ~7.9e-31 at radius_bits=100, matches SPEC's suggested ~1e-30

    orientation_sign = compute_orientation_sign_mpf(v_final)

    return {
        "m": m,
        "r": r,
        "Y": Y,
        "orientation_sign": orientation_sign,
        "newton_residual": str(resid),
        "newton_iters": newton_iters,
    }


if __name__ == "__main__":
    out = produce()
    print("m:", out["m"])
    print("r:", out["r"])
    print("orientation_sign:", out["orientation_sign"])
    print("newton_residual:", out["newton_residual"])
