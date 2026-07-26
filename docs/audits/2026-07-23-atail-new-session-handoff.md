# ATAIL new-session handoff — 2026-07-23

**Status:** active, partial, and fail-closed. The pushed checkpoint stages the
fixed-card-11 exact-two source bridge, but it does **not** close a production
`sorry`.

This is a cold-start handoff for the next session. It records the current
checkpoint and the exact continuation target. It does not replace live
`proof-blueprint` output; rerun the commands below before changing Lean.

## Post-handoff update — 2026-07-23

Two lanes described below have since advanced:

- `scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource/`
  now contains the validated direct and mirror source valuation. Its aggregate
  theorem is source-clean, with only `propext`, `Classical.choice`, and
  `Quot.sound`.
- `scratch/atail-force/unique4-exact-two-lrat-ingress/` now contains the
  fail-closed streaming materializer and replay-attestation validator. The real
  normalized p5 LRAT is split across an exact 23,857-clause checkpoint, and
  the generated package has SHA-256
  `4229c86fd26f38e812d20467c68fbefa04838101611b6e73b00210cb0a444232`.

The importable
`lean/Erdos9796Proof/P97/Certificate/CheckpointedRup.lean` module now has
canonical text ingress plus separate sound first-shard and second-shard
theorems. The bounded replay and all 23 ingress tests pass. A real one-shot
first-shard replay was attempted with raised recursion and stack limits, but
used more than 23 GiB without producing an `olean` and was interrupted after
more than 20 minutes. The second one-shot shard was not attempted. The next
endpoint is exact, independently rebased windows within each logical shard,
initially capped at 4,000 actions and 4 MiB of LRAT text. The package status
therefore remains
`STRUCTURALLY VALIDATED PURE-RUP SHARDS; LEAN REPLAY REQUIRED`. No production
`sorry` has been closed by these updates.

## 1. Authoritative current state

At the time of this handoff:

- branch: `main`;
- local and remote head:
  `63722d780b11001eba19d3ddddb31617519b5cf7`;
- checkpoint commit:
  `checkpoint(atail): stage exact-two source bridge`;
- live anchor:
  `Problem97.ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm`;
- exactly two source declarations on the live spine still reach `sorryAx`:
  1. `false_of_originalFrontierUniqueRadiusArm`;
  2. `false_of_frontierLargeOppositeCapsBiApexRobustResidual`.

Confirm this rather than trusting the snapshot:

```bash
proof-blueprint anchor
proof-blueprint status
proof-blueprint spine \
  Problem97.ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm \
  --max-depth 3
git status --short --branch
git rev-parse HEAD
git rev-parse origin/main
```

