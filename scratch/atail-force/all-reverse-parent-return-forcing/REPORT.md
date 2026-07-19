# All-reverse parent-return forcing audit

Date: 2026-07-17

Status: **REFUTED FROM THE CURRENT MARGINAL AXIOMS.**  Total critical-map
support locking, the known blocker-fiber bounds, both physical-apex
robustness facts, the retained original common-deletion frontier, both
cap-six bounds, and injectivity of the reverse outside-pair map can coexist
while every reverse outside pair is non-co-radial at `S.oppApex1`.  A direct
full-Euclidean parent theorem remains **OPEN**, but it must consume a new
cross-system metric/order coupling absent from these marginals.  No
production `sorry` is closed.

This lane owns only
`scratch/atail-force/all-reverse-parent-return-forcing/`.  It did not edit or
build production Lean, shared docs, blueprint state, protected lanes,
`ShellCurvature`, or git state.

## Required preflight

Before proposing a finite incidence lemma, I checked every registry required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered outside-pair cap-center
uniqueness, robust physical-apex common deletion, retained critical fibers,
blocker multiplicity, and a first-apex return of a reverse pair.  The closest
hits were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le`;
- `physicalSecondApex_commonDeletion_robust_or_critical`;
- `frontierCommonDeletionParent_biApexRobust_or_critical`;
- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`; and
- the current reverse-pair injectivity/capacity scratch theorems.

No bank theorem supplies the missing return incidence.  The sibling and
legacy hits are downstream consumers with extra named row memberships, not
classifiers of this parent surface.

## Source-exact implication directions

The relevant current implications are one-way and do not compose to the
desired return.

1. `FullyDeletionRobustAt.centerAt_ne` and
   `FullyDeletionRobustAt.blockerVertex_ne` say that a robust carrier center
   is omitted from the image of the chosen critical blocker map.
   `FullyDeletionRobustAt.exists_distinct_sources_same_blocker` then gives an
   anonymous repeated blocker fiber.  It does **not** place that fiber in the
   retained first-apex radius class or in a reverse outside pair.

2. `FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber` sharpens
   the two omitted physical-apex values to two nontrivial blocker fibers or
   one fiber with at least three sources.  Equal blocker values lock those
   sources to one exact critical shell.  This still gives no equality between
   a reverse outside target and a retained-frontier source, and no second
   center through a prescribed reverse outside pair.

3. `FrontierCommonDeletionParentResidual` retains the original frontier
   pair `F.pair.q,F.pair.w`, their common first-apex radius, first-apex double
   deletion, and the q-deleted rows at the two physical apices.  It does not
   state that either frontier source belongs to a reverse row.  Indeed, both
   stored q-deleted rows omit `F.pair.q`.

4. On the all-reverse leaf,
   `reverseOutsidePair_card_eq_two`, `reverseRowCenter_injective`, and
   `reverseOutsidePair_injective` give exact two-point outside residuals,
   distinct ordered-cap centers, and distinct residual pairs.  Their checked
   counting conclusion is only

   ```text
   K.period <= choose(card(D.A \ S.oppCap2), 2).
   ```

   It controls collisions **between reverse rows**, not intersection with a
   first-apex radius fiber.

5. `outsidePair_unique_capCenter` has the required terminal polarity:
   if one reverse row's two outside targets are also co-radial from
   `S.oppApex1`, its actual blocker and `S.oppApex1` are two distinct centers
   of the same ordered physical cap bisecting the same outside pair, hence
   `False`.  It is a consumer, not a producer of the first-apex equality.

6. The two inequalities `6 <= S.oppCap1.card` and
   `6 <= S.oppCap2.card` enable the already-known physical-radius classifier.
   They do not bound the complement's pair capacity tightly enough and do not
   relate critical-row radius fibers to first-apex radius fibers.

## Exact finite no-return regression

`check_no_return_model.py` checks a finite incidence/radius-fiber fixture.  It
is exact for the assertions in the script, but is deliberately **not** a
Euclidean realization and does not model `CounterexampleData.Minimal`.

The fixture has sixteen carrier labels and cap profile `(5,6,8)`, with the
standard pairwise endpoint intersections.  It retains all of the following:

- two opposite caps of cardinality at least six;
- an original off-surplus frontier pair `{3,8}` in one first-apex radius
  fiber;
