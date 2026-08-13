# P97 exact-17 cap-nine Lean-to-SAT closure route v1

Date: 2026-08-11

Status: active production route. Gates A, B, and D are implemented.  Ten
Lean-owned successor roots after the checked C--G root have been authenticated,
solved, and independently replayed `SAT`.  The 384 MiB PIQD build is installed,
but the live daemon still needs Adam's restart before the next disposable
canary and immutable-root submission.  The earlier exact-scale capacity
preflight passed.  The ninth root returned
`SAT` as immutable PIQD job `090c5be4-e747-40a3-ad96-baba17d9aace`; its total
308-variable model independently satisfies all 5,846,076 clauses.  The
mandatory exact-record theorem search completed with six bank hits and no
unreplayed proposal.  Its new generic two-Kalmanson cancellation record is now
banked with a source-realization bridge and a four-clause Lean-generated orbit.
The resulting tenth root, SHA-256 `7def1009...`, returned `SAT` as PIQD job
`d03a17f2-1c7c-434c-a0eb-0c1e3a2aaab6`; exact replay passed and the mandatory
scan found only another instance of the same checked generic-cancellation
theorem.  Its second four-clause orbit is now banked in Lean.  The resulting
5,846,084-clause eleventh root has SHA-256 `6ab37b78...`; recursive validation
and fail-closed ingress pass, but it has not been submitted.
PIQD terminal-certificate
custody and the final aggregate Lean landing remain open.  The existing Python/PIQD
exact-17 artifacts remain authenticated finite experiments, but they are not
the source of truth for this route.

## Checked implementation checkpoint — 2026-08-11

The source-to-base-CNF portion of gates A and B is now implemented in Lean:

- `BlockerVExactSeventeenSourceNormalForm.SourceRealization` retains the full
  carrier enumeration, convex boundary, normalized order, label embedding,
  selected-row table, and equality of every finite row with the pullback of a
  genuine carrier row;
- `exists_exactSeventeenSourceRealization_of_exactCover` extracts such a
  realization from the live exact-cover arm of the cap-nine target;
- `BlockerVExactSeventeenSourceCnf.baseCnf` is the Lean-authoritative Boolean
  formula with 308 variables and 209,692 clauses; and
- `SourceRealization.baseCnf_sat` proves that every extracted realization
  satisfies that exact formula. Its axiom closure is
  `[propext, Classical.choice, Quot.sound]`, with no `sorryAx` or compiler
  trust.

`BlockerVExactSeventeenSourceCnfExport.lean` writes the canonical DIMACS text
directly from Lean's `dimacsString`; it performs no independent re-encoding.
The first materialized root is
`scratch/exact17-lean-to-sat/base.cnf`, with header
`p cnf 308 209692`, 6,012,598 bytes, and SHA-256
`d5ea7921014b2c1868c100f89a2dfbd906f9cdba28f282fcbad015d93b1dd425`.
An independent parser checked the header, terminators, literal range, clause
count, absence of empty clauses, and exact use of variables 1 through 308.

Gate B now extends this base with the complete source-authenticated C--G
theorem bank.  `BlockerVExactSeventeenSourceCnfCdefg.lean` generates both
source-forced named orders, both cyclic directions, all 17 cuts, and every
increasing six- or seven-point offset choice.  Each family is proved sound by
transporting its positive finite hits to genuine selected carrier rows before
calling the corresponding source-clean Kalmanson consumer.  The exact counts
are 1,980,160 C--G clauses and 2,189,852 clauses in the extended formula.

`SourceRealization.extendedCnf_sat` is the realization-to-satisfaction bridge,
and `false_of_sourceRealization_of_extendedCnf_unsat` is the explicit
certificate-to-source landing contract.  Their axiom closure is
`[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
Quot.sound]`: there is no `sorryAx`, but the current finite regressions use the
project-accepted scoped `native_decide` trust boundary.

