# Ingress contract

## Scope and epistemic status

This directory contains exactly one bounded finite-relaxation diagnostic for
the first-source FreshThird non-hit frontier.  Its source snapshot is commit
`604b7d4b2089068920fd5afdcef3dd1cca4b4dbd`.

The packet is **not an induced finite carrier**.  It records only named Q-row
incidences, the two named cap-source rows, the bounded deletion subset, and the
named shells supplied in the minimal-deletion-core arm.  It does not close the
carrier under witnesses.  In particular it never asserts:

- that the named points are the whole carrier;
- that unnamed carrier sources or K4 witnesses do not exist;
- that the minimal-core shells are rows of the form `H.selectedAt source`;
- an invented K4 row after deletion or restoration;
- that the bounded theorem's new center differs from the Q-row center.

Accordingly, SAT is diagnostic evidence only.  UNSAT would be
promotion-relevant only after a separate audit proved that every encoded
clause is source-entitled and that the finite packet covers the universal
source quantified by the live Lean target.  This wave performs no such
finite-coverage proof and makes no promotion claim.

## Named universe

`q0,q1,q2,q3` enumerate the exact four-point support `KQ.support` of the
canonical Q row.  `q0` and `q1` are the distinct `Q.source₁` and `Q.source₂`;
`q2,q3` are names for the remaining support points.  No SMT element sort is
introduced.  A Boolean `<row>_q<i>` says only that the named Q point occurs in
that row.  `<row>_out` is the exact number of that four-point row lying outside
`KQ.support`; it does not name those outside points or identify them between
rows.

The main artifact asserts that every supplied named row whose center is known
different from the Q center has Q-overlap at most two.  This is the negation of
an overlap-three conclusion only over supplied names.  It does **not** negate
the live Lean target, whose witness ranges over every carrier source.

## Source-entitled projections

- `nh_*`, `first_center_eq_q`, `f_q*`, `f_out` project the constructors of
  `FreshThirdCapSourceNonHit` for `C.firstSource`.  Omission survival is erased
  after using the checked Lean theorem that it entails center inequality.
- `int_*`, `second_center_eq_q`, `s_q*`, `s_out` project the constructors of
  `FreshThirdCapSourceInteraction` for `C.secondSource`.  Cap membership and
  cap indices are deliberately erased.  The two cap constructors retain their
  exact Q-row intersection `{q0,q1}`.
- `v*`, `blocked_after_v`, `shared_arm`, `pair*`, and `core_arm` project
  `exists_freshThird_qRow_boundedSharedRadiusPair_or_minimalDeletionCore`.
  `blocked_after_v` is an opaque retained proposition, not a finite K4
  encoding.
- `core_<i>_q<j>` and `core_<i>_out` project the exact four-point shell supplied
  for active label `qi` in a `MinimalDeletionCore`.  The packet retains
  label-membership and pairwise disjointness after restriction to the named Q
  support.  Anonymous shell points are counted but not identified.
- `bounded_center_eq_q` is intentionally unconstrained.  The theorem puts its
  center outside `KQ.support`, but the Q-row center is itself outside its
  positive-radius support, so this does not yield center inequality.

## Artifacts and hypotheses

`main_named_rows_avoid_overlap3.smt2` is the sole diagnostic query.  It has one
`check-sat` and exact model readback.

`known_sat_baseline.smt2` is an encoder/solver smoke test with a fully pinned
hand fixture: both named rows are the Q row and the bounded theorem is witnessed
through the shared-pair arm.  It is not claimed to be a Euclidean P97 model.

The three malformed controls each have one `check-sat`:

- `control_empty_v_unsat.smt2` contradicts `V.Nonempty`;
- `control_core_overlap_unsat.smt2` makes two active core shells share `q0`;
- `control_sameblocker_omission_unsat.smt2` deletes `q0` from a row asserted
  equal to the Q support.

No successor CEGAR wave is authorized or produced here.
