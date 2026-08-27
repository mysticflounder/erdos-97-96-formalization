# Rigid221 CEGAR risk audit and theorem-mining report

**Audit date:** 2026-08-26
**Primary verdict:** `CROSS_CARDINALITY_EVIDENCE_INSUFFICIENT`
**Secondary verdicts:** `ENCODING_TOO_WEAK`, `ONLY_RELAXED_SURVIVORS_FOUND`

## 1. Decision

The existing corpus does **not** materially reduce the theorem risk in the live
`|A| >= 18` Rigid221 branch. It supports neither a cardinality-independent
contradiction nor a source-faithful bounded-obstruction extraction.

The audit does establish three useful negative results:

1. There is no declaration named `Rigid221LargeResidual`; the actual live
   boundary is a dependent context built from
   `ExactFourRigid221PentagonBlockerVResidual`, its source-heavy parent packet,
   and five additional branch hypotheses.
2. The exact-17 route is definitionally fixed to `Fin 17`. Its Boolean corpus
   cannot reach the `|A| >= 18` leaf without a separate lift, and retained
   decoded assignments show that the current unconditional base-CNF-UNSAT
   subgoal is too strong.
3. The strongest authenticated UNSAT computation is a fixed exact-12/A5
   selector cell. Its 472-clause core is source-available for that cell only;
   it supplies no selector coverage and no large-cardinality conclusion.

No full-packet survivor was found. The retained SAT objects are incidence or
row/order shadows and are explicitly separated from Lean residual models.
Consequently the audit does not use `FULL_PACKET_SURVIVOR_FOUND` or
`ROUTE_TERMINAL_REFUTED`: a weak abstraction can survive even when the Lean
terminal is true.

The exact theorem to attack next is the existing open
`..._card_ge_eighteen` declaration recorded in Candidate 1 of
`candidate_lemmas.md`. A post-audit decision review refined the first useful
milestone: extract the existing large-cardinality three-profile source-pair
producer from its off-class residual wrapper and apply that residual-neutral
ingress in the live `BlockerV` context. Cross-centre incidence production comes
after that ingress, not before it. No new exact-17 model-cut wave is warranted.

## 2. Evidence and source freeze

### 2.1 Repository boundary

The audit began at Git head
`e0947a71f8b854ffcd37ae015433fc5b202fe49e` on `main`, with 402 dirty paths and
no staged paths in the shared worktree. Parallel work advanced `HEAD` during
the audit first to `0b752f3a2e3ffdb1f25ad0e27a05e18432d8fbfa` and then to the
final validation head `5fd08c68fe84516d08e4997f61b7fb274ff078c6`. The three Lean
authority files used here remained byte-identical across those transitions:

| Authority file | SHA-256 at both heads |
|---|---|
| `Rigid221SourceHeavy.lean` | `dbe0e37c1b6562249ff41d0754bed606c58fe70efe93ed267230d0b773318c99` |
| `BlockerVExactSeventeenSourceNormalForm.lean` | `92cf2a9ce4e16d27d8d15c15880631eae0f534e377c9d7c4561bd863a6a567ab` |
| `Rigid221Closure.lean` | `cafeac3e4bbcabfbe6ffcf1443e4d9b93c717627e5144c6158040aff5676efa8` |

A post-audit decision review checked the recommendation against public-main
head `f9d505042c777db94c8c592683698352604bdf84`.
`Rigid221SourceHeavy.lean` still had the frozen hash above, so the refinement
changes the work order but not the source or corpus boundary.

The bundle records every model, report, certificate summary, manifest, or
source file actually read in `evidence_manifest.csv`, with byte count and
SHA-256. Foreign dirty work was not edited, staged, or cleaned.

### 2.2 Toolchain and publication spine

| Component | Frozen value |
|---|---|
| Lean | `4.27.0`, commit `db93fe1608548721853390a10cd40580fe7d22ae`, arm64 macOS |
| Lake | `5.0.0-src+db93fe1` |
| mathlib revision | `a3a10db0e9d66acbebf76c5e6a135066525ac900` |
| cached kernel build fingerprint | `5902ba928947b2ac2fda7b3cc06ff430f9e95f86f9046c96043581865b0a536c` |
| cached live-sorry build identifier | `dd97b61efbfa` (2026-08-13 snapshot) |

