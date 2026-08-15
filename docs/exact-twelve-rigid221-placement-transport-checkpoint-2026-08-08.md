# Exact-twelve Rigid221 placement-transport checkpoint

Date: 2026-08-08

## Placement transport result

`ExactTwelveRigid221PlacementTransport.lean` now supplies the first checked
source-level placement transport for the pentagon-off-class exact-twelve lane.
It proves:

- `frozenPlacementDomain` is exactly the ordered pairs of distinct labels in
  the seven-label variable-role vocabulary;
- `frozenPlacementDomain_card` computes its cardinality as 42 by kernel
  reduction (`decide`, not `native_decide`);
- every source-produced `FrozenRoleLabeling` lies in that domain;
- composing a carrier labeling with an admissible label permutation produces
  another fully realized `FrozenRoleLabeling`; and
- `labeledRowPattern_trans` identifies the transported finite rows exactly
  with generic row-pattern reindexing.

The targeted module build passes.  Explicit axiom checks for the cardinality,
row transport, placement membership, and relabeling declarations report only
`propext`, `Classical.choice`, and `Quot.sound`.

The normalized extension now supplies the remaining source-side transport:

- `ExactTwelveRigid221PlacementOrbits.lean` reduces the unrestricted
  42-placement domain to 21 representatives under the admissible action on
  the unnamed labels `3,4,5`;
- after consuming the source-produced physical-pair separation facts, it
  kernel-computes a 24-placement live domain and a stable 12-representative
  list, without swapping the frozen named labels `10` and `11`;
- `ExactTwelveRigid221NormalizedSafeIngress.lean` rederives the interior,
  closed-cap, and safe-cube predicates after normalization;
- `ExactTwelveRigid221BranchTransport.lean` transports the six-arm predicate
  and both distinguished-`d` predicates; and
- `ExactTwelveRigid221NormalizedV14Ingress.lean` carries the physical row,
  actual blocker identities, five exact row traces, and all three v14 branch
  predicates to one of the 12 representatives.

A fresh targeted build of the aggregate normalized-v14 ingress module passes.
Explicit axiom checks for the aggregate transport theorem and the separated
12-representative cover report only `propext`, `Classical.choice`, and
`Quot.sound`; neither depends on `sorryAx`.

This is source ingress plus a placement-coordinate representative cover.  It
is not full finite branch/certificate coverage and not a contradiction.

All computational statuses below concern the placement-transport/v14
representative lane and should not be read as the separate arm-static cell-6
v4 status.

## Computational status

The bounded v18 canary in the new `u/q`, `(jd,v)=(0,4)`, `d=4` cell classified
one additional model.  It produced an equality-duplicate-center certificate
already covered by the cardinality-independent `DuplicateCenterCore` consumer.
The cell remains `ITERATION_LIMIT`; this is not finite coverage and closes no
Lean obligation.  `ITERATION_LIMIT` is a fail-closed nonterminal/unknown
outcome, not a completed cell.  The stop-scaling rule therefore applies to a broad
arm-by-placement canary matrix.

`census/card_head/exact12_v14_schedule.py` now freezes the resulting
12 x 6 x 9 = 648 Cartesian coordinate schedule under schema
`p97_rigid221_exact12_full_v14_schedule.v1`.  Its canonical payload hash is
`b183cab096266e597362c6919df121cd311c7fc20e155f8b24ef12d23f4bd05b`.
The manifest also binds the supplying Lean source-file bytes.  Six focused
tests cover deterministic cardinalities plus omission, reorder, duplication,
Boolean/integer type confusion, and source-metadata drift; Ruff and the tests
pass.

The schedule is deliberately `ENUMERATION_ONLY`.  Its arm and center fields
are coordinates, not separately proved witnesses.  Cells may overlap or be
empty, and the schedule manifest does not validate theorem elaboration,
execute a solver, establish coverage, replay a certificate, or close a Lean
theorem.

`census/card_head/exact12_v14_jobs.py` now builds one deterministic descriptor
per schedule cell and authenticates the complete ordered 648-job set.  The v1
contract is intentionally `SOURCE_TO_CNF_UNVERIFIED`: every job has execution
`BLOCKED`, and validation rejects schedule/source drift, coordinate tampering,
type confusion, and missing, duplicated, or reordered job-set entries.  This
contract does not execute the solver.  It records the exact missing authority:
a reviewed source-predicate-to-SAT-literal valuation map, authenticated
compiler and variable-map artifacts, and independent model/proof replay.

That finite binding is now implemented under a separate schema instead of
retrofitting the blocked v1 descriptors.  `exact12_v14_valuation.py` compiles
the physical five-cycle, the six named-deletion arms, and distinguished `d`,
pins the exact candidate-table and base-CNF hashes, and independently replays
the added predicates.  All 648 cells compile in the focused regression.  The
72 cells with `d = xu` correctly omit `blocker(xu) != xu`, since the source
blocker domain already excludes its own source; an earlier draft rejected
those cells.

