# P97 exact-17 cap-nine Lean-to-SAT closure route v1

Date: 2026-08-11

Status: active production route. Gates A, B, and D are implemented. Twenty
Lean-owned successor roots through child 20 have been authenticated, solved,
and independently replayed `SAT`; each refinement was banked in Lean before
the next child was generated. Child 21 is the validated 308-variable,
5,846,200-clause root with SHA-256
`bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720`.
Immutable PIQD job
`b676c3ab-2084-4ed4-b0b2-94a6aa1dafda` reported `SAT`, but two simultaneous
solver processes wrote separate 308-literal assignments into one job log. The
model endpoint correctly rejects that permanently damaged log on the repaired
daemon. The response and derived artifacts remain quarantined; no theorem
mining or successor root is authorized from them. A byte-identical fresh rerun
is confirmed as job `f3053110-f26e-4166-83f0-b8db5a04651e` under recovery
manifest SHA-256
`dc92856c15ca520ecec614ca47e4b56a83888143244ff20160d5b52847e9ec08`
and repaired daemon SHA-256
`82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396`.
It is not authenticated until terminal retrieval supplies exactly one complete,
duplicate-free assignment and all 5,846,200 clauses replay. PIQD
terminal-certificate custody and the final aggregate Lean landing remain open.

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

Gates A, B, and D are therefore complete for this finite route. Gate C has
authenticated and replayed twenty Lean-owned `SAT` successors through child
20. Child 21 passed Lean export and independent ingress validation, but its
PIQD model response is rejected because it concatenates two solver runs. Gate
C is paused at the strict single-run-model gate while PIQD repairs the reader;
the finalizer additionally requires a duplicate-free total assignment and
replay of all 5,846,200 clauses. Gate E remains open: expose a terminal checked
result in Lean as `extendedCnf_unsat`, then use the banked landing contract
with the exact-cover extractor in the unchanged production leaf.

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
ingress. Its concatenated PIQD model response is rejected, so the immediate
goal is a provenance-clean single-run terminal response for that immutable
job. A terminal `UNSAT` result must preserve the
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
The root was submitted as immutable PIQD job
`b676c3ab-2084-4ed4-b0b2-94a6aa1dafda`. PIQD reported `SAT`, but the model
endpoint exposed 616 literals for this 308-variable formula. The corrected
root-cause audit found two simultaneous CaDiCaL processes writing two complete
assignments into the same job log; this was not append-across-restart behavior.
That output is rejected, even though the two blocks happen to agree, because
caller-side normalization would not establish single-run provenance.
The derived artifacts are quarantined as
`piqd-twenty-first-root-rejected-concatenated-{final,model}.json`.

The damaged endpoint is therefore **not authenticated** and no theorem mining
or successor root is authorized from it. PIQD commit `c262aa5` now fails closed
on a duplicate variable or header overrun. Fresh rerun job
`f3053110-f26e-4166-83f0-b8db5a04651e` changes only the producer-manifest bytes;
the CNF remains byte-identical. Its runner additionally requires one live
daemon, exactly one occurrence of every variable `1,\ldots,308`, no duplicate
or out-of-range variable, the matching assigned count, and a total replay
satisfying all 5,846,200 clauses. Exact 17 remains open until that fresh job is
authenticated and the Lean-first refinement loop resumes, or this exact root
is proved `UNSAT`, its certificate is independently replayed and banked, and
the resulting theorem is composed into the on-spine cap-nine leaf.

## Twenty-second Lean-owned child checkpoint — 2026-08-12

The fresh rerun of the byte-identical twenty-first root is terminal
authenticated `SAT` as immutable PIQD job
`f3053110-f26e-4166-83f0-b8db5a04651e`. The returned model contains exactly
one assignment for every variable `1,\ldots,308`, and the runner replayed all
5,846,200 submitted clauses. The accepted final report has SHA-256
`337398fba1249449e691c1c425e8a3dec1ec84a4df03cb7e83c039546e8af0db`;
the accepted model has SHA-256
`bb1617d726a80cec5d2e6985e2a5c6c0f095073122001bd94f611d512ca334dc`.
The quarantined two-run model remains inadmissible and contributes no clauses.

The mandatory theorem-bank scan found five source-backed records and no
unreplayed proposal. Equality closure and orbit minimization compress those
records to two occurrence supports: a forward/reverse two-center bisector
motif and a forward/reverse convex-five motif. The apparent cancellation and
perpendicular-bisector records are already consequences of those same hit
sets, so they do not justify separate clauses. The two source-clean families,
their eight-clause suffix, the source-evaluation theorem, and the conditional
terminal adapter are banked in
`BlockerVExactSeventeenTwentyFirstModelRefinements.lean`. Its targeted build
and axiom audit are green: there is no `sorryAx`, while the finite evaluation
uses the accepted `native_decide` trust boundary.

