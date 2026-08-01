# P3/R2 crossed-row compute lane

Date: 2026-07-28

Scope: the sole open Fishburn--Reeds P3 row case
`r_a < r_c < r_b < r_d`, orientation 1.  Orientation 2 follows by
the already-proved C2 transposition symmetry in
`../fr-pattern-p3-proof-draft.md`, Proposition 5.  No production,
Lean, census, D9, `B_col`, or Theorem 3 file was changed.

## Result ledger

- **PROVEN (new, not yet adversarially audited):** R2 x C2 is
  forbidden.
- **PROVEN (new, not yet adversarially audited):** R2 x C1 is
  forbidden.
- **PROVEN, conditional only on the already-audited transcription and
  C2 orientation convention:** therefore the P3/R2 family has no
  strictly convex Euclidean witness, for either column subcase and
  either transposed orientation.
- **EMPIRICALLY VERIFIED:** a fresh full supporting-line nonlinear
  encoding independently reproduces the old zero-margin/degenerate
  boundary signature.  This evidence is not used in the proof.
- **CONJECTURED:** nothing in the final mathematical result.  Promotion
  to an admitted census rule remains gated on independent adversarial
  audit and integration outside this compute lane.

All distances below are normalized to 1.  General common distance
`delta > 0` follows by similarity.

## 1. Paper and encoding audit

The actual paper `/opt/nfs/1-s2.0-092577219290026O-main.pdf`, journal
page 88, Fig. 4 was inspected from a temporary 600 dpi render (not
retained, so the paper and its page image stay out of the repository).
The lettered orientation-1 drawing says

```text
rows: b < d and a < c
cols: k <= h
```

and its six marked cells are exactly

```text
(a,e1), (a,ek), (b,e1), (c,e2), (d,e2), (d,eh).
```

Under the pinned opposed (C2) traversal convention, R2 has:

- distinct-column subcase C1, cyclic order
  `(a,c,b,d,e2,eh,ek,e1)`;
- merged-column subcase C2 (`ek=eh=p`), cyclic order
  `(a,c,b,d,e2,p,e1)`.

Thus C2's required graph is exactly the unit path

```text
b -- e1 -- a -- p -- d -- e2 -- c,
```

and C1 consists of the two unit paths

```text
ek -- a -- e1 -- b       c -- e2 -- d -- eh.
```

The probe parameterizes exactly these paths.  Its convexity predicate
is not merely the signs of consecutive turns: for every directed edge
of the target cyclic order it tests every nonincident vertex against
that edge's supporting line, and it tests both global orientations.

The structural audit

```bash
uv run python scratch/p97-search-lane/p3-r2-compute/selfcheck.py
```

passes 1000 random parameter samples per case.  It checks all six
required lengths in each sample (worst floating error
`5.56e-16`), checks that the full systems contain 35 (C2) and 48
(C1) supporting-line inequalities, accepts a regular heptagon as a
positive control, and rejects a regular pentagram even though all of
the pentagram's consecutive turn signs agree.  This directly audits
the star-polygon failure mode that a turn-only encoding would miss.

## 2. Radial-order lemma used below

**Lemma (radial order in a strictly convex polygon).** Fix a vertex
`v` of a strictly convex polygon.  In the open interior wedge at `v`,
the rays from `v` to the other vertices occur in the same order as
those vertices on the boundary arc from one neighbor of `v` to the
other.  Consequently, an angle whose two bounding rays contain
intermediate vertex-rays is the sum of the intervening positive
angles.

**Proof.** A ray from `v` in the open interior wedge meets the boundary
arc opposite `v` exactly once.  Existence follows from convexity.
Two distinct boundary points cannot occur on the same ray: their
nearer point would lie in the relative interior of the segment from
`v` to the farther point and hence in the interior of the convex
polygon, contradicting that it is a boundary point.  As one traverses
the connected boundary arc, the ray direction therefore varies
continuously and injectively through an angular interval of length
less than `pi`; it is strictly monotone.  Strict positivity of every
intervening angle follows from no three polygon vertices being
collinear.  This proves both assertions.  QED.

## 3. Exact proof for R2 x C2

Rename the cyclic order

```text
A, C, B, D, E, P, F
```

with unit distances

```text
AF = AP = BF = CE = DE = DP = 1.
```

Define the positive angles

```text
U = angle FAP,   V = angle APD,   W = angle PDE,
X = angle FAB,   Y = angle PAD = angle ADP,
Z = angle CDE.
```

The isosceles triangles give

```text
X < pi/2,   Z < pi/2,
Y = (pi - V)/2,
angle EPD = (pi - W)/2,
angle APF = (pi - U)/2.                       (1)
```

At `A`, radial order inside its polygon angle is

```text
F, P, E, D, B, C.
```

Therefore

```text
X = angle FAP + angle PAD + angle DAB > U + Y.
```

Using (1), this gives

```text
2U < V.                                        (2)
```

At `D`, radial order inside its polygon angle is

```text
B, C, A, F, P, E.
```

Therefore

```text
Z = angle CDA + angle ADP + angle PDE > Y + W,
```

and (1) gives

```text
2W < V.                                        (3)
```

Finally, at `P` the ray order is

```text
E, D, B, C, A, F.
```

Its strictly convex interior angle is less than `pi`, while additivity
and (1) give

