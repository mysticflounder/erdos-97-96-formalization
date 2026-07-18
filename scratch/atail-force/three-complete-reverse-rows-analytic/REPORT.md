# Three complete reverse rows: exact Euclidean/MEC audit

Date: 2026-07-18

Status: **EXACT RATIONAL LOCAL EUCLIDEAN/MEC COUNTERMODEL.  THE THREE
COMPLETE PERIOD-THREE `2+2` ROWS, SHARED CONVEX ORDER, CAP PLACEMENT, EXACT
NAMED FILTERS, FULL `8,6,6` LARGE-CAP CARDINALITY SURFACE, AND MEC GEOMETRY DO
NOT FORCE A FIRST-APEX CO-RADIAL RETURN OR DIRECT `False`.  THE NEXT DECISIVE
TARGET MUST ADD THE RETAINED FIRST-APEX T0/T1/FRONTIER ROWS OR GLOBAL
CRITICAL/MINIMALITY DATA.**

This lane owns only
`scratch/atail-force/three-complete-reverse-rows-analytic/`.  It did not edit
production Lean, shared docs, proof-blueprint state, git, `ShellCurvature`,
`SurplusM44`, or protected finite-certificate lanes.

## Preflight and starting point

The required theorem-bank registries and indexed Lean corpus had already been
checked for the immediately preceding all-reverse/common-deletion task and
were re-used here.  The relevant predecessor audits were:

- `cycle-three-rows-euclidean/REPORT.md`;
- `cycle-three-rows-semialgebraic/REPORT.md`;
- `cycle-three-rows-kalmanson/REPORT.md`;
- `period-three-rank2-coordinate-probe/REPORT.md`;
- `period-three-rank2-numerical-seed/REPORT.md`; and
- `period-three-rank2-interior-point/REPORT.md`.

The linear Kalmanson quotient was deliberately not enlarged.  Its 990 exact
rational survivors already prove that the linear abstraction is feasible.
The question here was whether actual rank-two coordinates and MEC/cap
placement eliminate the complete three-row surface.

## Discovery correction: the support-triangle escape split

The predecessor searches optimized all core and target variables at once and
found no hit.  The useful analytic decomposition is simpler.

Normalize the physical apex to `o = (0,0)`, put the two adjacent support
apices on the unit circle, and write the endpoint chord in unit-normal form

```text
n dot z = cos(A/2).
```

For row `i`, let `b_i` be its blocker, `r_i` its exact row radius, and `h_i`
the signed distance from `b_i` to the endpoint chord.  A necessary condition
for the two outside targets is

```text
r_i^2 - h_i^2 > 0.
```

This merely says that the blocker circle reaches the endpoint-chord side
containing the physical apex.  It is not enough for an outside target to be a
convex-hull vertex: the circle must also escape one of the other two support-
triangle edge lines.  Splitting that escape into the eight `L/R` choices
reduces the core to seven variables.  The `L/R/L` and `L/R/R` cells have
positive-margin numerical solutions.  Thus chord reach and triangle escape
are not an analytic contradiction.

Fixing the `L/R/L` core leaves only six circle angles.  Four independent
bounded runs then found substitution-checked full target completions.  This
exposed the earlier no-hit as an optimization/instrument result, not evidence
of infeasibility.

## Exact rational countermodel

`verify_exact_countermodel.py` replaces every trigonometric value by an exact
rational tangent-half-angle parameter:

- four rational parameters construct the unit-circle support apices and
  physical sources;
- three rational scalars place each blocker on the exact perpendicular
  bisector of its source pair; and
- six rational rotation parameters place two targets on each exact blocker
  circle.

The six row targets first give a fifteen-point rational core.  Two further
rational strict insertions, `zR` and `zO`, are placed just outside the
oriented edges `right -> x10` and `x11 -> o` while remaining strictly inside
the MEC disk and off every named radius.  All seventeen coordinates are
therefore rational.  The independent verifier
imports no optimizer or SMT solver and checks every predicate with
`fractions.Fraction`.

The exact counterclockwise order is

```text
o,
x20, x00, x01, x21,
left,
q0, b0, b2, q1, b1, q2,
right,
zR, x10, x11, zO.
```