The Lean exporter materialized
`scratch/exact17-lean-to-sat/extended-cdefg.cnf` with header
`p cnf 308 2189852`, 104,887,967 bytes, and SHA-256
`763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527`.
The independent standard-library fixture verified its DIMACS structure, the
byte-identical 209,692-clause base prefix, and all ten schema/order families
against an independent generator.  The report is
`scratch/exact17-lean-to-sat/extended-cdefg-validation.json`.

Gates A, B, and D are therefore complete for this finite route.  Gate C has
authenticated and replayed the root and nine Lean-owned successors, all
`SAT`; the ninth successor is immutable PIQD job
`090c5be4-e747-40a3-ad96-baba17d9aace`.  Its mandatory theorem search found a
checked generic two-Kalmanson cancellation instance plus five already banked
small metric obstructions.  The generic cancellation theorem, its complete
four-clause orbit, and its realization-to-satisfaction bridge are checked; the
corresponding tenth child is now solving under PIQD.  Gate E remains open: expose a
terminal checked result in Lean as `extendedCnf_unsat`, then use the banked
landing contract with the exact-cover extractor in the unchanged production
leaf.

## Target and claim boundary

The unchanged production target is

```text
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_
    pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_
    card_eq_seventeen_secondCapNine
```

The route closes that one exact-cardinality leaf only when every stage below is
complete. It does not by itself close the `card_ge_eighteen` sibling, the
parent Rigid221 residual, or full P97. No stage may create one production
`sorry` per normalized placement.

The exact-17 cap-nine Wave63 root and all earlier waves are frozen finite
evidence. They remain useful regression data and theorem-discovery inputs.
No Wave64 refinement is a production closure step until the Lean extraction
and checked-encoding gates below have landed.

## Why the route changed

The superseded exact-17 lane was

```text
Python finite model -> raw DIMACS -> PIQD -> Python semantic replay.
```

That validates transport and the submitted finite formula. It does not prove
that the formula is the complete image of the live Lean hypotheses. In
particular:

- the `lean_fol` smoke uses hand-authored `LeanSatIr`; it is not the checked
  source exporter now used by this route;
- the current Python variable map and center choices are Python-validated, not
  consequences of a Lean finite-normal-form theorem;
- the archived lane treats one normalized order/case, while the claimed
  56-placement coverage or a symmetry reduction is not a Lean theorem; and
- an LRAT proof can certify only the submitted CNF. It cannot supply missing
  source entitlement, placement coverage, or validity of learned clauses.

The current Python schema must therefore be treated as a conjecture generator,
not as the definition of the Lean finite problem. The new Lean normal form
must settle all label questions, including the exact image of `SelectedClass`,
the deleted source, and the actual next-row center. It must derive the allowed
center domain and off-class property rather than inherit the producer's
hard-coded `PHYSICAL` and fifth-center candidate sets.

## Production pipeline

### A. Lean finite-normal-form extraction

Prove one source-clean extraction theorem from the live target hypotheses. Its
conclusion supplies a typed finite packet containing at least:

- an explicit equivalence between the 17 carrier points and `Fin 17`;
- the cyclic order and cap-nine membership under that equivalence;
- the complete image of the selected physical class, including the deleted
  source decision;
- the four old exact rows and their centers;
- the actual next-row center obtained from `centerAt`, its selected support,
  its off-class fact, and its one-hit bound; and
- a placement index in the complete finite placement type.

Every label in the SAT schema must be the image of a named Lean object. The
extraction theorem, not Python normalization, is authoritative.

Acceptance gate A:

1. the extraction declaration is `sorryAx`-free;
2. its only inputs are hypotheses of the live cap-nine leaf;
3. the label equivalence and center mapping are explicit data; and
4. a source audit accounts for every SAT primitive from a field of the packet.

### B. Checked finite predicate and SAT export

Define the finite predicate over the extracted packet in Lean. Then use one of
these proof-producing encodings:

