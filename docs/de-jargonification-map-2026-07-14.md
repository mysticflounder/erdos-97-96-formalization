# De-jargonification map — prose proof + Lean corpus (2026-07-14)

**Status: MAP ONLY.** No source file outside this document has been edited.
All naming and scope decisions below are **locked** (Adam, 2026-07-14).
Execution — the scripted rename itself — has not started.

## 0. Directive, restated precisely

- Replace house/software jargon (`packet`, `row`, `shell`, `subpacket`,
  `tail`, `slot`, `skeleton`, `blocker`, `dangerous`, `live`, and internal
  codenames like `RVOL`, `LIVE-Q`, `K-A-PAIR`, `ATAIL`) with standard
  mathematical terms, everywhere.
- Scope: every Lean declaration name (not just docstrings/comments), plus
  the prose proof, plus — per the scope decision below — all of `docs/`.
- Execution constraint: the actual replacement must run through a
  **deterministic scripted tool** (sed / Python `re` / a proper identifier
  renamer) driven by the mapping table in §7 — not an LLM rewriting files
  by free-form judgment file-by-file.

## 1. Decisions at a glance

| decision | resolution |
|---|---|
| Docs scope | All of `docs/`, not just the prose proof (pulls in the `ATAIL`/`A11-*`/`K-A-PAIR`/`K-A-LIVE` family) |
| 551 unimported files | Rename mechanically, same pass as everything else |
| Category B (`Row`-as-index, `Bank`, `Record`) | Permanently out of scope — legitimate CS naming, not disguised math |
| Glossary | Locked — see §7 |
| `Packet` methodology | Per-symbol classification (`Data`/`Witness`/drop), not a blanket rule — the 75-name table itself is still a Phase-0/Phase-2 execution task |
| Execution | Not started |

## 2. Corpus baseline

| | count |
|---|---|
| `.lean` files (`P97` + `P96`) | 2,057 |
| Lean declarations (`theorem`/`lemma`/`def`/`abbrev`/`structure`) | 14,332 |
| `.md` files under `docs/` | 56 |
| `certificates/` files | 387 (not yet surveyed for jargon footprint) |

## 3. Reachability tiers — why execution order matters

`proof-blueprint spine` (rooted at the two publish targets,
`Problem96.erdos96_rhs` / `Problem97.erdos97_rhs`) splits the corpus into
three risk tiers, which should drive execution order once it starts:

1. **On the kernel spine** — declarations actually reachable from the two
   target theorems. This *is* the proof; renames here need a build+spine
   check after every batch.
2. **Imported but off-spine** — wired into the `lake` build (so a broken
   rename here still fails `lake build`) but not on the mined dependency
   chain of either target. Medium risk.
3. **Unimported** — 551 files / 2,129 symbols, never reached by any `lake
   import` chain, largely mined/search artifacts (§5). Lowest risk to
   rename (nothing depends on them via import), and — per §1 — in scope
   for the same mechanical pass, just last in line.

The prose proof and the P97 core files (`Foundation.lean`,
`U1CarrierInjection.lean`, `U1LargeCapRouteBTail.lean`,
`RemovableVertexAxiom/*`, `Cap/*`, `MEC/*`, `Moser/*`) are tier 1/2 and
are the priority.

## 4. Jargon inventory and blast radius

Counts are: distinct **declaration names** containing the token, and total
**lines mentioning** the token anywhere (the real blast radius for a
whole-token sed pass — includes references, hypotheses, docstrings).

