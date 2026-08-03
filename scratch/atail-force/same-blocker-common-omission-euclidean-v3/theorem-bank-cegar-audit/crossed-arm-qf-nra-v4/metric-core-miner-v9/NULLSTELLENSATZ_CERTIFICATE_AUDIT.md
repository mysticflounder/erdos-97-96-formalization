# Seven-point 11-equality core: characteristic-zero certificate audit

Date: 2026-08-01

## Verdict and trust boundary

The normalized 11-equality ideal is the unit ideal over `QQ`.  This was verified in three independent exact-algebra forms:

1. Singular `liftstd` produced and rechecked an explicit identity `1 = sum_i C_i f_i` for the normalized ideal.
2. msolve returned the reduced basis `[-1]` for both forward and reverse generator order.
3. A substantially smaller homogeneous identity `u^8 = sum_i D_i F_i` was produced by Singular and independently parsed and checked coefficient-by-coefficient over `Fraction` arithmetic.

The homogeneous identity lifts invariantly to the original coordinate-free metric variables and gives

```text
q^7 = sum_i Phi(D_i) f_i,   q = |P-A|^2.
```

Thus every real solution of the 11 equalities has `q = 0`, hence `A = P`.  In the normalized chart `A=(0,0), P=(1,0)`, this is the contradiction `1=0`.

This is **exact external characteristic-zero algebra**, not yet a Lean kernel proof.  No Lean, Lake, SAT, or CEGAR command was run in this audit.  The transport lemmas, determinant consequences, and final case split remain to be checked by Lean before this core can be called kernel-closed.

## Audited core

Let `XY^2` denote squared Euclidean distance.  The normalized chart fixes `A=(0,0)` and `P=(1,0)`.  The eleven generators, in source order, are:

```text
f1  = RW^2 - SW^2
f2  = RW^2 - UW^2
f3  = 1 - AS^2
f4  = 1 - AW^2
f5  = 1 - SU^2
f6  = 1 - SV^2
f7  = AR^2 - AV^2
f8  = PV^2 - PW^2
f9  = RV^2 - PV^2
f10 = RU^2 - PR^2
f11 = UV^2 - PU^2
```

The audited source `algebraic-minimal-core.sing` has SHA-256
`7ea5590062f4f0175de0b17b6b17fd553f806d00512f4be6fe4bb775fc160feb`.
The originating `result.json` has SHA-256
`3c54f5d25e05f8651c2fa33e46efc654af8ae458720d39f0b5274cfc5df90bcd`.

## Full normalized certificate

`extract-normalized-certificate.sing` uses exact rational coefficients and `liftstd`; it writes the eleven multipliers to `normalized-unit-certificate.singexpr` and reconstructs the identity in Singular.  The final check was:

```text
CERTIFICATE_ROWS=11
TOTAL_TERMS=34754
MAX_MULTIPLIER_DEGREE=8
CHECK_REMAINDER=0
```

Per-generator multiplier term counts are:

```text
2400, 1918, 3715, 4232, 2173, 3549, 3443, 4232, 3353, 2130, 3609.
```

The artifact is 19,666,359 bytes and has SHA-256
`d77355c755cf77448f5e78423009a376b5ba0935f5eb121916dacdc6b3e53ea5`.
Its size and very large rational coefficients make it useful as an audit witness but unattractive as a monolithic Lean `grobner` target.

The two msolve inputs differ only by generator order.  Their SHA-256 values are
`189b3e1bdf119508ac256e5b26c83e45f279ac1acd3eb064b48ce2323bc353ea`
and `325ffafc414deea46d795afd5b04d3983662d1d9491b0dba0410bc97ef589e35`.
Both exact runs returned:

```text
[-1]:
```

## Homogeneous axis certificate and invariant lift

Put `A=(0,0)` and `P=(u,0)` and replace every normalized unit squared distance by `u^2`.  With the variable `u` ordered last, Singular finds `u^8` in the homogeneous ideal and `liftstd` yields

```text
u^8 = sum_i D_i F_i.
```

The exact check reports:

```text
TOTAL_TERMS=14254
MAX_MULTIPLIER_DEGREE=6
CHECK_REMAINDER=0
```

The row term counts are

```text
1315, 1112, 1426, 1424, 1164, 1351, 1356, 1415, 1303, 1077, 1311.
```

`axis-u8-certificate.singexpr` is 1,953,704 bytes with SHA-256
`e5ff19a9af434b766323ddff5b19972ba8f9e54f02082bf11d6df053780e6f25`.

For the invariant lift, set `p=P-A`, `q=p dot p`, and for every point `X` set

```text
x_X = p dot (X-A)
y_X = det(p, X-A)
u   = q.
```

Lagrange's two-dimensional identity gives

```text
(p dot d)^2 + det(p,d)^2 = q * (d dot d).
```

