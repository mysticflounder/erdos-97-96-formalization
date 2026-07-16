# D2 — invariant separation test (|A|=12 census dead cores vs realizable controls)

Date: 2026-07-06. Workstream D2 per the archived 2026-07-06 closure plan
(`docs/archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md` §7), invariant
menu from `docs/d1-rigidity-literature-scan-2026-07-06.md` §5 (leads 2, 3) and the
task spec. All computation in `scratch/u12-census-port/d2-separation/`.

Labels: **PROVEN** (mathematical argument in this report), **EMPIRICALLY VERIFIED**
(checked by executed code against independent artifacts; solver verdicts are exact
char-0 msolve/Singular outputs, not kernel-checked proofs), **HEURISTIC** (stated
as such).

## 0. Verdict (binary deliverable question)

**No computed combinatorial invariant — and no small combination of them —
separates dead from alive cleanly.** Every individual invariant in families
(a)–(e) overlaps, with explicit, solver-verified witness pairs: feasible and
infeasible frameworks agreeing on the entire 21-scalar invariant vector, and
(separately) on the full pair-contraction profile plus circle-degree profile.
This is the "no separation" outcome: the realizability criterion for these
cores is **not a function of these counting invariants**, routing D3 away from
pure sparsity/contraction combinatorics (details and the two usable positive
signals in §6–§7).

## 1. Data provenance and schema (reversed from the ported scripts)

Ported data (`scratch/u12-census-port/`, checksums in `PORT_MANIFEST.sha256`):

- `_u12_dead_{555,654}.jsonl` — **12-point cubes, not k-point cores.** One JSON
  object per line: `{"0": [a,b,c,d], ..., "11": [...]}` = per-center 4-element
  equidistance class K_c (C1: c not in K_c). These are the stage-1
  ℂ-equidistance DEAD cubes of the 2000-cube censuses (958 for 654, 924 for
  555). The task brief called these files "dead cores"; the actual k∈{4..8}
  cores are *mined* from them (§2) — this schema correction is load-bearing.
- `_u12_alive_654.jsonl` — 164 stage-1 ℂ-ALIVE cubes from the earlier 300-cube
  pilot (matches `_u12_census_654.json`: sampled=300, n_alive_C=164; first line
  == `first_alive_C`). The 2000-cube census runs crashed in a downstream
  cross-check (tracebacks preserved in both `_u12_census_*_full.log`) before
  persisting alive sets — hence no full alive files and no `_u12_alive_555.jsonl`.
  The dead files were (re)written by a later stage-1-only `dumpdead` run of the
  same deterministic sampler (dead counts equal the census-log tallies exactly).
- Constraint semantics (`_u12_census.cube_polys` / `_min_core_sound.gen_map`):
  36 generators per cube, 3 per center, in **star form** `(c, K_c[0], K_c[j])`,
  j=1..3, meaning d²(c,K_c[0]) = d²(c,K_c[j]), under the gauge x0=(0,0),
  x1=(1,0). INDUCED(P) keeps exactly the generators with all three points in P
  (the base member K_c[0] must be in P for center c to contribute — star
  quirk, faithfully mirrored everywhere here).
- DEAD (stage 1) = msolve char-0 solve mode returns `[-1]` (empty over the
  algebraic closure) on the gauged 36-generator system; ALIVE = nonempty.
  **Distinctness is NOT part of stage 1** beyond the gauge pair itself.
- Stage 2 of the original censuses (msolve per-pair Rabinowitsch distinctness
  on the ℂ-alive cubes): **ALL alive cubes of both profiles are
  distinctness-DEAD** (654: 1042/1042; 555: 1076/1076; tallies in the ported
  logs). So "realizable controls" here means ℂ-equidistance-realizable in
  gauge, NOT realizable with 12 pairwise-distinct points (§5, caveat 1).

Dependency modules copied from the read-only source
(`../p97-rvol/scratch/u1_2_faithful/twolargecap_core/`), byte-identical,
sha256 in `DEPS_MANIFEST.sha256`: `gen_singular_shadow.py`, `_min_core_sound.py`.

### Schema validation (EMPIRICALLY VERIFIED — `validate_schema.py`, all checks PASS)

