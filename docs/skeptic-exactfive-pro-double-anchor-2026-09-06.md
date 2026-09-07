# Math Skeptic Audit: Pro exactfive double-anchor control

**Target**: immutable Pro report and replay references
`docs/references/exactfive-source-geometry-2026-09-05/double-anchor-pro-report-2026-09-06.md`
and `double-anchor-pro-replay-2026-09-06.md`, receipt
`docs/audits/2026-09-06-exactfive-pro-double-anchor-replay.json`, and §3d of
`docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 9

## Summary

The receipt is internally authenticated. Its recorded self-hash
`81b4eba38b2beebeac087332a2894642fd63580f78a86f2d647ed1a9b6a015f6`
recomputes, the four extracted script hashes match the replay Markdown fences
exactly, and the run manifest binds the immutable replay SHA-256
`c6d1a7e61e4fe66f512a0e81707867b47b92cb790005b91af1a1bd3eac91fabb` at base
head `6806d13fc38e031af644e31c4609a38feefd8c58`. The recorded commands all
exited zero with empty stderr.

The finite 48-point control is independently audited at the coordinate level:
2,208 supporting-edge checks and 17,296 cyclic triples pass; the independently
recomputed rich centers, actual-row centers, coverage, and global/total-H
flags match the construction output. The new mathematical content relative to
the audited 44-point control is local K4 at the point `u`, via the row
`{Z1,Z2,Z3,Z4}` centered at `u`. The partial source assignment still has
`H(u)=d0`; the actual row centered at `H(u)` has trace `{u}` and radius above
`r`. These are distinct centers and distinct rows.

All conclusions here are EMPIRICALLY VERIFIED on the explicit 48-point
certificate. The report, receipt, and plan correctly retain
`global_K4=false`, `total_H_possible=false`, 26 sources without actual
blockers, no physical source, and no full-source contradiction or closure.

## Findings

### F1: Attachment and extraction custody are authenticated

- **Location**: receipt `docs/audits/2026-09-06-exactfive-pro-double-anchor-replay.json:2-18`; run manifest `scratch/runs/exactfive-pro-double-anchor-review-20260906/run-0001/run_manifest.json:1-18`
- **Quote**: “The four Python fences under their filename headings in the authenticated replay Markdown, in order, without modification.”
- **Stated label**: Authenticated replay input
- **Evidence present**: The report and replay reference hashes match the run manifest. A read-only parser recovered all four fences and matched the artifact hashes and byte counts: `base_control.py` 7,268 bytes, `endpoint_control.py` 1,323, `double_anchor_control.py` 4,240, and `independent_audit.py` 4,492.
- **Actual label**: EMPIRICALLY VERIFIED custody and extraction fidelity.
- **Verdict**: OK
- **Reason**: The receipt’s self-hash and all four fence-to-artifact hashes validate. The run manifest binds the two input Markdown hashes, and the receipt binds the extracted script hashes.

### F2: The four scripts have bounded execution behavior

- **Location**: replay reference `double-anchor-pro-replay-2026-09-06.md:14-385`
- **Quote**: “No imports from the construction scripts. Standard library only.”
- **Stated label**: Reproducible standard-library computation
- **Evidence present**: The base, endpoint, and double-anchor blocks use only local imports, `runpy`, stdout capture, and exact arithmetic. The independent block reads one supplied JSON path and uses its own tuple/Fraction implementation. Static inspection found no network, subprocess, dynamic `exec`/`eval`, deletion, or file-writing operation.
- **Actual label**: EMPIRICALLY VERIFIED bounded script behavior by static inspection and receipt custody.
- **Verdict**: OK
- **Reason**: The proposed extraction names and replay JSON paths are internally consistent; the recorded run has zero stderr.

### F3: The 48-point carrier’s finite geometry is supported

- **Location**: report `double-anchor-pro-report-2026-09-06.md:24-68`; receipt `construction_summary`
- **Quote**: “Strict supporting-edge tests | 2,208 / 2,208 positive” and “Cyclically ordered triples | 17,296 / 17,296 positive”.
- **Stated label**: EMPIRICALLY VERIFIED exact local geometry
- **Evidence present**: The construction receipt records 48 points, 2,208 supporting-edge checks, 17,296 triples, MEC boundary `{O,V,W}`, strict cap sizes `{O:6,V:17,W:22}`, and unique surplus apex `W`. The coordinate-only auditor independently returns the same counts, eight rich centers, 40 nonrich centers, and 22-point actual-row coverage.
- **Actual label**: EMPIRICALLY VERIFIED for the explicit 48-point certificate.
- **Verdict**: OK
- **Reason**: The finite scope is explicit and all reported exact assertions are covered by the recorded construction and independent audit.

### F4: The new K4 row is centered at `u`, not at `H(u)`

- **Location**: report `double-anchor-pro-report-2026-09-06.md:60-68,108-121`; replay `double-anchor-pro-replay-2026-09-06.md:238-259`
- **Quote**: “The row centered at u is not the row centered at H(u), and neither is the row centered at H(H(u)).”
- **Stated label**: EMPIRICALLY VERIFIED local double-anchor control
- **Evidence present**: The added points `Z1..Z4` form the full rich class at center `u`. The partial assignment has `H(u)=d0`; the `d0` row is `{u,S1,S2,S3}`, meets `I` in `{u}`, and has squared radius approximately `4.1481 > r²=3.25`. The `u` row has a separate squared radius approximately `2.8916`.
- **Actual label**: EMPIRICALLY VERIFIED finite distinction between K4 at `u` and the actual row assigned to source `u`.
- **Verdict**: OK
- **Reason**: The report does not conflate a rich row centered at `u` with the source-owned row `K_{H(u)}`.

### F5: Actual rows, partial H, and source failures are correctly bounded

- **Location**: report `double-anchor-pro-report-2026-09-06.md:43-66,140-148`; receipt `construction_summary`
- **Quote**: “The partial H assignments use these ambient actual rows and are unchanged by the added u-row.”
- **Stated label**: EMPIRICALLY VERIFIED partial source control
- **Evidence present**: The complete rich census has centers `O,V,b,c,w,u,d0,d1`; actual nonrobust centers are `b,c,w,u,d0,d1`; partial H is `{q:d1,w:b,b:c,c:b,u:d0}`; actual-row coverage is 22 and 26 sources lack blockers. The receipt records `total_H_possible:false` and `original_physical_source_instantiated:false`.
- **Actual label**: EMPIRICALLY VERIFIED partial assignment on this carrier.
- **Verdict**: OK
- **Reason**: The report states that this is not a total source and does not promote the partial map to physical closure.

### F6: The independent auditor recomputes geometry from coordinates

- **Location**: replay reference `double-anchor-pro-replay-2026-09-06.md:288-385`; receipt `independent_audit`
- **Quote**: “No imports from the construction scripts. Standard library only.”
- **Stated label**: Independent audit
- **Evidence present**: The auditor defines its own Q(√3) tuple arithmetic, parses `coordinates_exact` from the supplied 48-point JSON, recomputes orientations, circumcenter, disk slack, caps, all distance maps, rich rows, deletion survival, partial H, trace, and coverage. Its retained result is `PASS independent tuple-field audit` with 2,208 edges, 17,296 triples, 22 actual coverage, and 26 missing blockers.
- **Actual label**: EMPIRICALLY VERIFIED independent arithmetic audit of the supplied coordinate certificate.
- **Verdict**: OK
- **Reason**: The auditor is independent of the construction modules, while its expected row sets come from the supplied certificate; this supports arithmetic and row consistency, not source-theorem validity.

### F7: The Pro report’s negative global claims are scope-correct

- **Location**: report `double-anchor-pro-report-2026-09-06.md:6,22,66-68,140-148`; receipt `construction_summary`
- **Quote**: “It is not a counterexample to a theorem retaining global K4, total H, and cardinal minimality.”
- **Stated label**: Finite countercontrol, not a global result
- **Evidence present**: The receipt records `global_K4:false`, `total_H_possible:false`, `cardinality_minimal_global_K4:false`, `original_physical_source_instantiated:false`, and `full_source_singleton_contradiction:false`; the report states no full-source reduction, termination argument, Lean declaration, or closure.
- **Actual label**: EMPIRICALLY VERIFIED finite failure of the local surrogate only.
- **Verdict**: OK
- **Reason**: No global lemma or false physical-source claim is asserted.

### F8: The independent reconstruction is distinguished from the repository’s 44-point extension

- **Location**: report `double-anchor-pro-report-2026-09-06.md:10-14,74-79,92-106`; plan `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:395-407`
- **Quote**: “The construction uses an independently reconstructed parent; it is not a byte-identical extension of the repository's 44-point checker.”
- **Stated label**: Independent corroboration and new finite control
- **Evidence present**: The report explicitly labels its 32-point reconstruction as independent corroboration, and the plan repeats that the 48-point construction is not byte-identical to the repository’s 44-point checker. The receipt binds only the Pro replay and its extracted artifacts.
- **Actual label**: EMPIRICALLY VERIFIED independent 48-point construction, not a repository source extension.
- **Verdict**: OK
- **Reason**: The provenance distinction is explicit and prevents treating the Pro coordinates as a byte-level continuation of the audited 44-point script.

### F9: The active plan paragraph preserves the finite-only boundary

- **Location**: `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:395-407`
- **Quote**: “Pro reports no new full-source reduction or contradiction consumer.”
- **Stated label**: Planning statement based on finite empirical evidence
- **Evidence present**: The paragraph cites the immutable report and receipt, repeats the 2,208/17,296 finite checks, states the independent-parent distinction, records 40 centers without K4 and 26 sources without blockers, and leaves the global source argument open.
- **Actual label**: EMPIRICALLY VERIFIED finite control summarized in the plan.
- **Verdict**: OK
- **Reason**: The plan adds no theorem admission or closure claim; it identifies the missing global argument as the next requirement.

## Weasel words

No automatic proof-context weasel words were found in the audited report,
replay, or plan paragraph. Approximate numerical values are labeled
diagnostic and are not used as exact pass/fail evidence.

## Scope conflation

No scope conflation remains. The new K4 row at `u` is kept separate from the
actual `H(u)=d0` row. The 48-point model is explicitly separate from global
K4, total H, cardinality minimality, the physical source, and full-source
closure.

## Lean sorry graph

Not applicable. This checkpoint contains Python scripts, JSON replay evidence,
and prose; it claims no Lean theorem or promotion.

## Upgrade drift

No stronger label is introduced. The independent reconstruction is reported as
finite empirical corroboration/control and is not promoted to a repository
source extension or a global counterexample.

## Required before CERTIFIED

None for this finite audit. Any global or physical use still requires global
K4, total H, cardinality/minimality custody, source transport, and a proved
full-source consumer.
