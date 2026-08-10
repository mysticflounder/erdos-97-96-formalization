# P97 CEGAR process audit — 2026-07-25 through 2026-08-08

Status: process and control-plane audit; not a theorem-closure claim.

## Executive result

The recurring failures were not primarily solver weakness. They were boundary
failures: an artifact was resumed under the wrong state, detached from the
source surface that gave it meaning, promoted beyond its evidence class, or
lost when a request was retried. The highest-leverage remedy is therefore an
authenticated end-to-end lifecycle around each mining wave, followed by a
consumer-first promotion gate.

The repository now has most of that control plane:

- `p97-cegar-wave/v1` binds source, encoding, execution, and intended
  producer/lift/consumer ownership;
- `phase3_piqd_driver.py` journals every piqd lifecycle event before retry or
  return, archives exact response bytes, independently replays available
  CaDiCaL LRAT in Lean, and seals the journal;
- the v3 resume gate treats `CHECKPOINT` idempotently and refuses v2/v3 output
  mixing; and
- `phase3_piqd_campaign.py` enforces the authenticated three-cell stop/pivot
  policy and recomputes each source receipt and classifier from one no-follow
  byte snapshot; and
- the productivity miner distinguishes local certificates, universal
  producers, and lifted consumers.

This reduces repeated operational failure and closes the independent finite
LRAT replay gate for CaDiCaL jobs with a proof artifact. It does not fill the
current mathematical producer gaps, provide a general-cardinality lift, or
close a live Lean consumer.

## Scope and evidence

The review covered commits and P97 CEGAR artifacts from 2026-07-25 through
2026-08-08, with particular attention to:

- the Phase-3 core and admission audits landed on 2026-07-28;
- the frontier/CEGAR checkpoint `25271543` on 2026-08-03;
- the Phase-3 journal, cache, portfolio, productivity, and projected-static v3
  work in `942ba577` on 2026-08-04;
- the idempotent-resume correction `6da139bf` on 2026-08-04;
- the case-split promotion audit dated 2026-08-06; and
- the fail-closed wave contract `d3617845` and piqd integration work on
  2026-08-07/08.

Finite solver results and successful builds are classified here as empirical
or local evidence unless a named universal producer, lift, and live consumer
are all present.

## Common failure patterns and remedies