1. a Lean exporter that emits the DIMACS clauses together with a proved
   realization-to-satisfaction theorem; or
2. an interim Lean-verified encoder/serialization in which Lean proves that the
   exact serialized clause list is equivalent to the finite predicate.

A separately reimplemented Python predicate is not an accepted substitute.
Python may package bytes, submit jobs, decode models, and propose cuts only
after the checked clause identity is fixed.

Acceptance gate B:

- source realization implies satisfaction of the base CNF;
- the variable map and DIMACS serialization are deterministic and checked;
- every learned clause has a source-clean Lean consumer or a checked derivation
  from already admitted clauses;
- source theorem, extractor, finite schema, encoder revision, variable map,
  clause sequence, and DIMACS bytes share one authenticated identity; and
- positive and negative fixtures catch a missing source condition and a
  changed label map.

### C. PIQD custody, solving, and terminal certificate

PIQD receives only the checked DIMACS artifact from gate B. Its responsibility
is immutable job/session custody, solver execution, total-model retrieval,
append-only refinement identity, and terminal proof transport.

For `SAT`, replay the total assignment against the exact checked CNF and decode
it through the checked variable map. For `UNSAT`, preserve an exact
session-clause-to-certificate-clause map, including dropped clauses, and replay
the terminal proof with the accepted checker. Neither result changes the
mathematical scope supplied by gates A and B.

### D. Complete placement coverage

Status: complete for the checked C--G formula.

The original planning choice was either:

- checking all 56 currently claimed placements; or
- proving a source-clean symmetry theorem and checking one representative of
  every proved orbit.

The implementation instead proves the stronger direct coverage statement.
The source realization records one of two `NamedOrder` values and one of two
orientations.  Every schema family enumerates both named orders, both cyclic
directions, every cut, and every increasing offset choice.  The semantic proof
uses `consumerCut` to reconcile the realized source orientation with the
enumerated direction.  Thus there is no remaining Python-side 56-cell claim or
anonymous placement table to trust.

### E. Aggregate Lean landing

Status: contract banked; terminal certificate and production wiring open.

The final consumer composes:

```text
live cap-nine hypotheses
  -> finite-normal-form packet
  -> checked base-CNF satisfaction
  -> placement-indexed terminal contradiction
  -> False.
```

It replaces the existing body of the cap-nine theorem without changing its
statement. Before claiming closure, run the targeted Lean build, a fresh
proof-blueprint spine audit, and a transitive axiom audit of the target.

The precise remaining Lean interface is a checked theorem

```text
extendedCnf_unsat :
  ¬ ∃ assignment, Std.Sat.CNF.eval assignment extendedCnf = true
```

from the terminal certificate.  In the exact-cover branch, compose
`exists_exactSeventeenSourceRealization_of_exactCover`,
`false_of_sourceRealization_of_extendedCnf_unsat`, and
`extendedCnf_unsat`.  No new placement-specific production theorem is needed.

## Lean-owned PIQD refinement checkpoint — 2026-08-11

The checked C--G root was provisioned exactly as specified above and returned
`SAT`.  Eight successor roots have since been regenerated from Lean after
source-clean clause admission; no Python-authored clause has entered the
production chain:

1. the complete guarded `EqualK4` family, root SHA-256
   `00e0e3e50e518833b782a1afbb686896365335d4cb15c993b3a6a25e31cc0aa6`,
   returned `SAT`;
2. the complete two-circle shared-pair family, root SHA-256
   `2feebcbf67b377b2e198c34e4385adccf0e8a631051c6058855d72321ddf4746`,
   returned `SAT`; and
3. the complete five-point three-row Kalmanson family, root SHA-256
   `009b34264ddcb114a59410f3af61a46b04b831841ce6687104c1833d7441a9d4`,
   returned `SAT` after independently replaying all 2,430,300 clauses;
4. the complete source-clean H--K schema orbit, root SHA-256
   `a489fdf5ddbd1f0abd765592e4b016841b170aed7a20833318704e30171bb570`,
   returned `SAT` after independently replaying all 3,618,396 clauses; and
