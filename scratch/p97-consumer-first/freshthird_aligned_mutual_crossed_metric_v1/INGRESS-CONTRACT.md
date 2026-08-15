# Ingress contract

## Exact live scope

The modeled constructor is the **direct** crossed arm consumed by
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_crossedThreeRowExactSupports`.
The two deletion constructors and reversed crossed orientation are not modeled.

The carrier has exactly 17 points and cap profile `(8,6,6)`. The roles
`C.firstSource`, `C.secondSource`, `Q.source`, and `Q.otherOutsidePoint` remain
distinct named carrier roles. No synthetic apex-grid role exists in this
encoding, so neither Q role is identified with an apex-grid hit. No six-center
or V2 hypothesis is imported.

## Encoded source facts

- One shared set of 17 real coordinate pairs is used by every clause.
- The boundary rank is a strict convex cyclic order: every increasing boundary
  triple has the source determinant sign.
- The three Moser apices lie on the normalized MEC, all carrier points lie in
  its disk, and the apex triangle is non-obtuse.
- Closed cap membership is the exact `OnArcOpposite` sign predicate and matches
  the proposed `(8,6,6)` composition.
- `point_k4_rows[c]` gives four same-distance positive-radius witnesses for
  every carrier center `c = 0,...,16`.
- `selected_rows[x]` is realized at the actual center `blockers[x]` and equals
  `point_k4_rows[blockers[x]]`.
- Off-support exactness is asserted only at centers in the image of
  `blockers`. Exactness at one of the unused K4 centers was rejected
  as unsourced in the original proposal; the corrected assignment has its own
  separately recorded unused-center set.
- The exact named P, C, and Pρ rows, endpoint omissions, mutual C-row
  intersection, exact first-cap intersections, blocker identities, and direct
  crossed orientation come from the validated incidence assignment.
- Every rich slice is placed on an actual common apex-centered squared
  distance. D44 radii are positive and distinct. Ambient D44 classes contain
  at least four carrier points; an S6 class, where allowed away from the first
  apex, contains at least six.
- At the first apex, the aligned-retained branch is forced to D44. Its two
  strict-cap slices are exactly the retained P and Pρ source pairs, up to
  swapping. This combines
  `oppApex1_rich_exactRetainedRadii_of_aligned` with
  `hfrontierInteriorEq` and `hρInteriorEq`.
- In the exact-17 profile, the first closed cap is exactly its two endpoint
  apices together with the six strict-cap points
  `P ∪ Pρ ∪ {C.firstSource, C.secondSource}`. The corrected assignment realizes
  the strict part as `{10,12} ∪ {7,9} ∪ {0,1}`; the refinement validator checks
  this equality directly.
- Each first-apex D44 slice has cardinality two, supplying the `htwo` premise
  of
  `freshThird_alignedRetainedConsumerPacket_sources_not_mem_firstApex_multiPointRadius`.
  The four encoded source exclusions are precisely its two conclusions applied
  to the two D44 radii. The generic single-source theorem is
  `firstFiberCapSource_not_mem_firstApex_multiPointRadius_of_aligned`.
- The two target positive producers are already negated by the corrected
  incidence assignment; no additional metric negation is asserted.

The three named retained/singleton theorems were independently checked to use
only `propext`, `Classical.choice`, and `Quot.sound`.

## Deliberate omissions

The encoder does not formalize a complete extraction from every original P97
and `CriticalShellSystem` hypothesis, particularly every anonymous deletion
packet and minimality consequence. Consequently, a SAT model of this packet
would still require a complete source-ingress audit before it could be called a
P97 counterexample.

For universal proof closure, it additionally omits the two deletion arms, the
reversed crossed arm, coverage over all exact-17 assignments, all other carrier
cardinalities, and a general-cardinality finite-core lift.

These latter coverage/lift items are not requirements for counterexample
existence: one genuinely complete source-faithful Euclidean model would suffice
for that. No such model was found here.

## Trust classification

SMT outputs are diagnostic. SAT coordinates are accepted only after exact Z3
substitution and an independent `Fraction` replay when all values are rational.
The geometry-only and cap-classification SAT models passed both checks. The
final UNSAT is independently reported by Z3 and cvc5 but is not a
kernel-checked Lean certificate and closes no theorem.
