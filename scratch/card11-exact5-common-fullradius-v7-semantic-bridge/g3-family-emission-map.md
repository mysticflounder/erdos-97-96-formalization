# Exact-11 v7 G3 family emission map

Source audit only.  The four
`scratch/card11-exact5-common-fullradius-v7/runs/*/manifest.json` files have
identical clause blocks.  Their common post-prefix starts at original
position `414048`; positions `1..414047` are inherited.  Counts below are
full source-family counts, not retained-core counts.

## Notation and ordering

- Labels are `L = [0,...,10]`; `I(c) = L \ {c}`.  `comb(A,k)` means
  `itertools.combinations(A,k)` in lexicographic iteration order.
- `R[r] = (c,i,B,X)` is manifest `selected_rows[r]` in array order
  (`1949` rows, every `|B|=4`).  Per-center row counts are
  `[210,43,16,210,210,210,210,210,210,210,210]`.
- `C[j] = (q,c,i,Y)` is manifest `source_choices[j]` in array/source-loop
  order (`6550` choices).  Per-source counts are
  `[689,760,766,686,686,686,84,84,707,701,701]`.
- `K` is manifest `source_center_variables`, ordered lexicographically by
  `(q,c)` (`92` keys).  `C(q,c)` is the ordered sublist of choices at that
  key.  `M(q,c)` and `U(c)` denote the source-center and used-center atoms.
  Numbers of `M(_,c)` by center are
  `[8,8,8,8,8,8,9,9,10,8,8]`.
- `E(c;a,b)` is the canonical local-equality atom.  `e(a,b)` is the
  canonical carrier edge and `G(e,f)` the canonical global-equality atom.
  `H(c;B)` is `localFour`; `W(q,c;{a,b})` is `qdeletedPair`; `O[o]` is the
  order-selector in manifest array order.
- For a block beginning at `F`, let `k = original_position - F` (zero based).
  “Unrank” below always means indexing the stated Python loop/order, so it is
  an exact inverse of the generator without assuming a closed-form
  combinadic convention.

G3 first emits selector totality at G3 clause `1`.  For each original
position `p`, it then emits the source clause once if all four cases agree;
otherwise it emits, in order,
`[-49358,*clause(s2_o9)]`, `[-49359,*clause(s3_o0)]`,
`[-49360,*clause(s3_o9)]`.  Thus a common position has G3 id
`p + 1 + 2·(# differing positions before p)`; a differing position starts
at that id and occupies three ids.

## v2/v3 families