5. the complete interleaved three-row Kalmanson orbit, root SHA-256
   `db8f493b4a8312efcf99d0e3e198537233b83dbb6cc5f4dad6f1423e22d90bd9`,
   returned `SAT` under immutable PIQD job
   `3e1cc468-a960-4393-b2ff-3b76eb54292e` after exact replay of all
   3,915,420 clauses;
6. the complete two-circle equality-chain orbit, root SHA-256
   `d5c09fd5e139f88df5966907485a2f80b208a3917431dbd07d189ae505f16b9e`,
   returned `SAT` under immutable PIQD job
   `7fcbf4c4-8cea-4179-8d56-16ddc3337494` after exact replay of all
   4,212,444 clauses; and
7. the complete perpendicular-bisector equality-chain orbit, root SHA-256
   `38db47b94b1f259feeb427a48850a94c58adf300deea0b37302a39435676e76a`,
   returned `SAT` under immutable PIQD job
   `925a0469-313e-4cbe-bdf5-3046b9786df1` after exact replay of all 4,756,988
   clauses.  Its mandatory theorem-bank scan retained five exact records; and
8. the complete two-Kalmanson equality-chain orbit, root SHA-256
   `ae29c7b97602f2e6ff6c746badb13ee8abad13afec3b005da0e6c632d5e1f7fd`,
   was admitted only after banking the source-clean
   `TwoKalmansonEqualityChainSchemas` theorem and realization bridge.  Its
   5,301,532 clauses passed independent recursive validation and returned
   `SAT` under immutable PIQD job `66c24b72-2b13-45d0-b00c-ef44115a1c88`.
   Exact replay checked all clauses and the mandatory scan retained five exact
   records.  The
   recursive validation report and fail-closed ingress manifest have SHA-256
   values `222e53bede625ae0213807e9472e8612f8bd883a9752ea4117d18b8f042d19a6`
   and `d03929f8c9d273930080aac376bdd8e3107e0783bee4f96e493b82ea44b34b7d`,
   respectively; and
9. the newly exposed swapped-`D`/`E` placement is generalized in the separate
   source-clean module `TwoKalmansonEqualityChainUnorderedDSchemas`.  The
   contradiction needs only the cyclic order `A < B < C < E < F < G`; the
   auxiliary center `D` is unordered.  Lean generated the complete 544,544-
   clause orbit as a ninth child with 5,846,076 clauses, 291,567,840 bytes,
   and SHA-256
   `759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28`.
   Recursive export validation and fail-closed ingress both pass against live
   daemon build `0cfc9577...`, which raises the shared raw-CNF envelope to
   384 MiB.  Exact-scale capacity qualification passed, and the child was
   submitted only after PIQD custody and a seeded-session export both rehashed
   to the immutable root.  Job `090c5be4-e747-40a3-ad96-baba17d9aace` is the
   sole admitted production job for this child.  It returned `SAT`; exact
   replay checked all 5,846,076 clauses.  The mandatory exact-canonical-record
   scan found six existing theorem-bank consumers and no unreplayed proposal.

Each child has a Lean realization-to-satisfaction theorem, deterministic Lean
exporter, independent recursive validator, immutable ingress manifest, and
PIQD job identity.  These are authenticated refinements, not closure.  The
interleaved family is cardinality-independent: for `a < b < c < d < e < f`,
rows at `b`, `e`, and `f` containing respectively `{c,d}`, `{a,d}`, and
`{a,c}` contradict two strict Kalmanson comparisons.  Its Lean theorem and
both cyclic orientations are source-clean.  The H--K survivor is rejected by
the generated 297,024-clause orbit.