The independently regenerated twenty-second root has 308 variables and
5,846,208 clauses, is 291,573,930 bytes, and has SHA-256
`dc44614e28c907d5c61b29e58cc6f6188e52a2504e119efa37157a81a56f7edb`.
Its parent prefix is byte-identical, its suffix contains exactly eight clauses,
and the validator confirms that both occurrence families reject the motivating
model and that all five theorem-bank records are covered. Recursive ingress
passed with manifest SHA-256
`e66141fa9b832ef37b5b99d45c531929c82d77d465747c7488929e360cb77693`
under repaired PIQD daemon SHA-256
`82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396`.

Exactly one successor was confirmed: PIQD job
`37efce1a-3d6f-4b97-abf5-a7faec6d087b`. Exact 17 remains open. Terminal `SAT`
requires complete model replay and the next mandatory general-theorem search;
terminal `UNSAT` still requires certificate retrieval, independent replay,
Lean banking, and composition into the cap-nine source leaf before any proof
closure is claimed.

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

## Thirty-fourth Lean-owned child checkpoint — 2026-08-13

This section supersedes the child-32 current-status paragraph above. The fresh
child-33 production job
`6304e936-8ef3-4b92-a153-062263a4aa01` terminated `SAT` at epoch one on the
308-variable, 5,847,248-clause root with SHA-256
`775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9`.
Its retrieved total assignment passed an independent streaming replay of every
root clause. This is a source-normal-form SAT assignment, not a Euclidean P97
counterexample.

The mandatory new-wave theorem search reported five motif families. Only the
paired-Kalmanson and perpendicular-bisector families had the required
`SourceRealization` bridges and were promoted. The forward/reverse two-circle
bisector, convex-five, and two-Kalmanson-cancellation hits remain diagnostic
candidates; their occurrence in the abstract model does not authorize a
successor clause. The two admitted families are banked in Lean as eight exact
clauses, together with source-evaluation theorems and a conditional terminal
adapter. Targeted axiom checks report no `sorryAx`; finite evaluation uses the
accepted `native_decide` trust boundary.

The official child-34 DIMACS was rendered directly by the Lean exporter. It is
the byte-identical child-33 prefix followed by exactly those eight clauses:

- 308 variables;
- 5,847,256 clauses;
- 291,620,980 bytes; and
- SHA-256
  `ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`.

The immutable export receipt has SHA-256
`dfd27a4fcdaabba87270259988b4b39a5debcf8f0d1d56802a35b40a035c59fc`.
Publication validation confirms the exact ordered suffix and zero semantic-new
duplicates. Ruff and 251 focused publication, ingress, runner, recovery,
post-wave-analysis, and adversarial tests pass.

Only the export is provisioned. Child-34 PIQD ingress and its runner are
deliberately `UNPROVISIONED`: all inherited child-33 daemon and solver pins were
cleared, and the gates fail closed until a fresh post-`acefb4a` PIQD build
receipt and live daemon/solver identities are supplied. No child-34 PIQD job has
been prepared or launched. After that fresh identity is available, emit and
validate one immutable ingress manifest, pin the runner to it and to the exact
root above, then submit exactly one job. Exact 17 and the production `sorry`
remain open.

## Thirty-sixth Lean-owned child checkpoint — 2026-08-13

Child 34 terminated authenticated `SAT` as immutable PIQD job
`3dc8ef3d-5cc3-49c1-b0e4-afc9d2552941`; independent replay checked all
5,847,256 clauses. The wave-only theorem mine found no genuinely new
source-valid family beyond the paired-Kalmanson bank. The remaining
two-circle, convex-five, and cancellation occurrences still lack the required
`SourceRealization` producer and therefore contributed no clauses.

Child 35 added four proposed perpendicular-bisector clauses and terminated
authenticated `SAT` as immutable PIQD job
`4fa2037f-d0da-42b9-862d-6e78cc3a9498` on the 308-variable,
5,847,260-clause root with SHA-256
`0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f`.
The total assignment passed exact replay. A mandatory post-wave audit then
found that the four new clauses had encoded raw carrier labels as cyclic
positions, so all four were satisfied by the motivating child-34 model. This
does not invalidate any SAT result or Lean theorem; it makes that refinement
operationally ineffective. No successor may rely on it as having removed the
model.

The corrected source theorem first canonicalizes carrier labels through the
named cyclic order and then applies the perpendicular-bisector obstruction to
the resulting positions. It is banked with its `SourceRealization` bridge,
four exact clauses, source-evaluation theorem, and conditional terminal
adapter. Targeted Lean diagnostics and axiom checks are clean; the finite
evaluation uses the accepted `native_decide` boundary.