The proof-blueprint source index matched disk at the freeze, but the mined
kernel reference graph had 36 stale declarations and one never-mined
declaration. `verify-publish --no-refresh` stopped at a reachable `sorry` and
did not invoke the kernel. Ten Lean files were dirty at the initial check.
Accordingly this audit did not rebuild or refresh the publication spine and
does not present the cached graph as a current-source proof audit. It reports
the exact cached identifiers and uses live source text for the frontier.

### 2.3 Review window and controls

The computational evidence window is 2026-08-03 through 2026-08-26, with
older exact stress artifacts included only as regressions. The prior process
audit and prior project-progress review were treated as baselines; all decisive
claims were rechecked against current source or hashed artifacts.

No Lean build, large SAT run, metric optimization, or new CEGAR campaign was
launched. The report generation parsed existing JSON/CSV/Markdown objects only.

## 3. Exact live Lean boundary

### 3.1 Source-heavy parent packet

`ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket` begins at
`Rigid221SourceHeavy.lean:71`. Its complete field list is:

```text
xu
xv
xu_ne_u
xv_ne_v
source_row_trace
opposite_row_trace
physical_class
blocker_eq_xv
source_pair_interior
```

These fields retain the two named companions, their inequalities, two exact
physical-class row traces, the exact five-class decomposition, actual
source-blocker identity, and the source-pair cap-interior identity.

### 3.2 Live residual packet

`ExactFourRigid221PentagonBlockerVResidual` begins at line 3526. Its complete
field list is:

```text
hsecond
hxuA
hxvA
huXvRow
huNotXuRow
hxvNotXuRow
hdeletedXuRow
hvDeletedRow
huNotDeletedRow
hxuNotDeletedRow
hxvNotDeletedRow
hclassFive
hxvInterior
hblockerInterior
hblockerEqV
htraceBound
htraceBoundXu
```

The live large theorem additionally assumes:

- the `v`-row actual blocker is the prescribed deleted point;
- the deleted-row blocker is in the second-cap interior;
- that blocker is off the physical radius class;
- `18 <= D.A.card`; and
- the next selected row has at most one physical-class hit.

This dependent stack is the source authority. The prose name
`Rigid221LargeResidual` does not occur in current source or at the frozen head.

### 3.3 Exact-17 endpoint and adapters

The bounded route uses:

1. `exactFourRigid221_blockerV_exactSeventeen_secondCapNine_outsideRows_unused_or_exactCover`
   at line 10915;
2. `exists_exactSeventeenSourceRealization_of_exactCover` at line 11099;
3. `ATailBlockerVExactSeventeenSourceNormalForm.SourceRealization`, whose
   boundary is `Fin 17` and whose `card_eq` field fixes the carrier size;
4. the exact-17 cocircular-pentagon-order certificate ingress and promotion
   theorem; and
5. the open cap-nine endpoint at line 11946.

The large leaf follows at line 12003 and is consumed by the cap split beginning
near line 12110. The legacy top-level wrapper is
`false_of_originalFrontierUniqueRadiusArm` in `Rigid221Closure.lean:1724`.

There is no adapter from an exact-17 `SourceRealization` to an arbitrary larger
carrier. The type boundary itself prevents using the finite corpus as an
unbounded proof.

## 4. Predicate crosswalk and implication directions

`predicate_crosswalk.csv` contains 16 audited predicates using only the status
vocabulary required by the specification. It explicitly covers source
identity, blocker provenance, canonical rows, radii, cap membership, order,
omissions, deletion identity and survival, center exclusion, convexity/general
position, global K4/minimality, exact cardinality, Kalmanson cuts, and the five
missing cross-centre incidences.

The load-bearing gaps are:

- complete source-to-actual-blocker provenance is missing from retained EX17
  model objects and only combinatorial in EX12/n16;
- common-radius classes are not retained in any canonical assignment;
- dependent prescribed-deletion survival is absent;
- strict convexity/general position is external to the Boolean row tables;
- the global minimal-counterexample/K4 packet is absent from every finite
  model artifact; and
- the current Lean packet has no producer for all five cross-centre incidences
  needed by the checked tetrahedron terminal.

Soundness directions used throughout the report are:

```text
SAT(weaker encoding) does not imply a Lean-packet model.
UNSAT(stronger encoding) does not imply the Lean packet is impossible.
UNSAT(source-derived finite cell) proves only that named finite cell unless
  selector coverage and a Lean ingress are separately checked.
Exact-17 closure, even if achieved, does not imply the n>=18 branch.
```

## 5. Run inventory

`run_inventory.csv` has 28 rows, one per distinct retained campaign wave,
explicit aggregate wave, or validated-but-unrun lineage endpoint. Multi-seed
and multi-cell runs are grouped only where the repository treats them as one
formula/refinement wave; the seeds/cells and aggregation caveat are recorded in
the row. This includes the historical EX12 source v3--v7 and EX17 schema
C/CDE/CDEF lineages, children 1--46, and the later exact-17 terminals; smoke
tests without a production solver wave are excluded.

### 5.1 R221-LARGE

There is no large source-faithful run. The closest artifact is the n=16
off-class incidence probe: SAT with one row/blocker assignment at profile
`(5,5,9)`. It omits the metric/order/global source packet and lies below 18.

Two FreshThird n=17 finite relaxations are also SAT, but omit aligned-delete,
common-radius, no-alternation, and tri-apex-rich predicates and do not encode
the live large residual.

### 5.2 R221-EX17

The strongest aggregate is the order-0, 28-placement audit:

| Result | Count |
|---|---:|
| Boolean models | 8,280 |
| strict-linear contradictions | 8,259 |
| metric unknown | 21 |
| dated theorem-bank hits | 5,999 |
| dated theorem-bank misses | 2,260 |

The Boolean formula never reached aggregate UNSAT. Later exact certificates,
2,040 dihedral images, and 130,291 PIQD pair-closure clauses reject many current
assignments, but successor assignments remain structural SAT. Child 32 is
UNKNOWN; authenticated children 33--44 are SAT.

The exact-16 Kalmanson probe reports 14 cells and 17,640 linear rejections, but
retains only counts/examples and does not encode the full source packet.

### 5.3 R221-EX12/A5

All 42 placements in the exact12-v2 incidence audit are SAT. The ordered v4
wave has no UNSAT cell; all 12 cells end at iteration limit or structurally
unresolved. Arm-static canaries v1--v21 each replay a SAT witness. Projected v26
sampling reaches at least 300 row cubes.

The exceptions are bounded fixed cells:

- A5/v17 has a verified 472-clause core for one fixed selector;
- exact12 cells 52, 58, 65, and 71 are kernel-checked finite pure-RUP facts.

Neither result includes a proof that every selector enters one of those cells.

## 6. Canonical corpus and model features

The role-preserving symmetry group used here is the identity. The detailed
reason and validation rules are in `symmetry_and_canonicalization.md`.

The builder produces 255 canonical records:

| Population | Canonical records | Meaning |
|---|---:|---|
| EX17 analysis objects | 251 | row/order shadows from 286 retained files |
| EX17 decoded assignments | 2 | full Boolean row tables; source-realizable flag false |
| EX12 | 1 | full row/blocker-map incidence shadow |
| n=16 | 1 | off-class incidence shadow |

Every record retains all source paths and hashes, and every record sets
`full_source_faithful_model=false`. Missing fields are named explicitly rather
than reconstructed from nearby reports.

`model_features.csv` contains the requested placement, row-intersection,
support-multiplicity, pair-codegree, interval, blocker, deletion, and
metric/order audit fields. Empty cells mean the source object does not supply a
sound input. In particular, an unused carrier point is emitted as
`unused_points_not_removable`, never as a deletion edge.

## 7. Cross-cardinality analysis

`containment_extension_dag.csv` audits six proposed edges. None preserves the
full packet.

```text
EX12 incidence shadow --X--> n=16 incidence shadow --X--> EX17 normal form --X--> n>=18
                               ^                         |
                               |---- arbitrary delete --X
```

Here `--X-->` means the proposed edge fails its source audit, not that no
combinatorial embedding exists.

- EX12 and n=16 use different weak schemas and have no complete source/deletion
  map between them.
- Adding a point to the n=16 probe does not produce EX17 order, radius, or source
  provenance.
- Deleting an unnamed EX17 point is invalid unless every selected row, actual
  blocker, cap identity, K4 witness, and dependent deletion survives.