`exact12_v14_bound_jobs.py` authenticates the compiler sources, variable map,
and exact DIMACS bytes.  `exact12_v14_cell_run.py` performs no-proof SAT
discovery, exact CNF and semantic replay for SAT witnesses, and a fresh
identical-CNF DRAT-producing rerun before accepting UNSAT.  Cell 0 is a real
`SAT_WITNESS_REPLAYED` canary.  Thus the incidence compiler is producing
authenticated survivor data, but it is not itself a contradiction or a
coverage result.

`exact12_v14_structural_cegar.py` is now a tagged mixed-v4 refinement
dispatcher over that binding.  It builds the complete theorem-backed
source-order bank from a no-follow repository-source snapshot, checks the fixed
Lean-source identities, recompiles every stored certificate, and admits the
lowest-index bank clause whose recorded selected-row choices are all selected
by the current assignment.  This is deliberately broader than
exact-cube equality: the Lean `SourceOrderPositiveNogood` consumer depends only
on positive matching of the recorded rows.  If no bank clause matches, the
dispatcher falls back to the existing order-independent structural metric
detector and independent certificate replay.  Every admitted cut is recompiled
to the exact selected-row variables and written to an append-only hash chain
bound to the cell job and the semantic detector contract.  The v4 journal tags
the certificate family, schema, and detector stage, records the deterministic
source-order bank index or `null` for structural cuts, and stores the canonical
cube and complete positive SAT assignment.  Replay reuses the path-built bank
snapshot, canonically recompiles it, requires the same lowest matching index
and exact stored certificate, and then checks the cube, assignment, learned
clause, cut falsification, and exact family-specific proof.  A supplied bank
snapshot is not, by itself, a claim that live repository paths still equal its
recorded Python manifest; the migrator establishes that stronger provenance by
capturing and checking the source bytes before path-free replay.  Legacy v2 and
tagged-v3 journals are rejected rather than silently migrated.  The retained
earlier waves remain historical nonterminal diagnostics; a fresh v4 wave is
required for promotion.

The separate `nextRowOnlyHit` successor runner now uses the same fail-closed v4
principle.  Its records authenticate the exact 57-entry source-order bank, and
replay reattests the current Lean/detector bytes and validates the whole journal
on a shadow CNF before installing any clause.  The fresh cell-3 i84 canary
replayed 84 records, including the new entry-56
`nextRowCell3PositiveNogood` cut, and ended `ITERATION_LIMIT`.  It produced no
terminal CNF, DRAT proof, all-cell coverage, universal lift, or live closure.

The subsequent twelve-cell v4 wave reached 100 authenticated records in every
cell and again ended `ITERATION_LIMIT` in all twelve cells.  Its 1,200 records
contain 1,184 duplicate-center, eleven equilateral-bisector, three three-triad,
one perpendicular-bisector/convex, and one entry-56 source-order cut.  The
mandatory post-wave search found no new local theorem family.  It did identify
that the bank's named terminal consumer was specific to the historical v14
clause delta.  The next-row lane therefore now has a separate conditional
`NextRowTerminalBankConsumer.false_of_terminalNextRowSourceOrderBank` endpoint,
and its journal schema advances to v5.  Only proof-carrying source-order entries
name that direct endpoint; structural Python certificates now name their
obstruction family separately and carry no direct Lean consumer.  A concrete
Lean reconstruction of each emitted next-row formula as a `CompiledNextRowJob`
remains open; no v4 artifact is being promoted through the v14 consumer.

Later checkpoint (2026-08-10): the separate five-omission v3 lane now has an
authenticated 716-cut layered successor, but every deleted-label shard stopped
at `ITERATION_LIMIT` without a terminal proof.  Those cuts neither replace the
placement transport proved here nor supply the still-open exhaustive coverage,
replay-check equivariance, and terminal-certificate gates below.

## Exact remaining gate

Source transport is complete for the listed v14 predicates and justifies
replacing the source-separated 24-placement domain by the 12 checked
representatives.  Replay-check equivariance and finite coverage are still
open.  `ExactTwelveV14DuplicateCenterCanary.lean` now translates the first
authenticated structural record to `DuplicateCenterNogood (Fin 12)`, proves
its checker by kernel reduction, and supplies exact- and positive-match source
consumers.  `ExactTwelveRigid221LearnedClauseBridge.lean` now also proves the
missing literal-reflection step: if the canonical source `finalAssign`
falsifies the emitted negative selected-row clause, every recorded support is
the source-selected candidate, hence the duplicate-center record
`PositivelyMatches` the source row pattern.  The canary proves all five record
rows are encodable and composes that exact Boolean premise to `False`.  A
targeted build passes, and proof-blueprint mines 94 dependency edges for the
eight canary declarations with zero edges into axioms.  This is still a
conditional record-ingress/reflection canary, not proof that a terminal bank
forces the Boolean premise.

