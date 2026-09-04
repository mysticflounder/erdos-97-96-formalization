# Strict-Kalmanson n=11 remainder forensics

**Local date:** 2026-09-04

**Status:** arithmetic fingerprint reproduced; producer decomposition not recovered

**Scope:** positive-membership no-goods for the all-center row abstraction

**Solver use:** none

## Outcome

The locally reconstructed n=11 baseline still has 19,844 distinct clauses:

```text
40 * C(11,6) = 18,480   complete Berge
 4 * C(11,4) =  1,320   shared-pair nonalternation
                       +    44   complementary arcs r=2,3
                       -------
                        19,844
```

The externally announced base count is 42,504. Its unexplained baseline
remainder has the exact arithmetic fingerprint

```text
42,504 - 19,844 = 22,660 = 49 * C(11,6) + 22.
```

The displayed subtraction and multiplication are a direct pen-and-paper proof,
so the identity is **PROVEN (pen-and-paper arithmetic)**. Its interpretation
as 49 additional templates and one 22-element orbit is **HEURISTIC**. No local
artifact supplies those templates, the 22 clauses, or their producer scope.
Moreover, `C(11,5) = C(11,6) = 462`, so the count alone cannot distinguish
five-role templates from six-role templates.

The focused reproducer
`scripts/audit_strict_kalmanson_n11_remainder.py` pins the relevant
four-equality and K2 Lean source digests, rebuilds the existing 29,018-clause
expanded census, checks the arithmetic fingerprint, and enumerates the checked
four-equality selected-row transforms. Its focused tests pin every count below.

## Evidence labels

| Claim | Label | Evidence boundary |
|---|---|---|
| `22,660 = 49*462+22` | PROVEN, pen-and-paper arithmetic | displayed subtraction and multiplication; focused reproduction test |
| 19,844 reconstructed baseline | EMPIRICALLY VERIFIED, finite n=11 | `generate_strict_kalmanson_known_clause_census.py`; semantic families only |
| 29,018 expanded known union | EMPIRICALLY VERIFIED, finite n=11 | same reproducer; not authenticated as part of the missing base |
| C--M orbit and clause counts below | EMPIRICALLY VERIFIED, finite n=11 | source-digest-pinned exhaustive enumeration |
| 42,504 base and 375,144 augmented bank | HEURISTIC, external report | nthdegree message #10544; bytes and proof absent |
| 49-template plus 22-orbit producer | HEURISTIC | count fingerprint only |
| case-20 exact UNSAT | HEURISTIC, external report | nthdegree message #10544; no local replay artifact |
| abstract strict-Kalmanson n=11 survivor | EMPIRICALLY VERIFIED, exact finite witness | `p97_strict_kalmanson_n11_wave4_survivor.json` and its verifier |
| displayed planar chain obstruction | PROVEN, Lean-formalized | `Problem97.false_of_realizes_three_equilateral_chain`; axioms `{propext, Classical.choice, Quot.sound}` |

The focused Lean re-elaboration found no `sorry`, `native_decide`, `unsafe`,
`@[implemented_by]`, or `@[extern]` in the inspected theorem sources.
`Problem97.false_of_realizes_three_equilateral_chain` and the direct K2 theorem
report only `{propext, Classical.choice, Quot.sound}`. This proves the named
theorems under their stated hypotheses; it does not authenticate bank ingress.

## Timeline evidence from nthdegree

Message #10326 announced the n=10 9,280-clause structural bank. Message #10492
then reported that an n=11 bank containing complete Berge, shared pairs,
cyclic complementary arcs, and a “nine-role six-form ladder” left five of 110
row-0 cells. It also reported four new motif orbits and displayed one of them:
the six-role four-row cycle later formalized as schema I.

Message #10494 displayed a four-role three-row K2 collapse. Message #10517
displayed the final six-role Euclidean chain obstruction. Message #10544 then
announced the 42,504-clause base, the 332,640-clause Euclidean motif orbit, and
the 375,144-clause augmented bank.

Those messages do not give:

- the nine-role ladder role map or its clause count;
- the four mined motif-orbit generators and instantiation scopes;
- per-family counts before and after deduplication;
- the base-bank serialization;
- the fixed-cardinality master encoding; or
- a checkable UNSAT trace.

The interval from #10326 through #10544 contains no other posted strict-
Kalmanson family specification that fills those gaps. The focused custody
question is recorded in message #11436.

## Checked four-equality inventory