- V1: dead-file line counts == census-log stage-1 DEAD tallies (958/924).
- V2: ported alive_654 count == pilot n_alive_C (164); first line == first_alive_C.
- V3: `sample_cubes(prof, 2000, seed=7)` deterministically regenerates the
  census samples: all dead cubes are members; complement sizes == logged ALIVE
  tallies (1042/1076); all 164 ported alive cubes lie in the first 300
  regenerated cubes and outside the dead set.
- V5: regeneration attempts == census-log attempts (2095/2004) — the ported
  sampler is behavior-identical to the one that ran the censuses.
- V4: gen_map = 36 star generators, 3 per center, 3 distinct points each.

### 555 control gap — status: CLOSED at the ℂ-alive level

`alive_2000_555.jsonl` (1076 cubes) and `alive_2000_654.jsonl` (1042 cubes)
derived as (regenerated 2000-sample) minus (ported msolve-DEAD set), justified
by V3+V5. Independent spot-verification (`spot_verify_alive.py` →
`spot_verify_alive.json`): 25 random derived-alive cubes per profile re-run
through the ported msolve `certify()` — **25/25 ALIVE on both profiles**; 25
random ported-dead cubes per profile — **25/25 DEAD on both profiles**.
Residual caveat: the non-sampled remainder of the complements inherits ALIVE
from the census-log tallies plus sampler determinism, not per-cube re-runs.

## 2. Objects compared

**Dead cores.** Minimal ℂ-infeasible induced supports mined from dead cubes by
the ported `_u12_core_mine.mine_cube` methodology: sweep k=3,4,…, test every
k-subset with ≥3 induced generators via msolve char-0 solve ([-1] ==
infeasible; timeout treated feasible), **every infeasible candidate exactly
confirmed by Singular char-0 reduce(1,std(I))==0 over ℚ**; stop at the first k
with a confirmed core (= min_support; all size-k cores recorded). Only
Singular-confirmed cores enter the analysis (7 timeout-flagged cores excluded,
counted below).

- Oracle smoke (`smoke_miner.log`): reproduces the known |A|=11 codex result —
  min_support 6, exactly the two known cores (0,1,2,3,6,9)/(0,1,2,3,7,9), one
  full 4-star each. PASS.
- Re-mining validation: reproduces the 4 surviving cube records of the original
  `_u12_coremine_654.log` exactly (min_support, n_cores, signatures, star
  counts). PASS.
- Gauge-pair pruning (production driver `mine_cores_v2.py`): only P ⊇ {0,1}
  tested. **PROVEN sound**: a subset missing 0 and 1 admits the all-points-equal
  solution; a subset with only one gauge point admits the all-points-at-that-
  gauge-position solution — either way every generator vanishes, so such P is
  never ℂ-infeasible. Hence every infeasible core contains both gauge points
  and pruning changes no result. Also EMPIRICALLY VERIFIED: pruned vs unpruned
  runs identical on all 43 doubly-mined cubes. Corollary (asserted during the
  sweep, holds 540/540): **every kill is a forced collapse of the gauge pair**.