| Family; original positions | Exact loop / position decode | Exact source clause(s) | Source count; G3 count |
|---|---|---|---:|
| `local-equality-transitivity`; `414048..418007` | `c in L`; `(a,b,d) in comb(I(c),3)`; branch `t=0,1,2`.  Decode `c=k//360`, then triple `(k%360)//3`, `t=k%3`. | With `ab=E(c;a,b)`, `ad=E(c;a,d)`, `bd=E(c;b,d)`: `[-ab,-ad,+bd]`, `[-ab,-bd,+ad]`, `[-ad,-bd,+ab]`. | `11·C(10,3)·3 = 3960`; `3960` common |
| `selected-row-internal-radius-equalities`; `418008..429701` | `R[r]`, then `(a,b) in comb(B,2)`.  Decode `r=k//6`, pair rank `k%6`. | `[-X,+E(c;a,b)]`. | `1949·6 = 11694`; `11694` common |
| `source-center-iff-some-source-row-choice`; `429702..436343` | For each `(q,c) in K`, emit one clause per `Y in C(q,c)`, then one reverse clause.  Decode by scanning key groups of length `|C(q,c)|+1`. | `[-Y,+M(q,c)]`; then `[-M(q,c),+Y₀,...,+Yₙ₋₁]`. | `6550+92 = 6642`; `6642` common |
| `used-center-iff-some-source-center-map`; `436344..436446` | `c in L`; all `M(q,c)` in `K` order, then reverse.  Decode by center groups of lengths `[9,9,9,9,9,9,10,10,11,9,9]`. | `[-M(q,c),+U(c)]`; then `[-U(c),+M(q₀,c),...]`. | `92+11 = 103`; `103` common |
| `source-choice-implies-entire-blocker-radius-class`; `436447..483222` | `R[r]=(c,i,B,X)`; `a in sorted(B)`; `z in sorted(I(c)\B)`.  Decode `r=k//24`, then `a` index `(k%24)//6`, `z` index `k%6`. | `[-U(c),-X,-E(c;a,z)]`. | `1949·4·6 = 46776`; `46776` common |
| `source-choice-no-qfree-after-that-source-deletion`; `483223..494814` | `(q,c) in K`; `Q in comb(I(c)\{q},4)`, with anchor `a=Q[0]`.  Decode key `k//126`, four-set rank `k%126`. | `[-M(q,c),-E(c;a,Q₁),-E(c;a,Q₂),-E(c;a,Q₃)]`. | `92·C(9,4) = 11592`; `11592` common |
| `first-apex-named-exact-five-entire-class`; `494815..494849` | `c=1`; case shell `B` below.  First `comb(B,2)` (10 positions), then `a in sorted(B)`, `z in sorted(I(c)\B)` (25 positions). | First `[+E(c;a,b)]`; then `[-E(c;a,z)]`. | `10+25 = 35`; all differ, hence `105` guarded |
| `global-edge-equality-transitivity`; `494850..573554` | `(e,f,g) in comb(comb(L,2),3)`; branch `t=0,1,2`.  Decode triple `k//3`, branch `k%3`. | With `ef=G(e,f)`, `eg=G(e,g)`, `fg=G(f,g)`: `[-ef,-eg,+fg]`, `[-ef,-fg,+eg]`, `[-eg,-fg,+ef]`. | `C(55,3)·3 = 78705`; `78705` common |
| `selected-row-global-equality-seeds`; `573555..585248` | `R[r]=(c,i,B,X)`; `(a,b) in comb(B,2)`.  Decode `r=k//6`, pair rank `k%6`. | `[-X,+G(e(c,a),e(c,b))]`. | `1949·6 = 11694`; `11694` common |
| `first-apex-exact-five-global-equality-seeds`; `585249..585258` | `c=1`; `(a,b) in comb(B,2)`.  Decode pair rank `k`. | `[+G(e(c,a),e(c,b))]`. | `C(5,2)=10`; all differ, hence `30` guarded |
| `duplicate-center-core-exclusions`; `585259..589878` | `(p,q,r) in comb(L,3)`; `(c₁,c₂) in comb(L\{p,q,r},2)`.  Decode triple `k//28`, center-pair rank `k%28`. | `[-G(e(c₁,p),e(c₁,q)),-G(e(c₁,p),e(c₁,r)),-G(e(c₂,p),e(c₂,q)),-G(e(c₂,p),e(c₂,r))]`. | `C(11,3)·C(8,2)=4620`; `4620` common |
| `perpendicular-bisector-core-exclusions`; `589879..594498` | `(a,b) in comb(L,2)`; `(p,q,r) in comb(L\{a,b},3)`.  Decode focus pair `k//84`, outside-triple rank `k%84`. | `[-G(e(p,a),e(p,b)),-G(e(q,a),e(q,b)),-G(e(r,a),e(r,b))]`. | `C(11,2)·C(9,3)=4620`; `4620` common |
| `convex-five-point-core-forward-exclusions`; `594499..927138` | For each manifest order `o`, each start index `s` (`a=order[s]`), let `T=order[s+1:]+order[:s]`; choose indices `i₁<i₂<i₃<i₄ in comb(range(10),4)` and set `(x,b,c,y)=T[i₁,i₂,i₃,i₄]`.  Decode `o=k//2310`, `s=(k%2310)//210`, combination rank `k%210`. | `[-O[o],-G(e(x,a),e(x,b)),-G(e(y,a),e(y,b)),-G(e(c,b),e(c,x)),-G(e(c,b),e(c,y))]`. | `144·11·C(10,4)=332640`; no dedup loss and all common |

The case-dependent first-apex sets are:

| case | `B = shell.u5` |
|---|---|
| `s2_o0` | `{0,2,6,7,8}` |
| `s2_o9` | `{2,6,7,8,9}` |
| `s3_o0` | `{0,3,6,7,8}` |
| `s3_o9` | `{3,6,7,8,9}` |