The source-to-schedule semantic seam is now kernel checked as well.
`ExactTwelveRigid221V14JobSemantics.lean` defines the six named-deletion arms,
the nine admissible distinguished-`d` values, the 648-element semantic job
coordinate type, and the exact `FrozenV14AddedConstraintsHold` predicate.
`ExactTwelveRigid221V14SourceJobBridge.lean` proves that the geometric physical
class and its `xu`-erasure are exactly the frozen compiler sets, translates all
five geometric cycle edges and source labels, and packages every normalized
source packet as one concrete schedule cell satisfying the complete semantic
predicate.  Its targeted build passes; `#print axioms` for
`exists_source_normalized_v14_semanticJob` reports only `propext`,
`Classical.choice`, and `Quot.sound`.  Thus the 648-cell schedule is now
source-entitled at the semantic-predicate level.  This still does not prove
that the corresponding DIMACS/Sinz extension satisfies every emitted clause,
and it supplies no terminal coverage.

`ExactTwelveRigid221V14JobCnf.lean` has begun the exact numbered-DIMACS
reflection.  It mirrors the compiler's blocker-variable and auxiliary-variable
layout, proves that each source has exactly one selected blocker and each
center has at most one, and extends the source assignment through all five
source-wise bound-one Sinz counters.  The aggregate theorem
`sourceSinzAssign_sat_source` proves satisfaction of every emitted source-Sinz
clause for every one of the five physical sources.  The theorem
`centerSinzAssign_sat_center` then extends that assignment through all twelve
center-wise bound-one counters and proves satisfaction of every emitted
center-Sinz clause.  The same module now also proves that the complete v14
extension selects exactly the source-faithful cover candidate at every valid
`xVar`, satisfies each source at-least-one blocker selector, and satisfies the
two compiler units forcing the `6`-source blocker at `8` and the `8`-source
blocker at `7`.  It additionally reflects the exact center-`1` row unit and
the center-`7` physical-intersection clause, preserving the compiler's ordered
candidate-literal list, and proves that the source-selected cover candidates
satisfy both clauses.  It now also mirrors all ten ordered blocker-to-row
implications in each of the five physical-source blocks and proves that the
source-faithful blocker/row assignment satisfies all fifty clauses.  A
targeted direct module check passes.  The module now also mirrors the selected
named-deletion arm in exact compiler order: the center-`2` blocker unit first,
then every blocker/candidate binary clause in increasing center and candidate
table order.  The semantic arm predicate proves that the canonical assignment
satisfies every clause in this Lean family, and the targeted module check
remains green.  This is certificate-ingress infrastructure only: the
module now also mirrors the complete distinguished-`d` family in compiler
order: the positive eligible-row clause, optional source-`9` blocker unit, and
the optional left-major forbidden-pair product.  The semantic distinguished
row and missing-conjunction hypotheses prove that the canonical assignment
satisfies every clause in this final local family, and the targeted direct
module check remains green.  All local non-Sinz and Sinz families are therefore
reflected separately.  The module now also aggregates those families in the
exact compiler order—initial row clauses, five source blocks, forced blockers,
twelve center-Sinz blocks, named-deletion arm, then distinguished-`d`—and proves
that the canonical source/blocker/Sinz assignment satisfies every clause in
that aggregate.  The ordered aggregate passes the targeted direct module
check.  The representative cell-0 artifact now supplies the first explicit
serialization bridge.  It authenticates the complete DIMACS bytes and their
1,280-clause suffix, and the generated
`ExactTwelveRigid221V14ClauseDeltaCell0000.lean` proves that this exact ordered
suffix equals `reconstructedClauseDelta`.  The checked delta SHA-256 is
`01cc5ecfca4bf068bd69e594a84017eeb75f87bf281cae43fecb05d32e482f3c`;
the complete DIMACS SHA-256 is
`cfc268f2915ff31eaf24a66a036e41e81f93aca0967e88c1b4a4158eb67a379`.
The equality proof uses `native_decide`, so this is a compiler-trusting exact
artifact check rather than a kernel-only certificate.  It covers one
representative schedule cell only.  There is still no production terminal bank or
live-leaf closure.

`ExactTwelveRigid221TerminalBankConsumer.lean` now supplies the complete
per-cell logical consumer.  Its `terminalDimacs` is exactly the frozen base
cover CNF, the cell's reconstructed 1,280-clause delta, and the learned
duplicate-center clauses; the base formula is not omitted.  The theorem
`not_realizes_of_terminalDuplicateCenterBank` proves that UNSAT of that complete
formula rules out any realizable source-safe row satisfying the cell
predicates.  Its learned-clause arm reuses the checked literal-reflection and
duplicate-center consumer.  A targeted direct source check passes.  The base
literal-range fact is evaluated with `native_decide`; the final theorem's
audited axiom closure is exactly `propext`, `Classical.choice`,
`Lean.ofReduceBool`, `Lean.trustCompiler`, and `Quot.sound`.  A source scan of
the evaluated base-CNF definitions found no `unsafe`, `@[implemented_by]`, or
`@[extern]` redirection.  This is therefore an explicit compiler-trusting
consumer, not a kernel-only proof.  A wrapper build currently stops in the
upstream `ExactTwelveRigid221V14JobCnf` module at the configured 16 GiB memory
cap; that is a build-resource failure, while direct elaboration of the new
module succeeds.  Most importantly, no production terminal bank or proof of
`DimacsUnsatisfiable` has yet been supplied, so this theorem closes no live
leaf by itself.