| Pattern | Evidence from the period | Consequence | Remedy and current status |
| --- | --- | --- | --- |
| Under/over-guarded encodings | The A-CORE audit had to forbid unsupported omitted hypotheses and require implying-hypothesis tags (`dc2e7d65`). DEL3 exposed a call-order/scope trap with orphan auxiliary IDs (`9e8ed3d5`). The mixed-law robustness probe skipped the `n=5` obligation and falsely returned SAT before correction. | Exact CNF bytes could faithfully encode the wrong mathematical contract. | Give every source clause a provenance tag and exact scope/domain; add positive and negative semantic smoke tests; replay the extracted model against the source predicates. piqd can bind the resulting bytes but cannot detect an omitted hypothesis or bad guard. |
| Relaxation confused with geometry | The rigid-base full metric gate was `UNKNOWN`, while a weaker K4 abstract-distance surface was SAT (`e5001be2`). Its Kalmanson and triangle constraints are necessary but not sufficient for planar realization. | A model of a relaxation could be reported as a geometric counterexample, while a timeout could be reported as evidence. | Name the exact encoded surface in every result. Keep structural SAT, metric SAT, metric unknown, and Euclidean/Lean proof separate; `UNKNOWN` proves nothing. Add a realizability or source-level bridge before consumption. |
| Resume-state drift | The first projected-static v3 replay omitted `CHECKPOINT` from the completed-state set, so `--resume` ran the solver again and appended two raw-SAT records. | A nominal replay mutated the run and changed its evidence history. | Fixed in `6da139bf`; regression coverage requires no solver call and no new manifest generation. Keep resume acceptance explicit per terminal/checkpoint state and compare canonical output bytes. |
| Schema/provenance mixing | The v3 migration found v2 learned streams incompatible with v3; exact-six candidates imported a retired off-spine module and did not match the live Rigid221 hypotheses. | Stale artifacts looked reusable but had no valid route into the current consumer. | Fresh output roots per schema; authenticated prefix ingress; wave hashes for Lean leaf, ingress hypotheses, CNF, variable map, order, backend, and profile; proof-blueprint anchor on the live consumer. |
| Mutable detector contract imported across stages | Expanding the repository-wide exact12 detector from the equality-only contract to a tagged multi-stage contract made a preserved v2 equality classifier fail validation even though its embedded source snapshot and certificate had not changed. | An unrelated later detector stage could retroactively invalidate an authenticated historical artifact, or tempt callers to waive validation. | Pin a versioned contract string and complete source-file closure in the classifier stage itself. All derivation, hash, manifest, and validation paths now use those pins; a regression monkeypatches a future global expansion and revalidates the classifier. This was P97 adapter/contract coupling, not a piqd daemon bug. |
| Orphaned producer snapshots | The first exact12 normalized-v14 cell-0 candidate named three producer-source hashes that no longer matched the worktree, and those exact bytes were absent from Git history. Regeneration from current source reproduced the same CNF and source-replayed model, but that empirical agreement cannot repair the old artifact's custody gap. | A source-faithful artifact can become unverifiable even when its DIMACS bytes remain stable; silently accepting current sources would sever the claimed source-to-CNF contract. | Reject the stale package. Archive a content-addressed producer-source bundle when each job is generated, bind every listed path, byte count, and digest into the package, and regenerate plus replay after drift rather than waiving it. This is a P97 artifact-lifecycle defect, not a piqd daemon bug. |
| Evidence-class collapse | Bounded UNSAT, learned clauses, exact-rational realizations, solver logs, and successful builds repeatedly risked being read as universal closure. | Local computation could be promoted past missing proof replay, lift, or consumer bridges. | Frozen outcome taxonomy and fail-closed publication assessment. piqd UNSAT remains `DISCOVERY_UNSAT` until proof bytes, independent checker, and replay receipt exist; even `CERTIFIED_UNSAT` remains only a publication candidate. |
| Retry history loss | A successful retry could previously obscure the request that timed out or failed. The confirmed piqd identical-prepare race returns a transient HTTP 500 to one concurrent caller. | Operational failure rates and oracle ambiguity became invisible; a later success appeared cleaner than the actual run. | Append the structured failure event and fsync the hash-chained attempt before every bounded retry. Stop immediately on uncertain journal durability. A successful re-prepare never replaces the earlier failure. |
| Terminal-state conflation | piqd reports solver timeout as `completed/UNKNOWN`, while daemon failures use lifecycle `failed` (often with result `UNKNOWN`). Poll exhaustion is a third condition. | Different remedies and reliability signals were collapsed into one vague unknown. | Preserve `SOLVER_UNKNOWN`, `DAEMON_FAILED`, and `POLL_TIMEOUT` in `p97-cegar-piqd-event/v1`. The frozen outer vocabulary uses `ERROR` for all three; `METRIC_UNKNOWN` is reserved for metric validation. |
| Case-split policy too coarse | The 2026-08-06 audit found useful source-clean dichotomies rejected merely for being splits, while other attractive branches lacked a decreasing measure or live residual. | Productive narrowing was discarded, but unproductive branch proliferation remained possible. | Admit a split only when every branch reaches a named consumer/residual or strictly decreases a cardinality, radius, or blocker-fiber measure. Record the measure and next consumer in the candidate contract. |
| Producer/consumer mismatch | Exact-six material was provenance-blocked; first-fiber infrastructure existed but lacked a FreshThird bridge; the false rational-octagon incidence producer was refuted. | Theorem-bank volume did not translate into proof-spine progress. | Search the theorem bank and live consumers first. Require exact theorem provenance plus the first missing adapter. Keep refuted shapes as negative tests so miners do not rediscover them. |
| Artifact volume mistaken for productivity | The retained-omission bank contained roughly 66,411 artifacts but only 64 substantive reports; raw SAT payloads and generated duplicates were not independent producers. | Storage and mining throughput overstated mathematical progress. | Rank unique consumer-addressable statements, not artifact count. Deduplicate by authenticated content and statement shape; park candidates without replayable finite consumers or universal Lean producers as `PARKED-SPEC`. |
| Cache/checkpoint authority inversion | Prefix checkpoints and warm caches improve scan time but cannot prove semantic equivalence or terminality. | Fast-path state could silently become the publication authority. | Authenticate raw prefix bytes and order digests, but require full semantic replay and independently checked identities at promotion boundaries. Source replay remains authoritative. |
| Synthetic verifier authority leak | The mixed-bank integration canary injected fake solver and `drat-trim` callbacks yet emitted the same `UNSAT_DRAT_VERIFIED` status as a live independently checked run. Its six-byte proof fails real `drat-trim` with `s NOT VERIFIED`. | A useful schema/code-generation fixture could be mistaken for terminal mathematical evidence. | Give synthetic runs a distinct schema and status namespace, record `evidence_class = synthetic_fixture`, forbid publication consumers from accepting it, and add a regression that rechecks every purported live proof with the real verifier executable. |
| Detector monoculture and source-order starvation | The fresh real 12-cell mixed-v3 wave `cb329a7e` learned 3,875 cuts: 3,777 (97.5%) were duplicate-center cuts, while the frozen source-order stage admitted zero. Five cells became `STRUCTURALLY_UNRESOLVED`; the other seven exhausted 400 iterations. | Larger iteration budgets mostly rediscover one local obstruction family and do not manufacture the missing source entitlement or terminal proof. | Treat repeated duplicate-center hits as a pivot signal. Deduplicate authenticated PIQD cuts at ingress, census the unresolved survivors by missing source predicate, and spend the next detector budget on source-faithful producer stages. Require a new semantic family or a smaller documented survivor frontier before extending iteration limits. |
| Backend/profile semantic drift | The audit found that raw job identities could name unsupported profiles. The piqd maintainer also corrected an operational misconception: an empty CaDiCaL profile intentionally selects `--sat`, while literal `default` selects CaDiCaL's default. | Unsupported names could detach identity from execution, while an omitted profile can silently bias an UNSAT-heavy run toward SAT discovery. | `PIQD-RAW-002` is fixed in piqd and P97 still rejects unsupported pairs. Wave manifests must spell `default` explicitly when intended; empty and `default` remain distinct valid identities. |
| Weak stop/pivot criteria | After the mixed-law robustness repair, the field closed `n=10` but remained SAT at `n=11` through `n=15`; a class-size cap still left `n=15` SAT (`0d76b444`). | Additional syntactic cuts could consume waves without addressing the missing semantic field, coupling, or producer. | Define a pivot condition before launch: repeated source-faithful SAT survivors with the same missing invariant stop that family and create a named semantic-producer task. The exact12 campaign controller now enforces that rule for one ordered, sequential three-cell canary and rejects post-pivot overrun. General scheduling and coverage remain open. piqd can measure and preserve no-progress, but it cannot choose the mathematical pivot. |