**Alive controls.** Every induced subframework of a stage-1 ℂ-ALIVE cube is
ℂ-feasible in gauge (**PROVEN** by restricting the cube's gauged solution).
Control universe: all S with |S| ∈ {4,…,8}, R(S) ≥ 1, no idle point (every
point of S occurs in an induced constraint). Full invariant records written
for every eligible control (`controls_all_{prof}.jsonl.gz`). Coverage: k ∈
{4,5,6} complete (all δ); k ∈ {7,8} restricted to δ ≥ −3 (tractability cut two
notches below the observed dead minimum; the excluded remainders are counted:
675,296 (654) + 697,826 (555) subframeworks, all with δ ≤ −4 at k ∈ {7,8}).
Every dead (k, δ) cell is fully covered.

## 3. Invariant definitions (exact integer combinatorics)

Framework (P, C), k=|P|, R=|C|, δ(S) = R(S) − (2|S| − 4), R(S) = #constraints
induced in S. Computed per framework by `invariants.py`:

- (a) Laman-style sparsity profile over every S ⊆ P with R(S) ≥ 1 (|S| ≥ 3):
  `max_sub_delta_all`, `max_sub_delta_proper`, `n_sub_tight` (δ(S)=0 count),
  `n_sub_over` (δ(S)≥1 count), sizes attaining the max.
- (b) over-determination profiles: `sub_delta_hist` = multiset {δ(S)};
  `sub_size_delta_hist` = multiset {(|S|, δ(S))}.
- (c) circle-degree distribution: per center c, m_c = #constraints centered at
  c; `circle_degree_profile` = sorted desc (m_c) (class size on c's circle =
  m_c + 1).
- (d) coordination-class data (Schulze–Serocold–Theran, D1 lead 2): L =
  #circles, E = R + L star edges, `class_size_profile`,
  `member_degree_profile` (#circles each point lies on), `min_L_at_max_delta`.
  **PROVEN identity, asserted on all 2.55M+540 frameworks swept:**
  E(S) − (2|S| − 3 + L(S)) = δ(S) − 1 — with one coordinated length class per
  circle, the SST sparsity count is exactly δ shifted; only the class
  *structure* can add power beyond δ.
- (e) pair-contraction profiles (Fekete–Jordán–Kaszanitzky / Guler–Jackson,
  D1 lead 3): for each pair {i,j} ⊆ P identify j:=i; drop vacuous constraints,
  count forced-zero constraints z (center collides with a witness ⇒ a distance
  is forced 0), dedupe by (center, witness pair); δ′ = R′ − (2(k−1) − 4).
  `contraction_profile` = sorted multiset (δ′, z); scalars `max_contract_delta`,
  `max_contract_delta_z0`, `gauge_pair_contract` (= (δ′,z) of pair {0,1}),
  `n_pairs_contract_over`, `n_pairs_z_pos`.
- Derived scalars: E − 2k, max/min member degree, min circle degree,
  gauge-contraction δ′ and z, n_circles, max_circle_degree.

### Mandatory smoke (hand-computed, `invariants.py` smoke — all assertions PASS)

S1 (single circle class): P={0,1,2,3}, C={(0;1,2),(0;1,3)}; k=4, R=2, δ=−2.
Hand answers: subsets with R≥1: two triples at δ=−1, P at δ=−2 → max_sub −1,
hist {−1:2, −2:1}; circle degrees [2], L=1, E=3, class sizes [3], member
degrees [1,1,1,0]; contractions: {0,1}→(−2,2); {0,2},{0,3}→(−1,1);
{1,2},{1,3}→(−1,0); {2,3}→dedupe→(−1,0).

S2 (mutual equidistance, δ=+2, **REALIZABLE with all points distinct** — two
equilateral triangles on a shared edge, PROVEN by construction): P={0,1,2,3},
C={(0;1,2),(0;1,3),(1;0,2),(1;0,3),(2;0,1),(3;0,1)}; k=4, R=6, δ=+2. Hand
answers: proper subsets {0,1,2},{0,1,3} at δ=+1; hist {1:2, 2:1}; circle
degrees [2,2,1,1], L=4, E=10, class sizes [3,3,2,2], member degrees [3,3,2,2];
contractions {0,1}→(−2,2), four pairs →(+1,1), {2,3}→(+1,0). S2 also witnesses
that top-level δ=+2 does not imply infeasibility.

## 4. Production runs and counts

Mining (`mine_cores_v2.py`, kmax=8, ms_timeout=30, Singular confirm 120s;
median 1.6 s/cube, p90 31 s, max 612 s, 52 solver-minutes total):

| slice | cubes mined (prefix segments of the dead file) | min_support hist | cores | Singular-timeout cores (excluded) |
|---|---|---|---|---|
| 654 | 109 of 958 (idx 0–64, 300–343) | {4:7, 5:17, 6:42, 7:38, 8:5} | 261 | 3 |
| 555 | 130 of 924 (idx 0–63, 100–165) | {4:9, 5:20, 6:49, 7:44, 8:8} | 286 | 4 |
| pooled | 239 | — | 547 (540 confirmed) | 7 |

Every mined cube produced a core by k ≤ 8 (zero min_support=None). Dead-core
(k, δ) cells span k ∈ {4,…,8}, δ ∈ {−1,…,4} — including two δ = −1 cores
(cells (555,6,−1), (555,7,−1)) and δ = +4 cores. 530 distinct full invariant
vectors among 540 confirmed cores (near-zero flattening, consistent with the
plan's "hundreds of classes" observation).

Controls (`sweep.py --mode controls`): 1,256,179 eligible (654, from 1042
ℂ-alive cubes) + 1,295,814 (555, from 1076) = **2,551,993 control frameworks**,
each with the full invariant record. Alive controls exist in **every** dead
(k, δ) cell (e.g. pooled (7,1): ≈25k controls vs 134 dead cores; (4,2): 27
controls; (8,3): 15.5k controls).

## 5. Caveats (read before using any verdict)

1. **"Alive" = ℂ-alive in gauge, without distinctness.** The census contains
   no known 12-point all-distinct-realizable cube (stage 2 above). Controls
   are feasible for exactly the relaxed problem the dead cores are infeasible
   for (gauged equidistance over ℂ) — the comparison is apples-to-apples for
   the mining oracle's notion, and a D3 criterion built on it would address
   gauged ℂ-infeasibility ("forced gauge-pair collapse"); all-points-distinct
   realizability is a further step the data cannot speak to.
2. **Dead sample vs dead universe.** Mining is exhaustive per cube, but 239 of
   1882 dead cubes were mined (prefix segments listed above; no selection
   beyond file order). The verdict shape was stable at 96, 189, 469, and 540
   cores. Exhausting the remaining cubes is a mechanical extension (~3–5 h at
   observed rates).
3. **msolve timeout = feasible** (ported convention): a timeout below
   min_support could in principle hide a smaller core; unrefuted in all 43
   pruned-vs-unpruned doubly-mined cubes and the 4 original-log cubes. Load
   during concurrent runs can only push min_support up (never fabricates a
   core; every reported core is Singular-confirmed).
4. **Control coverage cut at k ∈ {7,8}: δ ≥ −3 only.** All dead cores have
   δ ≥ −1 (verified), so every (k,δ)-matched comparison and every combination
   including (k,δ) is complete. Only the unconditional single-invariant tests
   could in principle be affected by the excluded δ ≤ −4 remainder; no
   separation claim below rests on that region (all overlaps were found well
   inside the covered region).
5. **Plan-basis corrections** (supersede closure-plan §7 wording, which came
   from 4 surviving cube records): mined cores occur at k ∈ {4,…,8} with k=7
   the modal size (not k ∈ {4,5,6}); δ range is {−1,…,4} (not {−1,…,2}); δ=−1
   cores are real but rare (2/540).

## 6. Separation results (EMPIRICALLY VERIFIED, 540 dead cores vs 2,551,993 controls)

Full tables: `analyze_final.log`, `separation_report.json` (per-slice and
pooled; matched-cell per (profile,k,δ)). Headline (pooled):

| invariant (family) | dead cores whose value also occurs among controls | controls sharing some dead value | dead cores separated within their own (k,δ) cell |
|---|---|---|---|
| k, R, δ, and every single scalar (a)–(e) | 540/540 | 10⁵–2.55M each | 0/540 (except gauge-contraction 41–56/540) |
| circle_degree_profile (c) | 540/540 | 1,469,234 | 0/540 |
| member_degree_profile (d) | 540/540 | 273,452 | 1/540 |
| sub_delta_hist (b) | 350/540 | 7,174 | 235/540 |
| sub_size_delta_hist (b) | 304/540 | 6,512 | 280/540 |
| **contraction_profile (e)** | **110/540** | **468** | **470/540** |
| k+δ+contraction+circledeg | 81/540 | 376 | 489/540 |
| ALL 21 scalars combined | 44/540 | 58 | 516/540 |
| ALL 28 invariants (scalars+profiles) | **0/540** | **0** | 540/540 |

Scalar ranges: the dead range is strictly contained in the alive range for
every scalar (e.g. δ: dead [−1,4] ⊂ alive [−6,8]; max_sub_delta_all: [−1,4] ⊂
[−1,8]; max_contract_delta: [0,6] ⊂ [−4,9]). No threshold criterion exists on
any single scalar.

Slice consistency: the same pattern holds per slice (contraction_profile:
38/258 dead-in-overlap on 654, 32/282 on 555; ALL_scalars: 12/258 and 12/282;
full vector clean on both). Pooling does not manufacture or destroy the effect.

**Solver-verified witness pairs** (`extract_witnesses.py` →
`collision_witnesses.json`; 4/4 verified — control: msolve feasible AND
Singular 1∉ideal; dead: Singular 1∈ideal): explicit feasible/infeasible pairs
agreeing on the **entire 21-scalar vector**, e.g.

- control 654/alive-cube 34, P={0,1,2,4,5,8,10,11} (k=8, R=12) vs dead core
  654/dead-cube 322, P={0,1,4,6,7,8,9,11} (k=8, R=12);
- control 654/alive-cube 124, P={0,1,2,4,10,11} (k=6, R=8) vs dead core
  555/dead-cube 102, P={0,1,2,3,4,7} (k=6, R=8).

plus 6 witness pairs each for "identical full contraction profile (+ circle
degrees) at the same (k,δ)". These witnesses close the question for the tested
families: **no function of these invariants can decide feasibility.**

The full 28-invariant vector has zero overlap on this sample. This is NOT a
criterion candidate: it is a 530-value lookup table whose components already
fail individually and in every tested sub-combination; with 2.55M controls
against 530 near-unique dead vectors, zero overlap is consistent with the
vector simply identifying frameworks almost up to isomorphism (HEURISTIC
reading). It does yield one usable exact statement, below.

## 7. Verdict and what it gives D3

**Binary answer: NO clean combinatorial separation.** Families (a)–(e) —
Laman-style sparsity profiles, over-determination profiles, circle degrees,
SST coordination-class counts (provably ≡ δ + class structure here), and
FJK/GJ pair-contraction profiles — each overlap between ℂ-infeasible cores
and ℂ-feasible controls, with solver-verified witness pairs. The kill
mechanism is not a counting phenomenon at this vocabulary's resolution; D3
should not pursue a pure sparsity/contraction-count criterion.

Two positive signals that survive, exactly stated:

1. **Contraction profiles carry most of the discriminating power** (D1 lead 3
   vindicated as a *feature*, not a criterion): 430/540 dead cores have a
   pair-contraction profile that not one of 2,551,993 feasible controls
   attains; within matched (k,δ) cells, 470/540. If D3 pursues a
   census-shaped route, the contraction profile is the natural index key —
   but the 110 colliding cores prove it cannot be the whole statement.
2. **Every kill is a forced gauge-pair collapse** (PROVEN corollary of the
   pruning argument + 540/540 cores containing {0,1}): the target lemma's
   shape is "these equidistance patterns force u = v", i.e. exactly the
   shared-bisector rigidity vocabulary of the in-house Near Enemy chain
   flagged in the D1 addendum — consistent with routing D3 toward
   ideal-membership/geometric certificates rather than combinatorial counts.

## 8. Artifacts

| file | content |
|---|---|
| `validate_schema.py`, `validation_summary.json` | schema + regeneration validation V1–V5 |
| `alive_2000_{555,654}.jsonl` | derived full ℂ-alive control cube sets |
| `spot_verify_alive.{py,json,log}` | msolve spot-verification of derived labels (50+50 cubes) |
| `mine_cores.py`, `mine_cores_v2.py` | mining drivers (unpruned reference / gauge-pruned production) |
| `mined_cores_v2_{555,654}{,_b}.jsonl` | mined dead cores, incremental records |
| `mined_cores_{555,654}.jsonl`, `mined_v2_validation_654.jsonl`, `smoke_miner.log` | oracle smoke + unpruned validation runs |
| `invariants.py` | invariant definitions + hand-verified smoke (run: `uv run python invariants.py`) |
| `sweep.py`, `sweep_summary_{dead,controls}.json`, `sweep_dead_final.log`, `sweep_controls.log` | production sweeps |
| `per_core_invariants.jsonl` | one record per mined dead core (547; task deliverable) |
| `controls_all_{555,654}.jsonl.gz` | full records for all 2.55M eligible controls |
| `analyze.py`, `analyze_final.log`, `separation_report.json` | separation analysis (per-slice/pooled/matched-cell) |
| `extract_witnesses.py`, `collision_witnesses.json`, `extract_witnesses.log` | explicit witness pairs + direct solver verification |
| `DEPS_MANIFEST.sha256` | provenance of the two copied dependency modules |
