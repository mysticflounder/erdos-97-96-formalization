# Period-three rank-two coordinate encoding audit

Date: 2026-07-17

Status: **THE COORDINATE FORMULA CORRECTLY ENCODES ONE FIXED, FULLY
DISJOINT, SOURCE-LEGAL PROJECTED ROLE CELL.  IT DOES NOT ENCODE THE FULL LIVE
PARENT.  THE TWO 120-SECOND RUNS ARE `UNKNOWN`, SO THEY ESTABLISH NO
MATHEMATICAL VERDICT AND CLOSE NO `sorry`.**

This audit independently compared
`period-three-rank2-coordinate-probe/coordinate_probe.py` with the fixed cell
in `period-three-full-role-identity-quotient/{REPORT.md,
probe_fully_disjoint.py}`.  It did not edit that producer, production Lean,
shared docs, proof-blueprint state, git, `ShellCurvature`, `SurplusM44`, or any
protected lane, and it ran no Lean/Lake/LSP command.

## 1. Fixed role map

The 25 names and their cap blocks agree exactly with the predecessor cell.
With the displayed orientation the closed boundary word is

```text
first,
  t0s, nS,
second,
  q, w, t0i, t1i0, t1i1, t1i2, nI,
  x0, y0, x1, y1, x2, y2,
surplus,
  c0, b0, b2, c1, b1, c2, t1o.
```

Thus the three open support-triangle blocks are:

| role | open block | fixed names |
| --- | --- | --- |
| `S` | `first -> second` | `t0s, nS` |
| `I` | `second -> surplus` | `q, w, t0i, t1i0, t1i1, t1i2, nI, x0, y0, x1, y1, x2, y2` |
| `O` | `surplus -> first` | `c0, b0, b2, c1, b1, c2, t1o` |

The row assignments are consequently the advertised ones:

- `T0 = {q,w,t0i,t0s}` has profile `3I + S`;
- `T1 = {t1i0,t1i1,t1i2,t1o}` has profile `3I + O` and is disjoint from
  `T0`;
- the physical exact-five row is
  `{c0,c1,c2,nS,nI}`, namely three strict physical points and one point in
  each adjacent block;
- the blockers `b0,b1,b2` are fresh strict-physical points; and
- the reverse outside pairs `{x0,y0}`, `{x1,y1}`, `{x2,y2}` are six fresh,
  pairwise-disjoint points, all in the `I` block in this chosen cell.

All 25 names are deliberately distinct.  This is one legal identity branch,
not a theorem that the live source forces full disjointness.  Likewise the
chosen unequal-radius arm, physical `3 + 1 + 1` profile, all-`I` outside
targets, one orientation, and this one within-block order are branch choices.
They would be overstrong in a universal encoding, but are legitimate in a
fixed-cell realizability probe.

There is one important projection caveat already visible in the word: the
named closed surplus cap has only
`{first,t0s,nS,second}`, hence cardinality four.  A live
`SurplusCapPacket` requires its surplus cap to have cardinality at least five.
The fixed formula must therefore be read as a named projection with at least
one unrepresented surplus-block carrier vertex, not as a complete 25-point
carrier.

## 2. Normalization and strict convexity

The normalization

```text
first = (0,0),  second = (1,0)
```

is sound.  Strict convexity makes the two points distinct, and translation,
positive scaling, and rotation send any such ordered pair to these values
while preserving squared-distance equalities, disequalities, and orientation.
No reflection quotient is silently used: the formula keeps the displayed
counterclockwise orientation only.

For each of the 25 consecutive directed boundary edges, the encoder requires
every other 23 named vertices to lie strictly to its left.  The resulting
`25 * 23 = 575` determinant inequalities are a correct sufficient encoding
of the displayed strict convex polygon.  Conversely, every named cyclic
subsequence of a live strictly convex carrier satisfies them, even when
unrepresented vertices occupy the gaps.  The 300 explicit pairwise
squared-distance-positive atoms are redundant but not stronger: strict
edge-side convexity already makes all named vertices distinct.