`ExactTwelveRigid221SourceOrderTerminalBankConsumer.lean` generalizes that
finite endpoint to a list of proof-carrying `SourceOrderPositiveNogood` values.
Each value stores its selected row choices and a semantic refutation of every
source realization positively matching those choices.  Structural
`DuplicateCenterNogood` values enter through the checked
`SourceOrderPositiveNogood.ofDuplicateCenter` adapter, while the current frozen
V8 order theorem supplies a native source-order value directly.  The complete
terminal formula still contains the frozen base CNF and reconstructed cell
delta before the learned clauses.  This is a typed mixed-bank consumer, not a
bank, terminal UNSAT proof, aggregate result, or live closure.

`ExactTwelveRigid221TerminalRupIngress.lean` now supplies the next logical
boundary.  It transfers successful replay by the existing compact pure-RUP
checker to `DimacsUnsatisfiable`, provided generated data proves both exact
parsing of the checker start formula and exact equality of its signed clauses
with the full `terminalDimacs` ledger.  The current exact-twelve endpoint
`false_of_checkedCompactSourceOrderTerminal` composes this fact with the mixed
source-order bank consumer.  Direct elaboration passes.  The generic replay
transfer itself has audited axiom closure
`propext`, `Classical.choice`, and `Quot.sound`; the final exact-twelve endpoint
additionally inherits `Lean.ofReduceBool` and `Lean.trustCompiler` from the
terminal-bank consumer's previously documented base-literal bound.  This
module embeds no terminal certificate and proves no cell terminal.

`scripts/prepare_exact12_v14_terminal_rup_source.py` now provides a fail-closed
postprocessor for a future terminal v14 job.  It accepts only an authenticated
`UNSAT_DRAT_VERIFIED` cell or structural summary, rechecks every bound artifact
path, size, and SHA-256, requires discovery and terminal CNF identity, copies
the bound job, and requires the summary's canonical job digest and cell index
to match that job.  Cell summaries must carry the clause-delta artifact bound
inside the job; structural summaries must carry a journal whose record count,
parent chain, detector-contract digest, certificate/cube/assignment hashes, and
terminal chain head all match the summary.  This postprocessor authenticates
the tagged v4 chain and admits only certificate families with an explicit typed
Lean ingress: replay-checked equality-duplicate-center records, or the exact
named theorem binding from the freshly authenticated source-order bank.  It
emits `terminal-bank-manifest.json` in journal order, compares every
family-specific replayed learned clause with the authenticated record, rebuilds
the current schedule manifest, validates and rematerializes the bound job
through the canonical compiler, installs the replayed cuts, and requires both
discovery and terminal DIMACS files to equal the resulting canonical bytes
exactly.  The manifest is provenance and typing data; structural Lean objects
must still be reconstructed from the richer authenticated journal records.

The staged source is self-contained: it includes the parsed summary, bound job,
discovery and terminal CNFs, DRAT, the clause delta or structural journal, the
exact detector-source files bound by the structural contract, and the derived
LRAT files.  After copying, every ledger-bound staged artifact is
rehashed before any checker is invoked, closing the validation-to-copy race.
The canonical source rebuild and semantic journal replay are then repeated on
the staged copies before `drat-trim` is invoked.
The postprocessor reruns `drat-trim` only as an untrusted proposal/precheck and
records its complete output; the receipt explicitly requires subsequent Lean
compact-RUP replay and does not authenticate the checker executable or treat
its `s VERIFIED` line as trusted closure.  Because the installed `drat-trim -L`
output can use sparse or
nonmonotone addition identifiers, the postprocessor normalizes base,
addition, hint, and deletion identifiers to the dense convention required by
the compact materializer.  It rejects reused or inactive identifiers,
negative/RAT hints, and any stream without a final empty-clause addition.  It
then emits the generic authenticated pure-RUP source manifest, re-enters the
generic strict loader before publication, and emits a separate exact-twelve
receipt binding all copied provenance inputs, the checker transcript, terminal
formula, raw proof, raw and normalized LRAT, and normalization counts.  The
mixed-v4 exact-v14 and postprocessor suites pass (`58` and `21` tests,
respectively), and Ruff is clean.  The adapter suite now includes
unmocked source-backed tests that build
the live cell-0 job, generate and replay a real duplicate-center certificate,
check exact staged formula bytes, and reject a self-consistently rehashed job
tamper, a rehashed semantic-certificate tamper, and an alternate DIMACS
rendering before the checker.  A smoke test using the installed
CaDiCaL and `drat-trim` confirmed the relevant sparse-ID behavior and the dense
normalization.  No retained exact-twelve run currently has a terminal artifact,
so this postprocessor has not yet produced a production certificate.