The mandatory theorem-search report for the H--K survivor exposed a replay
bug in the historical minimizer: it preserved any motif with the same stage
and orientation rather than the exact recorded core.  That report is not
promotion evidence.  The production scanner now binds the source-analysis
SHA-256 and requires complete canonical-record equality during minimization.
The interleaved survivor passed that repaired mandatory scan: the total model
and 22 canonical theorem-bank records are bound to the replayed analysis
artifact.  Those records are proposal inputs only; the next child is permitted
only after one genuinely new record is reduced to a source-clean Lean theorem
and its complete finite orbit is generated in Lean.

That exact-record reduction is now complete for the first genuinely new hit.
In increasing boundary order `q < u < w < y < t < v`, five selected rows with
supports

```text
q:{y,t}, v:{u,y}, t:{q,w}, u:{q,w}, w:{u,t}
```

force the two centers `q` and `v` to be equidistant from `u,y` while those two
points lie on the same side of the chord `qv`.  This contradicts the banked
two-circle reflection theorem.  The increasing, decreasing, and both cyclic
transport forms are banked in
`Erdos9796Proof.P97.ATail.TwoCircleEqualityChainSchemas`; its targeted build is
green and all four declarations have axiom closure
`[propext, Classical.choice, Quot.sound]`.

That theorem's complete 297,024-clause orbit was generated in Lean and admitted
as the sixth child.  Its exact SAT replay and mandatory theorem-bank scan found
six records.  The first genuinely new record is now the source-clean
`PerpBisectorEqualityChainSchemas` theorem: two direct equal-radius witnesses
and one equality chain put three distinct carrier centers on one perpendicular
bisector, contradicting convex independence.  Its complete 544,544-clause
cyclic orbit is the seventh child listed above.  No clause in either child was
authored by Python.

The repaired mandatory scan of the seventh child's exact SAT model retained
five records.  The first genuinely new record is now the source-clean
`TwoKalmansonEqualityChainSchemas` theorem: eleven selected-row incidences on
seven cyclically ordered points make two strict Kalmanson inequalities cancel.
Lean generated the complete 544,544-clause orbit, and the independent validator
checked the parent chain, byte-identical prefix, every new clause, and the model
cut before the eighth child was admitted to PIQD.

## Generic cancellation refinement checkpoint — 2026-08-11

The ninth model's only new record has been generalized and banked in
`BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation.lean`.
The checked source consumer generates both named orders and both orientations,
for exactly four clauses.  `sourceAssign_extendedGenericCancellationCnf`
proves that every `SourceRealization` satisfies the extended CNF, and
`false_of_sourceRealization_of_extendedGenericCancellationCnf_unsat` is the
corresponding terminal landing contract.

The Lean exporter produced 308 variables, 5,846,080 clauses, 291,568,096 bytes,
and SHA-256
`7def1009b154d3b846274821300bc68f6ddd43b651e11258506f19924773ccbc`.
The independent validator checked the byte-identical 5,846,076-clause parent,
all four suffix clauses, and rejection of the motivating ninth model.  The
recursive PIQD ingress gate also includes an explicit serialization-migration
check for two historical model files whose manifests recorded stale raw JSON
hashes: it replays each complete 308-variable assignment against its full CNF
and requires regenerated semantic analyses to be byte-identical to the banked
analyses.  It does not weaken or silently rewrite the historical manifests.

The tenth root was submitted only after those gates and exact daemon/solver
identity checks passed.  It is immutable PIQD job
`d03a17f2-1c7c-434c-a0eb-0c1e3a2aaab6`.  It returned `SAT`; its complete model
replayed against all 5,846,080 clauses, and the mandatory theorem search found
six existing bank hits with no unreplayed proposal.  The only novel exact hit
was another instance of the same cardinality-independent generic cancellation.

