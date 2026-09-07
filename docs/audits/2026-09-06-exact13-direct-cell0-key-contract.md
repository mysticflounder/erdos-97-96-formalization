# Direct cell-zero witnessed-key contract

Lane: `exact13-direct-cell0-key-contract-20260906`

Base: `9852eb8cb5f8283d7f5a8e0d06508590c45934bc`

Scope: solver-free encoding and replay prerequisites; no Lean closure claim.

## Why this checkpoint is needed

The retained direct-cell run checked its models with the legacy coarse
`validate_cell`, not the full occurrence-witness predicate of the current
source-indexed `Key.Valid`. The wave-5 computational audit found only mirror
orientations in its 20,001 new and 36,000 imported model records. Neither set
establishes direct-cell-zero coverage of the current source-key domain.

There is a concrete false positive in the older coarse domain. The final
direct-cell model has `z=8` and

```text
C0 = {1,2,6,12}      C1 = {0,3,5,11}
K  = {4,7,9,10}     L  = {5,8,11,12}
T  = {2,6,7,11}
```

The second apex is raw label 0. The full occurrence equations require the
blocker containing 0 to have the form `{0, ell} ∪ E`, where `ell ∈ L \ {z}`
and `E` is disjoint from `L`. Here that blocker is `C1`, but `C1 ∩ L = {5,11}`.
Thus this coarse model has no such occurrence witness. Rejecting it is a
source-domain correction, not a new geometric contradiction.

The retained model and its 469 candidate cuts are recorded in
`scratch/runs/exact13-cell0-coverage-20260905/run-0001/events/cell-000-coverage-batch.json`.
This checkpoint neither imports those cuts nor changes their original records.

## Exact restricted domain

The source catalog is a finite set, not a numbered list. This lane uses the
explicit value `(direct, 8, {9,10})`, called cell zero by the legacy producer.
Its source condition is

```text
P.idx = directIndex P.profile
X.tightSupport.zraw = 8
X.tightSupport.Kraw ∩ secondOppositeInterior secondOpposite = {9,10}.
```

The source signature already supplies `P.profile = secondOpposite`.
`exact13CoarseCellOfSignature` records precisely the orientation, `zraw`, and
this raw `K` intersection. The first apex is raw label 1 and the second apex
is raw label 0; raw labels are not positional indices.

Independent read-only verification by `luna-swarm-radius-scribe` (coordination
record 16759, same base revision) confirmed these three fields against
`CardGeThirteenExact13CoarseCellCatalog.lean` and `sourceOrderValid` in
`CardGeThirteenExact13SourceOrderBridge.lean`. The coarse partition also
forces `L ∩ I2 = {8,11,12}`; that is not an extra arbitrary source assumption.

The adapter starts from the corrected wave-3 witnessed-key root and all
1,815 guarded global one-boundary clauses. It adds only direct orientation,
`z=8`, and the five signed `K`-membership pins on `{8,9,10,11,12}`. It retains
all occurrence witnesses and introduces no variable, learned cut, solver call,
cross-orientation certificate transport, or existential-witness block.

## Validation

Main-agent validation after independent source review and implementation review:

```bash
PYTHONDONTWRITEBYTECODE=1 uv run --no-cache pytest -q -p no:cacheprovider scripts/test_exact13_direct_cell0_key_contract.py
uv run --no-cache ruff check --no-cache scripts/exact13_direct_cell0_key_contract.py scripts/test_exact13_direct_cell0_key_contract.py
```

Results: **8 tests passed**; Ruff passed. The in-memory restricted root has
432 variables and 31,290 clauses. Its seven pin literals are
`(-328, 243, 36, 37, -35, -38, -39)`. The comment-free `cnf.dimacs()` bytes
have SHA-256 `af3bc4eea3b3b076cf3bf30cef92e88c8d171bc20884c2fd51a46b1ded071597`.

Tests check that both the CNF export object and the retained clause tuple
contain the complete restriction, and that changing each pin rejects the
synthetic positive assignment. The positive assignment is inlined for clean
clone replay: it comes from wave-5 `imported-6000.json` (SHA-256
`2ee72ca033d4619cafd0364299d5aef7660eb8e17ec625882762dc3690fb9af4`), with its
orientation bit changed to direct. It satisfies every restricted clause and
passes the current full witnessed-key and guarded-intersection replay. This
is a synthetic finite assignment, not a geometric realization or a transported
cancellation certificate. No test requires the ignored wave-5 artifact tree.

The independent occurrence checker rejects the retained coarse false positive,
accepts an explicit witness-bearing core, and enumerates both ordered endpoint
choices. These are finite replay and mutation checks, not a Lean soundness
proof of the checker or the encoder.

Revalidation on September 7 at `f4b6491afd5d115e08e73c02afe443afafca04f5`
again passed all eight tests and Ruff, with unchanged dimensions and DIMACS
digest. The lane checkpoint retains its original base revision as provenance;
the later validation revision does not replace that base. This adapter
deliberately preserves the 1,815-guard root and does not incorporate the
separate third-apex successor's 550 additional clauses or wave-7 bank. It is
not a claim about the strongest current finite domain.

## Coverage obligation and consumer

The active covering plan is
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, phase 4. The immediate
residual is `false_of_cardGeThirteenAnchoredOutcome_exactThirteenFinite`,
and the final consumer is `Problem97.erdos97_rhs`. Its measure is remaining
admissible uncovered finite leaves.

For a source input satisfying the explicit cell predicate above, the missing
statement remains: some checked bank entry covers that input. The existing
`entry_covers_of_key_match` and `false_of_entry` consume a matching entry;
neither produces one. A global `StrongValidKeyCover` would suffice for all
inputs, but is stronger than this restricted task and remains unproved.

This checkpoint adds no Lean predicate or placeholder, changes no coordinator,
and claims no decrease in the proof-frontier measure. A future computation
must use this witnessed domain, retain its residual models and certificates,
and supply a checked exhaustive cover before closing the source branch. The
new restricted CNF's source-to-assignment lift and exhaustive coverage are not
formalized by this Python adapter.

## Separate bounded lead

The existing record-2 two-center certificate was replayed independently during
this preflight with

```text
uv run python scripts/certify_exact13_record2_full_cone.py --verify
  scratch/runs/cardge13-exact13-record2-full-cone-20260906/run-0001/record-002-two-center-closure.json
```

The verifier exited 0: 493/495 single-center rejections at center 2, 491/495
at center 7, and all eight remaining support pairs rejected. Its retained
self-hash is `d4917880cdcee033890611d83c0c3736d40da24d64b8c05ad17bed418ef6f3be`.
This is an exact finite replay of one fixed quotient group, not direct-cell
coverage or a Lean theorem. No solver was launched. The independent source
audit found that record 2 has raw `z=9` and `K ∩ I2={8,12}`, so it is not this
cell. Equality-quotient grouping supplies no source-preserving relabeling
theorem. The record is therefore excluded from this cell-zero implementation.

## Trust and ownership

The read-only `proof-blueprint refs --check` reported a stale kernel graph;
no refresh, Lean build, axiom audit, or publication gate was run in this lane.
Source searches therefore serve only as compatibility preflight, not current
kernel reachability evidence. All pre-existing dirty paths are foreign and
were left unchanged. Whole-bank coverage and wave-6 recovery are separate
lanes; this checkpoint does not adopt their results.