`scripts/generate_exact12_v14_terminal_bank_lean.py` now closes the separate
standalone materialization gate.  It reauthenticates the prepared receipt and
all copied artifacts, reruns the tagged journal replay, requires exact equality
with the typed terminal-bank manifest, recompiles every recorded choice to the
recorded learned clause, and verifies the hashes of every named source-order
Lean declaration.  It emits bounded Lean shards in journal order: structural
records become checked `DuplicateCenterNogood` values adapted by
`SourceOrderPositiveNogood.ofDuplicateCenter`, and theorem-backed order records
refer to their authenticated named declaration.  Generation also fails closed
unless the output directory suffix agrees with the declared Lean module
prefix, so the emitted sibling imports are addressable from the same module
root.  A two-record mixed contract
canary (one record of each family) and its coordinator elaborate directly in
Lean.  That canary uses the test harness's synthetic checker callback and fake
proof bytes; it is materialization evidence only and must not be cited as a
real terminal UNSAT/DRAT result.  No retained production run is terminal.

The earlier bounded twelve-cell structural wave learned 4,468 cuts but produced
no terminal UNSAT: cells `1,2,4,5,7,8,11` remained unresolved and cells
`0,3,6,9,10` reached their iteration limit.  Its mixed-stage journals cannot
be promoted because they predate the tagged v3 contract and are explicitly
rejected by the current replay.  An independent
48-order diagnostic found complete finite order coverage in frozen cells
`4,5,8`, partial coverage in `1,2,7,11`, and no aggregate placement theorem or
universal lift.  These are finite diagnostics, not closure results.

The fresh tagged-v3 twelve-cell wave at commit `cb329a7e` is retained under
`scratch/rigid221-sourceheavy-anchor/exact12-v14-wave-cb329a7e-mixedv3-i400-c0000-0011-r3`.
All twelve journals replayed successfully and contain 3,875 admitted cuts.
Cells `2,4,5,7,8` ended `STRUCTURALLY_UNRESOLVED`; cells
`0,1,3,6,9,10,11` reached the 400-iteration limit.  The detector-stage totals
were 3,777 duplicate-center cuts, 48 equilateral-bisector collisions, 29
perpendicular-bisector-convex cuts, 11 three-triad collisions, seven equal-K4
cuts, and one cut from each of the three larger circle-collision families.
The frozen source-order stage admitted no cut.  No cell produced terminal
UNSAT, DRAT, a production terminal bank, aggregate coverage, or a universal
lift.  This wave therefore supplies authenticated survivor data for the next
predicate-mining round, not a finite or live closure result.

The follow-up source-order audit found that the zero count was a registry
limitation, not an absence of order geometry: all five terminal survivor cubes
have 48-of-48 diagnostic coverage by the convex-five-point common-orientation
consumer.  All five survivor certificates now have checked Lean
`SourceOrderPositiveNogood` values.  Source-order bank schema v3 records the
five exact learned clauses
`(-55,-410,-498)`, `(-896,-1170,-2053,-2162)`,
`(-35,-172,-1363,-1620,-2493)`, `(-29,-55,-546,-939,-2894)`, and
`(-55,-313,-2134)` for cells `2,4,5,7,8`, respectively, alongside the earlier
frozen-V8 entry.  Each certificate replays all 48 direct/mirror source orders,
and each Lean source elaborates without `sorryAx`.

These are five replayable finite cuts.  They are not terminal cell results,
coverage of the 648-cell schedule, a general-cardinality lift, or closure of
either live exact-twelve residual.

A fresh cell-8 canary under detector contract
`6a65ee36bfa16027ae6a70ed727edc2c680af8f893aba11a6926d7eb0f73fa2b`
confirmed the production behavior.  At journal offset 110, exactly where the
old run had stopped on its survivor, the new stage admitted
`source-order-positive-coverage` with clause `(-55,-313,-2134)`.  Search then
continued through 29 additional structural cuts and stopped at the 140-record
bound with `ITERATION_LIMIT`; the complete journal replayed successfully.
Thus the canary validates the new refinement ingress but does not establish
finite UNSAT.

The same detector contract then replay-seeded that 140-record canary into a
fresh workdir and ran 260 additional refinements.  The resulting 400-record
journal again replayed successfully and ended `ITERATION_LIMIT`.  Its complete
stage totals are 386 duplicate-center, seven perpendicular-bisector, four
equilateral-bisector, two three-triad, and one source-order cut.  The terminal
record hash is
`ae6205ef62a600ec2b08c24ea358fede6418cd59307c5c9221cf599d81550bab`.
This shows that the cell-8 order cut is productive but not by itself close to
finite exhaustion; the next compute should use the expanded multi-survivor
bank rather than merely increasing this one-cell limit again.

The ensuing fresh mixed-v4 wave used all twelve authorized workers against
cells `0` through `11`, starting from empty journals under commit `ec013bfd`.
All 4,662 retained records replay exactly, including exact CNF replay.  The
five newly admitted source-order cuts all fired in live search at their old
survivor frontiers: cell `2` at record 208 (bank index 1), cell `4` at record
257 (index 2), cell `5` at record 229 (index 3), cell `7` at record 270
(index 4), and cell `8` at record 110 (index 5).  The frozen-V8 entry at bank
index 0 did not fire.  The complete stage totals are 4,529 duplicate-center
cuts, 60 equilateral-bisector collisions, 41 perpendicular-bisector-convex
cuts, 16 three-triad collisions, eight equal-K4 cuts, five source-order cuts,
and one cut from each of the seven-point twin-four-circle, seven-point
six-circle, and eight-point five-circle families.