## How piqd helps

piqd is valuable as a persistent static-oracle layer:

1. It gives exact raw-DIMACS inputs a stable content identity and separates
   prepare from execution.
2. It persists job state across the client process and exposes status, stored
   CNF, SAT model, proof/log artifacts, and bounded solver execution.
3. It supports central scheduling and deduplication when many CEGAR workers
   submit the same structural query.
4. The P97 adapter can re-read the stored CNF, independently check SAT models,
   fetch exact paginated logs and compact LRAT, replay CaDiCaL LRAT in Lean,
   and attach all bytes and the replay receipt to an authenticated wave.

That makes piqd a good replacement for ad hoc subprocess custody in the static
structural SAT/UNSAT part of a wave. It is not the CEGAR authority:

`phase3_piqd_package.py` now supplies the previously missing fail-closed bridge
for exact12 normalized-v14 cells. It authenticates the DIMACS dimensions and
bytes, current source-to-CNF files, compiler and clause-delta manifests, Lean
ingress files, cell/order identity, and an honest partial variable map. The map
names only the blocker variables exposed by the compiler and classifies every
other allocator range as opaque. The package also archives a content-addressed
bundle of the exact source bytes, so those bytes remain available for later
reconstruction if the worktree drifts. The current source-semantic replay still
rebuilds from the live worktree and requires it to match the packaged CNF.

- piqd stores a job identity, not the ordered sequence of P97 attempts and
  refinements;
- a raw job cannot currently be reset or requeued after `UNKNOWN` or `failed`;
- piqd does not independently replay DRAT/LRAT or issue the P97 hash receipt;
- piqd does not know the Lean ingress, universal lift, or live consumer; and
- the remaining concurrent-prepare race is on the encoder endpoint; the P97
  raw-CNF lane is unaffected.

The correct composition is therefore:

```text
live Lean consumer + ingress hash
              |
        P97 wave manifest
              |
   append-only attempt journal <---- CEGAR refinement decisions
              |
       piqd static oracle
              |
 model check / proof check / replay
              |
      producer + lift + consumer gate
```

## Recommended operating policy

1. Start every wave from the exact live consumer and create the immutable wave
   manifest before invoking a solver.
2. Use fresh output roots when an encoding or journal schema changes. Never
   resume across schema generations.
3. Journal an attempt before retrying; bound every retry/poll loop; retain
   solver unknown, daemon failure, and poll timeout as distinct reasons.
4. Use piqd for static job persistence and artifact retrieval, then perform
   independent model/proof checking outside the daemon. Keep missing proofs at
   `DISCOVERY_UNSAT` and rejected replay at `ERROR`.
5. Mine only from authenticated, semantically replayed journal prefixes.
6. Promote only a candidate that names its source theorem, universal producer,
   optional lift, and direct live consumer. Otherwise classify it as local,
   diagnostic, refuted, or parked.
7. At each checkpoint, query the indexed theorem bank and update the
   proof-blueprint anchor before launching another mining family.
8. Track piqd daemon defects separately in
   `docs/audits/piqd-integration-bugs-2026-08-07.md`; do not disguise missing
   P97 contracts as piqd bugs.

## Remaining gates

- Fix and reproduce `PIQD-ENC-001` on the encoder endpoint. The raw-CNF sibling,
  raw profile validation, SMT model reachability, and `drat-trim` verdict gate
  are fixed in the installed piqd release.
- Keep the now-implemented three-cell campaign controller fail closed. It
  enforces the ordered cell set, repeated-survivor key, threshold, and terminal
  pivot; it does not authorize distributed scheduling or establish coverage.
- Supply the remaining exact12 source selection theorem before consuming the
  PIQD classifier: for every `choice` in the five-row record, prove
  `RowChoiceSelectedByCoverIndex row choice`, or equivalently prove the recorded
  learned clause evaluates to false. The typed ingress and duplicate-center
  checker are present, but the live source hypotheses do not yet provide those
  five arbitrary positive row memberships.
- Keep independent replay mandatory even after the `PIQD-PROOF-001` fix; piqd
  remains the proof-artifact producer, not the publication authority.
- Decide whether piqd should expose a new raw-job requeue identity for terminal
  `UNKNOWN`/`failed`; current same-identity re-prepare cannot retry execution.
- If job-lane origin custody becomes a publication requirement, add daemon and
  solver identity fields to each PIQD job/result record. The current session
  lane binds solver identity, but job-lane `GET /version` and `GET /solvers`
  identities are only out-of-band observations; adapters must therefore keep
  `piqd_daemon_origin_custody = false` even when local package and driver
  custody validate.
- Continue the mathematical work at the named FreshThird/Rigid221 producer and
  adapter gaps. The control plane can prevent false progress, but it cannot
  synthesize those missing universal theorems.

