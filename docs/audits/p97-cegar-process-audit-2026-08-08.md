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
| Evidence-class collapse | Bounded UNSAT, learned clauses, exact-rational realizations, solver logs, and successful builds repeatedly risked being read as universal closure. | Local computation could be promoted past missing proof replay, lift, or consumer bridges. | Frozen outcome taxonomy and fail-closed publication assessment. piqd UNSAT remains `DISCOVERY_UNSAT` until proof bytes, independent checker, and replay receipt exist; even `CERTIFIED_UNSAT` remains only a publication candidate. |
| Retry history loss | A successful retry could previously obscure the request that timed out or failed. The confirmed piqd identical-prepare race returns a transient HTTP 500 to one concurrent caller. | Operational failure rates and oracle ambiguity became invisible; a later success appeared cleaner than the actual run. | Append the structured failure event and fsync the hash-chained attempt before every bounded retry. Stop immediately on uncertain journal durability. A successful re-prepare never replaces the earlier failure. |
| Terminal-state conflation | piqd reports solver timeout as `completed/UNKNOWN`, while daemon failures use lifecycle `failed` (often with result `UNKNOWN`). Poll exhaustion is a third condition. | Different remedies and reliability signals were collapsed into one vague unknown. | Preserve `SOLVER_UNKNOWN`, `DAEMON_FAILED`, and `POLL_TIMEOUT` in `p97-cegar-piqd-event/v1`. The frozen outer vocabulary uses `ERROR` for all three; `METRIC_UNKNOWN` is reserved for metric validation. |
| Case-split policy too coarse | The 2026-08-06 audit found useful source-clean dichotomies rejected merely for being splits, while other attractive branches lacked a decreasing measure or live residual. | Productive narrowing was discarded, but unproductive branch proliferation remained possible. | Admit a split only when every branch reaches a named consumer/residual or strictly decreases a cardinality, radius, or blocker-fiber measure. Record the measure and next consumer in the candidate contract. |
| Producer/consumer mismatch | Exact-six material was provenance-blocked; first-fiber infrastructure existed but lacked a FreshThird bridge; the false rational-octagon incidence producer was refuted. | Theorem-bank volume did not translate into proof-spine progress. | Search the theorem bank and live consumers first. Require exact theorem provenance plus the first missing adapter. Keep refuted shapes as negative tests so miners do not rediscover them. |
| Artifact volume mistaken for productivity | The retained-omission bank contained roughly 66,411 artifacts but only 64 substantive reports; raw SAT payloads and generated duplicates were not independent producers. | Storage and mining throughput overstated mathematical progress. | Rank unique consumer-addressable statements, not artifact count. Deduplicate by authenticated content and statement shape; park candidates without replayable finite consumers or universal Lean producers as `PARKED-SPEC`. |
| Cache/checkpoint authority inversion | Prefix checkpoints and warm caches improve scan time but cannot prove semantic equivalence or terminality. | Fast-path state could silently become the publication authority. | Authenticate raw prefix bytes and order digests, but require full semantic replay and independently checked identities at promotion boundaries. Source replay remains authoritative. |
| Backend/profile semantic drift | The audit found that raw job identities could name unsupported profiles. The piqd maintainer also corrected an operational misconception: an empty CaDiCaL profile intentionally selects `--sat`, while literal `default` selects CaDiCaL's default. | Unsupported names could detach identity from execution, while an omitted profile can silently bias an UNSAT-heavy run toward SAT discovery. | `PIQD-RAW-002` is fixed in piqd and P97 still rejects unsupported pairs. Wave manifests must spell `default` explicitly when intended; empty and `default` remain distinct valid identities. |
| Weak stop/pivot criteria | After the mixed-law robustness repair, the field closed `n=10` but remained SAT at `n=11` through `n=15`; a class-size cap still left `n=15` SAT (`0d76b444`). | Additional syntactic cuts could consume waves without addressing the missing semantic field, coupling, or producer. | Define a pivot condition before launch: repeated source-faithful SAT survivors with the same missing invariant stop that family and create a named semantic-producer task. piqd can measure and preserve no-progress, but it cannot choose the mathematical pivot. |

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
- Exercise a generated P97 wave through the live daemon after its mathematical
  producer contract is ready. The synthetic known-UNSAT daemon/replay smoke is
  complete, but it does not test a P97 encoding or close a Lean consumer.
- Keep independent replay mandatory even after the `PIQD-PROOF-001` fix; piqd
  remains the proof-artifact producer, not the publication authority.
- Decide whether piqd should expose a new raw-job requeue identity for terminal
  `UNKNOWN`/`failed`; current same-identity re-prepare cannot retry execution.
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