The official corrected child-36 DIMACS was rendered directly by Lean and
published ledger-last through the fail-closed boundary:

- 308 variables;
- 5,847,264 clauses;
- 291,621,334 bytes; and
- SHA-256
  `e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5`.

The child is byte-for-byte child 35 followed by the four corrected clauses.
The validator replays the authenticated child-35 assignment against every
parent clause, proves that corrected suffix clause 3 rejects that exact
assignment, rejects semantic duplicates, pins all Lean source bytes, and
refuses substituted artifact or source pins. The immutable export receipt has
SHA-256
`fe6a1456c7ca467c9e76db4f94079bec39b2291f7d388425e324b4e30221b7b8`;
five focused adversarial tests and Ruff pass.

Child 36 is now exported but has not yet been submitted to PIQD. The next
authorized step is a freshly validated immutable ingress and exactly one PIQD
job. `SAT` requires full replay followed by a wave-only general-theorem mine;
`UNSAT` requires independent certificate replay and composition through the
exact-17 source-realization and landing contracts. Exact 17 and the production
`sorry` remain open at this checkpoint.

## Thirty-seventh Lean-owned child checkpoint — 2026-08-13

Child 36 terminated authenticated `SAT` at epoch one as immutable PIQD job
`acc2df0f-b219-46d7-9d3b-a926fc2465a3`. It ran for 591.435 seconds on the
308-variable, 5,847,264-clause root with SHA-256
`e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5`.
The retrieved total assignment passed independent replay of every clause.

The mandatory wave-only mine produced exactly two records. One convex-five
occurrence duplicates an existing seven-hit support but does not yet have the
signed forward/reverse `SourceRealization` bridge required for admission. The
other record is a source-valid six-hit, two-Kalmanson cancellation in both
cyclic orientations. That family is banked in Lean as four exact clauses,
together with its source-evaluation theorem and conditional terminal adapter.
Targeted builds and axiom checks pass without `sorryAx`; finite evaluation uses
the accepted `native_decide` boundary. The authenticated Child36 assignment is
rejected by suffix clause 3.

The official Child37 DIMACS was rendered directly by the Lean exporter and is
the byte-identical Child36 prefix followed by those four clauses:

- 308 variables;
- 5,847,268 clauses;
- 291,621,474 bytes; and
- SHA-256
  `98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3`.

Its immutable ingress manifest has SHA-256
`3d02b8e2a18ba75b08020e8275ca7e7aadb8e0556762a062dbca3ae546026f18`.
Ruff, six focused adversarial tests, export/ingress validation, and live PIQD
daemon and solver identity checks pass. No Child37 PIQD job exists at this
checkpoint. The next authorized action is exactly one immutable Child37 job,
followed by full replay and wave-only mining on `SAT`, or independent proof
replay and Lean composition on `UNSAT`. Exact 17 and the production `sorry`
remain open.

## Thirty-eighth Lean-owned child checkpoint — 2026-08-13

Child 37 terminated authenticated `SAT` at epoch one as immutable PIQD job
`ba0b8d07-328d-4e43-873e-b99d005b1578` after 643.664 seconds. Its exact root
had 308 variables, 5,847,268 clauses, and SHA-256
`98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3`;
the retrieved total assignment passed independent replay of every clause. This
is an abstract source-normal-form survivor, not a Euclidean counterexample.

The mandatory wave-only theorem mine found exactly two new source-valid
six-hit Kalmanson-cancellation occurrences and no other admissible family.
Their two orientations expand to an eight-clause Lean-owned suffix. The source
bridge, suffix evaluator, extended-CNF evaluator, and conditional terminal
adapter are banked in Lean. Targeted builds pass, and transitive axiom checks
report no `sorryAx`; the finite evaluator uses the accepted `native_decide`
boundary. Suffix clause 7 rejects the authenticated Child37 model.

The official Child38 root was rendered directly by Lean and published with an
exclusive hard link followed by a ledger-last receipt. It is the byte-identical
Child37 prefix followed by exactly those eight clauses:

- 308 variables;
- 5,847,276 clauses;
- 291,621,758 bytes; and
- SHA-256
  `07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`.