The local smoke test is appropriate and passed: the counterclockwise unit
square is accepted, a crossed order is rejected, a unit four-shell is
accepted, and a non-equidistant four-tuple is rejected.

## 3. Shell equations and exclusions

There are exactly **19 nontrivial shell equalities**:

| row family | support size | equality count |
| --- | ---: | ---: |
| `T0` | 4 | 3 |
| `T1` | 4 | 3 |
| physical | 5 | 4 |
| reverse rows, three times | 4 each | 9 |
| **total** | | **19** |

The family counts printed as `4,4,5,4,4,4` also include one positive-radius
atom per row.  They must not be misread as 25 equalities.

`T0` and `T1` are correctly treated as selected subrows: no exact-class
exclusions are attached to them.  Their squared radii are required to differ,
which is the chosen unequal-radius branch.

The physical row excludes every other named point: `25 - 1 center - 5
support = 19` exclusions.  Each reverse row excludes every other named point:
`25 - 1 center - 4 support = 20` exclusions, for 60 in total.  Omitting the
center from these explicit lists is sound because its squared distance is
zero and each row radius is positive.

These 79 exclusions are necessary consequences of the live full-filter
physical class and exact critical four-shells.  They are nevertheless only
**named** exclusions.  The formula does not assert that an unrepresented
carrier vertex avoids those radii, so it does not yet instantiate the global
five-point physical class or the global exact critical supports.

The frontier constraint

```text
sqdist(second,q) != sqdist(second,w)
```

is the correct squared-distance version of the sourced `q/w` inequality.

## 4. Reverse-cycle incidence and alternation

For row `i`, the center and support are

```text
b_i : {c_i, c_(i+1), x_i, y_i}   (indices modulo 3).
```

This encodes both the current source and successor source in the successor
critical row, hence the all-reverse edge, while exact named exclusion removes
the nonincident cycle source.

The boundary order also implements the Lemma-223/230 alternation/localization
conditions:

- `b0` lies in the physical interval from `c0` to `c1`;
- `b1` lies in the physical interval from `c1` to `c2`; and
- `b2` lies in the physical interval from `c0` to `c2`, rather than on the
  complementary arc through `second`.

Equivalently, each owner chord `second--b_i` alternates with its source chord
`c_i--c_(i+1)`.  The non-obvious placement `c0,b0,b2,c1,b1,c2` is therefore
intentional and correct.

The fixed support choice also excludes `second` from every reverse radius.
That is consistent with the prose opposite-apex omission and is a legal fixed
subcell even before that omission has an imported Lean bridge.  It must not be
reported as a source-wide quotient reduction solely from this encoding.

## 5. Exact omitted live-parent ledger

The formula is deliberately a projection.  A SAT model, if one is eventually
found, would still have to extend through every item below.

### Ambient carrier and counterexample data

- all unrepresented carrier vertices and their exact boundary gaps, including
  at least one additional surplus-block point;
- convex independence of the **whole** carrier, rather than only the 25 named
  vertices;
- `D.K4`, i.e. a four-equidistant witness at every carrier point; and
- the concrete `CounterexampleData`/carrier provenance.  Nonemptiness and
  cardinality greater than nine are already forced by the 25 distinct named
  vertices, but the remaining structure is not.

### MEC, caps, and the surplus packet

The coordinate-only phase omits:

- the common minimum-enclosing disk;
- the three distinguished vertices on its boundary;
- nonobtuseness of the support triangle;
- the induced cap-segment/cap-partition interpretation for the entire
  carrier; and
- the surplus-cap cardinality field.

The optional MEC phase adds the corresponding coordinate constraints for the
25 named points.  Even then it does not add the missing carrier vertices,
their disk/cap placement, or the full `SurplusCapPacket` proof object.

### First-apex frontier and retained rows

- provenance of `q,w,T0,T1` from the same retained
  `CriticalPairFrontier`, `FrontierCommonDeletionParentResidual`, and
  `FirstApexShellRolePacket`;
- the full frontier marginal, first-apex split, second-apex split, and common
  deletion packet, beyond their necessary fixed-row distance consequences;
