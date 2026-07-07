# k4-bank — Lean-certify the complete dead k=4 window universe

Task: Independently re-derive the complete admissible k=4 window universe, decide
dead/alive per class, confirm/refute "exactly 10 dead", produce exact
ℚ-Nullstellensatz certificates for every dead class, and emit a self-contained
sorry-free Lean module `lean/Erdos9796Proof/P97/K4WindowBank.lean`.

Deliverable module stays UNIMPORTED (deliberate). No git. Files touched:
scratch/k4-bank/** and lean/Erdos9796Proof/P97/K4WindowBank.lean ONLY.

## Definitions adopted (with citations)

### Admissible k=4 window class
A witness-set (shell) map K: {0,1,2,3} -> 2^{others(v)}: each vertex v picks any
subset of the other three (sizes 0,1,2,3). A center is ACTIVE iff |K(c)| >= 2.
The class is admissible iff it has >= 1 active center.
  - Source: scratch/u12-census-port/dichotomy/classify.py:724-745 (tierC).
    per_vertex = all subsets sizes 0..3 (line 733-736); active iff len>=2
    (line 738); require >=1 active (line 739-740 `if not g: continue`).
  - Semantics: for active center c, members of K(c) are equidistant from c;
    generator per extra member = d2(c,M[0]) - d2(c,Mj).
    Source: classify.py:260-263; census554_lib.py:193-203; miner.py:51-63.

### Deadness (C_DEAD)
Class is dead iff the system {equidistance generators} ∪ {t_j·d2(a,b)-1 : all
C(4,2) pairs} is ℂ-empty  <=>  reduced GB over ℚ = {1}  <=>  msolve returns [-1].
  - Source: classify.py:26, 237-277 (encode_core), 415-417, 442-447.
  - Gauge: point 0->(0,0), point 1->(1,0), points 2,3 free (x2x,x2y,x3x,x3y).
    Source: classify.py:222-228 (coord_rel). WLOG by similarity transitivity on
    ordered pairs with nonzero squared separation (report §"Encoding" lemma G).

### Canonicalization
Two classes are equal iff related by a relabeling of the 4 points (S4 acting on
edges c->m). classify.py:147-185 canonicalizes the SUPPORT edge set under graph
iso (degree refinement + orbit-min edge tuple). INDEPENDENT re-derivation here
uses brute-force S4: min over all 24 permutations of the relabeled edge tuple.
These yield the SAME class partition (an S4 map of edge sets is a support-graph
iso and vice-versa; isolated vertices are interchangeable).

### delta
delta = R - (2k-4) = R - 4 for k=4, where R = Σ(|K(c)|-1) over active centers
(number of equidistance generators). Source: classify.py:411.

## Certificate format (census554_pattern_certificate.v1 shape)
  - generators: equidistance polys + Rabinowitsch t_j·d2(a,b)-1 (kept pairs).
  - coefficients: Singular `lift(I, ideal(1))` cofactors.
  - identity: Σ coefficients[i]·generators[i] = 1, re-checked in exact Fractions.
  - kill ∈ {base (no separators), pair:a-b (one), multi_pair (>=2)}.
  - Source: miner.py:313-414 (certify_pattern); verify_certs.py (exact recheck).
Lean checker: EndpointCertificate/Checker.lean checkCertificate verifies
Σ cᵢ·gᵢ = 1 over exact Rat; variable-count generic (Nat-indexed vars).
Lean var indexing chosen: x2x=0,x2y=1,x3x=2,x3y=3, t_j=4+j.

## The 10 dead classes from the dichotomy run (per_core_dichotomy.jsonl, Tier C)
delta multiset {1,1,1,1,2,2,2,2,3,4}. Canonical forms recorded in
scratch/k4-bank/dichotomy_dead_canons.json. To be independently reconfirmed.
  - Vesica (smoke i): 0:[1,2,3];1:[2,3];2:[0,1,3]  (R=5, delta=1).
  - Dead pair (smoke ii): 0:[1,2,3];1:[2,3];2:[0,3];3:[1,2] (R=5, delta=1).
  - Alive pair (smoke ii, must NOT be dead): 0:[1,2,3];1:[2,3];2:[1,3];3:[1,2].

## Progress log
- [done] Read all mandatory artifacts (d3/dichotomy/census-554 reports,
  classify.py, census554_lib.py, miner.py, verify_certs.py, Checker.lean,
  EpQ1000.lean format).
- [done] Pulled 10 dichotomy Tier C dead canons; delta multiset matches.
- [done] Independent enumeration+classification (enumerate.py): 44 classes,
  10 dead, 34 alive; delta multiset [1,1,1,1,2,2,2,2,3,4]; dead set == dichotomy
  Tier C canons (10/10); smoke (i) vesica dead, smoke (ii) dead-in/alive-out. PASS.
- [done] Certificates (certify.py): ALL 10 are BASE kills (equality-only,
  1 in <equidistance>, no Rabinowitsch separators). Exact-Fraction identity
  verified for all 10 (generator fidelity + Σ cᵢ·gᵢ = 1). Corroborated by the
  dichotomy's base_pinned_empty=true on all ten. Certs are tiny: <=8 gens,
  <=24 terms, total degree <=3, cofactor denominators <=4.
- [done] Emitted lean/Erdos9796Proof/P97/K4WindowBank.lean (emit_lean.py, 305
  lines): per-class certificate defs + `k4_dead_NN_valid` theorems + aggregate
  `k4DeadCertificates_all_valid`. Builds clean (lake build ...K4WindowBank,
  EXIT 0, no warnings), sorry-free, UNIMPORTED.
- [done] native_decide chosen (not kernel-pure decide): checkCertificate runs
  over Rat; Rat normalization (Nat.gcd, well-founded recursion) does NOT reduce
  in the kernel — even `(1/3+2/3=1)` gets stuck under `decide` (verified). This
  matches the existing EndpointCertificate.Patterns EpQ files. Axiom closure
  (axcheck.lean) = {propext, Classical.choice, Quot.sound, Lean.ofReduceBool,
  Lean.trustCompiler} on all theorems — allowed set per native_decide policy.
- [done] Smoke (iii) mutation control: Lean `checkCertificate
  k4_dead_00_corrupted = false` proven (native_decide); Python exact-Fraction
  rejects a corrupted coefficient (sum!=1) and a corrupted generator (fidelity).

## Reproduction
    cd scratch/k4-bank
    uv run python enumerate.py     # 44 classes / 10 dead; smoke (i),(ii); PASS
    uv run python certify.py       # 10 exact certificates -> certs.json
    uv run python emit_lean.py     # writes lean/.../P97/K4WindowBank.lean
    cd ../../lean && lake build Erdos9796Proof.P97.K4WindowBank   # EXIT 0
    lake env lean ../scratch/k4-bank/axcheck.lean   # axioms + Lean mutation ctrl

## The 10 dead classes (canonical rep; all base kills)
  R=5,d=1: 0:[1,2];1:[0,2];2:[0,3];3:[0,1,2]      (== dead-pair, smoke ii)
  R=5,d=1: 0:[1,2];1:[0,3];2:[1,3];3:[0,1,2]
  R=5,d=1: 0:[1,2];1:[2,3];2:[0,1,3];3:[0,2]
  R=5,d=1: 1:[0,2];2:[0,1,3];3:[0,1,2]            (== vesica, smoke i)
  R=6,d=2: 0:[1,2];1:[0,2];2:[0,1,3];3:[0,1,2]
  R=6,d=2: 0:[1,2];1:[0,3];2:[0,1,3];3:[0,1,2]
  R=6,d=2: 0:[1,2];1:[2,3];2:[0,1,3];3:[0,1,2]
  R=6,d=2: 1:[0,2,3];2:[0,1,3];3:[0,1,2]
  R=7,d=3: 0:[1,2];1:[0,2,3];2:[0,1,3];3:[0,1,2]
  R=8,d=4: 0:[1,2,3];1:[0,2,3];2:[0,1,3];3:[0,1,2] (complete: 4 mutually equidistant)

## Rigor labels
- Enumeration "exactly 44 admissible classes, exactly 10 dead" — PROVEN by
  exhaustive exact enumeration; the msolve dead/alive oracle is EMPIRICALLY
  VERIFIED, but each dead verdict is upgraded to PROVEN by an exact-Fraction
  Nullstellensatz certificate (1 in the equality ideal). Cross-checked against
  the independent dichotomy Tier C run (10/10 canon match, mode=Cempty).
- The Lean module `K4WindowBank` build = PROVEN (kernel-checked) for the
  identity checks `checkCertificate = true`, with the reported native_decide
  axiom cost (Lean.ofReduceBool + Lean.trustCompiler).
- NOT claimed here: geometric soundness wiring (that these identities close the
  leaf) — deliberately deferred; module is unimported.