## Verification

Focused control-plane verification at this checkpoint:

```bash
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_cegar_wave.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_driver.py \
  census/p97_search/tests/test_phase3_cegar_runtime.py \
  census/p97_search/tests/test_phase3_journal_checkpoint.py \
  census/p97_search/tests/test_phase3_productivity.py \
  census/p97_search/tests/test_phase3_productivity_integration.py
```

Result on 2026-08-08: 95 tests passed. This verifies the audited control-plane
contracts only; it does not audit transitive Lean axioms or close Problem 97.

After adding independent replay, the complete Phase 3 regression run reported
421 tests and 2 subtests passed. The focused replay matrix includes a real
known-UNSAT Lean acceptance, wrong-CNF rejection, tampered-LRAT rejection,
missing-proof downgrade, hash binding, and failed-replay non-certification.
Post-review hardening added direct job-CNF binding and strict replay-receipt
validation, exact checker reconstruction, and a concrete-replayer-only
certification gate. The replay command is now the non-configurable tuple
`lake env lean`. Its focused oracle/driver/replay matrix reported 56 tests
passed, including rejection of malformed and internally consistent forged
successful replay results and rejection of command substitution.

The daemon was then started on `127.0.0.1:7272`; `piqc version` identified piqd
`0.1.0` at binary SHA-256
`476585dd8e11c93dd1d03c5ec9d4b9e52735eae9fdda0895f60508f7d20ea865`,
and `piqc solvers` reported two usable CaDiCaL workers. Live job
`3c1d3805-71b5-486f-aafc-81bd0ba2a407` submitted a synthetic two-clause
contradictory-unit CNF, downloaded piqd's compact LRAT, and passed independent
pinned Lean replay. The driver emitted finite `CERTIFIED_UNSAT`; its 24-record
journal seal is
`f2853d9ecb9c63697791cf8e6e506695814c5a29ecac01f13675686933848010`,
and its terminal attempt is
`cd59472247fa266b6febde8517e2f462cd58b54d734997ef1fbccb78fa3751bc`.
This closes the live integration smoke only. It is not evidence for a P97
producer, lift, consumer, or transitive `sorryAx`-free theorem.

The first source-bound P97 wave then exercised exact12 normalized-v14 cell 0.
After adversarial review and hardening, the combined `test_phase3_piqd*.py`
matrix reported 88 tests passed; Ruff check and format verification passed for
the package and source-replay modules and their tests. The final adapters
reject symlink/non-regular artifact paths, use durable atomic writes, keep the
daemon UUID distinct from the stable source-job ID, and reject nonzero wave
iterations until a parent checkpoint artifact can be authenticated rather than
accepting a caller-supplied lineage digest.
The fail-closed package bound a 42,710-variable, 369,355-clause DIMACS file at
SHA-256
`cfc268f2915ff31e1af24a66a036e41e81f93aca0967e88c1b4a4158eb67a379`,
the exact ingress contract at
`b2b959820c0cf6a87efa178e754c4f348a49302471e42dbf9af0740cbaac2321`,
and an eight-file source bundle at
`51bf83555104a9045bdcdaf5b04c4980bc722fec7c149477fdbca84ca2a146b1`.
The manifest explicitly classifies the upstream blocked-job input as
`UPSTREAM_DIGEST_ONLY_NOT_ARCHIVED_OR_REPLAYED` and the variable map as partial
rather than claiming unavailable provenance or allocator coverage.

Live piqd job `cc4054b6-6e73-4bb6-9c09-ed4814f07c93` returned a total SAT model
with 31,257 positive literals. The P97 driver classified it
`STRUCTURAL_SAT`; the six-record journal seal is
`b12abbcc8c5bfca4c38cfc45006109b35cdeaf8c14017231502ff1cad186d8c8`,
and the terminal record is
`70f85cac9ee50ac5a9da99f59a449fd5d155aea7d7adb97372976a1db21b974c`.
Independent source-semantic replay rebuilt the identical CNF, checked the full
assignment against every clause, decoded the exact source model and blockers,
and accepted both the source-faithful candidate predicate and the added
constraints. Its canonical receipt is
`80dbbd70a6542d81248d2f85277c4bb5af296d8af23a30f95031e093c4182914`.
This establishes one authenticated finite survivor only: no 648-cell aggregate
coverage, terminal obstruction, producer theorem, universal lift, live Lean
consumer, or `sorry` closure follows.

## Bounded three-cell piqd custody canary and stop/pivot

Before launching more jobs, the project conversation recorded a deterministic
canary over normalized-v14 cells 0, 1, and 2, with a threshold of three
authenticated structural SAT survivors in the same diagnostic failure family.
Eligibility required a piqd `STRUCTURAL_SAT` terminal result and independent
source-semantic replay of the total assignment, exact CNF, current source
rebuild, source candidate, blockers, and added constraints. The three eligible
results were:

| Cell | piqd job | Replay receipt SHA-256 | Decoded cube SHA-256 |
| ---: | --- | --- | --- |
| 0 | `cc4054b6-6e73-4bb6-9c09-ed4814f07c93` | `80dbbd70a6542d81248d2f85277c4bb5af296d8af23a30f95031e093c4182914` | `27b80fc03f2161a2feb4644aedad76684f78e3f15a22a6aef53798f7f850d693` |
| 1 | `17287981-8e74-4fe1-9fe8-251433f6aab1` | `cc378a62c7eea0d011af6e0947d2842ca7855f975bdf28e3ec00f43cbba4b9f2` | `b4481f9ba7c112b70b25c9b9c2779d2c19acd5cbc1c9e098f702a54c0a58d658` |
| 2 | `819d6242-cd27-40ec-848c-d8593625039b` | `0eca4c86596e558702139af820695e9c5b8fcfbfd5725b1d876f894f403a8d71` | `ad1e6eeac2e537e0e841efd5b9e7bf189aa1fbbc84fbfca6807acbb88c23d8f2` |

All three packages bind the same eight-file source bundle at
`51bf83555104a9045bdcdaf5b04c4980bc722fec7c149477fdbca84ca2a146b1`.
A post-hoc run of the current detector manifest
`3a0c79449acb5373c42bf36f3d40e78ef8b83e2a028112018c16c78f0ac21b48`
classified all three models as `equality-duplicate-center`. The certificate,
cube, and blocker hashes differ, so these are three distinct survivors, not
one deduplicated model. The shared detector stage is used only as the
predeclared operational no-progress signal; the live piqd journals do not bind
that later detector invocation.

The threshold therefore fired: stop this static cell-sampling family and pivot
before spending more solver time. A separate exact12 refinement campaign had
already accumulated 4,468 replayed cuts without an UNSAT terminal or live Lean
closure, reinforcing the same decision. The prescribed work was, in order:

1. make certificate detection source-faithful by either proving ambient-fiber
   completeness or removing the unjustified `exact=True` interpretation of
   selected four-point supports;
2. bind the detector contract and certificate to the authenticated attempt,
   and dispatch each detector stage only to a matching Lean consumer rather
   than sending mixed stages to the duplicate-center consumer;
3. replay the missing Fin-12 ordered predicate, including its order witness,
   against the source semantics; and
4. implement the documented campaign-controller gap so the ordered cell set,
   eligibility gates, repetition key, threshold, and pivot reason are enforced
   by a durable manifest rather than conversation discipline.

The controller item is complete. The source-derived classifier described
below also closes item 1 for the equality-duplicate-center stage and closes
the artifact-binding half of item 2. Its typed Lean ingress now maps the exact
classifier to the pre-existing checked `record0`; the remaining half of item 2
is source entitlement or exact terminal-bank consumption, not certificate
checking. The separate ordered Fin-12 replay in item 3 remains its own lane.

Cells 1 and 2 also retain
`UPSTREAM_DIGEST_ONLY_NOT_ARCHIVED_OR_REPLAYED` for the blocked-job input.
Their current source rebuild succeeds, but that does not recover historical
upstream custody. These findings are P97 integration and promotion-boundary
defects, not piqd daemon bugs. They do not establish aggregate coverage, a
terminal obstruction, a universal producer or lift, a live consumer, or any
`sorry` closure.

## Durable campaign-controller remedy

The bounded canary is now executable policy rather than conversation-only
discipline. `phase3_piqd_campaign.py` implements the frozen
`p97-cegar-campaign/v2` contract for a dense ordered cell list, one
predeclared source-derived repetition key, threshold three, and at most one
cell in flight. Under an exclusive campaign lock it authenticates the package,
wave, archived source bundle, sealed driver journal, terminal SAT checkpoint,
model, source-semantic receipt, and source-derived classifier before appending
a hash-chained record. Three consecutive eligible records produce a canonical
`PIVOT_REQUIRED` result; later admissions fail closed. Legacy v1 campaign,
record, result, and source-classifier artifacts are rejected with an explicit
regeneration error.

An adversarial review found and then closed custody and restart gaps in the
first implementation: relabelled cells, package cross-binding omissions,
unsealed or symlinked inputs, threshold overrun, divergent concurrent writers,
and a final time-of-check/time-of-use gap in fresh source replay. The replay
core now accepts immutable authenticated byte snapshots while retaining the
original paths only as canonical identity labels. The public path API and CLI
delegate to that same core. Campaign admission snapshots the source job, CNF,
and model once with no-follow reads and never reopens them during replay;
mutation or deletion after admission therefore cannot change the accepted
bytes. The classifier also snapshots each declared detector source exactly
once through component-wise no-follow regular-file opens and embeds the full
base64 source bundle. This proves custody of the resident source snapshot, not
that the already-imported Python interpreter executed those exact bytes; the
artifact records `executed_byte_provenance = false`. Malformed receipt hashes
and noncanonical JSON are campaign errors, not uncaught exceptions or
permissive fallbacks.

The final-code canary is preserved at
`scratch/p97-piqd-source-classifier-canary-2026-08-08-v2/`. Its canonical
campaign SHA-256 is
`3459f294aca7ad1ffb91d3d3d877fc0ef9cb913a61e289bd590c44cc650596d9`,
the final campaign record is
`3f8d8665503d678055e09234c5222cf397b9afb6579300ba84664b086e3b7c8b`,
and the canonical result is
`10d7b93ed818139d15444e6e6100a4e5b56fd8606ca8a6b88d901ecb3da599dc`.
The result is `PIVOT_REQUIRED` for ordinals 0 through 2 with pivot
`repair-lean-duplicate-center-consumer`. Re-admitting ordinal 2 left the state
and result
files byte-identical at, respectively,
`1f144cc2b9f1181b73b78484921475436468608ef2b6e3f0cdef5da5c9a8a2c9`
and
`ecd01de7a0b96c1e9b78606c195b3fab18cacfa33c88ef2cad9c816961a71e95`.
After the stage-local contract correction and typed-ingress addition, the
complete `test_phase3_piqd*.py` integration suite has 161 passing tests.