- The exact-17 source type fixes the carrier to 17.
- Period-4/5 and one-row extension artifacts are combinatorial shadows that
  explicitly lack the parent packet.

There is no tested source-faithful large population, so a statement of the form
“every tested large survivor contains a bounded motif” would have an empty
empirical domain. No stable extension template or bounded role-preserving
selection algorithm is supported.

## 8. Refinement, cores, and family extinction

The full reconstruction is in `refinement_effects.csv`,
`unsat_cores_or_ablations.jsonl`, and `survivor_family_history.md`.

The central distinction is between assignment rejection and family closure.
EX17 model cuts, Kalmanson certificates, dihedral images, and PIQD pair clauses
remove current assignments, but new structural SAT assignments continue to
appear. The retained children/mines are not exhaustive, so no canonical family
has a proved extinction wave.

The A5/v17 core is the smallest authenticated source-available UNSAT reason:

```text
472 total clauses
= 467 inherited safe-cover clauses
+ 5 live fixed-cell source clauses
```

The five clauses force label 9 both into and out of row 8. This is PROVEN for
the fixed selector/cell. The inference to an aggregate A5 leaf, any EX17 leaf,
or `|A| >= 18` is unsupported.

## 9. Invariant and bounded-obstruction mining

The requested potentials were computed wherever their inputs exist. Across the
253 EX17 row-table records:

```text
I_out      29..37
P_repeat    8..24
X_cross    10..74
H_def       9 exactly
Span_total 34..94
```

`H_def=9` is explained by matching 17 rows into eight outside labels;
`P_repeat>=8` and `X_cross>=10` hold empirically on the stored EX17 tables. None
has an existing packet theorem giving an opposing bound or contradiction.
EX12/n16 either violate the literal cardinality-specific value or lack the
audited order/outside inputs, so they do not supply a source-faithful lift.

A complete small-coefficient search over `[-3,3]^6` on
`(I_out,P_repeat,X_cross,Span_min,Span_max,Span_total)` found no strict linear
separator between the 86 linear-UNSAT-only EX17 canonical records and the 164
linear-status-unknown records. One identical vector appears in both groups.
Since UNKNOWN is not a positive geometric class, even a separator would have
been diagnostic rather than a theorem.

Two-Kalmanson occurrences are the most persistent bounded motifs, but new
disjoint occurrence pairs keep appearing after closure waves. The child mines
operate on one retained assignment per selected cell. The data therefore does
not support a universal occurrence theorem or any bound `N` for a
source-faithful obstruction.

## 10. Representative adversarial suite

`representative-models/` contains cards for:

- the absence of any large source-faithful model;
- both decoded EX17 structural SAT assignments;
- the richest EX12 blocker-map shadow;
- the n=16 large-relaxation warning;
- an exact algebraic two-shell partial metric model;
- the strict-convex exact biquadratic residual-(4,5,6) witness;
- the integer-coordinate global-K4 blocker-graph stress construction; and
- the kernel-checked unused-point/deletion regression.

No exact or numerical Euclidean artifact in the suite satisfies the full live
source packet. Exact-coordinate witnesses are included precisely because they
show which attractive local inferences fail when a load-bearing global
hypothesis is absent.

## 11. Theorem-facing conclusions

`candidate_lemmas.md` gives the required quantified statements, field
provenance, consumers, dependencies, bank-reuse preflights, confidence, and
countermodel boundaries for three targets:

1. the direct `card_ge_eighteen` leaf;
2. the bounded exact-17 cap-nine endpoint; and
3. the cardinality-uniform `xv`-deletion missing-incidence eliminator.

The project-index searches found no bank theorem closing any target. Candidate
1 is the required next attack. Candidate 2 can close only a bounded endpoint
and its current unconditional CNF-UNSAT subgoal should be replaced by a refined
source-entitled bridge. Candidate 3 is a useful crossed-branch consumer
laboratory but does not by itself consume Candidate 1.

The decision review identified a residual-neutral ingress that organizes the
Candidate 1 large-cardinality route. The proof of
`pentagonOffClassBlocker_largeCard_threeColor_pair` uses its off-class residual
argument only through `hxvA` and `huXvRow`; its pair-deletion dependency already
takes those projections explicitly. The live `BlockerV` residual has both
fields, and `18 <= D.A.card` supplies the theorem's `17 <= D.A.card` bound.
Thus the first large-branch step is not a new incidence lemma but a neutral API
extraction and live-leaf adapter.

