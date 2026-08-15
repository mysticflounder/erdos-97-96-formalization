# Source-origin audit

The hard constraints in `run_wave.py` are finite encodings of these source
consequences:

| model clause | source ingress / consumer |
|---|---|
| six distinct centers and four distinct points per row | `SixSurvivorExactRowsBoundary` and its `FiveSurvivorExactRowsBoundary` fields |
| q absent from every survivor row | `U5QDeletedK4Class` / q-deleted row support |
| actual blocker p differs from every row center | six-row boundary blocker/center distinctness |
| pairwise row intersection at most two | exact two-circle intersection consequence used by selected four-point classes |
| three distinct dangerous points | `U3FixedTripleAuditFrame.dangerous` |
| named packet points on/off the p-dangerous radius | `U3LocalizedNoQFreePacket.exact_radius_class_card_eq_three_of_dangerousTriple` and the derived off-circle U5 candidate condition |
| audit center in `t0,t1,t2,u,a0,a1` | `exists_qDeleted_escape_or_criticalFourShell` |
| escape row has four points, q deleted, and distinguished point outside bounded support | `U5QDeletedK4Class` plus the localized no-q-free escape packet |
| critical shell has four points and contains q | `CriticalFourShell` support/cardinality fields |

The following were intentionally **not** encoded as hard clauses: Euclidean
coordinates, radii beyond the named dangerous exactness abstraction, cyclic
order, Kalmanson inequalities, global carrier coverage, canonical-row
identity, shell/dangerous-triple incidence, and `EdgeClosure`.  Those are the
missing producer obligations, not available ingress facts.