This closes the narrow stop/pivot-enforcement and artifact-custody gap for the
three-cell canary. It does **not** prove the classifier's mathematical
equivalence to a missing invariant, authorize parallel or distributed
scheduling, establish aggregate cell coverage, supply end-to-end source
entitlement to a Lean consumer, or close a theorem.
The result records
`aggregate_coverage = false`, `universal_lift = false`, and
`lean_theorem_closure = false`. No new piqd daemon bug was found during this
work.

## Source-derived duplicate-center classifier

A follow-up audit corrected an initially misleading diagnosis of the live
cell-0 evidence. The replay receipt and the structural classifier had not
described different or stale cubes: one path hashed an integer-keyed Python
mapping while the other explicitly normalized the same variable identifiers
to JSON string keys. Those representations serialize to the same canonical
JSON object. The defect was instead contractual: campaign admission trusted a
self-declared diagnostic classifier rather than deriving the classification
from the authenticated source job, discovery CNF, model, and archived source
bundle.

The narrow admissible stage is now `equality-duplicate-center`. It replays the
authenticated exact12 bytes, retains one canonical decoded cube, derives and
independently validates a duplicate-center certificate from selected positive
support, and records every metric row with `exact = false`. This is deliberate:
the certificate only needs the displayed support as a subset, so it does not
claim that the four selected points exhaust an ambient geometric fiber. The
classifier binds the complete cube and certificate, the learned clause, the
detector contract, the raw input hashes, and a detector-source snapshot
manifest. Campaign admission independently recomputes both the replay receipt
and classifier from its no-follow byte snapshots and requires canonical byte
equality with both submitted artifacts. A learned clause is admissible only
when each negated variable is positive in the replayed witness.