## v6/v7 families

| Family; original positions | Exact loop / position decode | Exact source clause(s) | Source count; G3 count |
|---|---|---|---:|
| `v6-local-four-class-witness-iff`; `927139..936378` | `(c,B,H)` in manifest `v6_local_four_class_variables` order; `a=min(B)` and `E_j=E(c;a,B[j])`, `j=1,2,3`; branch `t=0..3`.  Decode helper `k//4`, branch `k%4`. | For `t<3`: `[-H,+E_{t+1}]`; for `t=3`: `[+H,-E₁,-E₂,-E₃]`. | `2310·4=9240`; `9240` common |
| `v6-qdeleted-pair-witness-iff`; `936379..1023498` | `(q,c,a,b,W)` in manifest qpair order.  Let `Z=L\{q,c,a,b}` and enumerate `(u,v) in comb(Z,2)`; witness `H(c;sort{a,b,u,v})`.  Decode helper `k//22`, branch `t=k%22`. | For `t<21`: `[-H_t,+W]`; for `t=21`: `[-W,+H₀,...,+H₂₀]`. | `3960·22=87120`; `87120` common |
| `v6-u5-nontriple-equilateral-incompatibilities` (Family A); `1023499..1141398` | `C[j]=(q,c,i,Y)`; `B=cand[c][i]`; `T=sorted(B\{q})` (3); `Z=sorted(L\(B∪{c}))` (6); `t in T`, `x in Z`.  Decode `j=k//18`, `t` index `(k%18)//6`, `x` index `k%6`. | `[-Y,-W(q,t;{c,x}),-W(q,x;{c,t})]`. | `6550·3·6=117900` compact (`51,993,900` expanded logical clauses); `117900` common |
| `v6-u5-common-bisector-triple-incompatibilities` (Family B); `1141399..1180698` | Same `C[j],B,T,Z`; `x in Z`.  Decode `j=k//6`, `x` index `k%6`. | `[-Y,-E(x;c,T₀),-E(x;c,T₁),-E(x;c,T₂)]`. | `6550·6=39300`; `39300` common |
| `v7-global-two-center-bisector-parity`; `1180699..1370778` | Manifest order `o`; `F in comb(L,4)`; `(a,b) in comb(F,2)`, with remaining centers `(p,q)`, retaining exactly the four endpoint pairs for which `a,b` are nonalternating relative to `p,q` in that order.  Decode `o=k//1320`, four-set rank `(k%1320)//4`, then the `(k%4)`-th retained endpoint pair in loop order. | `[-O[o],-G(e(p,a),e(p,b)),-G(e(q,a),e(q,b))]`. | `144·(4·C(11,4))=190080`; `190080` common |
| `g3-selector-totality`; no `original_position` | One G3-only clause before the merged source stream. | `[+49358,+49359,+49360]` for `s2_o9,s3_o0,s3_o9`. | `1`; `1` |

## Existing Lean clause constructors

The exact post-prefix clause-constructor search found:

| Coverage | Existing declaration |
|---|---|
| v7 parity, including the exact `144 × 1320` occurrence order | `ExactFiveCommonShellV7.occurrenceClause` and `occurrenceClause_sat` in `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7/OccurrenceCore.lean:224` |
| G3 selector totality | `ExactFiveCommonShellV7.g3SelectorTotalityClause` in `.../G3SelectorSemantics.lean:134` |
| Generic wrapper for every guarded delta payload | `ExactFiveCommonShellV7.g3GuardedClause` in `.../G3SelectorSemantics.lean:151` |

There is no exact signed-clause constructor yet for the other post-prefix
families.  Relevant semantic producers already present include
`Census554.evalClauseD_transitivityClause`,
`Census554.Realizes.exactRowSemantic`,
`EqualityCore.not_realizes_of_duplicateCenterCore`,
`EqualityCore.false_of_convexIndep_of_perpBisectorCore`,
`Census554.ConvexFivePointCore.false_of_core`,
`u5_nontriple_equilateral_on_p_circle_incompatibility`, and
`u5_common_bisector_triple_incompatibility`; these prove semantics but do not
materialize the exact generator clauses.