The immutable export receipt has SHA-256
`62b40115c0b5f4f7af1968d93fc880df48effa66c7a352c346dd0bbeb213faa6`,
and the recursively validated PIQD ingress manifest has SHA-256
`6b74b75871940761fa346469b04c0ad17064a36b56766c5413c2ff6e048ad815`.
The full 263-test lifecycle suite, eight Child38-specific adversarial tests,
Ruff, exact export/ingress replay, source-pin validation, and the live PIQD
identity gate pass. No Child38 job exists at this checkpoint. The next action is
exactly one runner-mediated submission. Terminal `SAT` repeats exact replay and
wave-only theorem mining; terminal `UNSAT` requires independent certificate
replay and Lean composition through the exact-17 source-realization and landing
contracts. Exact 17 and the cap-nine production `sorry` remain open.

## Thirty-ninth Lean-owned child checkpoint — 2026-08-13

Child38 terminated authenticated `SAT` at epoch one as PIQD job
`aeaefb24-0f57-4b1f-9c62-644208e65977` after 647.509 seconds. Its exact root
had 308 variables, 5,847,276 clauses, and SHA-256
`07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`;
the retrieved assignment passed an independent replay of every clause. This is
an abstract SAT witness, not a Euclidean counterexample.

The mandatory wave-only mine exhaustively enumerated 597 forward and 597
reverse cancellation records, yielding 317 distinct supports, 101
subset-minimal supports, and exactly 28 minimum six-hit supports. All 28 are
instances of the existing cardinality-independent `CancellationOccurrence`
theorem family. Their two orientations produce a 112-clause Lean-owned suffix.
The strict generator now freezes the complete census funnel and all generated
output hashes, rather than merely trusting the final selected list.

The four Lean shards and coordinator prove all 112 source clauses, their
extended-CNF evaluator, the `SourceRealization` bridge, and the conditional
terminal adapter. Targeted diagnostics and axiom checks pass with no
`sorryAx`; the finite evaluator uses the accepted `native_decide` trust
boundary.

The official Child39 root was rendered directly from the Lean-owned CNF and is
the byte-identical Child38 prefix followed by exactly those 112 clauses:

- 308 variables;
- 5,847,388 clauses;
- 291,625,610 bytes; and
- SHA-256
  `989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`.

The suffix has SHA-256
`4cc66a1b3f4af46d60ed0a2c59f4fb6b0cb016f3ab1b111989ffe015f5b33925`,
the immutable export receipt has SHA-256
`2dc3c78fb19ee4cef8b7fe45c9f49f0f0bd75201f9c0bed57891215bae565ecc`,
and the recursively validated PIQD ingress manifest has SHA-256
`275a61b6febdc1ca5104ebe932919c24e2226f794e68b22caf02ffcbb076c83d`.
Ruff, nine focused adversarial tests, exact export/ingress replay, and the
runner's static gate pass.

No Child39 PIQD job exists at this checkpoint. Submit exactly one job through
the pinned runner after publication. On terminal `SAT`, replay the entire model
and mine only that new wave. On terminal `UNSAT`, independently replay the
certificate and compose the banked theorem through the source-realization and
landing contracts. Exact 17 and the cap-nine production `sorry` remain open.

## Fortieth Lean-owned child checkpoint — 2026-08-13

Child39 terminated authenticated `SAT` at epoch one as PIQD job
`68cfcaf6-1a90-466e-8fc3-d1c3ffc8e377` after 674.811 seconds. The exact
308-variable assignment independently replayed all 5,847,388 clauses of root
`989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`.
It is an abstract source-normal-form survivor, not a Euclidean counterexample.

The mandatory wave-only mine found 49 new source-valid instances of the
already general two-Kalmanson `CancellationOccurrence` theorem and no new
theorem family. Their two orientations yield a 196-clause suffix. Seven Lean
shards plus the coordinator prove all clauses, the source evaluator, the
extended evaluator, the `SourceRealization` bridge, and the conditional
terminal adapter. The targeted exporter build and axiom audit pass with no
`sorryAx`; finite evaluation uses the accepted `native_decide` boundary.

The Child40 exporter and fail-closed validators pin the immutable Child39
prefix, exactly 196 Lean-owned suffix clauses, the current Lean sources, and a
5,847,584-clause result. The production Lean-rendered root was published once
with no-overwrite semantics and a ledger-last receipt. It has 308 variables,
291,633,186 bytes, and SHA-256
`555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034`.
The recursively validated immutable ingress manifest has SHA-256
`df1c180056ee4c47e1d5ddc645ebda10a0129c9abcb6a41cace6749627469cd8`.
Ruff, six focused adversarial tests, and the live PIQD identity check pass. The
sixth test proves that a concurrent losing exporter cannot unlink the winner's
published root. Exactly one Child40 PIQD job,
`3d2779d0-4962-417d-b62a-a482b20e2772`, is confirmed and running at epoch 1
against these pinned bytes.