| term | decl names | lean lines | docs lines | category |
|---|---:|---:|---:|---|
| Surplus | 202 | 9,809 | 1,218 | kept as-is (§7) — biggest footprint in the corpus, deliberately untouched |
| Row | 849\* | 10,125\* | 606 | mixed — geometric sense → `FourClass`; mined-artifact sense out of scope (§5) |
| Packet | 75 | 4,769 | 488 | per-symbol split (§7) |
| Bank | 39 | 5,451 | 311 | out of scope (§5) |
| Shell | 69 | 1,632 | 181 | → `FourClass`, same as `Row` |
| Frame | 25 | 292 | 26 | kept as-is — standard geometric term |
| Tail | 24 | 349 | 167 | → `Residual` |
| Slot | 22 | 416 | — | → `Label` |
| Subpacket | 13 | 70 | (in Packet count) | folds into `FourClass` |
| Anchor | 12 | 164 | 5 | kept as-is — see §7 disambiguation |
| Record | 16 | — | — | out of scope (§5) |
| Dangerous | 11 | 156 | — | folds into `Fixed` |
| Blocker | 16 | 145 | — | → `Obstruction` |
| Skeleton | 3 | 146 | — | dropped entirely (inlined) |
| Manifest | 2 | 106 | — | folds into `Label` |
| Live/LiveData | 1 (struct) | — | huge via `LIVE-Q/T1/T3/C` labels | → `ConfigurationData`; case labels → §7 |

\* `Row`'s raw count is dominated by Category-B mined-artifact names
(`erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_subset_fixed`,
`left_row1021_exists_erasedPinRowSeed_privateMask`, …) — see §5. The
Category-A geometric sense of "row" (a center + its exact 4-point distance
class) is a much smaller slice, concentrated in `U1Depth5Prefix.lean`,
`U1LargeCapRouteBTail.lean`, `U1CarrierInjection.lean`, and the prose proof.

`RemovableVertexAxiom` (14 lean lines / 148 docs lines) and the acronym/
codename cluster `RVOL` / `LIVE-Q` / `LIVE-T1` / `LIVE-T3` / `LIVE-C` /
`K-A-PAIR` / `K-A-LIVE` / `ATAIL` are tracked separately in §6–§7 since
they're not vocabulary-imprecision, they're either wrong or codename-shaped.

## 5. Category B — generated/mined certificate-bank artifact names (out of scope)

A large share of `Row` (and all of `Bank`, `Record`) lives in
combinatorial-search artifact names, e.g.:

```
erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_subset_fixed
left_row1021_exists_erasedPinRowSeed_privateMask
rightNonSurplusRow1003Excluded_of_finiteScaffold
```

These encode solver/mining parameters (seed, mask, participant id, case
index) — they're the equivalent of a database row index or a SAT case
number, not a mathematical concept standing in disguise. Forcing "pure math
terms" onto a mined case-table index is a category error: the index *is*
the content. Same read applies to `Bank` (a stored cache of mined
certificates — accurately-named search infrastructure, not obscured math)
and most of `Record` (checkpoint/session labels like `Record001`).

**Decided: Category B is out of scope, full stop.** No mechanical pass
touches `erasedPinRow*`/`row1021`-style names, `Bank`, or `Record` — not
even a consistency-only pass. The `Row`→`FourClass` substitution (§7)
applies only to the geometric sense.

This makes per-symbol disambiguation of `Row` **mandatory** before any
mechanical run touches it: the tooling must distinguish "this
declaration's name encodes a mined-search-table index" from "this
declaration's name means the center+exact-4-class concept," since the same
substring spans both. The extraction step in §8 should tag each
`Row`-bearing declaration by directory (`RemovableVertexAxiom/Base.lean`,
`SurplusCOMPGBank*`, `ErasedPin*`, `EndpointCertificate/*` are Category B;
`U1Depth5Prefix.lean`, `U1LargeCapRouteBTail.lean`,
`U1CarrierInjection.lean` are the Category-A geometric sense) before
building the old→new map, not rely on a single blanket regex.

## 6. Category C — names that are simply wrong (fixed regardless of jargon policy)

- **`RemovableVertexAxiom`** (the directory and `RemovableVertexAxiom.lean`)
  — confirmed via `rg "^\s*axiom\b"` that **zero** `axiom` declarations
  exist anywhere under this path; it is exclusively proved
  `theorem`/`def`/`structure` content (`Base.lean`, `Continuation.lean`,
  `PinnedSurplusBank.lean`, `PinnedSurplusProducer.lean`,
  `PinnedSurplusGeneralM.lean`, `ErasedPinRowResiduals.lean`). The name is
  a historical relic from when this was an assumed (unproved) axiom; it no
  longer is one. 14 lean lines / 148 docs lines reference it. **Decided:
  rename to `RemovableVertexDescent`** — matches the existing sibling
  `Descent.lean` and the universal-descent framing already used elsewhere
  (removable vertex → strictly smaller counterexample is exactly a descent
  step).
