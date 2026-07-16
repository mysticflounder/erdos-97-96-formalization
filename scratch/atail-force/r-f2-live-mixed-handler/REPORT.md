# Anchored F2 live-heavy / mixed handler report

## Scope

This scratch lane owns only:

- `F2LiveMixedHandler.lean`;
- this report.

It does not change production Lean, closure docs, the blueprint, the
support-heavy lane, or any protected file.

The proof-blueprint anchor for the session was
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`.

## Required preflight

Before writing the reduction I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.md` and its JSON inventory;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory;
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory;
- focused `nthdegree docs search --lean` queries for the F2 live/mixed row
  shapes, original-source q-deleted/q-critical rows, and directed
  center/support incidences.

The closest banked families are the U5 mixed rank-two incompatibilities and
the two-q-critical adjacent/common-point consumers.  None directly consumes
the current F2 callback packet.  They require generated-row center/support
incidences that are not present in the exact source packet.  In particular,
selected-support omission was not interpreted as a metric inequality.

## Kernel-checked reduction

The file proves four exported declarations.

### 1. `liveSource_not_mem_dangerousTriple`

The exact live row has support `{q,t1,t2,t3}` and cardinality four, so `q`
cannot be one of `{t1,t2,t3}`.  This removes a recurring label ambiguity
without importing slot identities.

### 2. `nonempty_anchoredF2LiveHeavyReduction`

From the anchored provenance packet and
`SourceFaithfulF2ThreeRowChain`, it names:

- two strict live-only points `x,y`;
- two support-only points `s,t`;
- the retained coherent source `r = R.sourcePair.x`.

It then proves all of the following:

- the exact middle row is `{x,y,s,t}`;
- `{t1,t2,t3} = {x,y,r}`;
- the coherent source `r` is omitted by the middle row and is distinct from
  both `x` and `y`;
- `q` is omitted by the middle row;
- the actual middle row is therefore an exact
  `U5QDeletedK4Class D q S.oppApex2`;
- at least one of `x,y` lies outside the retained first-apex fixed marginal,
  by the existing anchored bound saying that marginal meets the middle row
  in at most one point.

This is stronger than the prior live-heavy direct-bank audit: it retains the
anchored coherent source and identifies it as the unique third dangerous
label omitted by the middle row.

### 3. `nonempty_namedF2MixedWitnesses`

From the full F2 profile plus
`F2MixedOneLiveOneSupportBoundary`, it names exactly:

- `x`: the unique strict live-only point;
- `y`: the other live-only point, which is not strict;
- `s`: the unique strict support-only point;
- `t`: the other support-only point, which is not strict.

The proof retains all cross-cell inequalities and proves:

```text
C.B₂ = {x,y,s,t}
x ∈ {t1,t2,t3}
y = q or y ∈ {t1,t2,t3}.
```

No anonymous four-set is substituted for `C.B₂`.

### 4. `nonempty_anchoredF2MixedOriginalQBranch`

The named mixed packet has exactly two original-`q` statuses:

1. `y = q`.  The existing exact middle row contains `q`, so
   `C.B₂.erase q = {x,s,t}` is an exact
   `U5QCriticalTripleClass D q S.oppApex2`.
2. `y ∈ {t1,t2,t3}`.  The exact live-row cardinality proves
   `q ∉ {t1,t2,t3}`, hence `q ∉ C.B₂`; the unchanged middle row is an exact
   `U5QDeletedK4Class D q S.oppApex2`.

This is the sharp original-source dichotomy.  It prevents future mining from
forgetting whether `q` was retained or omitted by the actual row.

## Exact residuals

No existing theorem-bank consumer turns either checked reduction directly
into `False`.

The remaining producer is now source-indexed and small:

- live-heavy: apply global K4 at the two named dangerous centers `x,y`
  relative to the original source `q`, then provide the directed
  center/support incidences required by the adjacent-center or
  third-common-point U5 consumer;
- mixed q-critical: couple the exact row `{x,s,t}` to one generated
  original-`q` row at the named dangerous center `x` or named off-live center
  `s`;
- mixed q-deleted: couple the exact row `{x,y,s,t}`—with exactly the two
  dangerous labels `x,y` and two off-live labels `s,t`—to one generated
  original-`q` row.

The missing ingredient is therefore not another cell count or anonymous
support pattern.  It is a directed, source-preserving row-incidence producer.
Any candidate producer must state which generated center owns the row and
which of `p`, the other named center, or the retained coherent source belongs
to its support.

## Validation

The bounded validation used the repository-pinned Lean 4.27.0 directly; no
full `lake-build` was run.

```bash
cd lean
env LEAN_PATH=/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-f2-live-mixed-handler/F2LiveMixedHandler.lean
```

The command exited `0`.  The printed axiom closures for all four declarations
are exactly:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.
