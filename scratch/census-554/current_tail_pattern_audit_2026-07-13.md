# Census-554 current-tail pattern audit

Date: 2026-07-13 PDT

## Verdict

The 307 rows appended after the frozen 5,632-row equality-core snapshot do
**not** expose a new repeated general theorem family.

- All 307 rows miss the original four equality-closure families.
- The tail has 306 arbitrary-relabeling motifs, and all 306 are new relative
  to rows 1--5,632.
- There is only one exact unlabeled motif repetition in the tail: two rows.
- A broader scan against the current 18 eligible unordered structural
  detectors finds 32 perpendicular-bisector/convex rows and no other current
  family.  Those 32 distinct full motifs minimize to four core motifs, all
  four already present before row 5,633.
- The remaining 275 rows give 274 new unlabeled motifs and hit none of the
  current unordered theorem families.  Their coarse size profiles repeat, but
  that is not enough evidence for a geometric theorem schema.

Thus the theorem-level result of the tail is **reuse**, not discovery:
`PerpBisectorCore` remains productive, while no fifth equality-only family is
justified by repetition in this tail.

## Epistemic labels

- **CURRENT SNAPSHOT / STRUCTURALLY VERIFIED:** row counts, hashes, JSON
  validity, certificate path inventory, and duplicate accounting below were
  recomputed from the live bank in this audit.
- **EMPIRICALLY VERIFIED BY READ-ONLY MINERS:** arbitrary-relabeling motif
  counts, equality-closure status, detector hits, and greedy core
  minimization.  These are deterministic Python analyses, not Lean proofs.
- **SOURCE-PROVED WITH HASH-BOUND PRIOR BUILD EVIDENCE:** the current
  `PerpBisectorCore` theorem source matches the theorem-catalog hash.  The
  catalog records its aggregate build and axiom audit as passed.  This audit
  did not rerun Lean or `proof-blueprint`.
- **NOT RUN:** the full exact replay of all 5,938 distinct bank certificates.
  The structural audit sees 142,380,092,453 certificate bytes and explicitly
  reports `exact_identity.status = NOT_RUN`.
- **NOT CLAIMED:** Census cover completeness, a new geometric obstruction,
  or stabilization/non-stabilization as a theorem.

## Required preflight

Before interpreting the tail, this audit inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling-bank registry and the 5,632-row Census-554 equality-closure lift;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- `certificates/census554_general_n_core_mining.{md,json}`.

The following indexed-corpus searches were run before assessing theorem
families:

```bash
nthdegree docs search --lean \
  "Census554 equality closure duplicate center equal K4 equilateral bisector three triad"
nthdegree docs search --lean \
  "Census554 pattern bank seven point circle collision equality core"
nthdegree docs search --lean \
  "distance equality rows finite support generalized collision core"
```

They returned the current `Census554.EqualityCore`,
`FivePointCollision`, and the later six-/seven-point collision modules.  They
did not reveal a separate theorem indexed specifically for the post-5,632
tail.

## Frozen current bank identity

The bank identity was checked at the beginning and again after the analyses:

```text
path:              scratch/census-554/bank.jsonl
raw rows:          5,939
raw SHA-256:       02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2
normalized rows:   5,938
normalized SHA-256:c1a876f3379d9a4360508dcb3e2a95d6de3e6c846556ae92a055c00533dc1b2a
tail rows:         307 (rows 5,633--5,939; pids pat_05632--pat_05938)
```

The one-row difference between raw and normalized counts is the preserved,
proof-identical duplicate `pat_00003` at raw rows 4 and 192.  It predates the
audited tail.

The current structural bank audit reports:

- status `STRUCTURAL_PASS`;
- 5,938 referenced certificate paths and 5,938 certificate files;
- no missing or orphan certificate file;
- no unexplained PID or Census-AUTOS canonical duplicate;
- no active `.bank-transaction.json`; and
- exact replay `NOT_RUN`.

The broad unlabeled-motif quotient used below permits an arbitrary relabeling
of the finite pattern support.  This is intentionally broader than the
Census-specific 72-element `AUTOS` quotient used by the bank admission audit.
Accordingly, two rows can be the same unlabeled local motif while remaining
legitimate, distinct Census role placements.

## Reproduction commands

Bank identity and structural audit:

```bash
wc -l scratch/census-554/bank.jsonl
shasum -a 256 scratch/census-554/bank.jsonl
.venv/bin/python -m census.census_554.bank_audit \
  --root scratch/census-554 \
  --out /tmp/census554-bank-audit-5939.json
```

The existing equality-core miner was run without Lean emission:

```bash
.venv/bin/python scripts/census554-general-n-core-miner.py \
  --bank scratch/census-554/bank.jsonl \
  --lean-bank-dir lean/Erdos9796Proof/P97/Census554/Bank \
  --prefix-checkpoint 5632 \
  --recent-count 307 \
  --top-limit 1976 \
  --out /tmp/census554-current-tail-5939-all-motifs.json
```

Two read-only `.venv/bin/python -c` scans then imported
`census.census_554.formalized_structural_oracle` and applied:

```python
detect_stage(row["pattern"], stage)
minimize_unordered_pattern(row["pattern"], stage)
```

to every tail row and every eligible unordered stage.  The minimized patterns
were passed through the same arbitrary-support `canonical_key` used by
`census554-general-n-core-miner.py`.  No source, bank, certificate, or Lean
file was changed.

## Delta from the 5,632-row equality-core snapshot

The original miner recognizes four order-independent, equality-only
obstructions in precedence order: duplicate center, equal K4,
equilateral-bisector collision, and three-triad collision.

| Primary status | Rows at 5,632 | Rows at 5,939 | Tail delta | Motifs at 5,632 | Motifs at 5,939 | Motif delta |
|---|---:|---:|---:|---:|---:|---:|
| duplicate center | 1,148 | 1,148 | 0 | 27 | 27 | 0 |
| equal K4 | 283 | 283 | 0 | 5 | 5 | 0 |
| equilateral bisector | 1,116 | 1,116 | 0 | 31 | 31 | 0 |
| three triad | 230 | 230 | 0 | 9 | 9 | 0 |
| outside all four | 2,855 | 3,162 | **307** | 1,598 | 1,904 | **306** |
| **total** | **5,632** | **5,939** | **307** | **1,670** | **1,976** | **306** |

Every one of the 10,635 role-labeled orbit instances represented by the tail
therefore remains `other` under the original four-family miner.

This is stronger than saying that the newest patterns merely have different
PIDs: the arbitrary-support canonical quotient finds 306 new motifs versus
the prefix.  The original four-family counts are literally unchanged.

## Tail shape distribution

The 307 rows have:

| Attribute | Distribution |
|---|---|
| support size | 128 on 6 labels; 179 on 7 labels |
| selected centers | 3 with 4; 57 with 5; 194 with 6; 53 with 7 |
| equality generators | 15 with 8; 120 with 9; 30 with 10; 142 with 11 |
| certificate kill tag | 50 `base`; 102 `multi_pair`; 155 `pair` |

There are only 26 coarse signatures if one remembers just support size,
number of centers, the multiset of row-mask sizes, and generator count.  The
five most frequent are:

| Rows | Support | Centers | Mask-size multiset | Generators |
|---:|---:|---:|---|---:|
| 54 | 6 | 6 | `2,2,2,3,3,3` | 9 |
| 50 | 7 | 6 | `2,2,3,3,3,4` | 11 |
| 36 | 7 | 7 | `2,2,2,3,3,3,3` | 11 |
| 27 | 6 | 5 | `2,2,3,3,4` | 9 |
| 26 | 6 | 6 | `2,2,2,2,3,4` | 9 |

These repetitions are bookkeeping regularities, not geometric cores.  Within
those 26 coarse bins the full arbitrary-relabeling quotient still has 306
motifs.  A theorem-family claim based only on mask sizes would therefore be
unverified.

## The sole exact unlabeled repetition

Only one arbitrary-relabeling motif occurs twice.  Its canonical rows are:

```text
0 : {1,2}
1 : {0,2}
2 : {0,3,4}
3 : {0,4,5}
4 : {1,3}
5 : {2,3,4}
```

The two occurrences are:

| PID | Stored kill | Orbit count |
|---|---|---:|
| `pat_05899` | `pair:7-8` | 36 |
| `pat_05915` | `pair:7-9` | 72 |

Both miss all 18 current unordered structural detectors.  This is a real
local-pattern repetition, but two isomorphic instances establish only one
fixed certificate motif.  Without a recurring smaller checked core or a
geometry theorem, it is not evidence for a new parameterized theorem family.

