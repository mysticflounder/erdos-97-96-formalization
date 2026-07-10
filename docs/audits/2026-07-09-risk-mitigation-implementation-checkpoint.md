# Closure risk-mitigation implementation checkpoint

Date: 2026-07-09 (PDT)

This checkpoint records implemented mitigations and the remaining admissible
work for the major risks in the full closure plan. It does not claim either
target theorem is closed. The fresh kernel graph still has the same five
on-spine source declarations.

## Risks reduced or eliminated

| Risk | Implemented mitigation | Current boundary |
|---|---|---|
| Concurrent Census554 writers | Shared lifetime driver lease; separate transaction lock; max-suffix PID allocation; canonical dedupe under lock | Active process predates lease import; enforcement starts on restart |
| Torn/orphan bank publication | Exact precommit certificate validation; recovery journal; atomic fsynced cert publication; atomic fsynced bank replacement | Bulk artifact/data migration remains open |
| False terminal marker | Persisted-CNF re-solve; mandatory `drat-trim`; marker written last; failed-checker regression | Active process has old terminal function in memory; its marker is provisional |
| Accidental acceptance of a legacy marker | `verify_completion` requires the new schema, verifies every digest, and independently reruns `drat-trim` | A pre-restart marker is rejected rather than interpreted as completion |
| Non-replayable cover manifest | Every exclusion records source row digest/PID, canonical motif, support injection, emitted pattern, and exact clause | Requires a terminal run using the new frontier code |
| Full-fleet certificate cost | `drat-trim -c/-L` emits core CNF/LRAT and maps needed exclusions to source rows before exact replay | Real core is unavailable until checked UNSAT |
| Unknown certificate heavy tail | Structural auditor measures p50/p90/p99/max and reports largest files without parsing 78 GB | Exact identity replay is `NOT_RUN`; core-specific build benchmark remains open |
| Provisional package/tests | Permanent combinatorial, protocol, terminal, audit, and profile modules; self-contained motif and transaction tests | Runtime driver/miner/verifier/generator and changing bank still live in scratch |
| Card-11 cover-to-geometry gap | Canonical geometry bridge plus `CoverRow`, support-injective `PatternEmbedsUnder`, `RealizesCube`, certified-row contradiction, and selected-cube adapter are built | Frozen checked finite cover, cover-core deadness index/replay, aggregate contradiction, and final consumer remain open |
| Card-12--14 profile ambiguity | Python 3/6/10 enumerator/tests and Lean arithmetic exhaustiveness theorems | No head census authorized; geometric cuts/candidate fixtures remain open |

The structural bank snapshot at 19:40 PDT had 5,444 raw rows and 5,443
normalized proof rows. The sole duplicate was the known `pat_00003` zombie:
its bookkeeping differs, but its PID, pattern, kill, orbit count, and cert path
are identical. There were no unexplained canonical duplicates, missing certs,
or orphan cert files. The cert fleet occupied 78,158,578,373 bytes; 157 files
exceeded 100 MiB and the largest was 2,281,208,887 bytes.

## Open mathematical clusters

### Front-A shared-radius tail

Risk cannot yet be eliminated: pattern-only and equality-only uniform routes
are falsified by explicit larger-card realizations. Admissible next work is
restricted to ATAIL-SUB2, a complete exact Q3 survivor surface if SUB2 is used,
or a genuinely geometric convexity-coupled theorem whose conclusion exactly
supplies `DoubleApexOffSurplusSharedRadiusPair`. The card-11 route narrows this
cluster but does not solve cards at least 12.

### Front-A liveData families

The active branch is owned by another proof-blueprint session and was not
edited. The mitigation is structural: dispatch one orbit consumer for LIVE-Q,
two polarity-correct consumers for LIVE-T1 (six positive `ht1Row_l1`, eighteen
negative), and a mirror orbit consumer for LIVE-T3. The seven terminal-center
branches remain separate named obligations. A polarity-uniform T1 lemma or 24
copy-pasted proofs is not an admissible shortcut.

### Front-B endpoint/pinned confinement

These are still producer gaps, not finite-bank gaps. The next accepted
deliverables remain `endpointLeft_residual_exists_metricShadow` plus its mirror,
and the right/left `PinnedSurplusSupportClasses` constructors. They must build
same-radius four-classes at every non-fixed center and prove candidate-mask
membership. Existing fixed `.v/.w` classes do not imply this confinement.
Owned pinned work was not modified.

### Front-B erased-pin confinement

The direct P4 rows still need geometric contradictions. For P2, the broad
`hrightCandidate` shape is known false; only the existing side-specific ordered
scaffold interfaces are admissible. The erased-pin branch is actively owned,
so this checkpoint adds no competing source edits. The optional row-to-class
map may be used diagnostically, but no CONJECTURED census cut becomes a proof
without a necessity theorem and on-spine consumer.

## Multi-center risk control

The finite representative surface and general-n persistence stack are already
kernel-checked, but no geometric spine consumer exists. Further broad scanning
does not reduce closure risk. The only useful order is MC-EXTRACT, MC-SURFACE,
geometric `CompletesGlobalFrom` (or an equivalent upper bound), then an exact
consumer for the shared-radius or liveData leaf. Until that conclusion is
stated against hypotheses available at a source site, multi-center work stays
off-spine and sorry-free.

## Verification at this checkpoint

- `lake-build Erdos9796Proof.P97.Census554.GeometryBridge`: pass.
- `lake-build Erdos9796Proof.P97.Census554.CardHeadProfiles`: pass.
- Geometry source: no `sorry`, `admit`, or declared axiom.
- Live axiom queries for `Card11CapLabeling.nonempty_of_card_eq_eleven`,
  `Card11SelectedCube.cubeOk`, and `exists_card11SelectedCube_cubeOk`:
  `propext`, `Classical.choice`, `Quot.sound` only.
- `lake-build Erdos9796Proof.P97.Census554.CoverRelations`: pass; source
  sorry-free; all three public bridge endpoints have the same core-only axiom
  closure.
- Permanent motif smoke: pass.
- Transaction/lease/audit/terminal unit tests: pass.
- Real CaDiCaL 3.0.0 + `drat-trim` tiny-UNSAT core/LRAT integration: pass.
- Full exact bank-certificate audit: not run.
- Real Census554 terminal proof/core: not available.
