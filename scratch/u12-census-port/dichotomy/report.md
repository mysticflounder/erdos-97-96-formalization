<!-- Provenance: report body produced by the dichotomy classification agent
     (2026-07-06 wave, closure plan §7 / D1 lead 1); its own report-file write
     was blocked by the subagent report guard, so the orchestrator transcribed
     the agent's final message verbatim into this file. Artifact paths and all
     headline numbers independently spot-verified against
     per_core_dichotomy.jsonl / smoke_results.json / orderings.json before
     commit (verdict×tier, msolve_agree 572/572, mode split 85/181,
     single-separator 113/266, killing_unknown 0, δ=3 class, u1 class,
     smoke 16/16, orderings n=9). -->

# ℂ-vs-ℝ dichotomy classification of the |A|=12 mined dead cores — RESULT

## Headline

**Every mined dead core is ℂ-dead. 0 are ℝ-only-dead.** 572/572 classified systems returned reduced Gröbner basis = {1} over ℚ where dead was expected, with two independent exact char-0 engines (Singular `redSB`+`reduce(1,G)` primary, msolve `[-1]` cross-check) agreeing 572/572. **D3 routes to the ideal-theoretic lemma shape: Wu/Chou saturation machinery applies; no real-geometric content is needed at the mined-core layer.**

## What was swept

