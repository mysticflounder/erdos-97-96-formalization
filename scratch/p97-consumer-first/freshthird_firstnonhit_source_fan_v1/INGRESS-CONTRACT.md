# Ingress contract: retained robust-class FirstNonHit fan preflight

This is a scratch-only, cardinality-independent finite preflight.  It is not a
Lean declaration and does not claim a universal contradiction.  The corrected
target is the two exact-four retained classes at `S.oppApex1`; the Q selected
row is deliberately not encoded as a fan target because its center is already
the nonrobust arm of the fan dichotomy.

The 128 positive cases are exhaustive only for the explicitly weakened
quotient emitted by `run_preflight.py`: 2 non-hit tags × 4 interaction tags ×
16 endpoint metadata tuples. Endpoint choices are metadata, not constructor
witnesses. The quotient does not encode the live constructor equality fields,
deletion/deletion-survival fields, cap fields, or support-overlap fields, and it
does not link any of those fields to the retained robust rows. Consequently,
dual-SAT is consistency of this quotient, with no inference that the live Lean
constructor product is insufficient or sufficient.

## Source-entitled ingress

| encoded object/clause | exact source | antecedent and interpretation |
|---|---|---|
| indexed all-large context | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:799-807` | `TriApexAllLargeContext D S` |
| retained context conversion | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:847-868` | `triApexAllLargeContext_of_residuals (H := H) L N T`; requires live `L`, `N`, `T` residuals |
| first-apex robust center | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:1063-1066` | `fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich` |
| source fan | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1017-1055` | `sourceFaithfulDeletionFan_of_triApexAllLargeContext G Row`; requires `G` and a `SelectedFourClass` row |
| fan equal-center arm | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:988-1014` | per support point: blocker cap, deletion blocked, and either center equality/support equality/nonrobustness or distinct-center overlap `≤ 2` |
| robust fan consequence | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1368-1405` | `nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan`; robust `S.oppApex1` discharges the nonrobust arm |
| finite fan kernel | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1254-1336` | exactly four row vertices; each self-shell membership and each row-shell intersection `≤ 2`; native finite enumeration yields a mutual omitted pair |
| retained two-radius antecedent | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean:962-1017` | `freshThird_alignedRetainedConsumerPacket_oppApex1_rich_exactRetainedRadii`; requires `hretained`, aligned retained packet, `T`, and the two named source radii; proves two positive unequal radii with class cardinality `≥ 4` and both canonical sources absent |
| exact-four promotion | `lean/Erdos9796Proof/P97/RemovableVertexAxiom/PinnedSurplusGeneralM.lean:397-410` | `SelectedFourClass.ofSelectedClass`; in this preflight an exact-four retained-class antecedent is required before the fan row is admitted |
| FirstNonHit constructors | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2068-2087` | `FreshThirdCapSourceNonHit.sameBlocker` and `.sourceRowOmission`; constructor fields are not encoded by this preflight |
| interaction constructors | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:1980-2042` | `FreshThirdCapSourceInteraction.sameBlocker`, `.sourceRowOmission`, `.distinctBlockersDifferentCaps`, `.sameCapWithInternalFiberSource`; constructor fields are not encoded by this preflight |

## Finite representation and explicit relaxations

The two robust rows are labelled `R0`,`R1`, each with exactly four vertices from
an eight-vertex quotient.  `source0` and `source1` are forbidden from both
retained rows, matching the retained-radii theorem's source nonmembership;
the remaining six vertices are anonymous quotient points.  This is a
relaxation: no Euclidean coordinates, distance equalities, shell realization,
or equality of the two row supports is asserted.

For each row and each of its four support slots, `shell[row][i][j]` is the
abstract membership of the actual critical shell used by the fan.  The only
fan clauses encoded are `shell[i][i]`, and row-shell intersection cardinality
`≤ 2`.  No `≥3` overlap query is made.  Blocker labels and cap labels are
finite quotient witnesses used only to classify equality/same-cap families;
their geometric identity, cap disjointness, and center coordinates are not
invented.  In particular, a blocker-equality or same-cap SAT result is not a
geometric realization.

The FirstNonHit and interaction constructor names are quotient tags only. None
of their live fields is encoded: in particular, no center/support equality,
deleted endpoint or deletion-survival witness, cap index/cap inequality, or
support-membership/overlap equality is asserted. No clause links these tags to
the retained robust rows. This is intentional: a SAT result is a quotient
consistency result, not a counterexample and not evidence about insufficiency
of the live constructor product.

The common-radius ingress, `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`,
is out of scope and is never silently included.  The Q-row fan is also out of
scope for this wave for the structural reason stated above.

## Status interpretation

Z3 and cvc5 check the same emitted QF_LIA formulas.  Deterministic finite
enumeration independently checks the four-vertex fan graph and the finite
blocker/cap mode families. Positive dual-SAT is exhaustive for the emitted
weakened quotient only. UNSAT is reported only for exact malformed controls
(overfull exact-four row, missing self-shell, or forbidden source membership),
each independently checked by both solvers and a readback validator.