That second orbit is banked in
`BlockerVExactSeventeenGenericCancellationSecond.lean`.  Its four guarded
clauses, source-satisfaction theorem, and terminal landing contract are
source-clean; the expected compiler-trust axioms come only from the accepted
`native_decide` finite checks.  Lean exported the eleventh root with 308
variables, 5,846,084 clauses, 291,568,228 bytes, and SHA-256
`6ab37b78e0db7cc98e2a1d62999d54d15a278135621aad95d520598afc7b47c2`.
The independent suffix validator and recursive ingress both pass, and clause
5,846,081 rejects the motivating tenth model.  Daemon build `0cfc9577...` is
live, the fresh disposable canary passed, and immutable eleventh-root job
`c06c0e77-271d-4642-906a-2801119904af` is solving.

## Active goal

Close the existing exact-17 cap-nine production leaf through this Lean-owned
successor chain. The twentieth root is now a fully authenticated and replayed
`SAT` checkpoint. Its mandatory scan recovered four exact records, compressed
to three nonredundant source-backed motif families: two-center bisector order,
convex-five order, and generic two-Kalmanson cancellation. Their complete
12-clause orbit is banked in Lean with `SourceRealization` bridges, and the
twenty-first root has passed both independent export validation and recursive
ingress. A
terminal `UNSAT` result must preserve the
submitted-to-certificate clause map, pass independent proof replay, be banked
as `extendedCnf_unsat`, and compose with the exact-cover extractor and the
existing source landing contract.  The frozen Wave63 Python route is not an
alternative production path.

## Immediate work order

1. The PIQD maintainer has built and installed daemon
   `0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360`,
   which raises the common prepare/blob/session-seed envelope from 256 MiB to
   384 MiB.  Adam restarted the daemon onto that exact build.  The disposable
   post-restart canary then passed under immutable PIQD job
   `d458b002-dbfe-409b-94d3-15b784f11c99`, before submission of the eleventh
   proof root.  The canary runner's required audited run label may
   distinguish disposable infrastructure checks, but grants no source or proof
   entitlement and must not appear in a production manifest.  Do not bypass
   PIQD, truncate the formula, submit a differently
   authored root, or special-case one endpoint.  `piqc version` reports this
   exact live identity.
2. The exact-scale throwaway artifact has qualified validation, storage,
   reread hashing, session custody, and solver handoff.  The canary is
   `scratch/exact17-lean-to-sat/piqd-large-cnf-capacity-preflight.cnf`, with the
   same 308 variables, 5,846,076 clauses, and 291,567,840 bytes as the proof
   root and SHA-256
   `b795edd93a4a222232e2b8128f6e2596eb153b9fd182788b93e0ef7a4f97e5a5`.
   It is deterministic and trivially SAT.  Immutable PIQD job
   `0e28e34e-385d-4b66-b2f9-9ae90c12b1fb` returned `SAT` in 2.216 seconds;
   the two-phase runner's final report is valid and rechecked the exact source
   SHA before confirmation and after completion.  Its live RSS observation was
   about 573 MiB for the daemon plus 855 MiB for CaDiCaL (a snapshot, not a
   peak measurement).  The runner now fails closed on two discovered API
   details: raw CaDiCaL jobs bind PIQD solver profile `sat`, and session receipt
   fingerprints identify the canonical headerless `journal.cnf`, while the
   exported session is separately checked against the original full DIMACS.
   This was a SAT canary under solver profile `sat`; it did not exercise
   CaDiCaL's UNSAT-only binary-DRAT emission, proof-blob storage, proof
   readback, or independent proof replay.  The profile governs the discovery
   solve only; PIQD uses a second full `--unsat` solve to mint a proof after a
   future terminal `UNSAT`.  Such a verdict is preliminary for proof promotion
   until the separate certificate gates pass.  A proof-pipeline failure leaves
   the PIQD verdict intact and must not trigger an unaudited retry or successor
   identity.
3. **Complete.** The admitted daemon hash was refreshed and the fail-closed
   ninth-child ingress replay passed byte-for-byte, binding root SHA
   `759507d0...`, manifest SHA `8166b6da...`, and daemon SHA `0cfc9577...`.