`KalmansonFourEqualitySchemas.lean` contains selected-row wrappers for schemas
C--M. Schemas C--K have increasing, decreasing, cyclic-shift increasing, and
cyclic-shift decreasing wrappers. L and M have only the two direct
orientations. Exhaustive role-orbit enumeration at n=11 gives:

| schema | arity | checked role patterns | n=11 clauses |
|---|---:|---:|---:|
| C | 7 | 14 | 4,620 |
| D | 6 | 12 | 5,544 |
| E | 6 | 12 | 5,544 |
| F | 7 | 14 | 4,620 |
| G | 6 | 12 | 5,544 |
| H | 6 | 12 | 5,544 |
| I | 6 | 6 | 2,772 |
| J | 6 | 12 | 5,544 |
| K | 6 | 12 | 5,544 |
| L | 7 | 2 | 660 |
| M | 8 | 2 | 330 |
| **distinct union** | | | **46,266** |

The finite enumerator finds zero exact clause overlap between this C--M union
and the existing 29,018-clause census. Its arithmetic subset test sums the
eleven listed whole-block counts; no such count sum is 13,486, the difference
between 42,504 and 29,018. This is a block-count test, not a search over every
subfamily of role patterns. Thus the file is rich enough to contain later
CEGAR material, but it does not recover the announced base decomposition.

The #10492 eight-atom motif is schema I. Its six checked dihedral role patterns
give `6*C(11,6)=2,772` clauses. This is a concrete source-backed family, not an
explanation of the full remainder.

## Four-role K2 scope

`FourRoleThreeRowK2Collapse.lean` proves the direct increasing-order seed from
#10494. Instantiation on increasing four-subsets gives 330 clauses and zero
exact overlap with the current census. Its full D4 role orbit has eight
patterns and 2,640 clauses, of which 660 already occur in the expanded census.
The source has no cyclic/reflection transport wrapper, so the 2,640 total is
bookkeeping rather than promoted proof coverage.

## Heuristic search notes outside the retained enumerator

Read-only searches inspected the named local sources and reported the notes
below. Their candidate universe and deduplication steps are not retained in a
replayable ledger, so this entire list is **HEURISTIC** and has no exclusion
weight:

- all 36 role patterns in `KalmansonThreeRowCycleSchemas.lean` already occur
  in the complete-Berge 40-pattern family;
- the 14-role theorem in `KalmansonSixteenEqualitySchema.lean` contributes no
  n=11 instantiations;
- the 20 transported 2K3 schemas have exact-rational certificate evidence but
  no schema-specific Lean adapters;
- `KalmansonSmallRoleCycleSchemas.lean` supplies ten S1 five-role patterns,
  while S2/S3 require an auxiliary gap witness and are not plain row-only
  four-role no-goods;
- `TwoKalmansonEqualityChainSchemas.lean` supplies a seven-role family;
- its unordered-D extension has 24 six-role degenerations only when named-role
  coincidences are admitted; and
- the endpoint, adjacent-grid, ordinal-cycle, and weighted-ingress files do
  not define fixed uniform row-only banks with the required count.

These notes do not establish absence from or inclusion in the announced base.

## Research consequence

The abstract strict-Kalmanson impossibility is refuted at n=11 by an
**EMPIRICALLY VERIFIED exact finite witness**: the retained integer metric
passes exact checks for every row equality, every strict triangle inequality,
and every strict Kalmanson comparison. That result is independent of the
missing base-bank custody. The **PROVEN (Lean-formalized)** declaration
`Problem97.false_of_realizes_three_equilateral_chain` excludes its displayed
planar motif and reports only core axioms. No finite-bank ingress or exhaustive
search closure is inferred from that theorem.

The missing computational claim is narrower: whether the announced finite
bank plus the Euclidean motif exhausts every n=11 row assignment. That remains
unverified until the 42,504 base or a fully specified independent replacement
and a checkable search proof are available.

## Reproduction

```bash
uv run python scripts/audit_strict_kalmanson_n11_remainder.py
uv run pytest -q scripts/test_audit_strict_kalmanson_n11_remainder.py
uv run --with ruff ruff check \
  scripts/audit_strict_kalmanson_n11_remainder.py \
  scripts/test_audit_strict_kalmanson_n11_remainder.py
```

## Next promotion gate

The highest-value handoff remains the original 42,504-clause base or a family
ledger detailed enough to regenerate it. The arithmetic fingerprint supplies
a precise integrity check, not a substitute: any proposed ledger must explain
the 22,660 remainder, state whether 462-sized blocks use five or six roles,
identify the 22 residual clauses, and reproduce the announced full-bank bytes
before its UNSAT result can be promoted.