This remedy remains finite and local. The cardinality-generic checked endpoint
is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.DuplicateCenterNogood.not_realizes_of_positiveCheck`,
not the older Fin-10 Phase-3 checker. A generated exact12 module now constructs
the typed `DuplicateCenterNogood (Fin 12)`, proves its check by kernel
computation, proves it equals the pre-existing
`ExactTwelveV14DuplicateCenterCanary.record0`, and computes the same learned
clause `[-6, -55, -155, -175, -525]`. The classifier hash and input hashes in
that module are metadata rather than kernel authentication. The logical
duplicate-center obstruction and its conditional source consumers predated
this adapter; its new value is the explicit mapping from the authenticated
PIQD artifact into the existing typed record.

The remaining live bridge is source selection, not certificate checking. A
consumer still needs either
`∀ choice ∈ record0.choices, RowChoiceSelectedByCoverIndex row choice` or the
equivalent proof that `evalClauseD` makes the recorded learned clause false.
The current source ingress supplies safe/canonical rows and partial roles, but
not all five of those positive memberships. The generated module remains
off-spine and continues to deny executed-byte provenance, aggregate coverage,
universal lift, and Lean theorem closure. The ordered Fin-12 stage remains a
separate lane. None of these adapter findings is a piqd daemon bug.

For clean-checkout reproducibility, the exact 486,333-byte validated classifier
is committed as the lossless 68,592-byte fixture
`census/p97_search/tests/fixtures/p97_source_duplicate_center_classifier_0000.v2.json.xz`.
Its compressed SHA-256 is
`12ffe7ffb88b970f5d2c99cb7b741748e7feb123141597b3420b544036f28f5f`;
its decompressed-byte SHA-256 is
`b070d150237ebd135c365d27beeea8f1fb087ff27806298442969a1882c2d264`;
and its canonical JSON SHA-256 is
`f183e53818371bcb4b060ed981301e67db0b51d9fc7ed9072571f05fefb30c91`.
The emitter accepts raw JSON or one bounded xz stream, rejects trailing or
concatenated streams and decoded input above 2 MiB, revalidates the full v2
contract, and regenerates the checked-in Lean file byte for byte. A targeted
`proof-blueprint spine` audit reports the generated
`not_realizes_of_positiveMatches` theorem source-clean at 0 open nodes out of
36; this is a local conditional theorem and does not make the unimported module
a live consumer.

## Consumer-first reachability and terminal-promotion remedy

A consumer-first follow-up found no current theorem-bank producer for either
form of the remaining source-selection input. The generated PIQD module proves
only certificate validity, equality with `record0`, and the learned clause. Its
five selected-row variables are

| Center | Learned literal |
| ---: | ---: |
| 0 | `-6` |
| 1 | `-55` |
| 2 | `-155` |
| 3 | `-175` |
| 4 | `-525` |

Those literals were false under the captured finite PIQD assignment. That does
not prove that an arbitrary source-facing `RowPattern` selects the same five
supports. Neither the production `FrontierLiveClosure` import path nor any live
consumer currently imports the generated PIQD module or the exact-twelve
canary. Importing them without a new premise producer would therefore be dead
wiring, not promotion.

There is, however, a narrower certificate route that does not require a new
universal five-row membership theorem. The existing
`SourceOrderTerminalBankConsumer.false_of_terminalSourceOrderPositiveBank`
starts from an exact full-bank `DimacsUnsatisfiable` proof. If the canonical
source assignment falsifies one learned clause, that consumer derives the
corresponding `selectedByCoverIndex` facts internally and invokes the stored
semantic obstruction. `TerminalRupIngress` already transfers a checked compact
RUP replay with exact signed-DIMACS equality into this consumer.

The missing producer on that route is a checked terminal certificate for the
*complete mixed bank*, not another duplicate-center checker. The authenticated
source-order bank currently records `terminal_unsat = false`, and the live
tagged CEGAR run remains `ITERATION_LIMIT`.

A subsequent two-record mixed-bank integration canary exercises the proposed
packet and Lean-bank generators, but it is deliberately synthetic evidence. Its
first tagged record has the same cube SHA-256
`ac75e36047af69bfa66959d5d6e706c48b77b4497bf3e83cd1ca8c30479a35dc`,
certificate SHA-256
`202acebee1d1d043f7c081ac042482a317aa1f603d8ea0f0f4465accd3683ca0`,
and learned clause `[-6,-55,-155,-175,-525]` as the PIQD classifier, but the
journal does not bind the classifier or replay receipt and its assignment hash
differs. It therefore demonstrates independent rediscovery and compatible
typed data, not operational reuse of the PIQD artifact. More importantly, the
canary's six-byte `terminal.drat` contains `proof`; a fresh real `drat-trim`
check against its 5,128,538-byte terminal CNF exits 1 with `no conflict` and
`s NOT VERIFIED`. Its callback-produced `UNSAT_DRAT_VERIFIED` label and
generated two-entry Lean bank are contract-test results, not a terminal proof.
Synthetic terminal fixtures must be labeled in the artifact itself and must
never share a proof-status vocabulary with independently checked live runs.

The subsequent real 12-cell mixed-v3 wave
`exact12-v14-wave-cb329a7e-mixedv3-i400-c0000-0011-r3` reached neither a
terminal proof nor a complete structural bank. Cells `2, 4, 5, 7, 8` stopped
as `STRUCTURALLY_UNRESOLVED`; cells `0, 1, 3, 6, 9, 10, 11` reached the
400-iteration limit. All 12 journals replay, with 3,875 authenticated records
in total. Their detector distribution is 3,777 duplicate-center, 48
equilateral-bisector collision, 29 perpendicular-bisector-convex, 11
three-triad, seven equal-K4, and three rarer circle-family cuts. The frozen
source-order stage contributed no record. This is strong empirical evidence
that the current loop is detector-limited and source-entitlement-limited, not
merely under-budgeted. More iterations are justified only after a new semantic
stage reduces one of the five unresolved survivor classes or materially changes
that distribution.

A separate source-faithful five-omission v3 wave completed on 2026-08-10.
All twelve deleted-label shards authenticated 275 local records and stopped at
`ITERATION_LIMIT`; none produced a terminal proof.  The aggregate stage counts
are 3,108 duplicate-center, 168 equilateral-bisector, and 24 equal-K4 records.
Because the twelve shards have the same 275 local clause, stage, and
certificate sequences, the compact successor stores one local sequence beside
the frozen 441-cut bootstrap and exposes the 716-cut union only as a derived
projection.  Theorem-bank mining found no cross-center universal producer for
those cuts.  Thus the package improves replayable finite cut custody but does
not change `terminal_unsat = false`, supply exhaustive coverage or a universal
lift, or close a live theorem.

The post-wave source-order diagnostic sharpens that pivot: it reports that
convex-five-point cores cover all five unresolved survivors. Commit `50d18ad1`
has since promoted all five exact finite certificates to source-clean Lean
values and source-order bank schema v3. The new clauses are cell 2
`(-55, -410, -498)`, cell 4 `(-896, -1170, -2053, -2162)`, cell 5
`(-35, -172, -1363, -1620, -2493)`, cell 7
`(-29, -55, -546, -939, -2894)`, and cell 8 `(-55, -313, -2134)`; together
with the frozen V8 theorem, the authenticated bank now contains six
Lean-backed cuts. These are real finite source-order cuts, but they are not
aggregate coverage or a live universal lift. Because the promotion changes the
detector manifest, the `cb329a7e` journals remain read-only mining evidence and
must not be spliced into a fresh run.

The exact PIQD classifier is also semantically identical to cell 0 journal
record 0: its selected-assignment, cube, certificate, learned clause, and
source-job hashes match. The new
`census/p97_search/phase3_piqd_structural_seed.py` adapter turns that classifier
into a locally authenticated one-record tagged-v3 journal. It reopens the
classifier, source job, and 5,128,454-byte base CNF with bounded no-follow reads,
rebuilds the exact job/CNF, checks the selected positive assignment, replays the
certificate and compiled clause, and publishes a journal, binding sidecar, and
commit marker with commit-last semantics.

The pre-`50d18ad1` live canary is preserved read-only at
`scratch/p97-piqd-structural-seed-canary-2026-08-08-v2/`. Its seed journal
SHA-256 is
`12283bcffdbf5975ed88ab9a9c99a04c391d69909793c234db5a67d9ca0b6e03`;
its record SHA-256 is
`ae2a991e613433339ca7d10b477bce2e9e56404a7170b7e1302e1f258d06c295`;
and replay returns the exact learned clause
`[-6, -55, -155, -175, -525]`. A real one-iteration structural run consumed
that seed byte for byte as journal record 0, added a second duplicate-center
record, and stopped `ITERATION_LIMIT` with discovery verdict `SAT`, two records,
`journal_replayed = true`, all three replay checks true, and
`terminal_proof_verified = false`. The complete Phase-3 PIQD integration suite
has 176 passing tests; the adapter-focused suite has 15 passing tests, with
Ruff check and format-check clean.

A custody audit of the preserved cell-0 PIQD run found that its package,
wave manifest, sealed six-record driver journal, terminal SAT model, and
checkpoint still validate against one another. The old
`source-semantic-replay.json`, however, has cube SHA-256
`27b80fc03f2161a2feb4644aedad76684f78e3f15a22a6aef53798f7f850d693` and no
longer equals a fresh replay from those immutable inputs. It is stale and must
be rejected, not grandfathered. A fresh replay in
`scratch/p97-piqd-receipt-refresh-2026-08-08-v1/` is accepted with receipt
SHA-256
`41c07ced340650a122e1ecd569ac28034e0135b14d0afbe6a4951b484139bf9f`,
cube SHA-256
`ac75e36047af69bfa66959d5d6e706c48b77b4497bf3e83cd1ca8c30479a35dc`,
source-job SHA-256
`8b597e1cc2092cdbf2c4b4dc06b5dc5e3ae9f57e21cf7107e14259c1e81d1191`,
CNF SHA-256
`cfc268f2915ff31e1af24a66a036e41e81f93aca0967e88c1b4a4158eb67a379`,
model SHA-256
`1c9c7ef27850fa1c2d50d49b3fe886f24ce0d6aba7d74cbe9fdffcdeafd3557e`,
and PIQD job ID `cc4054b6-6e73-4bb6-9c09-ed4814f07c93`. Its refreshed classifier
has file SHA-256
`9a4f3062aa659f2b2015f25ddfe3dad35855924219c6841039f74b35f80a5935`
and rederives the same certificate and learned clause. This establishes a
viable local package-and-driver custody chain after receipt regeneration. It
does not establish daemon-origin custody: the producer manifest binds a local
package and upstream digest but carries no signed PIQD-daemon attestation. The
PIQD maintainer confirmed that this is a job-lane product gap: session records
bind solver identity, but job records do not bind either daemon or solver
identity. It is an enhancement to schedule, not a current API violation.

This demonstrates operational cut reuse, not authenticated PIQD-daemon
custody. The adapter does not ingest a PIQD package/producer receipt, and the
structural runner consumes only the raw journal rather than the seed sidecar and
commit marker. The sidecar therefore states
`piqd_producer_receipt_present = false`,
`piqd_daemon_origin_custody = false`, and
`downstream_seed_packet_custody = false`, in addition to denying source
entitlement, aggregate coverage, universal lift, executed-byte provenance, and
Lean closure. Closing that custody gap requires a later packet-aware runner or
an authenticated wrapper that snapshots the verified journal into the runner;
the present seed removes duplicate work rather than adding a new obstruction
family.

Consequently the promotion order is:

1. retain each PIQD-derived classifier only as an authenticated finite tagged
   cut whose clause is recompiled from its exact source certificate;
2. materialize the base CNF, exact cell delta, and every replayed structural or
   source-order cut into one byte- and clause-identical terminal formula;
3. require an independently verified terminal proof and convert it to the
   checked compact-RUP ingress without dropping or retyping mixed records;
4. bind the generated Lean data to that exact formula and terminal bank; and
5. only then add the live cell/source adapter and aggregate cell-coverage
   theorem needed by the production frontier.

This makes PIQD useful as a survivor generator and refinement accelerator while
keeping the proof boundary honest. A PIQD SAT result, a false learned clause for
its own captured model, an `ITERATION_LIMIT` journal, or a source-clean local
consumer is not terminal UNSAT and does not close the active theorem. No PIQD
daemon bug was found in this reachability audit; the gaps are in P97 terminal
promotion, source entitlement, and end-to-end packet custody.

## Lean-FOL encoder smoke addendum

A later serial live smoke exercised PIQD's `lean_fol` path for the first time
on this daemon. The alg7 encoder, CaDiCaL execution, exact raw-DIMACS replay,
and small SAT-model decoder all worked. The run also found `PIQD-LEAN-001`:
the generated Lean UNSAT certificate hard-codes the Lean 4.29 `Std.Sat.CNF`
structure representation and fails to compile under this repository's Lean
4.27 list representation. The maintainer reproduced and root-caused the bug;
a one-line 4.27 compatibility edit makes the remaining LRAT theorem compile.

This does not alter the reachability conclusion above: the smoke used
hand-authored `LeanSatIr`, because PIQD's Lean-source exporter is not yet
implemented, and no exact12/Rigid221 encoder input exists. Current P97
exact-12 work should continue through the raw-DIMACS path with project-owned
source/variable-map/model validation. Full evidence and remedy order are in
`docs/audits/p97-piqd-lean-fol-smoke-2026-08-08.md`; the defect record is in
`docs/audits/piqd-integration-bugs-2026-08-07.md`.
