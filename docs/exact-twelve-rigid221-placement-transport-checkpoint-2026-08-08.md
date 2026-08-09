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
dispatcher over that binding.  It freshly rebuilds and authenticates the
complete theorem-backed source-order bank, recompiles every stored certificate,
and admits the lowest-index bank clause whose recorded selected-row choices are
all selected by the current assignment.  This is deliberately broader than
exact-cube equality: the Lean `SourceOrderPositiveNogood` consumer depends only
on positive matching of the recorded rows.  If no bank clause matches, the
dispatcher falls back to the existing order-independent structural metric
detector and independent certificate replay.  Every admitted cut is recompiled
to the exact selected-row variables and written to an append-only hash chain
bound to the cell job and the semantic detector contract.  The v4 journal tags
the certificate family, schema, and detector stage, records the deterministic
source-order bank index or `null` for structural cuts, and stores the canonical
cube and complete positive SAT assignment.  Replay rebuilds the current bank,
requires the same lowest matching index and exact stored certificate, and then
checks the cube, assignment, learned clause, cut falsification, and exact
family-specific proof.  Legacy v2 and tagged-v3 journals are rejected rather
than silently migrated.  The retained earlier waves remain historical
nonterminal diagnostics; a fresh v4 wave is required for promotion.

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

An independent promotion audit found one remaining postprocessor hardening
task: detector files are copied and hash-checked into the staged source, but the
second semantic replay still loads the live repository paths.  No terminal
artifact may be promoted until that validation-to-replay TOCTOU is removed or
the live bytes are otherwise proved identical to the authenticated snapshots
throughout replay.  This does not invalidate retained nonterminal journals or
prevent a fresh search wave; it blocks only terminal publication through the
current postprocessor.

The next production target is therefore:

1. rerun the affected cells under the expanded proof-backed source-order bank
   and the mixed-v4 positive-match adapter, extending cell 8 beyond the
   canary's 140-record frontier;
2. retain the tagged-v3 journals as read-only mining evidence, but do not splice
   them into the new detector hash chain; start fresh authenticated v4 journals
   under the new contract;
3. if a cell reaches `UNSAT_DRAT_VERIFIED`, run the landed postprocessor and
   standalone bank materializer, then generate the exact compact-RUP and DIMACS
   equality inputs required to obtain a checked
   `DimacsUnsatisfiable` theorem for that exact full terminal formula;
4. extend successful terminal production to every required cell in the frozen
   648-coordinate schedule;
5. choose the scalable all-cell serialization/equality form—generated per-cell
   checks or a schedule-parametric authenticated checker—without embedding 648
   redundant 1,280-clause lists unnecessarily;
6. aggregate immutable terminal records while rejecting missing, duplicated,
   nonterminal, or unverified cells; and
7. aggregate the per-cell terminal consumers and connect their schedule
   coverage to the two live exact-twelve residual leaves.

The historical eight-placement schedule swapped frozen named roles and remains
only a search heuristic.  No terminal exact-twelve UNSAT certificate,
aggregate 648-cell coverage theorem, or live-leaf closure currently exists.