4. **Complete SAT checkpoint.** Only the authenticated 5,846,076-clause root was confirmed as
   PIQD job `090c5be4-e747-40a3-ad96-baba17d9aace`, with a 3,600-second solver
   timeout.  The resumable controller is
   `scripts/run_piqd_exact17_ninth_root.py`; before confirmation it rehashed
   both PIQD's stored CNF and a seeded-session export.  It returned `SAT`; the
   controller replayed every clause, and the theorem miner bound six exact
   canonical records to analysis SHA-256 `1d502e1d...` with no unreplayed
   proposal.
5. **Complete SAT checkpoint; eleventh root ready.** The recovered generic two-Kalmanson
   cancellation record has a source-clean Lean consumer, its complete
   four-clause orbit, and the `SourceRealization` bridge.  The exact successor
   PIQD job `d03a17f2-1c7c-434c-a0eb-0c1e3a2aaab6` returned replayed `SAT`.
   Its second occurrence has also been admitted in Lean, and the independently
   validated eleventh root `6ab37b78...` is ready but unsubmitted.  Admit any
   later clause family only after complete SAT replay and mandatory theorem
   search.  If this or a later authenticated child is `UNSAT`,
   preserve the exact certificate clause map and replay the proof with the
   accepted checker.
6. Bank the checked terminal result as `extendedCnf_unsat`.
7. Replace the exact-cover `sorry` branch by the three-theorem composition in
   gate E, then run the targeted build, fresh spine audit, and transitive axiom
   audit.

## Definition of done

The route is complete only when the existing cap-nine target no longer uses
`sorryAx` and the terminal certificate for the exact checked extended CNF
reaches that target through the banked landing contract and an ordinary Lean
proof or explicitly accepted finite certificate checker.  Gates A, B, and D
are now checked; green PIQD jobs, checked SAT models, finite theorem-bank hits,
and an `UNSAT` result for any other CNF are not closure.

## Twentieth Lean-owned child checkpoint — 2026-08-11

The nineteenth authenticated root returned `SAT` as immutable PIQD job
`46fc3c88-007a-48bb-bf66-b3000e20f7d1`, and all 5,846,164 clauses were replayed
against the returned model. The mandatory theorem search found seven exact
hits with no unexplained record. Minimization reduced them to six
nonredundant source-clean occurrence families: five-row circle order, two
distinct bisector motifs, convex-five, generic Kalmanson cancellation, and
duplicate-center. The apparent perpendicular-bisector occurrence needs no
separate clause because the duplicate-center clause subsumes it.

Those six families, their 24-clause finite suffix, the source-evaluation
theorem, and the conditional terminal adapter are banked in
`BlockerVExactSeventeenNineteenthModelRefinements.lean`. Targeted Lean
checking and the axiom audit are green: the relevant declarations contain no
`sorryAx` and use only the accepted `native_decide` trust boundary. The
exporter and two independent validators prove byte-identical parent ingress,
regenerate all 24 new clauses, and verify that every orbit rejects the
nineteenth model.

The resulting twentieth root has 308 variables and 5,846,188 clauses, is
291,573,096 bytes, and has SHA-256
`e719b8c17edf85e089d859fbc1ab8aaa43d8a6e9514f32eb4a76842a665dd3ce`.
It is currently running as immutable PIQD job
`51cdf518-1150-47f5-ac2f-94a98159eb82`. Exact 17 remains open. A `SAT`
result requires complete replay and another mandatory general-theorem search
before any successor; an `UNSAT` result requires independent certificate
replay, banking the child theorem, and composition into the cap-nine source
leaf before it counts as closure.

## Twenty-first Lean-owned child checkpoint — 2026-08-11