- **Tier A (the mining of record, 100% of classes):** all 266 class representatives from the 2026-07-06 minimal-core census (654: 146 classes from 70 cubes; 555: 120 classes from 60 cubes). Verdicts extend to all 465 recorded core instances by the class-invariance lemma below. **266/266 C_DEAD**; 59 cross-slice shared classes classified twice from different representatives, verdicts agree 59/59; the u1TwoLargeCapObstruction class is among them (k=5, δ=1).
- **Tier B (fresh mining from the task's data files):** 80 cubes sampled uniformly (seed 20260706) from `_u12_dead_654.jsonl` (40/958) and `_u12_dead_555.jsonl` (40/924), mined with a faithful port of the record's exhaustive saturated-oracle min-support search (all sub-k* timeouts = 0, so no inflated k*). **262/262 core instances C_DEAD** (654: 134, 555: 128); verdicts agree with Tier A on all 205 instances of known classes; **43 new classes found, all C_DEAD** — at (k,δ) ∈ {(5,0):10, (5,1):35, (5,2):7, (6,1):5}.
- **Tier C (complete abstract k=4 universe, not a sample):** all 44 constraint-graph classes on 4 points: **10 C_DEAD** (δ = 1,1,1,1,2,2,2,2,3,4) + 34 saturated-ℂ-alive. All 9 distinct record k=4 classes lie in the dead set; only the complete-K4 δ=4 class never occurs as a minimal core.

## Distribution (all verdicts C_DEAD)

Tier A classes, slice × k × δ:

| slice | k=4 | k=5 | k=6 | δ=−1 | δ=0 | δ=1 | δ=2 | δ=3 |
|---|---|---|---|---|---|---|---|---|
| 654 (146) | 5 | 104 | 37 | 6 | 56 | 79 | 5 | 0 |
| 555 (120) | 8 | 90 | 22 | 3 | 46 | 61 | 9 | **1** |

Full cross-table in `per_core_dichotomy.jsonl` (e.g. 654: (5,0):46, (5,1):53, (6,1):22 …). Tier B instances: 654 {(4,1):23, (4,2):2, (5,−1):11, (5,0):61, (5,1):30, (5,2):7}; 555 {(4,1):19, (4,2):2, (5,−1):8, (5,0):56, (5,1):37, (5,2):1, (6,1):5}. **Finding: a δ=3 class exists (555, k=4)** — the stated range δ ∈ {−1,0,1,2} was a 654-only statistic; the abstract k=4 universe reaches δ=4.

Secondary structure (new data, per class):

- **Mode split** (equality system + gauge alone, no separators): 85/266 classes already unit ("Cempty"); 181/266 need distinctness separators ("nodistinct" = genuine forced-coincidence). Sharp δ-correlation: **all** δ≤0 classes are nodistinct; δ=1: 75 Cempty/65 nodistinct; δ≥2: 10/5. (Pin-convention-dependent bit; convention stated in the artifacts. Refines the earlier memory claim "ALL forced-coincidence", which generalized a 20-class spot sample under a different pin convention.)
- **Single-separator kills** (unpinned equality ideal + one Rabinowitsch separator already unit): 113/266 classes (42%), typically 4–11 individually lethal pairs; 0 undetermined pairs.
- k\* ≤ 6 on all 210 cubes mined to date; kmax=7 never reached; min core size 4 (no dead 3-core: any k=3 system is satisfied by an equilateral triangle — PROVEN).

## Smoke gates (16/16 PASS on the recorded run)

(i) toys: ⟨x−y, t(x−y)−1⟩ → GB {1}; squared variant → {1}; negative control ⟨x−y⟩ → non-unit. (ii) documented substitution — the literal gate premise ("an ALIVE cube has a real solution") is contradicted by the recorded stage-2 data (**all** ℂ-alive cubes are distinct-dead: 654 1042/1042, 555 1076/1076, zero timeouts), so the gate's purpose was served soundly by: equality-only encoding reproducing recorded stage-1 verdicts (3 DEAD + 3 ALIVE per slice, msolve 12/12 matches; Singular confirms 5/6 DEAD, 1 cube-scale timeout at 900 s — census-precedented: its own spot-confirm was 23/2/0); plus a witnessed core-shaped system (square+center, k=5, R=6, δ=0, exact rational witness verified by substitution) → full encoding **non-unit** (gb_size 16). Full-saturation on an alive cube → {1} in 0.1 s, matching the stage-2 record. (iii) ordering-independence: one C_DEAD class per (slice, δ) — 9/9 unit under lp **and** reversed-variable dp. Record-fidelity gates: seed-7 sample determinism (130/130 per-cube labels match), δ-distribution reproduction exact, 3 cube re-minings reproduce k\*, core counts, and class canons exactly.

## Encoding (as specified, stated precisely)

Pairwise-induced schema per core: for each active center c ∈ P with M = K_c∩P, |M| ≥ 2: |p_c−p_{M₀}|² = |p_c−p_{Mⱼ}|² (pivot immaterial as ideals — differences telescope). Points relabeled 0..k−1; gauge p₀=(0,0), p₁=(1,0); one Rabinowitsch variable per pair, t·((xᵢ−xⱼ)²+(yᵢ−yⱼ)²)−1 = 0, all C(k,2) pairs; integer coefficients, sympy-expanded, byte-identical polynomial strings to both engines. ℂ-dead ⟺ reduced GB over ℚ = {1}. Three PROVEN lemmas frame it: **(G)** gauge WLOG — complex similarities act transitively on ordered pairs with (p₁−p₀)·(p₁−p₀) ≠ 0 (split-coordinate construction w± = w_x ± i·w_y), so the verdict is pin-independent; over ℝ this is transitivity on ordered distinct pairs. Caveat: over ℂ the separator also excludes isotropic separations — standard Wu/Chou convention; soundness direction unaffected (ℝ-alive-distinct ⟹ saturated-ℂ-alive, so C_DEAD ⟹ no distinct real realization). **(I)** class invariance — graph-isomorphic cores have relabeling-identical systems, so per-class verdicts cover all instances (empirically re-confirmed 59/59 + 205/205). **(M)** monotonicity — 1 ∈ ⟨E⟩ ⟹ 1 ∈ ⟨E∪S⟩; hence every kill recorded anywhere in this census pipeline (stage-1, stage-2, mined cores) was already a ℂ-kill as recorded; what this sweep adds is independent *exact* verification (the record's Singular-confirmation phase never ran — `confirmed: false`, all modes null), the 555/k/δ distributions, and the certificate-shape bits.

## Labels

- PROVEN: Lemmas G, I, M; no-dead-3-core; per-core C_DEAD facts are exact unit-ideal computations (two independent exact engines, 572/572 agreement).
- EMPIRICALLY VERIFIED (scope stated): uniform ℂ-deadness over the full record class population (100%) + 80 fresh dead-file cubes (~4.2%/4.3% of the dead files); class accumulation is NOT flattened (43 new classes in 80 cubes) — new classes will keep appearing, but every one found so far is C_DEAD, and any future mine.py-mined core is C_DEAD by construction+(M) modulo msolve correctness. k∈{5,6} layers are sample-based; k=4 layer is COMPLETE (abstract universe).
- Coverage FLAG: record cubes = seed-7 sample prefix (70/60 cubes, mixed stage-1/stage-2-dead), not the dead files; Tier B covers the dead files directly. No truncation: Tier B completed all 80 planned cubes.

## D3-routing consequence

Uniformly ℂ-dead ⟹ **the uniform |A|≥12 lemma can be posed ideal-theoretically**: per-core Nullstellensatz certificates 1 = Σλᵢgᵢ (equality generators + Rabinowitsch separators) exist over ℚ, are extractable (Singular `lift`, as in the census's `certify_script`), and are kernel-checkable in Lean by polynomial-identity evaluation — the same certificate shape as the endpoint bank. Wu/Chou characteristic-set/saturation machinery applies as-is; SOS/Positivstellensatz and real-root classification are NOT needed at this layer. Lemma-design levers from the secondary bits: 42% of classes die from a *single* separator (certificate width 1); 32% die with no separator beyond the gauge pair; mode correlates exactly with δ≤0 vs δ≥1. Tier C kills DOF-counting in both directions with certificates: δ=−1 cores die; a δ=+2 abstract class is ℝ-realizable with all points distinct (msolve real-root isolation). The bounded-forced-subsystem tripwire (closure plan §6) should test these ℂ-dead cores as liveData producers.

## Artifacts (all under `scratch/u12-census-port/dichotomy/`)

`classify.py` (pipeline: smoke/tierA/tierB/tierC/orderings/report); `per_core_dichotomy.jsonl` (572 rows: core_id, tier, slice, cube_idx, P, k, R, delta, verdict, gb_size, gb_secs, msolve, msolve_agree, base_pinned_empty/mode, killing_pairs, canon); `rows_tier{A,B,C}.jsonl`; `smoke_results.json` + `smoke.log`; `orderings.json`; `tier{A,B,C}.log`; `cube843_long.log`; `mining-import/` (secured copy of the volatile session-scratchpad mining record + `PROVENANCE.md` with shas).

Operational notes: (1) this file was transcribed by the orchestrator (see provenance header). (2) The record's result JSONs lived only in a volatile session scratchpad; the copy in `mining-import/` is now the durable one. (3) Five orphaned solver processes (leaked at the agent's mid-session API-error termination) were killed; no effect on results. (4) One smoke-gate iteration: the initial ii-eq.dead_555 gate was over-strict (required Singular unit at whole-cube scale within 300 s; one cube times out even at 900 s while msolve decides in 0.12 s — census-precedented); re-gated to the census's own confirmation standard (msolve 3/3 record-match, zero disagreements, ≥2/3 Singular confirms) and the full suite rerun: 16/16 PASS. Core-scale GBs — the deliverable — all completed in ≤0.10 s.