- No other definite Category-C findings surfaced in this pass (`Axiom`,
  `Deprecated`, `Legacy`, `HACK` all return zero or near-zero declaration
  hits). A full audit for stale/misleading names should happen as part of
  Phase 1 file-by-file review, not assumed complete from this grep sweep.

## 7. The locked glossary

Every entry below was individually reviewed and decided. This is the
mapping table any execution tooling should consume.

| jargon token | target | rationale |
|---|---|---|
| `Row` (geometric sense) | `FourClass` | `CriticalFourShell` and `CriticalRowPacket` both describe a center + the fact that `A` has exactly 4 points at some radius from it. The corpus already has a third, cleaner name for this — `SelectedFourClass`/`CriticalSelectedFourClass` — the dominant term in the most central file. Converging eliminates the biggest internal terminology collision in the corpus. |
| `Shell` | `FourClass` | Same convergence as `Row`. |
| `Row` (mined-artifact sense) | *(kept — out of scope)* | Category B, §5. |
| `Bank`, `Record` | *(kept — out of scope)* | Category B, §5. |
| `Packet` | per-symbol: `Data` / `Witness` / drop | No single math word fits all 75 uses — some assert existence of a configuration (`Witness`), others just carry defining fields (`Data`). Per-symbol classification chosen over a blanket rule; the classification table itself is a Phase-2 execution task, not yet built. |
| `Subpacket` | folds into `FourClass` (4-subset) | Direct consequence of the Row/Shell decision — a "four-point subpacket" is a 4-subset of a `FourClass`. |
| `Surplus` | **kept as-is** | Already plain English (excess cardinality relative to the generic 4-point cap), not a software-engineering borrowing like `packet`/`row`. Keeping it avoids the single largest rename in the corpus (9,809 Lean lines) for no clarity gain. |
| `Tail` | `Residual` | Matches the prose proof's own gloss: "the residual case analysis remaining after the exact-pair branch is discharged." |
| `Slot` | `Label` | Matches the existing `l1..l4` field naming. |
| `Manifest` | folds into `Label` vocabulary | Tiny footprint (2 names), same direction as `Slot`. |
| `Skeleton` | **dropped entirely** — inline `D.A.erase q` | `D.skeleton q := A.erase q` is a one-line wrapper around a single mathlib call with no added content. This is a definition removal, not a token rename (see §8 tooling note). |
| `Blocker` | `Obstruction` | Standard combinatorics/proof-writing vocabulary; matches the project's existing "Obstruction G183"-style naming convention. |
| `Dangerous` (`U5DangerousTriple`) | folds into `Fixed` (`U3FixedTriplePacket`) | Both name the same co-radial triple `{t1,t2,t3}` at two different pipeline stages (`U5DangerousTriple.exists_triple_labels` literally converts one into the other). The prose proof's running text already prefers "fixed triple." |
| `LiveData` | `ConfigurationData` | Describes what it is: the data defining the specific local configuration being case-split on. `Live` (vs. mocked/test data) is a software-jargon borrowing with no math content. |
| `Anchor` | **kept as-is** | Means "a fixed reference set of label-pairs used as a distinctness-detecting basis" (`AnchorPairs`, `anchorProduct`) — a legitimate "fixed reference" metaphor. Its homonym collision with `proof-blueprint anchor` (an unrelated session-cursor tooling concept) is across two different systems and not a corpus naming problem. |
| `Frame` | **kept as-is** | Standard geometric term (coordinate/reference frame), not a disguised borrowing. |
| `RVOL` | retired — use `Theorem IV` everywhere | The prose proof mixes the acronym with "Theorem IV" for the same statement; "Theorem IV" is already the formal numbered label in the proof's own architecture (Part IV). |
| `LIVE-Q` | `the q-source case` | Named by its literal defining condition (q collides with the f₂ row's source). |
| `LIVE-T1` | `the t₁-source case` | Same pattern. |
| `LIVE-T3` | `the t₃-source case` | Same pattern. |
| `LIVE-C` | `the off-center case` | The f₂ row's center isn't p; its 7 sub-cases are named by which point the center actually is. |
| `RemovableVertexAxiom` | `RemovableVertexDescent` | See §6 — it's proved, not axiomatized. |

## 8. Mechanical execution design (sed/scripted — no LLM rewriting at run time)

Not yet started. Recorded here so execution has a spec to follow.

1. **Extract** the exact declaration-name inventory (`proof-blueprint
   symbols` or `rg` over `^\s*(theorem|lemma|def|abbrev|structure)\s+\S+`)
   into a table.
2. **Tag** every `Row`-bearing declaration by category (A vs. B, by
   directory — §5) before doing anything else with it.
3. **Build** an `old_name → new_name` map by applying the §7 glossary to
   each extracted name, using the per-symbol classification for `Packet`
   (still to be built — see §1).
4. **Validate injectivity** of the map before touching anything — reject if
   two distinct old names would collide on the same new name.
5. **Apply** as whole-token replacement (`\bOldToken\b`, respecting that
   Lean identifiers are contiguous alphanumeric/`_`/`'` runs, including
   dotted projections like `SurplusCapPacket.foo`) across `.lean` files and
   all in-scope `.md` files, via a single deterministic script
   (sed/perl/Python — not per-file LLM edits).
6. **File/directory renames** (`git mv`) are a separate, smaller pass
   (~60 files matched a jargon word in their basename) with an import-path
   fixup step.
7. **`Skeleton` is a definition removal, not a token rename**: unfold
   `D.skeleton q` to `D.A.erase q` at every call site and delete the `def`,
   rather than substituting a new name. Handle as its own small mechanical
   step (find-references → inline → delete def → build), separate from the
   token-substitution script.
8. **Batch by reachability tier** (§3): on-spine first, then
   imported-off-spine, then unimported.
9. **Verify after every batch**: `lake build` clean, `proof-blueprint sync`
   + `spine` shows the same open/closed shape (no accidental semantic
   change, no orphaned old-name references via a grep sweep), then commit
   that batch on its own (per this repo's checkpoint-per-commit policy). A
   batch that fails to build gets fixed or rolled back before the next
   batch starts — never carried forward broken.

## 9. Phasing

- **Phase 0 — decisions.** Done: glossary locked (§7), scope decided (§1),
  Category B boundary decided (§5). Remaining before Phase 2 can start:
  build the `Packet` per-symbol classification table (75 names), and
  survey `certificates/*.md` (387 files, not yet sized) for jargon
  footprint.
- **Phase 1 — all of `docs/`.** Translate `RVOL` → `Theorem IV`,
  `LIVE-Q/T1/T3/C` → descriptive case names, and the `ATAIL`/`A11-*`/
  `K-A-PAIR`/`K-A-LIVE` codename family throughout the audit/status/
  checkpoint docs, plus every in-scope glossary term. Text-only, zero
  build risk, can run standalone.
- **Phase 2 — on-spine Lean declarations** (`Foundation.lean`,
  `U1CarrierInjection.lean`, `U1LargeCapRouteBTail.lean`, `Cap/*`,
  `MEC/*`, `Moser/*`, `RemovableVertexAxiom/*`, `U1Depth5Prefix.lean`,
  `U3ToU5DangerousTriple.lean`, `U5GlobalIncidenceBasic.lean`). Highest
  scrutiny; build+spine check every batch.
- **Phase 3 — imported-but-off-spine declarations.**
- **Phase 4 — the 551 unimported files.** Disposition already decided
  (§1): rename mechanically, same glossary, same tooling. Lowest-risk
  tier, executed last.

## 10. Effort framing

Not a wall-clock estimate — framed in sessions (~150–200k context each):

- Phase 0: the decision work is done as of this document; the remaining
  `Packet` classification table is small and fits in a session alongside
  the start of Phase 2.
- Phase 1 (all of `docs/`): one session.
- Phase 2 (on-spine rename + verify): likely multiple sessions — the
  batch-verify-commit loop is the bottleneck, not the mapping itself.
- Phase 3–4: sized only after Phase 2's actual batch-verify cadence is
  known.