- the selected-row subset/deletion provenance and all parent-facing survival
  fields as source objects, even where the fixed disjoint rows make the
  corresponding bare existence statements metrically plausible; and
- the still-unelaborated producer for `FirstApexShellRolePacket`.

### Physical exact-five cycle and critical map

- global exactness of the five-point class at `second`, including exclusion of
  every unrepresented carrier point;
- `LargeCapUniqueFiveSecondApexRadius.unique_K4_radius`;
- construction of `b_i` and each reverse row from one total retained
  `CriticalShellSystem`;
- global exactness of each selected critical four-shell, including all
  unrepresented carrier points;
- `CriticalShellSystem.no_qfree` / source-by-source deletion failure;
- values and K4 witnesses for the critical-shell map at every source outside
  the three displayed cycle sources;
- provenance of the displayed three rows as one actual omission transition,
  minimal period exactly three, and the production period/cycle proof; and
- any extra deletion-survival and blocker facts carried by the full physical
  cycle but not reducible to the 19 named equalities.

### Parent closure hypotheses

- `D.Minimal` over every smaller convex K4 carrier; and
- `R.noM44`, the universal exclusion of an `(m,4,4)` surplus packet.

Thus “planar coordinate SAT” would be stronger than the predecessor's
abstract-distance SAT but still would not be a live counterexample.  Conversely,
fixed-cell UNSAT would eliminate only this identity/order/profile cell, not
the whole period-three branch.

## 6. Solver binding and current verdict

The final full coordinate formula has 46 free reals and 981 named atoms.  The
two recorded full runs each used a nominal 120-second solver budget and both
returned `UNKNOWN` due timeout:

```text
Z3 4.16.0 QF_NRA: unknown (timeout)
cvc5 1.3.3 --nl-cov: no verdict after its 120-second tlimit
```

Therefore there is no SAT witness, no UNSAT result, no certificate, and no
mathematical progress to bank from those calls.

The driver now distinguishes two hashes:

- an asserted-formula serialization, shared semantically by the Z3 in-memory
  assertion list and the cvc5 formula,
  `f61bf7b51c2cbc054a7fc871beef3b61c34a2b0825fdcdb1df1ab825123e655c`;
  and
- the cvc5 command stream, which additionally requests model values after
  `check-sat`,
  `685e8a1e4dd169a05e5d9a77a8cf78d3a7aa54e1c28130058f8e4f6d492d662b`.

This is the correct distinction: the engines do **not** literally consume one
identical SMT2 byte stream.  Z3 consumes the assertions in memory; cvc5
consumes the serialized formula plus `get-value`.  The result metadata must
bind both calls to the same asserted atom list, not claim byte-identical
inputs.

The budget discipline is also nominally common but operationally asymmetric:
Z3 uses its in-process 120-second timeout; cvc5 uses a 120-second `--tlimit`
and an outer subprocess timeout with a 20-second grace period.  Both expensive
solver searches are bounded at 120 seconds internally, but they do not have
an identical 120-second external wall-kill mechanism.

## Final classification

| question | audit result |
| --- | --- |
| Fixed role map and cyclic word | **CORRECT** |
| Similarity normalization | **CORRECT** |
| Nineteen row equalities | **CORRECT** |
| Named exact-support exclusions | **CORRECT, BUT NOT GLOBAL EXACTNESS** |
| `q/w` inequality | **CORRECT** |
| Blocker/source alternation | **CORRECT** |
| Strict convexity encoding | **CORRECT FOR THE NAMED SUBCONFIGURATION** |
| Full-disjoint/profile/order choices | **LEGAL FIXED BRANCH; NOT UNIVERSAL** |
| Full live-parent encoding | **ABSENT; OMITTED FIELDS LISTED ABOVE** |
| Two engines consume identical SMT2 bytes | **NO; SAME ASSERTIONS, DIFFERENT EXECUTION INPUTS** |
| Hard budgets | **BOTH INTERNALLY 120 S; EXTERNAL MECHANISMS DIFFER** |
| Current solver decision | **UNKNOWN / NO VERDICT** |
| Production `sorry` closed | **NONE** |
