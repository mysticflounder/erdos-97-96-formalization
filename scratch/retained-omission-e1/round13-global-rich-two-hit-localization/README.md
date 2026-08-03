# Round 13: global rich two-hit localization

This is an **unlaunched**, exact-cardinality-15 external CEGAR probe for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It covers both `RetainedOmissionAllLargeNormalForm` arms and the eight
S6/D44 rich-apex profiles.

## Cut admission record

| Field | Value |
| --- | --- |
| Constraint family | `global_distinct_cap_rich_two_hit_localization` |
| Lean producer | `Problem97.ATailFrontierLiveClosure.criticalShellCenter_mem_capInteriorByIndex_of_two_hits` |
| Lean contradiction consumer | `Problem97.ATailFrontierLiveClosure.false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap` |
| Exact antecedent | One used full exact critical row has at least two members in `SelectedClass(A, oppositeVertexByIndex i, r) ∩ capInteriorByIndex i`, and at least two members in the corresponding slice for a distinct index `j`. |
| Schema arms | Both paired and fresh. |
| Classification | Necessary geometric consequence; not a relaxation-only cut. |

The Python condition is a direct finite encoding of the two cardinality
antecedents.  Rich supports are genuine full distance classes: membership is
defined iff by distance equality, and the exact S6/D44 profile gives the
required rich-apex structure.  Critical supports are genuine full exact-four
rows at used centres, with all competing distance classes capped at three.

`B1` common-deletion sets play no role.  In particular, an omitted `B1` point
is not used as a power nonzero or any other full-shell nonmembership fact.

## Status and trust boundary

No worker has been launched from this directory.  Results, if later run, are
external Z3 evidence about the exact-15 finite abstraction; they do not close
the Lean theorem.  The current LSP server has not reached a transitive axiom
check for the producer because its enclosing file is not currently clean, so
the run must remain staged until that validation is available.

Before launch, run the inherited smoke case and record the script/schema
hashes, active case matrix, global core lease, timeout, and niceness in the
wave manifest.  A terminal result must remain `UNKNOWN` on timeout or solver
failure; no result from this runner may be merged with a different schema hash.
