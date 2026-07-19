# Period-three all-reverse semialgebraic decision design

Date: 2026-07-17

Status: **RESTARTABLE EXACT FORMULATION COMPLETE.  THE TWO 3-SECOND Z3/CVC5
REPRESENTATIVE PROBES ARE `UNKNOWN`; THIS IS NOT UNSAT, NOT COVERAGE, AND DOES
NOT CLOSE A PRODUCTION `sorry`.  MORE IMPORTANTLY, THE 990 FIXED-ORDER LEAVES
ARE CONDITIONAL ON A SHARED ANCHORED BOUNDARY-ORDER PACKET THAT THE CURRENT
SOURCE INTERFACE DOES NOT YET PRODUCE.**

This lane owns only
`scratch/atail-force/cycle-three-rows-semialgebraic/`.  It did not edit
production Lean, plan documents, blueprint state, `ShellCurvature`,
`surplusM44`, the card-five lane, or protected 555/654 files.  No Lean or Lake
build was run, and no blind or open-ended numerical optimization was started.

## Required theorem-bank preflight

Before constructing a new local metric formulation, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling-bank and later cyclic-order sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered the period-three reverse outside pair, three
complete critical rows, blocker shells, and strict Kalmanson closure.  The
closest current theorem remains

```text
CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
```

and the already-catalogued U1/U5 incompatibility consumers.  None supplies the
missing cross-row common-boundary producer or decides the simultaneous planar
Euclidean/MEC system.  The bank therefore did not contain a theorem to reuse
for this leaf.

## Reduction boundary: source-open before algebra

The completed Kalmanson census proves an exact finite statement **inside its
fixed anchored chiral boundary abstraction**:

| actual outside targets | surviving fixed orders |
|---:|---:|
| 5, with the unique overlap between rows 0 and 1 | 360 |
| 6, all distinct | 630 |
| **total** | **990** |

However, the current live inputs `K + hperiod + hreverse` supply only three
separate `ReverseRowCyclicRoles` packets.  They do not yet supply one global
anchored chiral boundary order whose restrictions are all three row packets.
Consequently, the table above is not yet an on-spine exhaustive case split.

The logically prior producer should have the following content, schematically:

```lean
structure ReverseThreeRowSharedBoundaryOrder ... where
  globalOrder : one injective CCW enumeration of the named core and target union
  core_restrict : globalOrder restricts to
    o,left,q0,c0,c2,q1,c1,q2,right
  row0_restrict : globalOrder realizes ReverseRowCyclicRoles row0
  row1_restrict : globalOrder realizes ReverseRowCyclicRoles row1
  row2_restrict : globalOrder realizes ReverseRowCyclicRoles row2
```

The exact field types should reuse the repository's actual CCW/boundary-order
interfaces.  This report is not proposing a new production API.  It records the
missing mathematical transport: extract one common boundary enumeration from
strict convexity and prove that all three marginal role packets restrict from
it with the fixed chirality.  Until that producer exists, every QF_NRA leaf in
this lane is explicitly conditional.

## Degrees of freedom before choosing an engine

The formulation gauge-fixes `o = (0,0)` and `left = (1,0)`.  Four tangent
half-angle parameters place `q0,q1,q2,right` on the physical unit shell.  Three
scalars place each blocker on the perpendicular bisector of its two unit-shell
sources.  The remaining target points have free Cartesian coordinates.

| conditional leaf | variables | generically independent equalities | generic dimension |
|---|---:|---:|---:|
| five targets | 34 | 23 | 11 |
| six targets | 36 | 23 | 13 |

The 23 equations are eight tangent-coordinate definitions, six blocker
coordinate definitions, six target-circle incidences, and three circumcenter
definitions.  Eliminating definitional coordinates gives the same count more
transparently:

| leaf | core and target variables | circle equations | generic dimension |
|---|---:|---:|---:|
| five targets | 17 | 6 | 11 |
| six targets | 19 | 6 | 13 |

Thus the equality variety is strongly positive-dimensional.  A Singular or
msolve equality-only ideal computation cannot decide the target: the possible
contradiction lives in strict convex order, cap side, MEC containment, and
exact-class disequalities.  Running a Gröbner engine on the equalities would
mine the wrong object, so this lane deliberately did not do it.

## Exact polynomial parameterization

For `0 < t0 < t1 < t2 < T <= 1`, each physical source is defined by

```text
(1+t^2) x = 1-t^2
(1+t^2) y = 2t.
```

This is the rational tangent-half-angle chart on the required first-quadrant
arc.  It is complete there; no circle point in the live source interval is
omitted.  `T <= 1` is exactly the nonobtuse apex condition.

For row sources `q_i,q_j`, its blocker is

```text
c_i = lambda_i (q_i + q_j).
```

Because the sources are distinct unit vectors in an arc shorter than `pi`,
this parameterizes their complete perpendicular bisector and forces the two
source radii equal.  Each actual outside target has two free coordinates and
one circle equation for every row containing it.  A shared five-target vertex
therefore occurs in two target-circle equations.

The circumcenter `m` of `(o,left,right)` and its squared radius `R2` are encoded
without division:

```text
2 m_x = 1
2 right_y m_y = 1-right_x
R2 = m_x^2 + m_y^2.
```

All remaining constraints are polynomial equalities or inequalities over
reals.  The emitted SMT-LIB files declare `QF_NRA` explicitly.

## ENCODED ledger

For each selected fixed order, the formula encodes:

1. the Euclidean coordinate gauge `o=(0,0)`, `left=(1,0)`;
2. the exact physical unit shell for `q0,q1,q2,right`;
3. strict source order and the nonobtuse Moser apex condition;
4. all three blocker/source perpendicular-bisector equalities;
5. all six target-circle incidence equalities for the three complete `2+2`
   rows, including a repeated target variable in the five-target overlap;
6. the chosen cyclic order by requiring every other point to lie strictly to
   the left of every directed boundary edge;
7. the physical cap and outside targets on the two required strict sides of
   the endpoint chord;
8. containment of every named point in the exact circumdisk of
   `(o,left,right)`;
9. pairwise distinction of every named point;
10. every named nonmember excluded from the physical radius class; and
11. every named nonmember excluded from each of the three exact row classes.

Euclidean coordinates automatically imply all triangle and Kalmanson
inequalities, so those abstract metric constraints are not re-encoded.

## OMITTED ledger

The formula does **not** encode or prove:

1. the source-open `ReverseThreeRowSharedBoundaryOrder` producer described
   above;
2. the Lean finite-normalization adapter transporting a live shared order to
   one of the 990 case identifiers;
3. the total global `CriticalShellSystem`, K4 at every ambient source,
   deletion-survival/minimality, `hnoRem`, `noM44`, or the rest of the retained
   parent frontier;
4. unnamed ambient points or the global statement that no unnamed point joins
   one of the exact radius classes—the formula contains only the necessary
   named-point exclusions;
5. period-four or period-five all-reverse continuations; or
6. a kernel-checked CAD, Positivstellensatz, or Lean certificate.

Therefore SAT would only be a local model after exact replay, while UNSAT would
only decide a conditional fixed-order leaf until items 1 and 2 were proved.

## Bounded probes

`semialgebraic_probe.py` generated and tested two representative exact systems:

| case | points | variables | constraints | z3 4.16, 3 s | cvc5 `--nl-cov`, 3 s |
|---|---:|---:|---:|---|---|
| `k5_0384` | 14 | 34 | 346 | `UNKNOWN` (timeout) | `UNKNOWN_NO_VERDICT` (timeout) |
| `k6_1584` | 15 | 36 | 393 | `UNKNOWN` (timeout) | `UNKNOWN_NO_VERDICT` (timeout) |

Both engines passed hand-checkable SAT and UNSAT QF_NRA smoke instances first.
The tangent parameterization and an exact square-orientation test also passed.
The target results are absence of verdicts.  They are not evidence for SAT or
UNSAT, and no longer budget should be inferred from them.

`verify_design.py` independently reloads the finite Kalmanson records, checks
the 360/630 split and row-0/row-1 five-target overlap, rebuilds both formulas,
checks the DOF and constraint counts, parses the emitted SMT-LIB, and verifies
that the shared-order producer remains explicitly marked source-open.  Its
current output is:

```text
PASS: 990 conditional fixed-order leaves; k5 DOF=11, k6 DOF=13; representative z3/cvc5 probes UNKNOWN
PASS: shared anchored chiral boundary-order producer remains explicitly source-open
```

## Narrowest exact restart

The next proof-facing step is **not** another solver run.  It is the common
boundary-order producer.  Once that exists, the narrowest complete exact leaf
is `k5_0384`, with order

```text
o,left,q0,c0,c2,q1,c1,q2,right,t_x0_x1,t_y0,t_y1,t_x2,t_y2.
```

For an exact decision attempt, first eliminate the eight source coordinates,
six blocker coordinates, and three MEC auxiliaries from this leaf.  Keep the
five target coordinates implicit: that leaves 17 variables and six quadratic
circle equations without losing the antipodal point of any target circle.
Only then try CAD/interval subdivision on this one fixed order.

A more aggressive 11-variable rational chart may reflect the shared target
across the line of centers and parameterize the four unique targets by rational
rotations.  That chart is not exhaustive unless every omitted antipodal target
is either proved impossible from the fixed order or handled by an explicit
finite chart split.  Do not silently discard those exceptional leaves.

If `k5_0384` is SAT, export a model and independently substitute it into the
pre-encoding polynomial ledger before calling it a local witness.  If it is
UNSAT, cross-check with an independent exact engine and extract a certificate
or a small geometric inequality before scaling to the other 359 orders.  An
all-reverse branch closure requires the shared-order producer plus decisions
for every surviving order (or one theorem covering them), and then the same
work for periods four and five.

## Reproduction

Regenerate the two bounded probes and SMT-LIB files:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-semialgebraic/semialgebraic_probe.py \
  --timeout-ms 3000
```

Replay the finite split and formulation structure without launching target
solver probes:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-semialgebraic/verify_design.py
```

## Epistemic status

| Claim | Status |
|---|---|
| 360 five-target and 630 six-target orders survive the stored Kalmanson abstraction | **EXACT FINITE ENUMERATION** |
| Those 990 cases exhaust the current live Lean packet | **NOT PROVED; conditional on source-open shared-order producer** |
| Representative polynomial encodings match the stated local coordinate ledger | **EXACTLY GENERATED and structurally replayed** |
| Representative k5 or k6 leaf is SAT | **UNKNOWN** |
| Representative k5 or k6 leaf is UNSAT | **UNKNOWN** |
| Equality-only Gröbner search can decide the leaf | **NO; equality varieties have generic dimension 11/13** |
| This lane can currently close the all-reverse branch | **NO** |
| Production `sorry` closed | **NONE** |
