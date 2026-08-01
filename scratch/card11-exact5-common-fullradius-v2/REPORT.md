# Corrected full-radius common-center report

Run date: 2026-07-30.

## Terminal result

All four corrected card-11 cases are **SAT**.  Every complete model satisfies
the exact persisted DIMACS CNF and independently reconstructed finite
semantics.

| case | variables | clauses | CaDiCaL seconds | CNF SHA-256 | model SHA-256 |
|---|---:|---:|---:|---|---|
| `s2_o0` | 41,602 | 494,849 | 1.318 | `0735e949d32fec3dece37c753c0e7dc125daf01c40fcbb638eb206e519876977` | `a3fb7f66a7b64e19da36a849ee17d59a8beaa60449811146d34a9eb6c1412b6e` |
| `s2_o9` | 41,602 | 494,849 | 1.324 | `2d5e07aacf60fe62a30dcabc90e3a66bae00ebd9cbe0cafdbefff8be89fd90d1` | `7869c6e09988a55ed1d12e9feb1f2d971d2e2fadaed89a54a8529de7f1b9f53f` |
| `s3_o0` | 41,602 | 494,849 | 1.296 | `13ad15b867c27c1ed50122b2e434dea3030ef16d83997a7ba9fa620c3baf1be0` | `6aba5a2c98133313270b2f501bd047dec5012115930d14bb423e427cb1072bdf` |
| `s3_o9` | 41,602 | 494,849 | 1.288 | `501c3dbee85a6df8e97d425f6ca0536913b07b0e188d167c0e2d1184c01dfa85` | `a3472d564bd065b43372a2b1d05e0468074c6aa7c4c4ba8de8b4c8f413670e7f` |

The jobs used `-t 900` serially.  Maximum CaDiCaL concurrency was one, below
the two-core ceiling.  `summary.json` records the aggregate result; each
`runs/<case>/` directory preserves the CNF, manifest, complete model, raw
solver transcript, independent verification, hashes, and source provenance.

## Why v1 was unsound

`SelectedFourClass` records four carrier points at one positive radius and
only forward incidence (`U1CarrierInjection.lean:400-414`).
`FaithfulCarrierPattern.classAt` chooses one such four-subset per center and
explicitly does not say it is the whole class
(`U1CarrierInjection.lean:1382-1397`).

The v1 encoding nevertheless gave every selected Census row all 24
support/outside inequalities.  At the first apex this forced the selected
four-row to be an entire class while the exact-five assumption forced a fifth
label into the same class.  The resulting UNSAT was therefore an encoding
contradiction, not a consequence of the live residual.

Whole-class exactness is available only at actual blocker-image centers:

- `CriticalFourShell.support_eq` names the complete filtered radius class
  (`U1CarrierInjection.lean:542-554`);
- `selectedFourClass_support_eq_shell` identifies the selected row with that
  shell at a chosen blocker (`U1CarrierInjection.lean:1079-1102`);
- `GeneralCarrierBridge.blocker_row_support_eq_shell`,
  `source_mem_blocker_row`, and `exactAt_blocker` export the exact row property
  on carrier labels (`GeneralCarrierBridge.lean:175-224`).

V2 gates every support/outside inequality by the decoded source-to-center
choice.  The first-apex selected four is otherwise allowed to be a proper
subset of its exact five-shell.  All four target models realize that proper
subset.

## Encoded semantics

The inherited source-indexed CNF contributes 41,004 variables and 414,047
clauses: the fixed card-11 Census-554 row surface, C1/one-hit/C2/C4
constraints, pair and triple capacities, boundary-order alternatives, the
four named common-center shell cases, and a total functional source-to-row
map preserving source membership and row selection.  Sources `q=6` and
`w=7` are mapped to the common blocker `8`.

V2 adds 598 variables and 80,802 clauses:

| clause block | clauses |
|---|---:|
| exhaustive local equality transitivity | 3,960 |
| selected-row internal equalities only | 11,694 |
| source-center iff some source-row choice | 6,642 |
| used-center iff some source maps there | 103 |
| chosen blocker row is the entire radius class | 46,776 |
| direct `no_qfree` after the chosen source deletion | 11,592 |
| named first-apex exact-five entire class | 35 |

There are 495 local equality variables: 45 unordered comparisons among the
ten incident labels at each of 11 centers.  Reflexivity is implicit, symmetry
comes from canonical unordered indexing, and three Horn implications for
each triple enforce transitivity.  The independent verifier reconstructs and
checks all 11 partitions.

For every selected row, its six internal comparisons are equal.  If and only
if a center is the image of at least one source, each selected row used there
gets all 24 support/outside inequalities.  For every exact source choice
`q -> c`, all 126 four-subsets of the nine incident labels other than `q` are
forbidden from one equality class at `c`.  This is the finite form of
`CriticalShellSystem.no_qfree` (`U1CarrierInjection.lean:1010-1019`) and
`no_qfree_at` (`U1CarrierInjection.lean:1034-1039`).

The named first-apex five labels receive ten internal equalities and 25
support/outside inequalities.  This represents
`class_card_eq_five` in
`FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
(`FirstApexUniqueRadiusResidual.lean:183-225`) without upgrading the
separately selected four-row.

No `K4_delete` or Corollary D9 theorem logic is duplicated: the CNF only
spells out the finite equality partitions and the existing source-specific
`no_qfree` condition.

## Independent gates and mutations

`verify_artifact.py` does not import the encoder.  For each target it checks:

- the CNF and manifest hashes and every DIMACS clause;
- completeness and identity of the persisted model and solver assignment;
- all 11 equivalence partitions;
- the Census C1/one-hit/C2/C4, capacity, and boundary-order semantics;
- total functional source mapping, source membership, and selected-row
  preservation;
- exact iff semantics for source-center and used-center variables;
- selected rows as equidistant subsets;
- blocker rows, and only blocker rows, as whole classes;
- all 11 source-deletion `no_qfree` obligations; and
- the first-apex exact-five class with its selected four properly contained.

The self-test suite also passes:

- a shell-free positive domain is SAT and independently model-checked;
- an arbitrary selected row with an extra equal-radius outside label is SAT
  when no source maps to its center;
- the same proper-subset behavior at a chosen blocker is UNSAT;
- disabling `no_qfree` permits a forced post-deletion four-class, while
  enabling it makes the same mutation UNSAT;
- non-transitive equality and an outside member in the exact-five shell are
  UNSAT.

Every UNSAT mutation has an independently checked `drat-trim` certificate
against its exact persisted CNF.  These controls distinguish the intended
gates from incidental inherited constraints.

## Meaning and trust boundary

The corrected finite abstraction does **not** contradict any of the four
common-center shells.  The v1 UNSAT conclusion must not be used.  Conversely,
SAT does not prove that any model is realizable by 11 Euclidean points: the
new layer represents equality partitions of incident distances, not numerical
distances, triangle inequalities, or coordinates.

The new radius/source layer is aligned with the live theorem interfaces:
selected-row equalities come from `SelectedFourClass`, whole-class
inequalities are precisely blocker-gated by `exactAt_blocker`, source
membership is theorem-backed, and deletion constraints are indexed by the
exact source and blocker from `CriticalShellSystem.no_qfree`.

What remains outside the certificate is the theorem-backed ingress from an
arbitrary geometric residual to the fixed 11-label valuation: the
Census-554 candidate table, boundary and order selectors, and exhaustiveness
of the four displayed shell cases.  The Python verifier is also part of the
SAT trust base, though it checks complete assignments rather than trusting
CaDiCaL's verdict.  No Lean theorem was edited, built, or closed by this
round.
