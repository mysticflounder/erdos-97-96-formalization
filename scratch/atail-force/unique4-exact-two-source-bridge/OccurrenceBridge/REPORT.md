# OccurrenceBridge: trimmed-clause satisfaction for the p5 valuation

Lane anchor: session `c188f5d9`; this directory is the lane's only owned
path (`IndexedSource/` is landed and frozen at `024626d0`; companion
lane `019f9077` owns the trimmed-certificate materializer half,
including `TrimmedOccurrenceGenerator/`, whose production JSON this lane
reads but never writes).

## Deliverable

For the authenticated trimmed occurrence map
`TrimmedOccurrenceGenerator/p5-largest.trimmed-occurrence-map.json`
(sha256 `7ddd7a6f…`, 8,703 trimmed clauses over 616 dense variables, no
auxiliary variables), prove in Lean that every stored clause is
satisfied by the `IndexedSource` bridge valuation

```
bridgeVal Q σ : Nat → Prop := fun n => interpAtom Q σ (atomOfVar n)
```

for ANY packet geometry `Q` and index transport `σ` carrying a
`DenseFamilySatisfaction Q σ` record — the composition seam documented
at the end of `IndexedSource/FAMILY_ROUTES.md`.

Top-level statements (`BridgeMain.lean`):

- `bridge_clauses_sat : DenseFamilySatisfaction Q σ →
  ∀ clause ∈ bridgeClauses, clauseSat (bridgeVal Q σ) clause`
- `bridge_clauses_bool_sat`: the classically-decided Boolean assignment
  `fun n => decide (bridgeVal Q σ n)` evaluates every stored clause to
  `true` (the `FAMILY_ROUTES.md` seam form);
- `bridge_clauses_sat_direct` / `bridge_clauses_sat_mirror`: composed
  with the frozen `IndexedSource` branch aggregates;
- `exists_bridge_satisfying_packet`: every `(5,5,4)` exact-two residual
  reaches a boundary packet whose own geometry satisfies all 8,703
  trimmed clauses in the packet's realized orientation;
- `bridgeClauses_length : bridgeClauses.length = 8703`.

## Mechanism

| module | content |
|---|---|
| `BridgeCore` | `DenseAtom`, closed-form `varOfAtom`/`atomOfVar` (encoder numbering, round-trip kernel-checked over all 616 valid atoms), `bridgeVal`, `litSat`/`clauseSat`, literal-subset transfer |
| `BridgeFamilies` | `ClauseShape` (14 constructors covering the 18 retained families), Boolean `shapeWF`/`entryWF` kernel checks, `instLits` builders, per-family satisfaction lemmas, `shape_sat` dispatcher, `entryList_sat` |
| `BridgeChunk01–40` | generated `BridgeEntry` data (stored clause verbatim + shape parameters), one `by decide` WF theorem per chunk |
| `BridgeChunkAll` | generated concatenation `bridgeEntries` + assembled `bridgeEntries_wf` |
| `BridgeMain` | clause list, main theorem, Boolean corollary, packet corollaries |

Each `BridgeEntry` stores the map's `exact_dense_signed_clause` verbatim
plus its family's shape parameters.  `entryWF` kernel-checks (a) the
shape's side conditions (exactly those the matching
`DenseFamilySatisfaction` field needs: distinctness, cap membership,
strict target chains, distinct role points) and (b) that every
instantiated literal occurs in the stored clause.  Satisfaction is
proved for the instantiated literals and transferred by literal subset,
so stored-clause literal ORDER is irrelevant and extra literals only
weaken the clause — sound by construction.

Generation (`generate_bridge_data.py`) is sha256-gated on the map and
re-derives every literal from the closed-form dense numbering and
mirrored Kalmanson schema tables, failing fast on any mismatch with the
stored clauses; the Lean `decide` checks are authoritative.

Kalmanson entries name a schema index into the frozen
`seededCutSchemas` (8 entries) / `retainedBankSchemas` (18 entries)
lists plus the increasing target embedding; the map's
forward/reflected orientation maps to the normalized/`reflectSchema`
list positions.  The trimmed core uses 16 of the 18 retained bank
schema/orientation pairs (none for schema 5 reflected or schema 7
reflected) and all four seeded records in both orientations.

## Validation status

VALIDATED 2026-07-23. `validate.sh` (lock-acquiring, full LEAN_PATH
chain, `-DwarningAsError=true`) builds all 44 modules with zero errors;
per-chunk `decide` ≈ 5–7 s.  All `#print axioms` outputs show exactly
`[propext, Classical.choice, Quot.sound]`, in particular:

```
'Problem97.P5OccurrenceBridgeScratch.bridge_clauses_sat' depends on
  axioms: [propext, Classical.choice, Quot.sound]
'Problem97.P5OccurrenceBridgeScratch.exists_bridge_satisfying_packet'
  depends on axioms: [propext, Classical.choice, Quot.sound]
```

## What this does and does not prove

- It proves the stored clause list `bridgeClauses` — the occurrence
  map's trimmed clauses verbatim, in map order — satisfiable by the
  packet's own geometry, i.e. the source side of the p5 contradiction.
- It does NOT replay the trimmed UNSAT certificate (companion lane) and
  closes no production `sorry`.  The remaining seam with the companion
  half is one list equality: its replay clause list against
  `bridgeClauses` (both ground terms, decidable).
- `false_of_originalFrontierUniqueRadiusArm` additionally needs the p4
  profile and the arbitrary-cardinality reduction.
