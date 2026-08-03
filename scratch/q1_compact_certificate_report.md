# Bounded compact G3 certificate search (2026-08-02)

Target: `T = (bu-bs)*(br-bv)*bv*bw` from generators `q1,e2,e5,e7,e8,e9`, with production `e5(br,bs,bu,bv)` (arity 4).

* `scratch/search_compact_linear.py` solved exact QQ coefficient systems for uniform multiplier degree bounds 1, 2, 3, and 4 (all six generators included). Every system was inconsistent (`EmptySet`). Thus no certificate exists in these low-degree ansatz spaces.
* Singular `lift(I,T)` over QQ in variable order `(br,bs,bu,bv,bw)` verifies `reduce(T,std(I)) = 0` and `T in I`. The six multiplier columns have term counts 1169, 391, 550, 1007, 1061, 860 (total 5038 terms), so this is not compact/Lean-friendly.
* Alternate variable orders `(br,bs,bv,bw,bu)` and `(bu,br,bs,bv,bw)` reached the target remainder check but did not complete the lift within the bounded ~30 s run (no coefficient output; treated resource-blocked). No claim of UNSAT or Lean closure is made.

No production files were modified. No compact exact characteristic-zero producer or Lean 4.27 check was found.
