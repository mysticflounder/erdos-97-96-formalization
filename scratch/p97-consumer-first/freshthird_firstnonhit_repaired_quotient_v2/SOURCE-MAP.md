# Repaired FirstNonHit quotient source map

Source gate: **PASS** for one discovery-only, cardinality-independent named-role
quotient. `SOURCE-VALIDATION.json` pins nine current Lean files by SHA-256 and
checks 32 declaration tokens. The gate ran before either solver. It does not
replace a fresh Lean build or transitive axiom audit.

## Representation

Each materialized source role `r` has a carrier-point value `v_r`, its actual
blocker center `b_r = H.centerAt v_r ...`, and four pairwise-distinct support
slots `s_r_0,...,s_r_3`. Membership in the actual selected row of `r` is
definitionally equality with one of those four slots. The slots therefore
represent the exact `CriticalFourShell.support`, not a selected subset.

Support slots not otherwise named are anonymous carrier points. They may alias
any source, blocker, or support point unless a current theorem forbids that
alias. Only the two unnamed points needed to enumerate Q's exact support are
materialized as source roles `q2,q3`, since `support_subset_A` makes them valid
`CarrierVertex` witnesses. There is no carrier enumeration and no `MAXN`.

For every named blocker value the formula forbids five pairwise-distinct named
source values with that blocker. This is the exact named-role consequence of
`actualBlockerFiber_card_le_four`; aliases count once. Unnamed fiber members are
not enumerated, though the source theorem itself remains carrier-wide.

## Hard-clause admission

| Clause group | Exact source license |
|---|---|
| each row has four distinct slots | `CriticalFourShell.support_card` |
| each source is in its actual row | `CriticalFourShell.q_mem_support` |
| actual blocker center is outside its row | `CriticalFourShell.center_not_mem_support` |
| equal source values have equal blocker values | subtype extensionality and proof irrelevance for `centerAt` |
| equal actual blockers imply exact support equality | `selectedSupports_eq_of_actualBlockers_eq` |
| distinct centers have support intersection at most two | `SelectedFourClass.inter_card_le_two` |
| every named actual-blocker fiber has at most four distinct named sources | `actualBlockerFiber_card_le_four` |
| Q has two distinct sources with one actual blocker and mutual row membership | `FreshThirdBlockerFiber.sources_ne`, `.blockers_eq`, `.source₁_mem_source₂_shell`, `.source₂_mem_source₁_shell` |
| Q support has exactly the four materialized sources | support cardinality plus `support_subset_A`; `q2,q3` are anonymous existential fillers |
| C's two source points differ | `TwoCapSourceThirdCanonicalRowSurface.sources_ne` |
| Q deletion-fan blocker-cap placement and same-center nonrobustness | `SourceFaithfulSelectedFourDeletionFan`, `sourceFaithfulDeletionFan_of_triApexAllLargeContext` |
| exact-four or distinct-row Q boundary | `freshThird_qRow_exact_blocker_boundary`; its two omissions are represented by exact support difference plus the cross-deletion iff |
| repeated-cap pair and five outcomes | `exists_repeatedBlockerCap_pair_outcome` and `cross_deletion_survives_iff_not_mem_selected_support` |
| first two-constructor normal form | `FreshThirdCapSourceNonHit`; omission-center inequality from `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` |
| second four-constructor normal form | `FreshThirdCapSourceInteraction` |
| retained pair inequality, distinct centers, and mutual omissions | `exists_retainedFirstApex_mutualDeletionPair_threeLocationCases` plus the cross-deletion iff |
| common same-blocker exact four W sources, off Q, with blockers distinct from Q | `freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell` |

The complete assertion-level catalog is `clause_catalog_<case>.json`.

## Distinctness and alias audit

The only explicit source-value distinctness constraints are:

- `q0,q1,q2,q3` pairwise distinct, because they enumerate one exact four-set;
- `c_first != c_second`, exactly `C.sources_ne`;
- `ret_z != ret_w` in the retained arm;
- `w0,w1,w2,w3` pairwise distinct in the common same-blocker arm.

The common W points are additionally unequal to every Q support point because
they are proved outside Q's exact support. There is no blanket C/Q, C/retained,
C/W, Q/retained, or retained/W inequality. Blocker points, sources, and anonymous
fillers may alias whenever the listed membership and center-nonmembership facts
permit it. In particular, the common same-blocker arm allows C's sources to be
two of Q's four support sources, as the source does.

## Exact omissions

The quotient deliberately omits:

- the ambient carrier and all unnamed source rows;
- P/Pρ source roles and their blocker fibers;
- cap-incidence predicates except the finite constructor/pair tags actually
  needed by the retained packets;
- the retained three-way location geometry and its P-endpoint support formula;
- common-radius, selected-class, triangle/cap-order, cyclic-order, and metric
  distance data;
- deletion propositions already represented through the proved exact
  selected-support nonmembership equivalence;
- a source-to-quotient coverage theorem, a general-cardinality lift, and a Lean
  consumer for solver artifacts;
- any Twelvefold pinned endpoint, endpoint-distance, or pinned multiplicity
  field.

These omissions make SAT only `SAT-abstraction`, and even authenticated quotient
UNSAT would not be a universal claim without a lift.
