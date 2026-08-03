# Exact G3 product-square certificate

This directory contains a characteristic-zero certificate for the q-branch
generator order

`e2, e5, e7, e8, e9, q1`.

Set

```text
x = bu - bs
y = br - bv
P = x*y*bv*bw
```

The file `localized-g3-product-square-certificate-exact-v1.singexpr` defines
exact rational polynomials `D1` through `D6` and satisfies

```text
D1*e2 + D2*e5 + D3*e7 + D4*e8 + D5*e9 + D6*q1 = P^2.
```

Its SHA-256 digest is
`36d337d0235e2a5d00c03a1a6ea433b1f3a8d58222c160a1b545a834e3bae64a`.
There are 3,353 multiplier terms. The per-multiplier term counts and degrees
are `(235,9), (358,10), (726,11), (701,11), (588,11), (745,11)`.

## Independent exact check

Run from this directory:

```bash
/opt/homebrew/bin/Singular -q verify-localized-g3-product-square-exact.sing
```

The checked output is saved in
`verify-localized-g3-product-square-exact.out`; it reports
`INDEPENDENT_SQUARE_IDENTITY=1` and `RESIDUAL_TERMS=0`.

## Lean conversion

Singular's polynomial syntax here is already close to Lean syntax: `*`, `+`,
`-`, `^`, and exact integer quotients are used. Declare local abbreviations
`x := bu - bs`, `y := br - bv`, and `P := x*y*bv*bw`, translate each `Di`
verbatim as a polynomial over the ambient characteristic-zero field, and use

```text
linear_combination D1 * he2 + D2 * he5 + D3 * he7
  + D4 * he8 + D5 * he9 + D6 * hq1
```

to obtain `P^2 = 0` (the goal orientation may require `negate` or `ring_nf`).
Then `sq_eq_zero_iff` or `mul_self_eq_zero` gives `P = 0`; the existing
nonzero hypotheses for `bu-bs`, `br-bv`, `bv`, and `bw` contradict this.

The localization variable `t` is absent from this certificate. The source lift
was normalized only after an exact check that its first six coefficients were
all divisible by `t^2` and its seventh coefficient was exactly `-P*t-1`.
