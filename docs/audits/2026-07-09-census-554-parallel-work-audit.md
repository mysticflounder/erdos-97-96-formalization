<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Audit note: parallel census-554 work (2026-07-09)

Audited surfaces:

- `lean/Erdos9796Proof/P97/Census554/MotifTransfer.lean`
- `lean/Erdos9796Proof/P97/Census554/Space.lean`
- `lean/Erdos9796Proof/P97/Census554/PolyCheck.lean`
- `lean/Erdos9796Proof/P97/Census554/CertCheck.lean`
- `lean/Erdos9796Proof/P97/Census554/Bank/`
- `scratch/census-554/gen_lean_certs.py`
- the active census, frontier, bank, certificate, and SAT-cover scripts under
  `scratch/census-554/`
- `docs/closure-plan-full-spec-2026-07-09.md`
- the census handoff in `scratch/census-554/STATE.md` and
  `scratch/census-554/report.md`

Auditor: Codex, independently reviewing the parallel implementation and its
current working-tree artifacts. This is a correctness and publication-readiness
audit, not a claim that the running census is complete.

## Findings

### P1: Batch certificate generation creates duplicate Lean declarations

`Bank/PatBatchProbe.lean:21-26` enters `Problem97.Census554.Bank` and defines
the same global names as the individual modules, for example `pat00966` in
`Bank/Pat00966.lean:17-22`. The shared generator header fixes that namespace at
`gen_lean_certs.py:463-483`, while `--batch-name` at lines 547-550 emits all
records without adding a batch-specific namespace.

This is not merely a theoretical collision. A targeted `lake-build` completed
the selected Lean compilation, but the subsequent proof-blueprint resync failed
on duplicate declarations, including
`Problem97.Census554.Bank.coeffs02213` from `PatBatchProbe` and `Pat02213`.
Any module importing both forms would encounter the same problem.

Required repair: keep probes outside the Lean source tree, or emit batch modules
under a unique namespace and ensure that batch and individual certificate
modules cannot export the same names.

### P1: Parallel census execution does not enforce a single writer

`frontier_add.py:24-27` checks only for a process whose command contains
`run_census.py`. It does not protect against another `frontier_loop.py`, a
direct `cegar.py` process, or another invocation of `frontier_add.py`.
`frontier_add.py:30-71` computes the next pattern identifier, writes the
certificate, and appends the bank row as separate unlocked operations.
`cegar.py:101-120` has the same count-derived identifier and unlocked append
pattern. `run_census.py:41-55` starts CEGAR without acquiring a shared lock.

The known duplicate `pat_00003`, attributed in the existing report to an
overlapping zombie append, demonstrates that this race has already occurred.
The duplicate happens to be content-identical and harmless to the current SAT
constraints, but the protocol does not guarantee that future collisions will
be harmless.

Required repair: every bank writer must acquire the same OS-level lock, and
certificate creation plus bank append must be treated as one checked
transaction. Pattern identifiers should be allocated while holding that lock.

### P1: Solver artifacts use a shared, hardcoded temporary path

`cover_probe.py:38-40` and `sat_cover.py:170-172` point into one old
`/private/tmp/claude-501/.../scratchpad` session directory. All cover processes
therefore write the same CNF path, and the scripts depend on a temporary
directory that may disappear after cleanup or on another host.

This compounds the missing process lock: concurrent solver invocations can
replace the file between emission and CaDiCaL consumption. Even absent a race,
the committed scripts are not reproducible from a fresh checkout.

Required repair: allocate a private managed temporary directory or CNF file per
solver invocation. Retain the final closure input separately if UNSAT is
reached.

### P1: The closure plan undercounts the remaining proof obligations

`docs/closure-plan-full-spec-2026-07-09.md:46-57` says that a census UNSAT
leaves "exactly two discharge obligations": per-pattern deadness and motif
transfer. The same document records additional open obligations:

1. Candidate-filter necessity at the geometric leaf remains open at lines
   76-79.
2. Verified cover checking remains open at lines 122-126.
3. The card-11 contradiction and leaf wiring do not exist at lines 138-142 and
   158-163.
4. Applying `motif_transfer` to a support-sized motif embedding also requires a
   finite bridge extending that support injection to an injective relabeling of
   all of `Fin 11`; no such bridge has been implemented or named in the plan.

Consequently the statement at lines 198-200 that "Card 11 closes via A.1/A.2"
is premature and conflicts with the document's own statement that Front A has
no complete known route. Census UNSAT would settle the finite search result,
not by itself close the Lean leaf.

