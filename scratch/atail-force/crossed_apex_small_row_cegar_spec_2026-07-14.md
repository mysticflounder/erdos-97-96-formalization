# Crossed small apex-row experiment specification

**Status: TIER-A EXACT WITNESS / CEGAR STOPPED / NO LIVE CLOSURE CLAIM.**

This is the narrow experiment exposed by the checked prescribed-apex deletion
work.  It is not a continuation of the 167,782-case decorated three-center
sweep.  Adam has authorized this parallel ATAIL closure research.

## Formal source packet

Write `a := S.oppApex1` and `b := S.oppApex2`.  The proposed generic Lean
classifier first splits the old same-`a`-radius survivor pair `q,w` into:

1. K4 survives in `(A.erase q).erase w` at `a`; or
2. the radius-`r` class at `a` is the unique K4 class and has cardinality
   four or five.

The robust theorem already supplies a selected class `Rb` in
`(A.erase q).erase w`, centered at `b`, together with two fresh off-surplus
members `x,y` of `Rb`.  They satisfy

```text
dist a q = dist a w,
dist b q != dist b w,
dist b x = dist b y,
dist a x != dist a y,
q,w notin Rb.
```

The experiment concerns only the second classifier arm.  Its first question
is whether the two resulting small apex rows are already incompatible with
the exact Moser-cap geometry.

## Tier-A outcome

The broad two-row geometric lemma is false before the omitted live fields are
added.  `crossed_apex_small_row_cegar/exact_tier_a_witness.py` exactly checks
an eight-point `Q(sqrt(3))` configuration with:

- a strict cyclic convex order;
- two distinct apices `a=(0,0)` and `b=(1,0)`;
- a unique five-point radius-one class at each apex;
- row intersection of cardinality two;
- an old pair in the `a` row and absent from the `b` row;
- a mirrored pair in the `b` row and absent from the `a` row; and
- the required unequal cross-apex radii for both pairs.

The exact checker passes.  Its trust boundary omits MEC-boundary selection,
the live closed-cap predicates, all-center K4, and a critical shell system.
It therefore refutes the proposed bare strict-convex two-row lemma, not the
live theorem.

The deterministic outer manifest contains 192 cases and its three tests
pass, but no exhaustive Tier-A sweep is warranted: one exact witness is
already enough to reject the universal two-row lemma.

## Tier A: two-row geometric falsifier

Tier A deliberately omits abstract critical rows and all-center K4 witnesses.
It tests the smallest proposed geometric lemma, not the live theorem.

Required fields:

- a nonobtuse circumscribed Moser frame and its three closed caps;
- the exact cap partition and common cyclic convex order;
- distinct opposite apices `a,b`;
- a surplus cap of cardinality at least five and both opposite caps of
  cardinality at least four;
- one `a`-centered radius class `Ra`, with `|Ra| in {4,5}`;
- one `b`-centered radius class `Rb`, with `|Rb| in {4,5}`;
- `q,w in Ra`, `q != w`, and both outside the surplus cap;
- `x,y in Rb`, `x != y`, and both outside the surplus cap;
- `q,w notin Rb`;
- if `|Ra| = 4`, then `x,y notin Ra`; if `|Ra| = 5`, at most one of `x,y`
  lies in `Ra`;
- each row obeys the existing exact-radius cap cover and the two adjacent
  one-hit bounds; and
- all named carrier points are pairwise distinct except intersections between
  unnamed row members that are explicitly enumerated.

The cardinalities `4/5 x 4/5`, possible row-intersection size `0/1/2`, and
cap-piece distributions are finite outer cases.  Coordinate feasibility is
the inner exact-real problem.

Tier-A verdict scope:

- exact rational or real-algebraic SAT proves only that the proposed two-row
  geometric lemma is false;
- UNSAT is only a proposal until a small core is independently certified and
  translated to Lean;
- neither outcome by itself closes `DoubleApexOffSurplusSharedRadiusPair`.

## Tier B: producer-faithful extension

Tier B is permitted only if every Tier-A case is UNSAT or if a Tier-A SAT
witness identifies one precise missing live field worth adding.  It may add:

- the same `CriticalShellSystem` source/blocker map used by the survivor
  packet;
- exact source membership in selected supports;
- same-center support locking;
- the old and mirrored single-deletion survival facts;
- failure of K4 on the common twice-erased carrier at the relevant apex; and
- only those cap/order fields already present in the live theorem or proved
  by a checked adapter.

Do not import the five abstract `rows` merely as unconstrained extra circles.
They count only after a Lean-facing provenance theorem links their centers or
supports to `Ra`, `Rb`, `q,w,x,y`.

## Execution policy

**Current decision:** stop before solver execution.  The exact Tier-A witness
has already reached the first stop condition below.  The remaining policy is
retained only for a future producer-faithful extension with a newly proved
live field.

1. Generate the complete finite outer case list and pin it in a manifest.
2. Run a cheap SAT-seeking pass first, one process, with a short per-case
   timeout and no learned cuts.
3. Independently replay every rational SAT model exactly.  Treat algebraic or
   floating models as unverified until separately checked.
4. Stop the entire route after the first exact witness for each structural
   family; bank the witness and record which proposed lemma it refutes.
5. Only for repeatable UNSAT cases, run deletion-based minimization followed
   by MARCO-style enumeration of multiple minimal cores.
6. Accept no CEGAR cut from timeout, `unknown`, engine disagreement, or an
   uncertified UNSAT answer.
7. Match every accepted core against the required theorem banks before
   deriving a new scalar kernel.
8. A mined kernel is progress only after a checked extraction map from the
   formal crossed-row packet is available.

The existing `second_center_metric_cegar` code may be reused for immutable
manifest hashing, fail-closed oracle accounting, checkpoint validation, and
multi-core storage.  Its incidence generator and fixed `(4,5,6)/(5,5,5)`
placements must not be reused as though they represented this packet.

## Stop conditions

Stop with one of the following exact outcomes:

- `EXACT_TIER_A_WITNESS`: the two-row geometric lemma is false; identify the
  first missing live field before any stronger run;
- `TIER_A_UNSAT_PROPOSALS`: begin independent core certification, not a bulk
  sweep;
- `PRODUCER_FAITHFUL_WITNESS`: the added live fields still do not force the
  route; bank the counterexample within the encoded abstraction;
- `CERTIFIED_CORE_WITH_EXTRACTION_MAP`: translate that core to a scratch Lean
  theorem and adapter; or
- `BOUNDED_UNKNOWN`: no mathematical claim and no automatic budget increase.

## Work ordering

The same-radius double-deletion classifier is the prerequisite because it is
the Lean proof that justifies the `|Ra| in {4,5}` restriction.  Its scratch
validation should run after the active full build completes.  The Tier-A
outer manifest is implemented and validated, but the exact witness makes a
coordinate sweep unnecessary.  The next theorem-facing producer must instead
supply a cross-row or critical-row center `z != a` with
`dist z q = dist z w`, together with the cap-side placement needed by
`bisectorCapKernel`.
