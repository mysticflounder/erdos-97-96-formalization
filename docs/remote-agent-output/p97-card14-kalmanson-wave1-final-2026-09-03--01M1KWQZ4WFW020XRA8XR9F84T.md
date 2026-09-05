# P97 card-14 Kalmanson screen — wave 1 final checkpoint

**Date:** 2026-09-03  
**Scope:** exact screen of the authenticated maximal `firstOppositeO1Six` card-14 model; reusable local no-good family prepared for all card-14 models.  
**Status:** the maximal displayed model is refuted. The other five authenticated profile models still require their raw support maps or a source-faithful CEGAR rerun with the new clauses.

## Main exact result

The maximal authenticated model has cyclic order

```text
[1,3,4,5,0,6,7,8,9,2,10,11,12,13].
```

Its 91 pair distances quotient to 38 equality components, so the retained equalities have rank 53. Exhaustive generation produces 2,002 strict Kalmanson inequalities. After equality cancellation:

- 597 reduce to one-component comparisons `X > Y`;
- 170 pairs have opposite reduced coefficient vectors and are immediate exact contradictions;
- the homogeneous normalized LP has no positive strict margin.

A canonical six-role certificate uses only three authenticated selected rows:

```text
center 3  contains {4,6}
center 1  contains {6,9}
center 10 contains {4,9}
```

The roles occur in cyclic order

```text
1 < 3 < 4 < 6 < 9 < 10.
```

Strict Kalmanson on `(1,3,4,6)` gives

```text
d(1,4) + d(3,6) > d(1,6) + d(3,4).
```

Because the row at center `3` gives `d(3,6)=d(3,4)`, this gives `d(1,4)>d(1,6)`.

Strict Kalmanson on `(1,4,9,10)` gives

```text
d(1,9) + d(4,10) > d(1,4) + d(9,10).
```

Because the row at center `10` gives `d(4,10)=d(9,10)`, this gives `d(1,9)>d(1,4)`.

The row at center `1` gives `d(1,6)=d(1,9)`, hence

```text
d(1,4) > d(1,6) = d(1,9) > d(1,4),
```

a contradiction.

This is exactly the source-clean theorem

```text
Problem97.ATailCapCrossingKalmanson.false_of_six_ccw_two_k2_three_selected_rows
```

at `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:863-880`. The current-source audit reports axiom closure `[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.

## Occurrence census

The support-level scanner checks every cyclic cut and both orientations. The maximal model contains:

- 20 unique oriented occurrences;
- 13 direct-order occurrences;
- 7 reflected-order occurrences.

## Universal finite no-good family

For labels in cyclic order `a,b,c,d,e,f`, the theorem forbids simultaneous membership

```text
{d,e} ⊆ row(a),  {c,d} ⊆ row(b),  {c,e} ⊆ row(f).
```

The representation-neutral clause is

```text
¬hit(a,d) ∨ ¬hit(a,e) ∨ ¬hit(b,c) ∨
¬hit(b,d) ∨ ¬hit(f,c) ∨ ¬hit(f,e).
```

At `n=14`, complete enumeration gives:

- 84,084 raw oriented role instances;
- 36,036 unique width-6 no-goods;
- 12 unique clauses per cyclic six-subset.

Payload hashes:

```text
rank order [0,...,13]:
1d2502192c18e870174eaa7f6140591f4321f9a02f99fc158a466da4f6ee0699

maximal physical-label order:
cda2b51d33a64bde1cc57630057c3bcd1b18a6038f18c43f51b0e4c26897dc6d
```

The maximal support assignment falsifies exactly 20 clauses, agreeing with the occurrence scanner.

The clause is local and cardinality-independent: it uses only six ordered boundary vertices and six positive row memberships. It does not use exact cardinality 14, exact cap sizes, global blocker coverage, or `k4_everywhere`. A future full-profile UNSAT proof may still depend on those global families and therefore needs a separate heredity audit.

## Negative control

The abstract cyclic row system `row(c)=c+{1,2,4,8} mod 14` has zero occurrences. Thus the cut is not a disguised consequence of row size four, pair-codegree bounds, or generic cyclic incidence.

## Reproducibility

The sealed bundle contains:

- `card14_triangle_occurrence_scan.py`;
- `card14_kalmanson_scan.py`;
- `card14_two_k2_clause_family.py`;
- maximal-model support/equality inputs and outputs;
- both 36,036-clause family files;
- the cyclic1248 negative control;
- `run-manifest.json` and `SHA256SUMS.txt`.

All three scanners compile, all generated result files replay byte-for-byte, both clause-family files regenerate byte-for-byte, both embedded family hashes verify, the manifest self-hash verifies, and the maximal assignment independently falsifies exactly 20 universal clauses.

Run manifest SHA-256:

```text
dce96cad7ce29108aec4eb1a27ca7a89930baccb56b6336eae8fdeb24210b02b
```

Archive SHA-256:

```text
27376881c9e987503f3f5afd949df9ef23756d48ed8e603637b073ce387a704d
```

## Remaining execution

The other five authenticated card-14 models have not yet been screened because their raw support maps have not been returned to this session. Their packets were requested in project message `#9394`; source-faithful CEGAR integration of the 36,036 clauses was requested in `#9395` and `#9410`.

For each returned model, the next deterministic sequence is:

1. support-level six-role occurrence scan;
2. full equality-component Kalmanson scan if needed;
3. structural rerun with the entire universal no-good family;
4. proof/core heredity audit on any UNSAT result.

## Claim boundary

Proved:

- the displayed maximal model is incompatible with a strictly convex planar distance matrix;
- the contradiction is an existing source-clean Lean theorem;
- the `n=14` local clause family is finite and deterministic.

Not proved:

- profile-wide UNSAT after CEGAR;
- refutation of the other five displayed models;
- impossibility of every card-14 profile;
- an arbitrary-cardinality theorem forcing an occurrence.