The twentieth root returned authenticated `SAT` as immutable PIQD job
`51cdf518-1150-47f5-ac2f-94a98159eb82`; all 5,846,188 clauses replayed against
the returned model. The mandatory general-theorem scan produced four exact
records and no unexplained proposal. After minimization, three source-clean
occurrence families remain: the two-center bisector order motif, the
convex-five motif, and a generic two-Kalmanson cancellation. Their Lean bank is
`BlockerVExactSeventeenTwentiethModelRefinements.lean`. It supplies the full
12-clause finite orbit, source-evaluation theorem, and conditional terminal
adapter. Targeted Lean checking is green and the relevant declarations contain
no `sorryAx`; finite evaluation uses the accepted `native_decide` boundary.

The final twenty-first root has 308 variables and 5,846,200 clauses, is
291,573,600 bytes, and has SHA-256
`bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720`.
The parent prefix is byte-identical. The independent validator regenerated all
12 suffix clauses, verified that every motif rejects the motivating model, and
rejected all four canonical child-20 records. Recursive ingress passed with
manifest SHA-256
`6ffd148a57458b23929dc933eeb2b35607f860c790b8cda347090311105cbe22`
and live PIQD daemon SHA-256
`fa66c08a9f341bb03ce1c39d32737f6b5bb91efe31d6a55f86f903caf207383c`.
The checkpoint is ready for immutable PIQD submission. Exact 17 remains open
until this or a later authenticated child is proved `UNSAT`, its certificate is
independently replayed and banked, and the resulting theorem is composed into
the on-spine cap-nine leaf.

## Thirty-second Lean-owned child checkpoint — 2026-08-12

This checkpoint supersedes earlier current-status text in this route. Children
29, 30, and 31 were authenticated `SAT`; child 31 was PIQD job
`53044c24-da6c-4fdd-9f50-f4f539891383` on the 5,846,904-clause root with
SHA-256 `3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204`.
Complete model replay followed by the mandatory new-wave theorem search found
84 subset-minimal occurrences. They have now been banked in Lean as six
source-valid clause families, with 336 ordered orbit clauses and a conditional
terminal adapter.

The resulting child-32 root has 308 variables and 5,847,240 clauses. Its
immutable CNF SHA-256 is
`c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`,
and its recursively validated ingress-manifest SHA-256 is
`f5da5c5bb0c5cbb7f1f95dd3230aef848ae62623330e9fecb5c62d9b66cba82e`.
The exporter proves that the parent is a byte-identical prefix and that the
suffix is exactly the Lean-owned 336-clause bank. Publication, export, ingress,
and runner validation pass; 71 focused adversarial tests pass. The targeted
Lean build passes with no `sorryAx`; finite CNF evaluation remains inside the
accepted `native_decide` trust boundary.

Both terminal custody paths have also been exercised against the live PIQD
service: a known-SAT model was retrieved and replayed, and a synthetic
known-UNSAT compact-LRAT proof was retrieved and independently accepted by the
pinned Lean LRAT checker. The synthetic smoke validates the mechanism only; it
is not evidence about the exact-17 root.

A first production prepare created immutable PIQD job
`2506986e-0445-465f-9b05-eff6bb9a5983`, but the local runner stopped before
confirmation because it incorrectly expected the manifest hash in the prepare
response. PIQD source and live status establish that prepare does not return
that field; `GET /jobs/:id` is authoritative. The job remains `prepared`, both
status manifest hashes match the pinned manifest, and independently retrieved
CNF and manifest bytes match their local snapshots exactly. The repaired runner
uses direct job-ID confirmation and has an explicit recovery path that validates
the persisted intent, live identity, status, and both stored inputs before
confirming. Thirty-five focused runner tests and lint pass.

Production child 32 is therefore prepared but **not yet confirmed** at this
checkpoint. The next authorized action is reconciliation and one confirmation
of that existing job, never another submission. Terminal `SAT`
requires full model replay, new-wave-only general-theorem mining, and Lean-first
banking before child 33. Terminal `UNSAT` requires authenticated proof retrieval,
independent replay, a child-specific Lean UNSAT theorem, and composition through
`exists_exactSeventeenSourceRealization_of_exactCover` and the landing contract.