Next handle the authenticated terminal result. `SAT` requires full replay and
a new-wave-only theorem mine before any successor. `UNSAT` requires independent
certificate replay and Lean composition through the existing exact-cover,
source-realization, and landing contracts. Exact 17 and the cap-nine production
`sorry` remain open.

## Forty-first Lean-owned child checkpoint — 2026-08-13

Child40 terminated authenticated `SAT` at epoch one. Independent replay checked
all 5,847,584 clauses of the exact Child40 root. The exhaustive new-wave mine
found 84 subset-minimal instances of the existing source-valid
`CancellationOccurrence` family. Their two cyclic orientations yield a
336-clause Lean-owned suffix; twelve shards and a coordinator prove the suffix,
the extended evaluator, the `SourceRealization` bridge, and the conditional
terminal adapter.

The immutable Child41 root has 308 variables, 5,847,920 clauses, 291,654,272
bytes, and SHA-256
`fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24`.
Its recursive export and ingress validators pass. The shared runner now enforces
the stricter terminal contract: PIQD `UNSAT` custody must include the
submitted-session clause map and proof; the runner reconstructs the exact kept
CNF and independently replays the compacted LRAT. This does not replace source
validity: Lean separately proves that every learned clause is true for every
`SourceRealization`. Ruff, 284 focused adversarial tests, the live Child41 PIQD
static gate, the targeted exporter build, and the axiom audit pass.

No Child41 PIQD job exists at this checkpoint. Publish the validated source and
runner first, then submit exactly one authenticated job. A terminal `SAT` again
requires full model replay and a new-wave-only theorem mine. A terminal `UNSAT`
requires certificate replay and composition through the exact-cover and
source-realization landing contracts. Exact 17 remains open.

## Child41--Child44 refinement progression — 2026-08-14

Child41, Child42, and Child43 each terminated authenticated `SAT` at epoch one,
and each retrieved assignment independently replayed every clause of its exact
submitted root. Their PIQD job identifiers are, respectively,
`038ded12-0e98-4c93-b666-2ca2ac06da5e`,
`283f5c21-de62-4318-8a11-bcb4632a5f76`, and
`9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb`. The corresponding wave-only mines
found 133, 35, and 57 source-valid supports. Every support is an instance of
the already-banked cardinality-independent two-Kalmanson cancellation family;
none constitutes a new theorem family or a Euclidean counterexample.

The Child43 root has 308 variables, 5,848,592 clauses, and SHA-256
`dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76`.
The 57 Child43 supports expand through both cyclic orientations to an exact
228-clause Lean-owned Child44 suffix. The bank proves every suffix clause for
every `SourceRealization`, the source and extended-CNF evaluators, and the
conditional terminal adapter. The provisioned Child44 candidate has 5,848,820
clauses, 291,704,790 bytes, and expected SHA-256
`17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9`.
The direct Lean rendering, exclusive hard-link publication, ledger-last
receipt, recursive ingress validation, and live static gate have all passed.
The immutable ingress manifest has SHA-256
`152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048`.
Child44 was subsequently submitted exactly once as immutable PIQD job
`f717c352-2456-412a-ae45-d910f47d3e94`.  Its confirmed binding is the root and
manifest above, with identity SHA-256
`97825c01cb69aed6c8eceaa6e32ff7ebc0c328dfebe4406ee7dcc204f35c82a2`.
The job terminated `SAT` at epoch one after 1,687.851 seconds.  This is not a
Euclidean counterexample.  Canonical finalization and an independent replay
both pass for all 5,848,820 clauses.  The custody-final SHA-256 is
`b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa`, the
custody-model file SHA-256 is
`2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a`, and the
canonical assignment SHA-256 is
`5436c27196fd618ed7641c940fb56cfb7ee20a4e0f2c777c171da8e7c45af819`.
The decoded selectors are next center `15` and named order `1`.

The shared lifecycle runner now descriptor-binds every local root, manifest,
and custody record with no-follow opens, pre/post `fstat` checks, exact byte
hashes, duplicate-key-rejecting JSON, and immutable-record digest binding. The
pre-submission validation found and repaired two fail-closed integration bugs:
the live exporter originally chose a macOS temporary path behind the `/var`
symlink despite the no-follow policy, and the Child44 ingress path adapter did
not expose the nested export path expected by the shared runner. Neither bug
created a PIQD job or accepted a solver result. The focused adversarial suite
now passes 322 tests, and the repaired live export, ingress, and static gates
all pass.