Eleven cells reached the 400-record iteration limit.  Cell `4` passed its
source-order cut, learned four further structural refinements, and exposed a
new structurally unresolved survivor at record 262.  Its survivor hash is
`15e7be554ec876f7622a8ec9543ed6c58c77952a2cb3e89805c414d91fca5a28`.
No cell produced terminal UNSAT, DRAT, a production terminal bank, aggregate
coverage, a universal lift, or a live Lean closure.  The retained wave is
documented at
`scratch/rigid221-sourceheavy-anchor/exact12-v14-wave-ec013bfd-mixedv4-i400-c0000-0011-r2/RUN-SUMMARY.md`.
An earlier `r1` launcher attempt created its cell directories before invoking
the fail-closed runner, so every invocation rejected the non-fresh workdir and
wrote no journal; it is inert launch-failure evidence, not a search run.

Post-wave triage of the saved cell-4 survivor found a sixth source-entitled
positive-order predicate.  Five selected rows force one of the two
convex-five-point cores `(a,x,b,c,y) = (2,1,6,8,4)` and
`(2,1,8,7,3)`; the cores split the 48 frozen boundary orders into four groups
of twelve (direct/mirror and forward/reverse).  The checked Lean value
`mixedV4Cell4PositiveNogood` records the source-level contradiction, while the
authenticated Python binding compiles its five row choices to
`(-55, -387, -703, -1605, -1935)` at appended bank index `6`.  This is one
finite learned predicate obtained from the survivor.  It is not a terminal
cell proof, schedule coverage, a universal lift, or a live-sorry closure; a
fresh cell-4 run under the new detector contract is required to measure what
it exposes next.

A replay-seeded continuation of cell `1` subsequently exhausted its structural
portfolio at record `432` and saved a new survivor with SHA-256
`6564ae0b3005354d934d68c14ae15d486c75613ea60b578c58cc3be3b94f656b`.
Exhaustive source-order triage found a strictly smaller seventh predicate: the
single convex-five-point core `(a,x,b,c,y) = (11,0,3,6,2)` covers all 48 frozen
orders, using only the selected rows centered at `0`, `2`, and `6`.  It appears
in forward orientation for all 24 direct orders and reverse orientation for all
24 mirror orders.  The checked Lean value `mixedV4Cell1PositiveNogood` records
this source-level contradiction.  Its authenticated Python binding explicitly
selects that core without changing the legacy certificates and compiles the
three row choices to `(-43, -164, -1171)` at appended bank index `7`.

This is another finite learned predicate, not terminal cell UNSAT, schedule
coverage, a universal lift, or live-sorry closure.  The saved 432-record
cell-1 journal predates the predicate, so it was not accepted directly under
the new detector contract.  Instead, a fail-closed migration authenticated the
complete old chain, changed only its detector and chain metadata, and replayed
every certificate, assignment witness, and learned clause under the committed
current source before atomically publishing a new seed journal.  The production
runner then replayed that complete migrated prefix independently.

At record `432`, exactly at the saved survivor frontier, the new run admitted
`source-order-positive-coverage` with bank index `7` and clause
`(-43,-164,-1171)`.  It then learned nineteen additional duplicate-center cuts
and reached a 452-record `ITERATION_LIMIT`.  The complete current-source journal
replayed successfully; its terminal record hash is
`0bed4a5925784d7fc5b54e3b90274865a6f93e8bcaad2f4d79c7efe833f6e2e9`.
Thus the new cut is now a production search event, but it has not produced a
cell UNSAT or a new structurally unresolved survivor.

The next bounded cell-`1` continuation replayed that 452-record prefix and
learned 89 more checked cuts before reaching `STRUCTURALLY_UNRESOLVED` at
record `541`.  The complete journal replayed successfully.  Its terminal
record hash is
`0c905b8c361d2642ca5e4affae24c63e687bda47c0ae31c39907325f36a66f00`,
and the saved survivor has SHA-256
`e83c1417fb6c4453b70edc7b474513512e8adaf2680e138f8afff5d17e396075`.
Source-order diagnosis found a second three-row predicate, now on centers
`2`, `9`, and `11`: the two swapped common-five cores
`(a,x,b,c,y) = (1,2,10,9,11)` and `(1,11,10,9,2)` cover the two 24-order
halves of the frozen direct/mirror universe.  The checked Lean value
`mixedV4Cell1SecondPositiveNogood` proves the resulting source-level
contradiction.  Its Python binding compiles the selected rows to
`(-160,-2312,-2864)` at appended bank index `8`.