Required repair: replace the two-obligation account with the complete bridge
chain and give each missing theorem or generated artifact its own tracked plan
item.

### P2: A CaDiCaL UNSAT result would not yet be a durable proof artifact

`frontier_loop.py:82-87` prints `COVERAGE COMPLETE` directly from CaDiCaL's
stdout. The CNF is overwritten each iteration, the accumulated lazy embedding
set exists only in process memory, and the loop emits no final input digest,
manifest, DRAT/LRAT proof, or independently checked solver certificate.

The closure plan correctly lists a Lean cover check as open, but the script
header and terminal message overstate the current trust level by saying that
coverage is complete modulo only motif transfer. Until the direct Lean cover
check or another independently checked proof artifact exists, an eventual
UNSAT result must be labeled EMPIRICALLY VERIFIED rather than PROVEN.

Required repair: persist the exact final bank snapshot and exclusion-instance
manifest with digests, plus either a checkable SAT proof or the generated input
to the planned Lean finite cover checker.

### P2: The authoritative handoff is stale and gives an unsafe resume command

`scratch/census-554/STATE.md:65-95` and
`scratch/census-554/report.md:88-113` still report the old 1,597-row checkpoint
and instruct the next operator to launch `run_census.py`. At this audit
checkpoint the bank had 5,428 rows and `frontier_loop.py` was still advancing.
Following the documented resume command during that run would activate the
unlocked-writer race above.

Required repair: identify one authoritative driver, retire the obsolete resume
command, and update the handoff from generated state or an atomic checkpoint so
that row counts and process instructions cannot drift independently.

### P2: The referenced motif-cover regression test is absent

`cover_probe.py:23-25` cites `cover_probe_smoke.py` and specific canonical-key
and embedding gates, but no such file exists in the tracked tree or current
working tree. Independent ad hoc randomized checks passed during this audit,
but they are not a reproducible regression suite.

Required repair: add a deterministic committed test covering relabeling
invariance of `unlabeled_key`, non-isomorphic key separation, `AUTOS` orbit
containment, and source-cube validity of every embedding returned by
`embed_into_cube`.

### P2: The certificate-data pipeline is not yet permanent in git

At the audit checkpoint, `scratch/census-554/gen_lean_certs.py` and the entire
`lean/Erdos9796Proof/P97/Census554/Bank/` directory were untracked. The current
working tree therefore contains the only copies of the generator and generated
sample modules, including the duplicate-declaration probe.

Required repair: first resolve the batch collision and decide the supported
generated-module layout, then commit the generator, deterministic tests, and a
reviewable representative certificate set. Large raw certificate artifacts
need an explicit storage and reproducibility policy rather than accidental git
inclusion.

### P3: New Lean files omit the project source header

The generated header at `gen_lean_certs.py:463` begins directly with an import,
and the generated bank modules inherit that omission. The other new
`Census554` Lean files also begin with imports. This violates the project's
Lean source-header convention.

Required repair: fix the generator once and add the standard copyright,
license, and author header to the handwritten modules.

## Independent verification performed

1. **Lean source review.** `MotifTransfer.lean`, `PolyCheck.lean`, and
   `CertCheck.lean` were reviewed through their main soundness theorems. The
   motif normalization argument, sparse-polynomial evaluation bridge, and
   certificate-to-deadness contradiction are coherent.
2. **Placeholder and trust scan.** No `sorry`, `admit`, project axiom,
   `unsafe`, `extern`, or `implemented_by` declaration was found under
   `lean/Erdos9796Proof/P97/Census554/`. `motif_transfer` and
   `isDead_of_checkCert` use core axioms only. The sample `native_decide`
   replay additionally uses the approved `Lean.ofReduceBool` and
   `Lean.trustCompiler` boundary.
3. **Certificate replay checks.** The four newest certificates at the audit
   checkpoint, `pat_05424` through `pat_05427`, independently passed structure,
   generator-fidelity, and exact `Fraction` identity verification.
4. **Generator fidelity.** Regenerating the `pat_00966` sample produced output
   byte-identical to its current individual module. Representative base, pair,
   and multi-pair modules compiled individually.
5. **SAT encoding smoke.** All five existing `sat_cover.py` gates passed:
   candidate counts and valid empty-bank witness, exact-cube exclusion, forced
   C2 rejection, forced C4 rejection, and sub-mask pattern exclusion.
6. **Motif-cover spot checks.** One hundred randomized relabeling-invariance
   checks for `unlabeled_key` and four latest source-cube embedding checks
   passed. These checks should become the missing committed test above.