The mandatory cross-wave meta-analysis covers Child33 through Child43 and has
full normalized source-valid mines for Child39 through Child43. Across those
five waves it found 358 source-valid occurrences, all belonging to the same
two-Kalmanson cancellation family.  The separate Child44-only mine found 99
additional paired, source-checked occurrences of that same family, representing
396 clauses if banked, and excluded ten diagnostic records without a
`SourceRealization` bridge.  It found no new theorem family.  The newest
cumulative CNF retains learned clauses but does not retain prior assignments,
diagnostic hits, normalized support identities, frequencies, or failed theorem
candidates, so the serial theorem-mine route is now retired.

Exact 17 and the cap-nine production `sorry` remain open.  No Child45 is
authorized.  The source-total thirteen-cell campaign below is the production
successor.

Child44 is also the hard gate for the serial model-blocking strategy. The five
fully mined waves Child39--Child43 contain 358 source-valid occurrences, all in
the same two-Kalmanson cancellation family, and 110 of Child44's 228 suffix
clauses are already parent-subsumed.  Child44 then terminated `SAT`; its
independent replay and wave-only mine completed with 99 more occurrences of the
same family and no new theorem schema.  This closes the serial strategy gate
and does not authorize an automatic Child45.

The earlier proposal to instantiate a complete finite orbit of the generic
cancellation schema is not executable as stated.  A checked cancellation
contains equality-closure paths selected from the current row system.  The
existing enumerator is complete only for one supplied model; it is not an
enumerator of every `SourceModel`, and the raw finite model space is far too
large.  A monolithic Boolean-plus-LRA replacement was also tested previously:
the metric-only layer is fast, but both the base and full-static mixed formulas
timed out.  Neither route is a justified production successor.

## Post-Child44 bounded placement campaign

A terminal Child44 `SAT` moves the campaign to a source-total finite partition,
not another serial suffix.  `SourceModel.nextCenter` has thirteen legal values:
the base CNF chooses exactly one of seventeen labels and separately excludes
the four old centers.  Together with the two named orders this gives 26 finite
placement cells.  The authenticated Child41, Child42, and Child43 models all
occupy the same cell, named order `1` and next center `0`; the serial loop has
therefore repeatedly refined one cell rather than measured the whole finite
frontier.

The replacement campaign is:

1. split first into the thirteen `nextCenter` cells, using the source theorem
   that these cells cover every realization;
2. solve all still-open cells in parallel while preserving a separate
   immutable root, model, or proof record for each cell;
3. independently replay every `SAT` model and run the already implemented
   complete strict-Kalmanson linear oracle, rather than only the first static
   motif matcher;
4. for a linearly infeasible model, extract and exactly replay a deletion-
   minimal positive weighted Kalmanson certificate, then admit the whole batch
   through the existing source-clean weighted consumer;
5. for a Kalmanson-feasible model, stop refining that cell with Kalmanson
   clauses and send it to the Euclidean/EDM/Ptolemy realizability lane; and
6. for an `UNSAT` cell, replay its proof against the exact cell root and mark
   that cell closed.  Exact 17 closes when all thirteen cells are closed and a
   thin Lean coordinator consumes the source-total case split.

The source-total ingress candidate has been LSP-elaborated for
`BlockerVExactSeventeenSourceNormalForm.lean` as
`legalNextCenterLabels`, `legalNextCenterLabels_spec`,
`SourceModel.nextCenter_mem_legalNextCenterLabels`,
`legalNextCenterLabels_length`, and `legalNextCenterLabels_nodup`.  The list is
the explicit complement of the four old centers, has thirteen duplicate-free
entries, and every `SourceModel.nextCenter` belongs to it.  LSP elaboration is
clean apart from the file's pre-existing `native_decide` style warning, and the
four new theorems' axiom closures contain only the ordinary core axioms.  The
reuse preflight at source revision `d2d146ab` found the existing
`SourceModel.nextCenter_not_old` antecedent and CNF evaluator, but no previously
named thirteen-cell coverage theorem.  The immediate consumer remains the
future per-cell terminal coordinator; these declarations are ingress, not leaf
closure by themselves.  After canonical Child44 finalization, the source hunk
was banked and its targeted module build passed.  The direct coverage theorem's
literal axiom closure is `propext`, `Classical.choice`, and `Quot.sound`.

The frontier measure is now the number of open next-center cells, followed by
the number of Kalmanson-feasible cells.  A round that merely adds another
assignment-specific pair-cancellation suffix without reducing either measure
is not progress.  Before production use, a small assumption/cell canary must
bind the Lean variable map, replay `SAT` models, replay any `UNSAT` proofs, and
verify the finite coverage split.  PIQD supports session assumptions, but the
current P97 runner does not yet authenticate that interface; separately rooted
unit-clause jobs remain the proof-producing fallback.