The physical and reverse shells are

```text
o  : {left, q0, q1, q2, right}
b0 : {q0, q1, x00, x01}
b1 : {q1, q2, x10, x11}
b2 : {q2, q0, x20, x21}.
```

The exact replay proves:

1. all seventeen points are pairwise distinct and occur in the displayed
   strict convex order;
2. the support triangle `(o,left,right)` is nonobtuse;
3. every point lies in its circumdisk, while `o,left,right` lie on the
   boundary, so this disk is the minimum enclosing disk of the named set;
4. `q0,b0,b2,q1,b1,q2` lie strictly on the physical-cap side of the endpoint
   chord and all six targets plus `zR,zO` lie on the complementary side;
5. the physical radius class is exactly the five displayed named points;
6. all other physical-apex radius classes are singletons, so radius one is
   the unique radius class of cardinality at least four at `o`;
7. each blocker row is an exact four-point named radius class;
8. all six outside targets are distinct, so the three outside pairs are
   distinct;
9. every outside pair is non-co-radial from **both** adjacent support apices
   `left` and `right`; and
10. the three closed support-triangle caps have exact named sizes `8,6,6`.

The stable exact-coordinate digest is

```text
b4d51bfd3ee1001a49fe73c7338e040c6892ff7de4f4ed3fec0ae50ee1cf292a
```

The smallest exact margins reported by the verifier are all positive.  In
particular:

```text
strict hull:
6693340668291196631103961924212118160445
/
780149295060514742830388358241252065815325224

MEC interior:
701547839496284819515184724585227269547153161886
/
75660583873848948946646718022878101021398447890625

either-adjacent-apex nonreturn squared-distance gap:
93895147765448733985661556826327571606921696
/
5500696164199932938985379498040033330882736473
```

Because these are actual rational planar coordinates, every Euclidean
Ptolemy, Cayley-Menger/rank-two, and nonlinear circle identity holds
automatically.  Those conditions cannot be the missing local consumer.

## Lean validation boundary

`ExactThreeRowMecCountermodel.lean` reconstructs the same rational model and
checks the complete Boolean ledger.  Direct elaboration with warnings as
errors succeeds.  Its axiom report is

```text
propext,
Classical.choice,
Lean.ofReduceBool,
Lean.trustCompiler,
Quot.sound
```

Therefore the Lean theorem is **compiler-reduced, not kernel-only**.  It does
not use `sorry` or a custom mathematical axiom, but its finite Boolean proof
uses `native_decide` and must not be described as a trust-free kernel
certificate.  The independent `Fraction` replay is the primary exact audit.

## Exact cap and source mapping

The model can be read source-faithfully on the physical/reverse surface in
the production fixed-core orientation as

```text
S.oppApex2  = o
S.oppApex1  = right
surplusApex = left

cycle sources = q0,q1,q2
actual blockers = b0,b1,b2.
```

Its three named caps in that designation are:

```text
S.surplusCap (opposite left) : 6
S.oppCap1   (opposite right) : 6
S.oppCap2   (opposite o)     : 8.
```

Thus the two rational insertions make this a genuine exact model of the full
`L` **cap-cardinality** surface: the designated surplus cap has more than four
points and both opposite caps have at least six.  This does not construct the
other fields of `L` such as total K4/CSS, minimality, `noM44`, or the retained
first-apex rows.

The physical exact-five profile is an **endpoint-hit** profile: besides the
three strict physical cycle sources, the other two class members are the two
adjacent support apices.  Current production `LargeCapUniqueFiveSecondApexRadius`
and `three_le_capInterior_hits_of_largeCapUniqueFive` do not exclude this
profile.

## Comparison with the previous 25-role numerical seed

This exact model does **not** embed into the fixed word used by
`period-three-rank2-numerical-seed` without changing that cell.

The old complete-row-compatible cell used

```text
physical exact five = {nI,c0,c1,c2,nS}
```

and treated `(second,nI,nS)` only as an auxiliary exact seed triangle; its
live distinguished vertices `first,second,surplus` were still missing.  It
also put the reverse targets into a different within-cap pattern.