The committed nine-entry bank was then replay-seeded from that authenticated
541-record prefix.  Bank index `8` fired at record `541`; the next 99 learned
cuts were structural metric cores (97 equality-duplicate-center, one
equality-equilateral-bisector-collision, and one
equality-perpendicular-bisector-convex).  The run reached its 641-record bound
with `ITERATION_LIMIT`, no saved survivor, and no terminal UNSAT.  Its journal
has SHA-256
`fc5c9e68985821ee7dc2c9f0d0ff92a5509f645caed43d222db3e06261a17041`
and terminal record hash
`0f0546c70e3780a46f8bba0418d2a3bc85a5d64725c59b728add86b4d9af5588`.
An independent current-source migration replay authenticated all 641 records.
The hardened migrator rejects final and intermediate symlinks, requires working
`O_NOFOLLOW`/directory-descriptor primitives, snapshots the authenticated
source journal and every detector/Lean source into immutable in-memory bytes,
rebuilds the source-order bank from only those bytes, and replays the rewritten
journal against that prebuilt bank without reopening repository source paths.
The ordinary runner likewise snapshots path- or stream-backed journals before
replay, opens the repository sources to build at most one source-order bank per
replay/run, and passes that frozen snapshot to every source-order record.  Each
admission still canonically revalidates the supplied snapshot; this checkpoint
does not claim that the compilation work itself is memoized.  A caller-supplied
bank is accepted only if its complete canonical recompilation agrees, so
recomputing the bank's self-hash after changing an entry, generated Lean
binding, or source manifest does not authenticate the mutation.

Publication remains descriptor-bound and no-overwrite: the migrator binds the
output parent and created file by descriptor and inode, content-binds the
candidate before and during publication, rehashes the destination through the
retained descriptor, verifies the output name/inode and parent identity, and
sets a successful output to mode `0400`.  A failed post-create publication
deliberately leaves an explicit unverified residue rather than risking a raced
unlink.  Every later consumer must still reopen the path without following
symlinks and rehash the returned receipt, because an ordinary path cannot be
made immutable against a malicious same-UID process after return.  The final
focused hardening gate has 34 passing tests, including caller-resealed bank
mutations and a two-source-order-record/one-build assertion; the broad
exact-v14 gate has 77 passing tests plus the generated-Lean test.  This
strengthens the nonterminal replay evidence; it remains neither cell closure
nor universal proof ingress.

A second bounded continuation replayed the 641-record prefix and learned 100
more structural metric cuts: 99 equality-duplicate-center cores and one
equality-equilateral-bisector-collision core.  It reached its 741-record bound
with `ITERATION_LIMIT`, no saved survivor, and no terminal UNSAT.  Its journal
has SHA-256
`a28e02241a7a3dab05b31d2bb1590fb6e47a4e2abce34cf7d676f6040fdd9076`
and terminal record hash
`2f168a02a6147f4457962494d66249db0e062d6bad2203c237fcdbf973dcb6c2`.
The hardened migrator independently replayed all 741 records and reproduced
that journal byte-for-byte.  This migration hardening does not by itself repair
the separate terminal-RUP postprocessor issue described below.

The next bounded continuation replayed the 741-record prefix and learned 50
more checked cuts: 49 equality-duplicate-center cores and one
equality-perpendicular-bisector-convex core.  It reached
`STRUCTURALLY_UNRESOLVED` at record `791`, with no terminal CNF and no terminal
UNSAT proof.  The complete journal has SHA-256
`2f6b613ea0937082dff02a139be48e5e3250c202482118995c5df969fade1267`
and terminal record hash
`cf76307d4a460e3ffb25d3619c07be5d047678814df12e02526c605aa7f7e8fe`;
the survivor has SHA-256
`520774fdbc42d610accfc76d845a945fecb10f410d36ba78d7715434f376822f`.

Source-order diagnosis of that survivor found a third checked three-row
predicate on centers `2`, `6`, and `10`.  The two common-orientation cores
`(1,2,7,6,10)` and `(1,10,7,6,2)` cover the two orderings of labels `6` and
`7`, hence all 48 frozen direct/mirror orders.  The directly elaborated Lean
value `mixedV4Cell1ThirdPositiveNogood` proves the source-level contradiction;
its Python binding compiles to `(-160,-1383,-2548)` at appended bank index `9`.
This is one proved reusable finite cut, not proof that the cell or schedule is
UNSAT.

The real 791-record migration canary was then rerun under the final immutable
input and exact-bank-recompilation rules.  It published 133,536,048 bytes at
mode `0400`, with journal SHA-256
`026f5c4e147ad5717ddb29ceed82d001029ee4e1ea6215a00a3376428431f3b0`
and migrated terminal record hash
`b8f10058945a3e050d9b50267305adbd731cf7b51c4f7e279b4fae6ac8b0cacf`.
All 791 records passed current-source semantic replay from the frozen source
bundle and single prebuilt bank.

In parallel, the replay-seeded cell-`4` continuation reached its new
362-record bound with `ITERATION_LIMIT`.  Its complete journal replayed
successfully and has terminal record hash
`ba1d4617c8bdb80c1f22103f8e04e65601d6e1db8fbd010b7a56f9fbfb9a9e21`.
It exposed neither a saved survivor nor terminal UNSAT, so it is lower priority
than replaying the explicit cell-`1` survivor against bank index `8`.