The first session canary used the exact Child44 stored formula with assumptions
`290` and `307`, namely next center `0` and named order `0`.  Session
`8d9b5463-5ebf-4707-bdc7-3367af9cb530` returned `UNKNOWN` after its explicit
1,200,000 ms timeout, with result receipt SHA-256
`f763a1b8406f6d1a48536ce7882683b1ed25af6f0c7ef98bc0e7fc2c680414cc`.
The canary created no model and no proof.  Its session journal canonicalized
the root to 291,704,772 bytes with SHA-256
`5debe2aea0b016a4178065153f9c7b2053ae0a2b79ea143a8bd52bb4704b9f41`,
rather than preserving the raw Child44 bytes.  Production cell custody must
therefore bind both the raw parent identity and the session journal identity,
and terminal `UNSAT` must still pass through static handoff.  The timeout also
rules out launching all cells under one short serial session; use deterministic
conflict budgets and parallel cell sessions for the next canary.

## Child46 terminal and post-Wave-43 uniform successor

The source-total campaign and subsequent FortySixth promotion have now moved
the production root past Child44.  Child46, SHA-256
`106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2`
with 5,848,864 clauses, was submitted exactly once as PIQD job
`6f031597-70aa-4c22-bb3b-b222dbb7871f` and returned `SAT`.  Independent replay
checks every root clause and reconstructs a source model whose full
strict-Kalmanson system is rationally infeasible.  It is therefore a new CEGAR
input, not a Euclidean counterexample candidate.

The periodic cross-wave theorem search after Wave43 found no recurring ground
support among Child39--43, Child45, and Child46.  It did find one recurring
mathematical shape: three selected rows forming a six-incidence cycle on six
cyclically ordered points.  `KalmansonThreeRowCycleSchemas.lean` proves the
three direct order types (adjacent/adjacent and the two
adjacent/inner-outer orientations), including both increasing and decreasing
cyclic consumers.  The metric declarations use only the ordinary core axioms.

`BlockerVExactSeventeenThreeRowCycleRefinements.lean` is the finite ingress
contract.  It instantiates all three source theorems over both named orders,
both directions, seventeen cuts, and all 4,368 five-offset choices; proves all
891,072 resulting clauses from `SourceRealization`; appends them to Child46;
and supplies the terminal conditional-UNSAT adapter.  The Lean-owned export is:

```text
variables: 308
clauses:   6,739,936
bytes:     322,685,712
sha256:    2870fa87246292872ef0668471b2dab8a708a7c1815e2223a385c2ecb8a8f869
```

Independent byte-level regeneration verifies the exact Child46 body prefix,
the complete suffix order and contents, and twenty falsified suffix clauses
under the authenticated Child46 assignment.  The theorem is uniform in
carrier cardinality, but its finite clause consumer is scoped to the exact-17
normal form.  It does not claim coverage of the five overlap cycles or of
producer certificates whose Kalmanson proof uses auxiliary vertices outside
the six incidence endpoints.

The next route step remains unchanged in trust shape: publish this exact root
immutably, validate the registered ingress and replay lock adversarially, and
submit exactly one successor.  A `SAT` terminal triggers only a wave-local
theorem mine; an `UNSAT` terminal requires independent certificate replay and
composition through `exists_exactSeventeenSourceRealization_of_exactCover`.

## Current-root small-role cycle successor — 2026-08-16

The fully cumulative current root has 308 variables and 7,037,500 clauses.  Its
immutable SHA-256 is
`c2d5a4472eea783152919078da45083ad31835a407a75e22150bf2eae63cd3e8`.
PIQD job `89aef52c-023d-4b9e-9e84-78ac487ea152` returned `SAT` in one
solver epoch, and an independent local replay checked all clauses under the
reported 308-variable assignment.

The mandatory wave-local mine found no new metric family beyond the existing
generic two-Kalmanson cancellation theorem.  The cross-wave compression then
exposed and corrected a coordinate error in the first motif classification:
mined support indices were already boundary-position indices, so applying the
model boundary permutation a second time was invalid.  In the correct induced
cyclic order, all thirteen size-six minimal occurrences from the two latest
models reduce to two directed incidence patterns:

1. five cyclic roles with incidences
   `a:{b,c}`, `b:{c,e}`, and `d:{b,e}`;
2. four cyclic roles with incidences
   `a:{b,c}`, `b:{a,c}`, and `d:{a,b}`.

The five-role pattern is unconditionally excluded by two strict Kalmanson
inequalities.  The four-role pattern is excluded when either open alternating
gap `(a,b)` or `(c,d)` contains another carrier point.  An exhaustive symbolic
check shows that the four-role incidence pattern alone has no such certificate
when both gaps are empty; those placements are therefore not admitted.