```text
angle EPF
  = angle EPD + angle DPA + angle APF
  = (pi-W)/2 + V + (pi-U)/2
  < pi.
```

Hence

```text
2V < U + W.                                    (4)
```

But (2) and (3) imply `U+W < V`, contradicting (4) (and `V>0`).
Thus R2 x C2 has no strictly convex realization.  QED.

The terminal contradiction is exact linear angle arithmetic; no
floating-point or optimizer claim enters it.

## 4. Exact proof for R2 x C1

Rename the cyclic order

```text
A, C, B, D, E, H, K, F
```

with unit distances

```text
AF = AK = BF = CE = DE = DH = 1.
```

Define

```text
U = angle FAK,   W = angle HDE,
X = angle FAB,   T = angle CDE,
Y = angle KAD,   Z = angle ADH.
```

The isosceles triangles `AFB` and `CDE` give `X,T < pi/2`.
The radial orders at `A` and `D` are respectively

```text
F, K, H, E, D, B, C
B, C, A, F, K, H, E.
```

Consequently

```text
X = U + Y + angle DAB > U+Y,
T = angle CDA + Z + W > Z+W,
```

so

```text
U+Y < pi/2,       W+Z < pi/2.                  (5)
```

The four vertices `A,D,H,K` inherit the strictly convex cyclic order
`A,D,H,K`.  Put

```text
Q = angle DHK,    R = angle HKA.
```

Their quadrilateral angle sum is

```text
Y + Z + Q + R = 2pi.                           (6)
```

Since `DH=DE`, the base angle `angle EHD=(pi-W)/2`.  At polygon
vertex `H`,

```text
angle EHK = angle EHD + angle DHK < pi,
```

hence

```text
Q < (pi+W)/2.                                  (7)
```

Similarly `AF=AK` gives `angle AKF=(pi-U)/2`, and at polygon vertex
`K`,

```text
angle HKF = angle HKA + angle AKF < pi,
```

hence

```text
R < (pi+U)/2.                                  (8)
```

Equations (6)--(8) imply

```text
Y+Z > pi - (U+W)/2.                            (9)
```

But (5) implies

```text
Y+Z < pi - (U+W).                              (10)
```

Because `U,W>0`, the upper bound in (10) is strictly smaller than the
lower bound in (9), a contradiction.  Thus R2 x C1 has no strictly
convex realization.  QED.

Again, the contradiction is exact angle arithmetic.

## 5. Independent empirical reproduction

Script: `r2_probe.py` (Python 3, NumPy, SciPy).

The initial global/local discriminating runs were:

```bash
uv run python scratch/p97-search-lane/p3-r2-compute/r2_probe.py \
  --case c2 --restarts 20 --seed 20260728 --de \
  --output scratch/p97-search-lane/p3-r2-compute/c2-first.json

uv run python scratch/p97-search-lane/p3-r2-compute/r2_probe.py \
  --case c1 --restarts 20 --seed 20260728 --de \
  --output scratch/p97-search-lane/p3-r2-compute/c1-first.json
```

Each command tests both orientations.  Differential evolution used
population multiplier 24, at most 2500 generations, tolerance
`1e-11`, followed by polishing.  It was then supplemented by 20
Nelder--Mead starts per orientation (`xatol=fatol=1e-12`, at most
10000 iterations).  Best raw supporting-line margins were `-0.0`
(C2) and `0.0` (C1).

The C2 optimizer approached the exact two-cluster collapse

```text
A = C = B = D,       E = P = F,
```

to displayed precision.  Its five chain directions approached

```text
pi, 0, pi, 0, -pi
```

in the script's `(b-from-e1, e1-from-a, d-from-p, e2-from-d,
c-from-e2)` convention.  The C1 optimizer likewise approached
`A=C=B=D` and a nearly collinear second cluster containing
`E,H,K,F`.  These are boundary degeneracies, not Euclidean witnesses.

The requested restart-count replications use 150 starts for each of
the two orientation signs in C2 (300 total), and 200 per sign in C1
(400 total):

```bash
uv run python scratch/p97-search-lane/p3-r2-compute/r2_probe.py \
  --case c2 --restarts 150 --seed 9720260728 \
  --output scratch/p97-search-lane/p3-r2-compute/c2-300-restarts.json

uv run python scratch/p97-search-lane/p3-r2-compute/r2_probe.py \
  --case c1 --restarts 200 --seed 9720260728 \
  --output scratch/p97-search-lane/p3-r2-compute/c1-400-restarts.json
```

These optimization results remain **EMPIRICALLY VERIFIED only**.
The completed replication produced best margins
`1.0154558527857627e-18` for C2 and signed `-0.0` for C1, both
indistinguishable from zero at double precision.  In the C2 best point
`E=P` to roundoff (`1.11e-16` separation); in the C1 best point
`E=H` exactly at the stored double values.  Thus this run independently
recovered the particular single-pair collapses reported by the earlier
draft, in addition to the more extensive two-cluster degeneracies
found by the differential-evolution runs.

The exact proofs in Sections 3--4 supersede them for the forbiddenness
claim.

## 6. Audit boundary

This note supplies a complete prose proof but has not received the
project's required independent math-skeptic audit.  Until that audit:

- call the mathematical result **PROVEN (author proof), UNAUDITED**;
- do not call P3 fully certified or admitted;
- do not promote an R-P3 production rule based only on this note.