The next whole-schedule checkpoint authenticated and migrated all twelve
retained journals, comprising 6,896 records, to the then-current 15-cut source
contract.  A bounded continuation allowed at most 100 new classifications per
cell.  Cells `0,3,4,5,6,7,8,9,11` reached their new iteration bounds; cells
`1`, `2`, and `10` instead exposed structurally unresolved survivors at records
951, 523, and 819.  No cell produced terminal UNSAT.

Source-order diagnosis produced one checked finite obstruction for each new
survivor.  `mixedV4Cell1FourthPositiveNogood` uses rows centered at `0`, `2`,
and `6` and compiles to `(-22,-168,-1177)`.
`mixedV4Cell2SecondPositiveNogood` uses rows centered at `1`, `4`, and `5` and
compiles to `(-55,-704,-991)`.  The five-row
`mixedV4Cell10SecondPositiveNogood` compiles to
`(-26,-834,-1200,-2034,-2310)`; its complete 48-order coverage is the union of
two explicitly ordered common-five cores, each covering 24 orders.  Supporting
an authenticated ordered list of preferred cores was necessary to make the
Python replay select exactly the five rows proved contradictory in Lean,
rather than the detector's larger greedy union.  The resulting bank has 18
learned cuts and authenticates 20 Lean sources.  These are three reusable
finite predicates, not terminal cell proofs, schedule coverage, a universal
lift, or live-sorry closure.

The source-order bank is append-only because its numeric entry indices are
authenticated certificate data in retained journals.  The original fifteen
cuts therefore remain at indices `0` through `14`; the three new cuts are
appended at indices `15`, `16`, and `17`.  Journal migration re-chains and
replays records under the current detector contract but deliberately does not
reinterpret or remap an existing certificate's bank index.

An independent promotion audit found one remaining postprocessor hardening
task: detector files are copied and hash-checked into the staged source, but the
second semantic replay still loads the live repository paths.  No terminal
artifact may be promoted until that validation-to-replay TOCTOU is removed or
the live bytes are otherwise proved identical to the authenticated snapshots
throughout replay.  This does not invalidate retained nonterminal journals or
prevent a fresh search wave; it blocks only terminal publication through the
current postprocessor.

Resolution (2026-08-13): the postprocessor semantic replay no longer opens
repository paths.  In both replay rounds it now builds the proof-backed
source-order bank twice — once from the live tree and once from an immutable
in-memory snapshot of every source named by the authenticated detector
contract and the frozen bank source manifests — requires canonical equality,
and passes the snapshot bank with an explicitly absent repository root into
`replay_journal`, so any replay code path that attempts a live source read
fails closed.  The snapshot bytes are verified against the authenticated
manifests immediately before each replay and reattested after it completes,
so a concurrent source edit during either replay round aborts publication
instead of silently changing replay semantics.  Two regression tests cover
the no-repository replay wiring and the mid-replay drift abort.  Remaining
trust boundary, stated exactly: the exact-12 Python modules are still imported
once from the live tree, with byte attestation covering only the files the
detector contract names; the schedule and bound-job materialization is
validated at time of use by the authenticated job's exact DIMACS digest; and
a same-UID process that mutates and exactly restores a source inside one
attestation window remains outside this defense, as already conceded for the
journal migrator.  This resolves the promotion blocker recorded above.  It
produces no terminal artifact by itself.

The next production target is therefore:

1. land the three new checked source-order predicates, their exact Python
   bindings, and the 18-cut/20-source authenticated-bank replay tests;
2. migrate the latest twelve journals from the 15-cut contract to the committed
   18-cut contract, replay every retained record independently, and continue
   all twelve cells in bounded tranches under the authorized 12-core limit;
3. classify every newly exposed survivor before increasing that cell's bound,
   and prioritize preservation and checking of any terminal UNSAT artifact;
4. inspect iteration-limit tails only for recurring generalized predicates
   with a source-level Lean entitlement, rather than mining exact-assignment
   blockers;
5. if a cell reaches `UNSAT_DRAT_VERIFIED`, run the standalone bank
   materializer and generate the exact compact-RUP and DIMACS equality inputs
   required to obtain a checked `DimacsUnsatisfiable` theorem for that exact
   full terminal formula (the previously prerequisite terminal postprocessor
   TOCTOU hardening landed 2026-08-13; see the resolution paragraph above);
6. extend successful terminal production to every required cell in the frozen
   648-coordinate schedule;
7. choose the scalable all-cell serialization/equality form—generated per-cell
   checks or a schedule-parametric authenticated checker—without embedding 648
   redundant 1,280-clause lists unnecessarily;
8. aggregate immutable terminal records while rejecting missing, duplicated,
   nonterminal, or unverified cells; and
9. aggregate the per-cell terminal consumers and connect their schedule
   coverage to the two live exact-twelve residual leaves.

The historical eight-placement schedule swapped frozen named roles and remains
only a search heuristic.  No terminal exact-twelve UNSAT certificate,
aggregate 648-cell coverage theorem, or live-leaf closure currently exists.
