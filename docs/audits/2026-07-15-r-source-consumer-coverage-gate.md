# R source-to-consumer coverage gate

Date: 2026-07-15

Status: **SOURCE-AUDITED; NO CONSUMER-COMPLETE CLASSIFIER; NO MINING
AUTHORIZED.**

## Decision

The canonical `R` state is source-current, nonterminal, and suitable as a
proof-design state.  No current union of checked contradiction consumers is
complete on that state.  The object-selection hold therefore remains in
force.

This audit distinguishes two questions which must not be conflated:

1. **Is the state honestly produced?** Yes.  The parent constructs a concrete
   `CriticalPairFrontier`, its `firstApexSplit` is split before continuation,
   and the `R` arm constructs an ambient robust history pair together with
   exact critical-shell transition data.
2. **Does every state branch reach a checked `False` consumer?** No.  The
   directed omission/deletion-survival branch remains uncovered, including
   its symmetric off-surplus blocker-cycle realization.

Accordingly, neither a forbidden equality nor a terminal row-capture packet
is an admissible standalone mining object.  A future computation may start
only after a source theorem returns a disjunction whose every branch has an
already-checked terminal consumer or an invariant-preserving well-founded
transition.

## Canonical source chain

The accepted state retains the full parent telescope and uses the following
checked extraction chain.

1. `exists_criticalPairFrontier_of_K4` chooses the positive first-apex radius
   and a concrete `CriticalPairFrontier`.
2. `firstApex_trichotomy_with_secondApex_double_survival` splits the frontier
   into `R`, `FA-UNIQ4`, and `FA-UNIQ5`.  Bare `U4` and `U5` remain reserved
   for the historical numbered U-lane and theorem banks.
3. On `R`, `exists_terminal_and_ambientRobustHistoryPair_of_frontier`
   constructs the terminal carrier, ambient robust erasure history, and an
   `AmbientRobustHistoryPair`.
4. `exists_strictSource_orientation_with_transition_split` orients one pair
   endpoint into strict `oppCap1` and retains the exact directed critical-row
   decision.
5. `robustPair_blocker_cross_three_way` adds the exact reciprocal blocker
   normal form.

No fixed ambient cardinality, card-11/card-12 profile, selected-row exactness,
or target-negated finite-shadow premise appears in this chain.

## Exact branch matrix

For a strictly oriented robust pair `x,y`, write `c_x,c_y` for the two actual
critical blockers, `R_x,R_y` for their selected exact supports, and `S_xy`
for K4 survival after deleting `y` at `c_x`.

The directed source split is exactly

```text
y in R_x and c_x outside the surplus cap
or
y not in R_x and S_xy.
```

The reciprocal three-way refinement is:

| Branch | Source-produced data | Closest checked consumer | First missing field | Verdict |
| --- | --- | --- | --- | --- |
| B0 | `c_x = c_y`, common blocker outside surplus, and both directed cross hits | ordered-cap pair uniqueness or the robust three-bisector sinks | a third carrier center/row bisecting `x,y`, or a complete cap-order terminal | nonterminal |
| B1 | `c_x != c_y` and `S_xy` (equivalently `y` is omitted from `R_x`) | common-deletion expansion using `c_x` and an opposite apex | the expansion ends in an aligned prescribed pair or a genuine successor cycle, neither of which is `False` | nonterminal |
| B2 | `c_x != c_y`, `y in R_x`, and reverse survival `S_yx` | one outside pair-row plus the symmetric common-deletion expansion | a terminal consumer for the common-deletion/cycle output or another pair-bisecting center | nonterminal |

The B1/B2 common-deletion packaging is source-audited as a routine composition
of the current robust-apex survival and blocker/apex-distinctness theorems, but
it is not yet a named Lean declaration.  It is useful normalization, but a
generic `CommonDeletionTwoCenterPacket` is explicitly not a contradiction.
Its checked iteration admits a genuine period-at-least-two successor cycle.

## Consumer coverage failures

The mandated theorem-bank registries and indexed Lean corpora were checked.
The closest families fail for distinct, visible reasons.