The dependency claim is PROVEN by direct source inspection, but the neutral
extraction has not been elaborated or freshly built, and the current off-class
producer is off-spine. There is also a declaration-order gate: the live leaf
occurs before the current helper chain. An implementation must either move the
dependency-closed `BlockerV` cardinality/coordinator block after the extracted
producer or place neutral versions of the helper chain before the leaf. A
direct in-place call to the current later declaration cannot elaborate in Lean.

## 12. Recommended next work

### Lean work

1. Extract a residual-neutral large-cardinality three-profile source-pair
   theorem from `pentagonOffClassBlocker_largeCard_threeColor_pair`, taking
   `P`, `packet`, `hxvA`, `huXvRow`, and `17 <= D.A.card` explicitly. Preserve
   the existing off-class theorem as a wrapper.
2. Apply that theorem in the actual Candidate 1 `BlockerV` context. Keep the
   deleted-row blocker identity, second-cap interior/off-class facts, and
   next-row physical-hit bound in scope in every exported branch.
3. Generalize the crossed-row, exact-three-row, and bi-survival rectangle
   exports only where a field-by-field dependency audit confirms that the
   off-class wrapper is unnecessary.
4. Split each crossed branch at the genuine consumer boundary: the exact five
   additional incidences go to the checked tetrahedron terminal; their
   complements become named source-faithful missing-incidence packets. Treat
   the bi-survival common-deletion rectangle as a distinct family needing a
   new consumer.
5. Keep exact-17 work terminal and bounded. Replace the false base-CNF-UNSAT
   proof obligation with a refined CNF plus a checked `SourceRealization`
   implication.

### Solver work

No new large solver campaign is justified now. A solver should be used only
after the crossed missing-incidence and bi-survival packet families have exact
predicate schemas.

Once those schemas exist, the smallest useful campaign is a source-audited
falsification suite at `n=18`, run separately for the bi-survival rectangle and
each distinct crossed missing-incidence packet (then 19 and 20 only if the same
schema and role-preserving extension question remain meaningful). It must
retain actual source/blocker identity, canonical row
provenance, cap/order data, common-radius classes or a checked consequence,
prescribed deletion and survival, the `n=18` cardinality bound, the four
structural live assumptions (the `v` blocker equals `deleted`, the `deleted`
blocker is in the second-cap interior and outside the physical class, and the
next selected row has at most one physical-class support), and the relevant
minimality/K4 assumptions. Its first output should be one fully audited model
or one proof-carrying UNSAT cell, not a high-volume model stream.

Further exact-17 pair-cut waves are lower priority until an exhaustive
occurrence theorem or a checked refined-terminal bridge exists.

## 13. Reproducibility and limitations

Run:

```bash
uv run python docs/audits/rigid221-cegar-risk-audit-2026-08-26/scripts/build_bundle.py
uv run python docs/audits/rigid221-cegar-risk-audit-2026-08-26/scripts/validate_bundle.py
```

Pass `--check-small-coefficients` to the builder to reproduce the slower
`[-3,3]^6` diagnostic search; it reports 86 UNSAT-only records, 164
UNKNOWN-only records, and zero strict separators.

The builder reads existing artifacts, regenerates all machine tables and
representative cards, and writes `SHA256SUMS`. The validator checks schemas,
counts, role-preserving canonicalization invariants, evidence hashes, and the
bundle digest list. It invokes no solver or Lean build.

Known limitations:

- several historical run manifests omit source heads, seeds, elapsed times, or
  final state; the inventory records `UNKNOWN` rather than guessing;
- aggregate EX17 reports do not retain every raw assignment, so 8,280 models
  cannot be canonically reconstructed;
- no retained model contains all metric, source, blocker, deletion, and global
  packet fields;
- the cached kernel graph is stale and is not used to claim current
  reachability; and
- the audit's own command-output discipline had six budget violations during
  broad discovery/hygiene filtering, the largest approximately 21,235,577
  tokens. Subsequent evidence reads were targeted, and no conclusion relies on
  truncated output.

These limitations strengthen, rather than weaken, the primary verdict: the
available evidence is insufficient for a cross-cardinality conclusion.