## Comparison with the current broader theorem catalog

The source currently exposes 18 eligible unordered detectors in
`formalized_structural_oracle.UNORDERED_FAMILIES`: the original four, the
later source-proved equality-collision families, and the convex-independent
perpendicular-bisector core.  The order-sensitive convex five-point and
rhombus families were not applied because a bank row alone does not carry a
compatible cyclic boundary order.  Exact-off-circle remains deliberately
ineligible because a selected row is not an `ExactAt` assertion.

The scan result is:

| Current unordered family | Tail rows | Tail role-labeled orbit instances |
|---|---:|---:|
| perpendicular-bisector/convex | 32 | 936 |
| every other current unordered family | 0 | 0 |
| no current unordered family | 275 | 9,699 |

The 32 hits range from `pat_05693` through `pat_05934`.  They comprise 14
six-label and 18 seven-label rows, and all 32 full unlabeled motifs are
distinct and new relative to the prefix.

However, minimizing only the row equalities needed by
`equality-perpendicular-bisector-convex` gives four canonical core motifs:

| Tail rows | Canonical minimized rows | Already before 5,633? |
|---:|---|---|
| 17 | `0:{1,2}; 1:{2,3,4}; 2:{1,3,4}` | yes |
| 8 | `0:{1,2}; 1:{0,3}; 2:{0,3}; 4:{1,2}` | yes |
| 6 | `0:{1,2}; 1:{0,2}; 3:{0,1}; 4:{0,1}` | yes |
| 1 | `0:{1,2}; 1:{0,2,3}; 2:{0,4}; 4:{2,3}; 5:{1,4}` | yes |

Across the full prefix, the same detector already hit 1,183 rows and reduced
to 15 canonical minimal motifs.  The tail adds no new minimal
perpendicular-bisector motif.  This explains the apparent tension:

```text
32 new full motifs
    -> 4 old minimized cores
    -> 1 already-formalized general theorem
```

The relevant current Lean declarations are
`EqualityCore.PerpBisectorCore` and
`false_of_convexIndep_of_perpBisectorCore` in
`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean`.  Its current source
SHA-256 is
`d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82`,
which matches the structural-oracle catalog.  Reconstructing the catalog also
checked every recorded theorem-source and build-artifact hash; it records a
passed aggregate build and the axiom set `propext`, `Classical.choice`, and
`Quot.sound` at `2026-07-14T01:30:43Z`.  That is hash-bound prior evidence,
not a fresh build by this audit.

## Generalization decision

### Existing family to reuse

**Perpendicular-bisector/convex core: REPEATED, GENERAL, ALREADY PROVED.**

The tail supplies 32 additional applications but no new theorem statement.
Any future structural cache should minimize these rows to the existing core
and retain exact theorem/source provenance rather than bank 32 theorem names.

### Fixed motif, not yet a family

**`pat_05899` / `pat_05915`: EMPIRICALLY REPEATED, NOT GENERALIZED.**

This pair is worth retaining as one unlabeled bank motif.  It is not enough to
propose new geometry, especially because it misses every current unordered
detector and its stored exact certificates are algebraic back ends rather
than a human theorem schema.

### Remaining tail

**274 unlabeled motifs among 275 rows: NOVEL-AGAINST-PREFIX, UNCLASSIFIED.**

The absence of repetition is evidence against selecting a new theorem family
from this bounded tail.  It does not prove that no shared subcore exists.  A
future pass would need an independently motivated invariant or order-aware
metadata and repeated minimized witnesses; deriving one-off geometry from
these rows is not justified by the current counts.

## Recommended action

1. Update the next read-only snapshot miner to report the existing
   perpendicular-bisector family alongside the original four.  The current
   four-family `other` count hides 32 already-handled tail rows.
2. Reuse the four existing minimized perpendicular-bisector seeds; do not add
   a new Lean theorem family for the 32 superpatterns.
3. Keep `pat_05899` / `pat_05915` as one fixed unlabeled motif candidate only.
   Promote it only if a separately checked recurring smaller core emerges.
4. Do not infer motif-alphabet stabilization or Census completeness.  The
   current exact replay and terminal cover gates remain open.

No new geometry was derived or formalized in this audit.