- **Strict-surplus pair capture.** `InteriorSelectedRowCapturesPair` and
  `StrictSurplusRowCapturesErasedPair` have checked consumers, but each packet
  is itself equivalent to `False`.  In B0/B2 the sourced pair-row center is
  outside the surplus cap; in B1 the mate is omitted.  Treating capture as an
  intermediate producer reverses the logical polarity.
- **Robust four-center sinks.** The source gives the first apex and at most one
  additional pair-row center.  The current sinks require two additional
  distinct pair-bisecting centers or four prescribed support incidences.
- **Same-cap/source-pushout bank.** A raw `SameCapIncompatibleEdge` is not a
  terminal.  Its construction additionally needs a same-cap role and endpoint
  radius equality; a cross-cap alternative needs a strict global-order
  advance.  The checked bank closes only after a complete wrong-side,
  rank-drop, strict-lap, or populated two-edge packet is present.
- **Original U1/U5 metric banks.** These are genuine consumers, but the R
  state supplies no role map from an arbitrary erased pair to the named
  `p,q,t1,t2,t3,u` incidences or the required q-critical support lower bounds.
- **Continuation C/N/E terminals.** The dispatcher is source-complete, but
  its three closing selections are not produced.  Packaging their callbacks
  as parent content is equivalent to assuming the contradiction.

## Rejected classifier shapes

The following proposed total targets do not pass the gate.

1. `R source -> strict-surplus pair capture`: has a terminal consumer, but is
   the entire contradiction and is avoided by the current finite regression
   surfaces.
2. `R source -> left in-surplus cross hit or right in-surplus cross hit`: both
   conclusions are terminal, but the source theorem proves the opposite
   polarity on every cross-hit arm and permits cross omission with survival.
3. `R source -> C-terminal or N-terminal or E-terminal`: every terminal is
   checked, but none of the closing selections is source-produced.
4. `R source -> capture or raw cap-oriented edge`: capture is contradictory
   and a raw edge is nonterminal, so the disjunction has no complete consumer
   map.

The sharpest currently source-derivable quotient is instead

```text
B0 coincident outside pair-row
or
common deletion of y at c_x and oppApex1
or
common deletion of x at c_y and oppApex1.
```

This quotient is branch-complete but not consumer-complete.  Introducing a
Lean wrapper for it would not close a branch and is not counted as proof
progress.

## Regression gates

Any future classifier must explain, using a newly consumed full-parent field,
why it excludes all of the following without promoting them beyond their
stated abstraction.

- `FiniteRobustHistoryBoundary.lean`: exact within its finite incidence
  interface; realizes outside blockers and cross omission.
- `FiniteBlockerCycleBoundary.lean`: exact within its finite interface;
  realizes an off-surplus blocker two-cycle with no recorded pair-capturing
  center.
- `TupleSelectionCountermodel.lean`: exact within its finite incidence
  interface; every syntactic continuation choice remains open.
- the corrected iteration-7 SAT residual: exact only inside the pinned
  target-negated finite abstraction; it has zero represented R-capture hits.

These are not Euclidean counterexamples to the parent theorem.  They are
regression tests against proofs which fail to consume the missing full
geometry.

## Next admissible theorem

The next mathematical theorem must retain the full live parent telescope and
do one of the following.

1. Eliminate the directed omission/deletion-survival branch by producing a
   genuinely new geometric incidence, with an immediate checked consumer; or
2. turn that branch into an invariant-preserving cap walk which returns a
   wrong-side terminal, a strictly smaller rank state, or enough accumulated
   cross-cap order to construct a complete strict-lap/two-edge terminal.

Either theorem must visibly use a parent field not already inert in the local
R split, such as a concrete MEC/cap role, the second-large-cap geometry,
`hNoM44`, or a proved coupling to the named live U1 rows.  A raw endpoint
equality, row membership, blocker placement, finite deficit, or another
unstructured cycle is not sufficient.

No R mining round, CEGAR continuation, producer implementation, or production
Lean change is authorized by this audit.
