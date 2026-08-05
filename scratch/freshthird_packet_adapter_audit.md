# FreshThird C/Q adapter audit (2026-08-04)

No source-clean adapter from `TwoCapSourceThirdCanonicalRowSurface C` plus
`FreshThirdBlockerFiber Q` to either target packet is available.

* `C` (FrontierLiveClosure.lean:10593-10599) gives two distinct *source
  vertices* in `capInteriorByIndex oppIndex1`; each witness has only canonical
  row support/cardinality and two `CrossPairDeletionView` fields
  (lines 10570-10585).  A `CrossPairDeletionView` is disjunctive survival of
  deleting one of a named pair at the source's selected blocker center, not
  survival for a fixed deleted point at two centers.
* `Q` (BlockerMultiplicityGeometry.lean:70-111) gives two fresh source
  vertices, equal blocker values, freshness, and mutual shell incidence.  It
  gives no first-apex radius/marginal membership or second-apex deletion
  survival.
* `CommonDeletionTwoCenterPacket` (CommonDeletionTwoCenter.lean:29-46)
  requires one fixed `q`, distinct ambient centers, and
  `HasNEquidistantPointsAt 4 (D.A.erase q) center₁/center₂`, plus exact rows.
  Missing from C/Q: (i) a single q orientation for both CrossPairDeletionView
  disjunctions; (ii) distinctness of `H.centerAt C.firstSource` and
  `H.centerAt C.secondSource` (C only says source vertices differ); and (iii)
  fixed-q survival at both centers.  The exact rows would follow from
  `nonempty_commonDeletionTwoCenterPacket` once (i)-(iii) are supplied.
* `SurvivorPairRelocationPacket` (CriticalPairFrontier.lean:288-303) requires
  q,w in one first-apex radius marginal, q != w, and each deletion surviving
  at fixed `S.oppApex2`.  C/Q have no such fixed-apex survival.  P/Pρ source
  fields are in first-apex classes but belong to radii `radius` and `radiusρ`
  (typically distinct), and their CrossPairDeletionView remains only an
  OR at a fresh source center.  To use P.source₁/P.source₂ as q,w one still
  needs `q_survives` and `w_survives` at `S.oppApex2` (and marginal extraction);
  these are not present in C/Q.

Thus the adapter route is blocked by genuine hypotheses, not coercion or
import issues. Existing frontier `F.pair` already is a relocation packet, but
that is independent of FreshThird C/Q and does not constitute a projection.