Consequently `Phi(F_i)=q*f_i` for every one of the eleven generators.  Applying `Phi` to the axis identity gives `q^8=q*sum_i Phi(D_i)f_i`; cancellation in the polynomial ring gives the displayed `q^7` certificate.  Its target degree is 14, and the transported multipliers have degree at most 12.

`verify_certificate_exact.py` independently verifies:

```text
AXIS_IDENTITY_VERIFIED: sum(C_i*f_i) = u^8
NORMALIZED_SUBSTITUTION_VERIFIED: sum(C_i|u=1 * f_i|u=1) = 1
COORDINATE_FREE_COVARIANCE_VERIFIED: Phi(f_i_axis) = q*f_i_full for i=1..11
CERTIFICATE_TERMS=14254
MAX_MULTIPLIER_DEGREE=6
```

This was run as `uv run --with sympy python verify_certificate_exact.py`.

## Compact staged bilinear decomposition

The compact route uses isotropic coordinates over `CC`:

```text
z_X = x_X + i*y_X
b_X = x_X - i*y_X,
XY^2 = (z_X-z_Y)(b_X-b_Y).
```

Every generator is affine-linear in `(zR,zS,zU,zV,zW,1)`.  The resulting `11 x 6` matrix is encoded in `verify-generic-minor-subsystem-q.sing`.  Every selected `6 x 6` augmented minor vanishes at a solution.

Equations `f3` and `f4` imply `bs != 0` and `bw != 0`.  Split first on `br=0` and `bv=1`.  Real conjugacy then gives, respectively, `R=A` and `V=P`.

### Degenerate branches

An exhaustive exact search through all subsets of the eleven equations, in increasing cardinality, found these minimum-cardinality contradiction supports:

```text
R=A: f3, f6, f7, f9
V=P: f1, f4, f6, f8, f9
```

Exact `liftstd` reconstruction on these supports gives:

```text
R=0 support f3,f6,f7,f9 UNIT=1 IDENTITY=1 terms=33 maxdeg=6
V=P support f1,f4,f6,f8,f9 UNIT=1 IDENTITY=1 terms=111 maxdeg=4
```

These are small direct `grobner` candidates.  The branch equalities `(br,zr)=(0,0)` or `(bv,zv)=(1,1)` are included as generators.

### Generic branch without inverse variables

Assume `br != 0` and `bv != 1`, in addition to `bs != 0` and `bw != 0`.  Six low-term augmented minors suffice.  After cancelling the explicit known-nonzero factors from three of them, write their consequences as

```text
bv*(br-bw)*q1 = 0,
e2 = 0, e5 = 0, e7 = 0, e8 = 0, e9 = 0,
```

where the exact polynomials are printed by `verify-generic-factor-branches-q.sing` and preserved in `verify-generic-factor-branches-q.out`.  The first factorization gives three ordinary equality branches:

```text
bv = 0
br = bw
q1 = 0.
```

Exact rational `modStd(..., exactness=1)` verifies these consequences:

```text
bv=0  + e9
  => br*bs^2 = 0                         [direct substitution]

br=bw + e2,e5,e7,e8,e9
  => bs^3*bw*(bv-1)^3 = 0               [GB size 30]

q1=0  + e2,e5,e7,e8,e9
  => br*bs^2*bw^2*(bv-1)^2 = 0          [GB size 64]
```

Every right-hand product is nonzero under the generic hypotheses, so each branch is contradictory.  This removes the inverse variable used in the first generic unit-ideal check and turns the terminal argument into three polynomial equalities followed by `mul_ne_zero` reasoning.

For kernel-facing work, the two larger terminal products admit the following finer exact factor chains.  In the `br=bw` branch, exact `QQ` ideal reduction gives

```text
B3  = bs*(bv-bu)*(bw-1)*(bw-bv) = 0
B17 = bs*bv*h = 0
h   = bw^3-bv^2+2*bv*bw-3*bw^2+bw
```

If `bw=1`, then `h=-(bv-1)^2`; if `bw=bv`, then `h=bv*(bv-1)^2`.  Both contradict the generic hypotheses.  The remaining case is `bu=bv`, in which exact reduction gives

```text
B24 = -bv^2*(bw-1)*(bw-bv^2) = 0.
```

The `bw=1` alternative is already impossible, so `bw=bv^2`.  Substitution in `h=0` yields

```text
bv^3*(bv-1)^2*(bv+2) = 0,
```

hence `bv=-2`.  With `br=bw=4` and `bu=bv=-2`, the original residual equation `e9=0` is exactly

```text
-12*(bs^2+2*bs+4) = 0,
```

which is impossible over `Real` because `bs^2+2*bs+4=(bs+1)^2+3>0`.  Direct exact `lift` reconstruction measured the three staged memberships as follows:

Here `e9` is the determinant residual used in this audit.  In the kernel worker's normalized polynomial naming, `p9=36*(bs^2+2*bs+4)` at the same substitution, so the transplant coefficient recovering the positive quadratic is `1/36`, not `-1/12`.

```text
B3  after br=bw:          616 multiplier terms, max degree 7
B17 after br=bw:          410 multiplier terms, max degree 6
B24 after br=bw, bu=bv:    35 multiplier terms, max degree 4
```

An exhaustive subset screen followed by exact `QQ` confirmation found that `B3` and `B17` each require all five residual equations in this selected subsystem.

In the `q1=0` branch, three low-term members of the exact Gröbner basis are

```text
G3  = -(bu-bs)*(br-bv)*bv*bw = 0
G7  = bs*bv*(br^2-br*bv+bv^2-br) = 0
G39 = br*(br-1)*bw*(bu^2-bs*bw) = 0.
```

Put `F=br^2-br*bv+bv^2-br`.  Since `bs,bv` are nonzero, `G7` gives `F=0`.  If `br=1`, then `F=bv*(bv-1)`, impossible; hence `br!=1`, and `G39` gives `bu^2=bs*bw`.  If the second factor of `G3` vanishes, `br=bv`, then `F=br*(br-1)`, again impossible.  Thus `bu=bs`, after which `bu^2=bs*bw` and `bs!=0` give `bw=bs`.  Direct substitution in the original residual equations now gives

```text
e7 = -bs*(bv-1)*(bv-bs) = 0,
e8 | (bu=bs,bw=bs,bv=bs) = bs^2*(1-bs) = 0.
```

Therefore `bv=bs=1`, contradicting `bv!=1`.  Exact expanded lifts of `G3`, `G7`, and `G39` reconstruct successfully but contain respectively 5,038, 4,720, and 9,140 multiplier terms (maximum degrees 9, 9, and 11).  The factored displayed equalities, not those expanded multipliers, are the intended helper-theorem interfaces.

An exhaustive 64-subset support check shows that the first branch needs only `e9` and `bv=0`: direct substitution in `e9` gives `-br*bs^2=0`.  For the other two displayed targets, all five residual equations and the branch equation were required in the modular minimum-support screen; their final membership checks were then performed independently over `QQ`.

The six selected original minor supports are:

```text
q1 source: f1,f2,f3,f4,f5,f7
e2 source: f2,f3,f4,f5,f6,f7
e5 source: f3,f4,f5,f6,f7,f10
e7 source: f3,f4,f5,f6,f7,f11
e8 source: f3,f4,f6,f7,f8,f11
e9 source: f3,f4,f6,f7,f9,f11
```

This is the recommended Lean decomposition: prove the bilinear transport once; prove each small determinant/minor identity by ring normalization or a fixed linear combination; split the displayed factors; then run only the three reduced terminal algebra goals.  It avoids the observed monolithic `grobner` resource failure.

## Reproduction commands

Run from this directory:

```bash
Singular -q extract-normalized-certificate.sing
Singular -q extract-axis-u-last-certificate.sing
uv run --with sympy python verify_certificate_exact.py
msolve -f algebraic-minimal-core-forward.ms -o msolve-forward.out -t 1
msolve -f algebraic-minimal-core-reverse.ms -o msolve-reverse.out -t 1
Singular -q verify-degenerate-minimal-certificates.sing
Singular -q verify-generic-minor-subsystem-q.sing
Singular -q verify-generic-factor-branches-q.sing
Singular -q mine-q1-low-term-consequences-q.sing
Singular -q extract-br-bw-staged-certificate-metrics.sing
```

Tool versions used:

```text
Singular 4.4.1 (44105), arm64-Darwin
msolve 0.10.1
uv 0.11.7
Python 3.14.6
SymPy 1.14.0
Darwin 25.5.0 arm64
```

## Negative result / status discipline

A direct coordinate-free Gröbner run did not finish within 630 seconds and was interrupted.  Its status is **UNKNOWN**, not a contradiction certificate and not evidence against the ideal claim.  The exact invariant lift above replaces the need for that computation.

An optional attempt to expand the generic `q1=0` *terminal-product* membership into explicit `lift` multipliers was stopped after about 100 seconds and more than 600 MB resident memory.  This does not affect the exact `modStd` membership result, which completes quickly.  Separate lifts of the staged `G3`, `G7`, and `G39` intermediates did finish, but their 5,038, 4,720, and 9,140 multiplier terms are still unsuitable for manual transcription.  The `bv=0` and `br=bw` expanded terminal identities had 8 and 2,604 multiplier terms respectively; the compact staged polynomial statements above are the intended interface.

The current terminal classification is therefore:

```text
External exact QQ certificate: VERIFIED
Independent exact parser check: VERIFIED
Coordinate-free polynomial consequence q^7: VERIFIED algebraically
Lean source/kernel closure: NOT RUN / OPEN
SAT or CEGAR contribution: NONE
```