The new exact model instead supplies a different legal branch:

- physical profile: three strict cycle sources plus both support-apex
  endpoints, i.e. the endpoint aliases `nI = surplus = left` and
  `nS = first = right` in the previous role vocabulary;
- blockers: three fresh distinct strict-physical centers;
- target identity partition: fully disjoint six-target branch;
- target roles, relative to `S = surplus cap`, `I = first-opposite cap`:
  row 0 is `II`, row 1 is `SS`, row 2 is `II`; and
- within-`I` order: the row-2 pair encloses the row-0 pair,
  `x20 < x00 < x01 < x21`, while `x10 < x11` lies in the other adjacent cap.

Starting at the retained first apex, the exact physical/reverse subsequence is

```text
first=right,
zR,x10,x11,zO,
second=o,
x20,x00,x01,x21,
surplus=left,
q0,b0,b2,q1,b1,q2.
```

This endpoint-hit branch was not the old fully-disjoint 25-role word.  The
full-role quotient report already warned that its exclusive `I/S/O`
normalization did not yet give source coverage for distinguished cap-endpoint
aliases; the exact model makes that warning concrete.

## Can it seed T0/T1/frontier?

Only partially.

It is an exact, source-faithful seed for:

- the support triangle and MEC disk;
- the physical exact-five class;
- all three cycle sources and blockers;
- all three complete reverse rows; and
- one exact boundary-order/target-role cell.

It does **not** supply the retained first-apex frontier or the T0/T1 rows.
An exact scan of squared distances from `first = right` finds no repeated
distance among the other sixteen named points.  Hence no two existing
vertices can simultaneously serve as `q,w`, and no displayed pair can be
reused as the first two members of a four-point T0 or T1 shell at that apex.

The exact roles still to be solved are the production
`FirstApexShellRolePacket` roles:

- each of `q,w` is in `S.oppCap2` or `strictFirstOppositeCap S`, with at
  least one in the strict first-opposite cap;
- T0 is the retained row through `q,w` and has two strict-first-cap hits;
- T1 is the double-deletion row and also has two strict-first-cap hits; and
- in the unequal-radius arm the T0 and T1 supports are disjoint.

Their boundary slots are not fixed by this model and still require an order-
cell enumeration.  The clean fully-disjoint fixed-coordinate extension adds:

- `q,w` plus two T0 completion points; and
- four T1 points,

for eight fresh first-apex shell points.  A more general aliasing extension
could reuse at most one existing point on each of the two new radii; the
exact scan rules out reusing an existing pair.  The cap bounds are already
met, but the T0/T1 metric, role, and boundary-order constraints still must be
solved, not assumed.

## Route correction and next exact target

The following implication is now exactly refuted:

```text
complete period-three physical/reverse cycle
+ all three complete 2+2 rows
+ strict convex common order
+ exact named filters
+ actual planar Euclidean rank two
+ support-triangle MEC/cap geometry
  -> first-apex co-radial reverse pair or False.
```

Do not spend another round on local Ptolemy, Cayley-Menger, generic MEC, or
marginal curvature for these three rows.  The narrow next feasibility/
certificate problem is the **first-apex extension of this exact endpoint-hit
seed**:

1. add the retained first-apex frontier pair and full T0/T1 selected rows;
2. preserve both six-point opposite-cap bounds;
3. preserve the exact physical and reverse named filters and the common MEC
   order; and
4. only after that add total critical-map/K4, minimality, and `noM44` fields.

An exact SAT extension would prove that even the full geometric row front is
nonterminal and force the route onto global criticality/minimality.  An exact
UNSAT certificate or a small analytic inequality for this extension would be
the first result on this line capable of closing the all-reverse leaf.

## Reproduction

Exact independent replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/three-complete-reverse-rows-analytic/\
  verify_exact_countermodel.py
```

Compiler-reduced Lean replay:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/three-complete-reverse-rows-analytic/\
  ExactThreeRowMecCountermodel.lean
```

The discovery scripts `audit_chord_reach.py` and
`search_fixed_core_targets.py` retain the bounded route from the seven-
parameter escape core to the exact rational model.  They are not proof
artifacts.