The relevant source declarations are in
[`FrontierLiveClosure.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean):

- the unique-radius arm has its direct `sorry` near line 41;
- the exact-five source route near lines 121–148 is textually closed;
- the large-opposite-caps robust residual has its direct `sorry` near line 152.

The exact-five theorem is not an unconditional closure: its axiom closure still
inherits the unique-radius `sorryAx`.

## 2. Scope of this continuation

The next bounded target is the **p5 exact-two constructor** in the fixed-card-11
coverage:

```text
p4 exact-two | p5 exact-two | aligned p5
```

The aligned-p5 constructor is closed. The p4 and p5 finite formulas are
externally banked, but neither yet has the complete Lean
source-to-valuation-to-LRAT bridge.

The arbitrary-card part of the same unique-radius arm is a separate geometric
frontier. Its admissible aggregate outputs are the existing p4 three-row
Kalmanson occurrence, `CriticalFiberClosingCore`, or a contract-complete
alternative `IsM44`, derived from the full critical/MEC/no-M44 parent data.
Fixed-card certificate work does not replace that theorem.

Closing p5 alone will therefore:

- close one fixed-card-11 constructor;
- leave p4 exact-two open;
- leave the arbitrary-card unique-radius arm open;
- leave the separate bi-apex robust residual open;
- not, by itself, remove either production `sorry`.

Do not broaden this session into literal CEGAR, another local metric consumer,
or a bare escape adapter. The p5 blocker is an aggregate certificate ingress,
not a missing terminal theorem.

The maintained strategy documents are:

- [`closure plan`](../closure-plan-full-spec-2026-07-09.md);
- [`closure matrix`](../closure-matrix-2026-07-09.md).

## 3. Pushed p5 checkpoint

The primary checkpoint report is:

- [`unique4-exact-two-core-map/README.md`](../../scratch/atail-force/unique4-exact-two-core-map/README.md)

The selected p5 target is:

```text
p5.greedy-family-largest-seed0.json
```

Its compact external formula has:

- 18 retained families;
- 9,412 clauses;
- 616 dense variables;
- only source atoms of the forms `m`, `eq`, and distinguished `class`;
- no auxiliary SAT variables.

The compact formula is **externally UNSAT** under CaDiCaL. That is exact
discovery evidence, not yet a kernel theorem. Direct replay of the untrimmed
LRAT was too large, so the active route is:

```text
DRAT backward trim
  -> compact normalized LRAT
  -> kernel-checked UNSAT theorem
  -> authenticated clause-occurrence map
  -> direct/mirror source valuation
  -> p5 exact-two contradiction
```

The committed source-map artifacts are compressed:

```text
scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json.gz
scratch/atail-force/unique4-exact-two-core-map/p5.input-core-map.json.gz
```

On a fresh checkout, materialize only the map currently needed:

```bash
gzip -dk \
  scratch/atail-force/unique4-exact-two-core-map/p5.input-core-map.json.gz
```

The uncompressed p4 and p5 maps are approximately 114 MB and 144 MB and are
intentionally uncommitted.

## 4. Already validated Lean-side components

These scratch components are useful and source-clean, but remain conditional
consumers until the aggregate ingress is complete:

- [`CardElevenExactTwoBoundaryPackets.lean`](../../scratch/atail-force/unique4-exact-two-occurrence/CardElevenExactTwoBoundaryPackets.lean)
  supplies the direct-or-mirror p4 and p5 boundary packets.
- [`ExactTwoSchemaDecoder.lean`](../../scratch/atail-force/unique4-exact-two-schema-decoder/ExactTwoSchemaDecoder.lean)
  contains the four decoded schema consumers.
- [`Kalmanson`](../../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/)
  contains source-clean Kalmanson occurrence adapters.
- [`MirrorSchema58.lean`](../../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58/MirrorSchema58.lean)
  contains normalized schema-5/schema-8 mirror terminals.
- [`Curvature`](../../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/)
  contains the source-clean four-disjoint-retained-mask contradiction.
- [`TrimmedOccurrenceGenerator`](../../scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/)
  contains a fail-closed mapper for the eventual trimmed certificate.

The checked scratch theorem closures use only the ordinary core axioms
`propext`, `Classical.choice`, and `Quot.sound`. Recheck any promoted or
regenerated theorem with `#print axioms`; do not infer source cleanliness from
a successful build.

The mirror ingress still needs the source Boolean reindexing

```text
ρ(i) = -i mod 11
```

and construction of the normalized mirror occurrence. No indexed-source Lean
module exists yet.

## 5. Exact remaining p5 bridge

The p5 contradiction needs both halves below.

### A. Kernel-checked certificate theorem

Generate a trimmed CNF/LRAT package whose hashes and clause numbering are tied
to the selected 18-family p5 formula, then elaborate its UNSAT theorem in Lean.

The local materializer is:

```text
scratch/atail-force/unique4-exact-two-core-map/
  materialize_trimmed_reduced_core.py
```

It is currently **not ready for a production run**. Its publication block still
contains stale names from an earlier pipeline design, including:

```text
raw_lrat
final_raw_lrat
normalized_original_lrat
final_normalized_original_lrat
input_to_core_alias
remap_stats
```

The live pipeline variables instead distinguish the original, core, and
selected LRAT stages. Repair the manifest and clause-numbering payload
coherently; do not merely substitute names until the artifact relationships are
clear. The draft parses, but no tiny test has yet passed through final
publication. The production trimmed certificate JSON, trimmed CNF/LRAT, and
occurrence map do not yet exist.

The intended fallback is structurally conservative but still unverified
end-to-end: it extracts a core-relative DRAT, verifies that proof against the
trimmed core, emits a core-relative LRAT, and normalizes learned clause IDs
using the trimmed-core base count. The current normalizer does not remap base
clause IDs.

After repair, run the isolated self-test:

```bash
env UV_CACHE_DIR=/tmp/uv-cache-materialize-trimmed \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/materialize_trimmed_reduced_core.py \
  --self-test \
  --prefix trimmed-reduced-core-self-test \
  --timeout-seconds 300
```

Then run the selected production target:

```bash
env UV_CACHE_DIR=/tmp/uv-cache-materialize-trimmed \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/materialize_trimmed_reduced_core.py \
  scratch/atail-force/unique4-exact-two-core-map/p5.greedy-family-largest-seed0.json \
  --prefix p5-largest \
  --timeout-seconds 7200
```

Do not run this concurrently with another Lake owner; the materializer uses the
shared `lean/.lake/lake-build.lock`.

### B. Source-to-formula satisfying valuation

Define the source valuation for every dense atom in the selected formula:

```text
m(c,p)
eq(c,l,r)
class(p)
```

The theorem must start from the live direct-or-mirror p5 exact-two packet and
prove every authenticated retained clause, including the reflected indexing
for `ρ(i) = -i mod 11`. It must not assume a solver-selected row assignment as
new geometry.

There is currently no
`scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource/` module.
Create both the Lean source and:

```text
scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource/validate.sh
```

The validator must run Lean with `-DwarningAsError=true` under the shared build
lock and print the axiom closure of the aggregate theorem.

## 6. Occurrence-map gate

Once the trimmed certificate exists, validate the map generator:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py \
  --self-test
```

Then generate the production occurrence map:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py
```

Optional Lean data output:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py \
  --lean-output \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/P5LargestTrimmedClauses.lean
```

This tool checks hashes, contiguous clause IDs, literal order, the dense
renaming bijection, unique occurrence allocation, and family membership. It
does **not** prove geometric source satisfaction or UNSAT.

## 7. Acceptance gates

Do not mark p5 closed until all of the following hold:

1. `drat-trim` verifies the selected certificate.
2. The materializer report authenticates the greedy input, source map, dense
   CNF, trimmed core, clause numbering, and LRAT hashes.
3. The generated Lean certificate theorem elaborates with
   `-DwarningAsError=true`.
4. `#print axioms` records the exact certificate checker boundary and no
   `sorryAx`.
5. The direct and reflected source valuations prove every retained clause.
6. The occurrence map passes its production hash audit.
7. A focused composition theorem combines the source valuation with the UNSAT
   theorem to eliminate the p5 exact-two packet.
8. That theorem is wired into the fixed-card-11 p5 constructor and the live
   spine is reminted.

After p5, perform the analogous p4 bridge. Only after p4, p5, and aligned-p5
coverage compose should the fixed-card-11 branch be described as closed. The
arbitrary-card unique-radius and bi-apex robust frontiers remain separate.

## 8. Worktree and ownership cautions

This is a dirty, multi-agent worktree. Preserve unrelated changes and stage
only owned paths.

At handoff time, these exact-two files were local-only:

```text
scratch/atail-force/unique4-exact-two-core-map/materialize_trimmed_reduced_core.py
scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json
scratch/atail-force/unique4-exact-two-core-map/p5.input-core-map.json
scratch/atail-force/exact5-bv-encoding-profile/normalize_lrat_for_lean.py
```

The raw maps are intentionally local. The materializer and LRAT normalizer are
not: once repaired, validated, and reviewed, they should be committed with
their report and generated small artifacts.

Do not manually edit `docs/live-blueprint.md`; it is generated after builds.
Do not stage unrelated exact-five, card-≥14, `surplusM44`, or other agents'
scratch changes.

## 9. First actions for the new session

1. Run the live blueprint and git commands from section 1.
2. Read the core-map README and the materializer publication block.
3. Repair the materializer and pass its isolated self-test.
4. Generate and Lean-check the trimmed p5 certificate.
5. Generate the authenticated occurrence map.
6. Implement the direct/reflected indexed-source valuation.
7. Compose and validate the p5 contradiction.
8. Update the closure plan and matrix with evidence, not projected status.

If the materializer cannot produce a small replayable LRAT, record the exact
size/time/failure mode and revise the certificate representation. Do not
replace the aggregate bridge with another queue of literal local witnesses.
