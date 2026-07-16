# R/full-parent continuation object gate

Date: 2026-07-15

Status: **PROPOSED TWO-ROW TARGET REJECTED BEFORE ENCODING; NO SOLVER RUN;
BRANCH-INDEXED FULL-PARENT COUPLING OPEN.**

## Decision

The proposed solver target built from two continuation rows and a common
union of

- repeated outside-pair support;
- an original-U5 fixed-triple role; or
- a same-cap blocker/rank edge

does not pass the source-to-consumer gate.  No formula was generated and no
solver was run.

The failure is structural, not a solver-budget issue.  The live source
constructs an `R` normal form and a continuation dispatch on the same concrete
frontier, but no current theorem couples their incidences.  The proposed
terminal alternatives are either impossible already on the bare continuation
surface, missing a live role map, or nonterminal.  Encoding their union would
therefore answer a different question from the Lean obligation.

## Exact source-produced joint object

Fix a concrete

```text
F : CriticalPairFrontier D S r H
```

and the `R` witness

```text
hR : HasNEquidistantPointsAt 4
  ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1.
```

Two checked constructions are then available.

1. `exists_doubleSurvivalBranchNormalForm F hR` produces the robust descent,
   retained erased-pair history, and terminal subcarrier.
2. `nonempty_frontierContinuationDispatch F` trims the actual twice-erased
   second-apex witness to a row omitting `F.pair.q,w`, chooses two strict
   `oppCap2` centers, and uses all-center `D.K4` to choose their rows.

Their product is source-complete, but it is only juxtaposition.  The second
construction never consumes `hR`; the first supplies no membership of a
retained robust pair in either continuation row.  In particular, the live
source proves the omissions of the original frontier pair from the parent
second-apex row and proves the continuation centers distinct from that pair,
but it does not prescribe the supports of the two new rows.

The sharp source-complete quotient is consequently

```text
(R blocker branch B0 or B1 or B2)
times
(CrossSurvival or NonEquilateral or Equilateral continuation output).
```

Every `B` branch remains nonterminal, and every continuation output needs its
own branch-specific geometric selection.  Naming this product in another Lean
structure would not close a branch.

## Why the proposed common union fails

### Repeated outside pair

`TwoContinuationRows.common_support_outside_oppCap2_card_le_one` forbids the
two native rows from sharing two points outside `oppCap2`.  Similarly,
`false_of_strictOppCap2_row_contains_firstApex_strict_pair` closes a single
row containing both members of a strict first-apex pair.  These are genuine
conditional terminals, but no source theorem selects the required pair in a
continuation support.  For an arbitrary retained robust pair, only one
endpoint is known to be strict `oppCap1`, so even the intended localization is
not source-produced.

### Original-U5 fixed-triple role

`U5QCriticalTripleClass.two_triple_points_incompatibility` is a genuine
terminal consumer.  The live parent source `q` lies in the leaf surplus cap,
whereas the `R` endpoints lie outside it, so identifying that role with an R
endpoint is impossible.  The continuation rows also lack the named
q-critical provenance and the required memberships of two dangerous-triple
points.  Global K4 supplies an anonymous selected four-row, not those roles.

### Same-cap blocker/rank edge

A continuation row can be used to form a `SameCapIncompatibleEdge` only after
an endpoint hit and the endpoint-radius equality have been produced at an
actual blocker.  No current theorem supplies that endpoint hit.  Moreover,
`source_pushout_left` and `source_pushout_right` return rank-interval
membership, not `False`.  A raw edge is therefore not a terminal alternative;
it must carry an invariant-preserving strict rank decrease, a complete
wrong-side terminal, or enough history to construct a strict-lap terminal.

## The valid branch-indexed contract

The existing scratch structure

```text
UnifiedFrontierParentCoupling F
```

already states the smallest checked every-arm terminal contract.  Its fields
are deliberately different:

| Routed branch | Required closing output | Checked consumer |
| --- | --- | --- |
| Cross survival | `CrossSurvivalClosingSelection D S H` | two outside support hits at one first-apex radius |
| Non-equilateral | `StrictOppCap1CommonHit P` | `false_of_nonEquilateral_of_strictOppCap1CommonHit` |
| Equilateral | `JointTransitionClosingSelection ...` | low-hit fresh-pair or third mixed-pair-bisector consumer |

No theorem constructs `UnifiedFrontierParentCoupling F` from the parent
hypotheses.  It is a checked consumer contract, and constructing it is
equivalent to providing the missing branch content.  A correct future solver
query must retain the actual routed branch and negate its corresponding
closing output; it may not replace the table by one untyped union.

## Full-parent alternatives audited

Two natural attempts do not repair the coupling.

1. **Seed from the live U1 rows.**  The direct live source `q` cannot be a
   frontier source because it is in the surplus cap and the frontier sources
   are outside it.  `robust-live-transport/REPORT.md` gives a useful
   conditional consumer after blocker alignment with `p`, but neither that
   alignment nor dangerous-triple membership of the mate is produced.
2. **Use the second large cap to construct a fresh frontier.**  Physical
   packet reorientation and fresh frontier construction are checked, but
   `second-cap-incidence-coupling/REPORT.md` shows that symmetry and both local
   frontier directions still do not force a strict-surplus row to contain two
   points of either endpoint marginal.  The old pair cannot be transported as
   the fresh pair.

The two complementary regressions leave a narrow boundary.  The exact
35-point model has strict convexity, MEC/caps, no-`IsM44`, and a total
critical-shell map but fails all-center K4.  The finite all-center row/blocker
models have the global incidence projection but omit simultaneous Euclidean,
convex, and MEC realization.  The predecessor bank-clean all-center residual
has an exact-CAS `UNIT` equality ideal and hence is not a Euclidean model; the
iteration-7 successor is only a verified structural shadow and has not been
promoted to a realizability claim.  A successful theorem must couple those
layers.  It cannot cite row existence, cap symmetry, or total criticality in
isolation.

## Next admissible theorem

Before any paired-row scan, prove a full-parent `R` transition theorem of the
following shape:

```text
directed R omission/deletion-survival state
  -> named checked terminal
   or invariant-preserving successor with strict same-cap rank decrease
   or invariant-preserving adjacent-cap advance carrying bounded lap history.
```

The first missing geometric field is a same-cap endpoint
membership/radius equality at the actual blocker together with preservation
of the `R`/full-parent invariant at the successor.  If that field cannot be
produced, the theorem must instead return a named immediate contradiction or
a strict global-boundary advance.  Iteration without invariant preservation,
another unstructured blocker cycle, and another anonymous pair of global-K4
rows do not qualify.

Equivalently, a dependent one-dispatch proof may construct exactly the
closing output for the branch it actually receives.  It still must visibly
consume the full simultaneous geometry absent from both regression families.

## Compute and change-control consequence

- Do not encode the paired `G,K` rows.  Those labels belong to one pinned
  35-point model, which fails K4 at both centers; freezing its coordinates is
  trivially inconsistent, while deforming them invalidates the pinned exact
  geometry unless every hull/MEC/cap/CSS gate is re-established.
- Do not impose a fixed 35-label carrier.  The live parent assumes only
  `9 < D.A.card` and has no extraction into that frame.
- Do not promote arbitrary `SelectedFourClass` rows to exact radius classes.
- Do not use "no bank match" as the negation of a Lean terminal theorem.
- Keep the iteration-7 SAT residual as regression evidence.  Do not continue
  R CEGAR or launch a geometric paired-row scan until the transition theorem
  above supplies an exact source and target.

Adam authorized the independent read-only source, consumer, geometry, and
encoding audits to run in parallel.  They agree on this fail-closed result.
No Lean file was edited, no Lean build was run, and no production `sorry` was
closed by this adjudication.
