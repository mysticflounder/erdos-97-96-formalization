# Exact localized G3 multiplier factor audit

Input: `localized-g3-product-square-certificate-exact-v1.singexpr`.
CAS: Singular 4.4.1, ring `QQ[bv,bs,bw,x,y]`, degree order `dp`.

Each `Dᵢ` divides exactly by the common monomial `bv*bw*x`.  The term counts
of the quotients `Qᵢ = Dᵢ/(bv*bw*x)` are:

| quotient | terms |
|---|---:|
| Q1 | 235 |
| Q2 | 358 |
| Q3 | 726 |
| Q4 | 701 |
| Q5 | 588 |
| Q6 | 745 |

`factorize(Qᵢ)` returns only a rational unit and one nonconstant factor of
multiplicity 1 for every `i`; there are no further nontrivial factors.
Every pairwise `gcd(Qᵢ,Qⱼ)` has `size = 1`, so no common nonconstant factor
remains after removing `bv*bw*x`.

As a linear-decomposition check, evaluation at six integer points gives a
nonzero 6×6 determinant (exact rational arithmetic), so the six quotients
have coefficient-space rank 6; there is no constant-coefficient low-rank
staging of the multiplier vector.

Raw CAS output is in `audit_factor_g3_rank.out`; the generated Singular input
is `audit_factor_g3.sing` and its generator is `audit_factor_g3.py`.