7. **Bank integrity snapshot.** The 5,428 bank rows contained 5,427 unique
   pattern identifiers. The sole duplicate was the already documented,
   content-identical `pat_00003` row.
8. **Build result.** A serial wrapper build of the core `Space` and `CertCheck`
   targets completed without Census554-specific Lean errors. The wrapper's
   proof-blueprint resync then failed because of the batch/individual duplicate
   declarations described in the first finding.

## Census status at the audit checkpoint

The census was not complete. The latest observed frontier log was at iteration
1089, with approximately 811,975 lazy pattern instances and 5,428 bank rows.
The iteration had found two new six-point minimal patterns and had certified at
least one when inspected. Neither `COVERAGE_COMPLETE.json` nor
`ALIVE_CANDIDATE.json` existed.

This status is deliberately recorded as a checkpoint. The live process may
advance after the audit, but none of the findings above depends on its eventual
termination result.

## Post-audit recheck (2026-07-09 18:32 PDT)

The parallel agent changed and committed the audited surfaces after the
findings above were written. The dispositions below distinguish the initial
snapshot from the committed repairs and the remaining integration gaps.

| Finding | Current disposition |
|---|---|
| Batch/individual duplicate declarations | **RESOLVED.** `PatBatchProbe.lean` is gone; batch generation uses a disjoint namespace; `proof-blueprint index --refresh` succeeds. |
| Single-writer protocol | **PARTIAL.** `cegar.py` now holds the shared bank lock for its whole run and `frontier_add.py` locks each append. There is still no lifetime lease excluding two `frontier_loop.py` processes, and cert write/bank append lack validate-temp-fsync-rename semantics and canonical dedupe under lock. `STATE.md` and the `frontier_add.py` docstring still incorrectly say that `cegar.py` is unlocked. |
| Shared hardcoded CNF path | **RESOLVED.** `cover_probe.py` and `sat_cover.py` allocate per-process temporary directories. The permanent clean-checkout gate remains open. |
| Undercounted closure chain | **RESOLVED IN DOCS.** The closure plan and matrix now enumerate the geometry, cover, certificate, consumer, and wiring steps. The support-injection bridge is additionally compiled as `motif_transfer_of_supportInjOn`, with core axioms only. |
| Durable UNSAT artifact | **PARTIAL.** `frontier_loop.py` now stages a final CNF, DRAT output, instance manifest, bank snapshot, and hashes. It is unexercised; it can still write `COVERAGE_COMPLETE.json` when the persisted-CNF re-solve fails, does not independently check the DRAT proof, snapshots the bank without the writer lock, and omits source-PID/support-injection provenance from manifest rows. |
| Stale handoff | **PARTIAL.** `STATE.md` retires `run_census.py` and names `frontier_loop.py` as authoritative, but its lock note is now stale because `cegar.py` was subsequently fixed. |
| Missing motif-cover test | **PARTIAL.** `cover_probe_smoke.py` is tracked and all four deterministic gates passed in this recheck. It depends on ignored local certificate payloads and scratch-relative cwd/imports, so it is not yet a clean-checkout regression test. |
| Pipeline permanence | **PARTIAL.** Supported tooling, generator, smoke test, state, and bank are now tracked, and 21 representative generated bank modules are committed. They remain under provisional `scratch/census-554/` rather than the requested permanent package, while bulk certs are local-only. The closure matrix specifies migration to `census/census_554/` with self-contained fixtures and documented ignored artifacts. |
| Lean source headers | **RESOLVED.** Handwritten and generated Census554 Lean files now carry the project header. `Space.lean` still contains the stale `{{NEEDS_RESEARCH}}` doc marker and scratch-path references, to be cleaned during permanent migration. |

Operationally, the loop was no longer running at this recheck. `bank.jsonl`
had 5,431 rows and the log ended after printing the frontier cube at iteration
1154. No `COVERAGE_COMPLETE.json` or `ALIVE_CANDIDATE.json` existed. This is a
paused, nonterminal checkpoint, not evidence for UNSAT or ALIVE.

## Overall verdict

The core Lean certificate-to-deadness, motif-transfer, and support-injection
work is technically substantive and the checked theorem surfaces are
sorry-free. Several original findings were repaired and committed, but the
pipeline is still not publication-ready: it has not
moved from provisional `scratch/` to the designated permanent package, the
writer/driver protocol and completion-marker gate remain incomplete, the
regression fixture is not self-contained, and the census has no terminal
result. These are integration and proof-boundary defects, not evidence that
the checked Lean mathematical lemmas are false.