- a disjoint first-apex four-row surviving simultaneous deletion of `3,8`;
- exact q-deleted four-rows at both physical apices, with overlap at most two
  and the second-row/marginal one-hit bound;
- full single-deletion robustness at the first apex via two disjoint
  four-rows and at the second apex via one exact five-point radius class;
- a total fixed-point-free blocker map omitting both physical apices;
- exact-card-four support locking at every blocker value, with every source
  in its own critical support and every blocker fiber of cardinality at most
  two;
- a period-three all-reverse cycle on strict physical-cap sources
  `11,12,13`;
- forward omission and reverse membership on every cycle edge;
- the exact `2 + 2` cap split and cap-straddling blocker order for all three
  reverse rows; and
- injective reverse row centers and injective outside pairs.

The exact reverse outside pairs are

```text
{3,9}, {8,5}, {6,10}.
```

The two displayed first-apex radius fibers are

```text
{3,8,6,12}, {9,10,5,11}.
```

Every reverse pair has one endpoint in each fiber, so none is co-radial from
the first apex.  The original frontier pair `{3,8}` is co-radial but is not a
reverse outside pair.  No extra row membership is asserted.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/all-reverse-parent-return-forcing/\
  check_no_return_model.py
```

Expected output:

```text
PASS: exact finite all-reverse parent no-return regression
carrier=16 cap_profile=(5, 6, 8)
frontier_pair=frozenset({8, 3})
reverse_pairs=[frozenset({9, 3}), frozenset({8, 5}), frozenset({10, 6})]
all reverse pairs have distinct first-apex radius colors
```

Therefore the desired return is **REFUTED as a consequence of the listed
marginal axioms**.  This is not a counterexample to a theorem allowed to use
the full Euclidean, MEC, minimality, or full-filter semantics.

## Sharp counting boundary

Let

```text
X = D.A \ S.oppCap2,
P = powersetCard 2 X,
E = {pair in P | the two points are co-radial from S.oppApex1}.
```

Under no return, injectivity of `reverseOutsidePair` proves only

```text
K.period <= card(P \ E).
```

Equivalently, the following is a legitimate bounded producer with an
immediate `outsidePair_unique_capCenter` consumer:

```text
card(P \ E) < K.period
  -> some reverseOutsidePair lies in E
  -> False.
```

Current hypotheses do not prove its premise.  In the fixture, `card X = 8`,
so `card P = 28`; the two displayed first-apex fibers already contribute six
co-radial outside pairs, while the reverse period is only three.  Thus the
available nonreturn capacity is far larger than the cycle.

This shows that a pure cap-cardinality/blocker-fiber count is not merely
unfinished; it is the wrong strength unless a new theorem sharply collapses
the first-apex distance-color capacity of the complement.

## Narrowest legitimate next lemma

The weakest direct producer is the metric occurrence itself:

```lean
-- Architectural statement, not elaborated here.
theorem exists_reverseOutsidePair_coRadial_firstApex
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (E : FrontierCoupledExactFivePhysicalCycleParentResidual H Flarge)
    (hreverse : ...) :
    exists i a b,
      reverseOutsidePair E.exactFive.cycle i = {a, b} /\
      dist S.oppApex1 a = dist S.oppApex1 b
```

A slightly stronger but more parent-directed form is

```text
exists i,
  reverseOutsidePair K i subset
    SelectedClass D.A S.oppApex1 F0.radius.
```

Either closes immediately through `outsidePair_unique_capCenter`.  Neither
follows from the marginals audited here.  A proof must visibly consume a new
coupling absent from the regression, such as a full Euclidean/MEC order law
relating the retained first-apex filter to the source-indexed reverse rows,
or a global first-apex distance-fiber capacity theorem strong enough to prove
`card(P \ E) < K.period`.

## Epistemic ledger

- **PROVEN IN CURRENT SOURCE / CHECKED SCRATCH:** the implication directions
  and reverse-pair cardinality/injectivity facts cited above, subject to their
  owning modules' recorded axiom audits.
- **REFUTED EXACTLY WITHIN THE FINITE MARGINAL ABSTRACTION:** the implication
  from the listed current marginal axioms to a first-apex return.
- **OPEN:** a direct theorem from the full Euclidean parent surface, and the
  displayed source-indexed metric coupling.
- **NOT RUN:** Lean/Lake build, proof-blueprint, production compilation,
  axiom audit, or git operations.