`KalmansonSmallRoleCycleSchemas.lean` proves increasing and decreasing
selected-class consumers for the five-role pattern and both four-role gap
placements.  Its six public declarations have only `propext`,
`Classical.choice`, and `Quot.sound` in their axiom closures.

`BlockerVExactSeventeenSmallRoleCycleRefinements.lean` instantiates those
theorems over the complete exact-seventeen source surface:

```text
five-role clauses:          2 * 2 * 17 * C(16,4) = 123,760
four-role base triples:     C(16,3)               =     560 per cut
four-role gapless triples:                            14 per cut
four-role admitted clauses: 2 * 2 * 17 * 546      =  37,128
source-complete bank:                                160,888
cumulative root:                                   7,198,388
```

Independent enumeration found all 160,888 guarded clauses distinct and found
no overlap between the two families.  Relative to the cumulative parent,
64,097 of them are already implied by a shorter or equal parent clause and
96,791 are genuinely nonredundant.  The exact authenticated redundancy census
has 62,537 unit, 1,416 binary, and 144 length-seven shortest witnesses; it also
records 204 exact parent duplicates.  The parent SAT model falsifies exactly
seven of the nonredundant clauses, so this successor makes a real refinement
despite the large source-generated redundant orbit.  Publication must
recompute and match this complete census rather than silently weakening the
parent-subsumption gate.

The exact source adapters select the correct increasing or decreasing theorem
from the source orientation, using the canonical auxiliary position `1` in the
first gap or `c+1` in the second.
A targeted build and independent source audit pass.  The finite ingress and
terminal adapter inherit the project's accepted native-reduction boundary
(`Lean.ofReduceBool` and `Lean.trustCompiler`) and contain no `sorryAx`.

This bank is a uniform family theorem, not an exact-seventeen closure result by
itself.  The next production action is to export and immutably publish the
7,198,388-clause Lean-owned root, validate its ingress, and submit exactly one
authenticated PIQD solve with the existing 3,600-second timeout and a hard
limit of at most twelve cores.  A `SAT` result receives one wave-local theorem
mine; an independently replayed `UNSAT` result composes through
`exists_exactSeventeenSourceRealization_of_exactCover` to close the exact-17
cap-nine branch.

## FortyNinth weighted successor and pinned-multiplicity gate — 2026-08-17

The FortyNinth Lean-owned root is now provisioned and authenticated at 308
variables and 7,198,668 clauses.  Its publication is a source-pinned,
create-once export; the next computational action is exactly one authenticated
PIQD solve with the existing 3,600-second timeout and one core (hard limit
twelve).

The pinned-multiplicity proposal is a conditional successor refinement, not a
retroactive change to this root.  Pairwise row-overlap capacity at most two is
already present.  The global overlap-count bound is vacuous at `n = 17`, and
normal-incidence is not yet a source-proved lemma, so neither is admitted as a
Boolean clause.

If FortyNinth is SAT, first formalize source-safe same-shell semicircle/order
constraints and three-pin squared-distance compatibility, then add them to a
new cumulative successor and rerun the authenticated validation pipeline.
Normal-incidence remains blocked until its vertex/edge-normal alternatives are
proved in Lean.  Independently, construct the anti-coverage query that
conjoins the exact-seventeen source CNF with the negation of every banked
weighted-occurrence hit pattern: UNSAT is a finite coverage certificate;
SAT models are mined only for genuinely new source-valid occurrences.

The intended Lean endpoint is a structural coverage theorem over
order/orientation/next-center cases, not an assertion that the current finite
occurrence catalog is exhaustive.

## FortyNinth next-zero-atom promotion — 2026-08-17

The first authenticated FortyNinth solve was SAT.  Its replayed assignment
contains two additional direct zero atoms, indices 3844 (`adjacentSides`) and
3861 (`innerOuter`).  Both have source-valid weighted-Kalmanson adapters, so
they are promoted as a separate eight-clause child: two occurrences times two
named orders times two orientations.  This child is cumulative over the
published 7,198,684-clause zero-atom root and therefore has 7,198,692 clauses.

This is a source-adapter promotion, not an exact-17 closure claim.  The next
gate is one authenticated solve of the published child using the existing
3,600-second timeout and one core.  A SAT result is mined only for the next
minimal source-valid subset; an independently replayed UNSAT result composes
through the child terminal adapter.

The solve was SAT after 779.47 seconds.  Independent replay checked all
7,198,692 clauses against the complete 308-variable assignment with no
failures.  The wave-only exact Kalmanson scan found five source-valid
two-atom cancellation records, but only four distinct hit supports: two of
the eight-hit records have the same support.  The next promotion therefore
starts with the two distinct eight-hit supports (8 guarded clauses), while
the two ten-hit supports remain queued behind that child.
