# P97 card-14 Kalmanson program — Wave 3 checkpoint

**Date:** 2026-09-03  
**Project:** Erdős 97–96 formalization  
**Wave status:** substantive progress, but the source-faithful card-14 profile regeneration remains open pending one encoder adapter.  
**Primary claim boundary:** every retained historical card-14 witness is now known to violate a source-clean Kalmanson terminal; no whole card-14 profile has yet been regenerated and proved UNSAT with the new bank.

## 1. Executive result

Wave 3 separates three logically different statements that had previously been easy to conflate.

1. **Historical-witness elimination.** An independent project-channel scan of the six retained authenticated card-14 assignments found at least one literal positive selected-row occurrence of the source-clean `301_415_205` six-role Kalmanson schema in every assignment. Therefore all six historical witnesses are geometrically invalid.
2. **Profile-wide coverage.** This has **not** yet been run. The historical assignment bytes were not preserved in this bundle, and the current card-14 profile path still needs an adapter binding its chosen-K4 selector variables to arbitrary-center row-membership literals and publishing the resulting center-to-support map.
3. **Exact finite theorem mining.** A new equality-closure master gives independently replayable exact UNSAT results for the all-center selected-four-row/strict-Kalmanson relaxation through `n=9`. Since `n≤11` is already closed in Lean, these runs are smoke tests and theorem-mining evidence, not a new P97 cardinality closure.

The computation therefore advances the genuine card-14 program without overclaiming: **all old witnesses die; the new bank is complete; the missing work is a deterministic profile regeneration interface and then lazy source-faithful CEGAR.**

## 2. Complete six-role geometric bank

For one cyclic sextuple `i0<i1<i2<i3<i4<i5`, exhaustive exact classification of three-row Berge triangles gives four infeasible dihedral orbits:

| Orbit representative | Orbit size | Certificate type |
|---|---:|---|
| `012_325_415` | 12 | two strict Kalmanson inequalities |
| `012_413_523` | 12 | two strict Kalmanson inequalities |
| `013_412_523` | 12 | two strict Kalmanson inequalities |
| `013_235_415` | 4 | three-comparison strict cycle |

Thus there are exactly **40 forbidden fixed-order incidence schemas per cyclic six-subset**. At `n=14`, the complete family has

```text
40 * choose(14,6) = 120,120
```

unique width-six row-membership no-goods.

The 36 two-Kalmanson templates are exactly the first three size-12 orbits. The four additional templates are the size-4 `013_235_415` orbit. This reconciles the earlier 108,108-clause and 120,120-clause counts.

Project source report: commit `f6c1a632e` added the 40 fixed-order consumers as an opt-in generic cut family plus a regression. The remaining issue is not theorem-bank coverage; it is the adapter from the card-14 profile solver's chosen-support representation into those generic cut literals and durable result publication.

## 3. All six retained historical card-14 witnesses die

The following table records the independent scan reported in project-channel message `#9452`. “Literal positive occurrences” means all three required same-center pairs occur in the selected K4 supports of the authenticated assignment, so the source-clean theorem applies directly to that displayed witness.

| Profile | Cap triple `(s,o1,o2)` | Structural type | Assignment digest | All named-schema occurrences | `301_415_205` occurrences | Literal positive occurrences |
|---|---:|---|---|---:|---:|---:|
| `secondOpposite` | `(5,4,8)` | pure second growth | `b48b4aa0…ec8d` | 74 | 2 | **1** |
| `surplusS6O1Four` | `(6,4,7)` | deep-growth mixed | `087e79b5…1f7f` | 69 | 3 | **3** |
| `surplusS6O1Five` | `(6,5,6)` | `z=0` exact-grid mixed | `c1bcd5ec…9e2e` | 58 | 2 | **1** |
| `surplusS7` | `(7,4,6)` | `z=0` exact-grid pure surplus | `9f60a546…23ad` | 56 | 4 | **2** |
| `firstOppositeO1Five` | `(5,5,7)` | deep-growth mixed | `c3deacf2…57df` | 89 | 2 | **2** |
| `firstOppositeO1Six` | `(5,6,6)` | `z=0` exact-grid pure first-opposite | authenticated maximal model `03166e4a…33d84` | 59 | 6 | **4** |

Every final column entry is positive. Therefore every displayed historical witness is excluded by an existing exact geometric theorem—without coordinates, nonlinear SMT, triangle inequalities, or approximate arithmetic.

### Provenance anomaly caught during verification

Message `#9452` printed a 63-character hexadecimal string for the last profile's per-assignment digest. That cannot be a SHA-256 digest. This checkpoint therefore identifies the last historical object using the independently reported authenticated maximal-model SHA-256

```text
03166e4a947c0b66559edb8732a91828ad5a4e0ff5efb8a90e91e0959c233d84
```

and preserves the malformed reported string separately in `profile-witness-scan.json`. No missing nibble was guessed.

### What this does not prove

These are six witness eliminations, not six profile UNSAT results. A profile may have another structural assignment avoiding the currently displayed occurrence. Profile-wide closure requires a solver rerun with learned cuts or an exhaustive proof that every assignment contains a forbidden occurrence.

## 4. Why the source-faithful profile rerun has not yet happened

The generic 40-schema bank exists, but the current card-14 structural route has not yet supplied the following end-to-end interface:

1. a literal meaning “point `p` belongs to the chosen selected-four support at arbitrary center `c`” that is shared by the profile encoder and the cut generator;
2. a deterministic decoder from the total assignment to **every** center's selected support;
3. immutable publication of the raw assignment bytes, cyclic profile order, decoded row table, source and input hashes, and cut-bank hash;
4. independent replay proving that the decoded support map satisfies the base profile formula and that each learned no-good is source-valid;
5. a result identity that changes whenever the profile order, source revision, variable layout, bank, or assignment changes.

The historical receipts retained job IDs, orders and hashes, but did not preserve all assignment bytes needed for a new independent replay. Reusing prose row tables would therefore be unsound.

The first adapter acceptance gate is deliberately small:

- an uncut smoke system must remain SAT and publish all selected supports;
- enabling one known matching 40-bank clause must reject the known bad model;
- a negative/tampered row-map replay must fail closed;
- the full run packet must bind source, variable layout, order, assignment, row map and cut bank.

No Wave-3 card-14 SAT, UNSAT or timeout verdict is claimed before that gate passes.

## 5. Exact all-center K4/Kalmanson smoke census

### 5.1 Dynamic exact master

For a cyclically ordered `n`-label carrier, each center chooses a four-element support from the other labels. Choosing a row identifies the four distance edges from that center. A rollback union-find maintains the exact equality closure of all chosen row edges.

For every cyclic quadruple, the master considers both strict Kalmanson inequalities. If the multiset of quotient distance components on the positive side equals the multiset on the negative side, the inequality has become

```text
0 > 0
```

and the branch is rejected immediately. This is monotone under adding further row equalities and uses no floating-point or optimization oracle.

The master can additionally reject the complete 40-schema Berge bank. Symmetry reduction is checked either not at all, by rotation, or by a dihedral-canonical center-zero signature.

### 5.2 Exact results

| `n` | Row choices per center | Raw row-system space | Geometric bank used | Exact status | Memo states | Transitions |
|---:|---:|---:|---|---|---:|---:|
| 5 | 1 | 1 | single-K collapse only | UNSAT | 1 | 1 |
| 6 | 5 | 15,625 | single-K collapse only | UNSAT | 5 | 25 |
| 7 | 15 | 170,859,375 | single-K collapse only | UNSAT | 45 | 675 |
| 8 | 35 | 2,251,875,390,625 | single-K collapse only | UNSAT | 931 | 32,585 |
| 9 | 70 | 40,353,607,000,000,000 | 3,360 complete Berge no-goods + single-K collapse | UNSAT | 4,235 | 183,160 |

The `n=9` result was independently replayed with the sound rotation breaker. A separate dihedral run also returned exact UNSAT with 1,573 memo states and 69,461 transitions; its older internal collapse-label format is retained as a cross-check but the rotation run is the canonical byte-for-byte replay target.

### 5.3 Independent n=8 CEGAR cross-check

Before the stronger direct equality-closure master was written, an exact Farkas CEGAR route learned 352 seed cores. Dihedral closure gave 4,440 no-goods; inclusion minimization retained 3,736. Together with the 1,120 complete Berge clauses, the final exact master had 4,856 no-goods and proved UNSAT in 347 states / 12,145 transitions.

The deterministic verifier reruns this master and obtains the same structural result. This is independent agreement between two exact encodings.

### 5.4 Interpretation

These finite results are not presented as new closure of P97: the project already has Lean closure through `n=11`. Their value is structural:

- for `n≤8`, universal selected-four rows alone already force a one-inequality equality collapse;
- `n=9` is the first size here requiring explicit small three-row order motifs in addition to one-inequality collapse;
- equality-component reasoning is dramatically cheaper than coordinate NRA for screening row assignments;
- the same incremental union-find and exact Kalmanson screen should be the inner loop of the regenerated card-14 CEGAR campaign.

## 6. First unresolved smoke frontier: `n=10`

At `n=10`, each center has `choose(9,4)=126` possible rows and the raw space is

```text
126^10 = 1,008,568,618,886,953,829,376.
```

Two bounded exact searches were run:

| Search | Extra incidence cuts | State limit | States | Transitions | Status |
|---|---|---:|---:|---:|---|
| base dynamic master | none beyond 8,400 Berge clauses | 10,000 | 10,001 | 1,224,492 | limit exhausted |
| incidence-enhanced | row intersection≤2 and pair codegree≤2 | 5,000 | 5,001 | 626,397 | limit exhausted |

Neither returned a witness, but neither is an UNSAT proof. These records are classified only as an integrity-checked scaling frontier. Since `n=10` is already Lean-closed, further effort here has lower priority than the card-14 source adapter.

## 7. Source-side reduction learned during Wave 3

The card-14 profile order should no longer be arbitrary. Source analysis shows that `z=0`, meaning `oppCap2.card=6`, forces the two disjoint A2 radius classes to partition the four-point strict second-opposite interior and hence forces an exact two-radius adjacent-cap grid.

The recommended profile execution order is therefore:

1. `z=0` exact-grid cells:
   - `(7,4,6)` — `surplusS7`;
   - `(5,6,6)` — `firstOppositeO1Six`;
   - `(6,5,6)` — `surplusS6O1Five`.
2. Deep-growth mixed cells:
   - `(6,4,7)` — `surplusS6O1Four`;
   - `(5,5,7)` — `firstOppositeO1Five`.
3. Bounded pure-second control:
   - `(5,4,8)` — `secondOpposite`.

For each `z=0` UNSAT result, normalized positive incidence cuts should be intersected across the three profiles and replayed in a support-open Grid packet. A common local core that does not use exact `n=14`, cap exhaustion, or in-label `k4_everywhere` would be a candidate for a cardinality-generic Grid terminal.

The general certificate layer is already close to adequate: `WeightedKalmansonCancellationData` is cardinality-parametric and supports both strict Kalmanson forms with exact Nat weights and explicit equality-closure paths. The missing piece is a generic source/CNF adapter from an injective cyclic role map and selected-support atoms into that checked structure; the current occurrence adapter is fixed to a concrete finite role type.

## 8. Heredity audit required for every future profile UNSAT

A profile-wide UNSAT result must be classified by which clause families its core uses.

### Potentially local/hereditary

- named positive selected-row memberships;
- a bounded injective cyclic role map in the original ambient carrier;
- exact equal-radius equations coming from those named rows;
- strict Kalmanson inequalities;
- row-intersection and pair-codegree geometric bounds;
- explicit deletion/source relations whose ambient source theorem is retained.

### Non-hereditary or exact-cardinality-sensitive

- exact total cardinality 14;
- exact cap exhaustion;
- `k4_everywhere` restricted to the selected 14 labels;
- global blocker coverage within the selected labels;
- negative membership inferred only because a point is not among the selected labels;
- full-class closure asserted only inside a proper induced subset.

A local core can seed an arbitrary-cardinality occurrence theorem. A core using the second group closes only a fixed finite profile unless a separate source lift is proved.

## 9. Deterministic next execution

Once the adapter lands, the next computation is fixed:

1. Run the three `z=0` profiles without geometric cuts and publish exact total assignments and decoded row maps.
2. Scan only the actual selected supports for the 40 forbidden six-role schemas; add the violated no-goods lazily.
3. After six-role saturation, union-find all positive row equalities and scan all `2*choose(14,4)=2,002` strict Kalmanson forms for:
   - one-form zero collapse;
   - opposite-vector two-form cancellation;
   - then exact rational Farkas supports.
4. Expand each quotient certificate to the minimal source row-membership atoms through an equality proof forest.
5. Iterate to authenticated SAT or proof-producing UNSAT.
6. For UNSAT, run the heredity audit above and source-open replay before proposing a general theorem.
7. Repeat for the two deep-growth mixed profiles and finally the pure-second control.

This avoids eagerly materializing large banks at higher cardinality and ensures that the final proof package contains only the finite cuts actually needed.

## 10. Reproducibility and verification

`verify_wave3.py` performs the following independently:

- compiles all core Python scripts;
- checks embedded canonical payload hashes for ten principal result files;
- regenerates the complete 40-schema bank counts at `n=6,8,9,10,14`;
- reruns the exact no-symmetry `n=5,6,7,8` masters byte-for-byte modulo elapsed time and payload digest;
- reruns the exact rotation-canonical `n=9` master;
- reruns the independently learned `n=8` 4,856-no-good master;
- checks the `n=10` records are explicitly `LIMIT_EXHAUSTED`, not SAT/UNSAT;
- checks that all six historical profiles have a reported literal killing occurrence while marking their assignment bytes unavailable;
- checks that the profile-wide rerun status remains `NOT_RUN`.

Current verification result:

```text
PASS
payload SHA-256: 2d8b3b7e127d41fad8e368c247d3e4e1716fcec3f3aa0cef381b34b7ff81128d
```

## 11. Bottom line

Wave 3 has not yet closed a card-14 profile, but it has removed the main ambiguity around the evidence:

- **all six old card-14 witnesses are dead;**
- **the complete six-role bank is exactly known and source-banked;**
- **the equality-closure screen is exact, fast and independently replayed;**
- **the only blocker to a real six-profile campaign is the authenticated selected-support adapter and deterministic model publication;**
- **future UNSAT claims have a precise heredity test separating fixed-card closure from a general P97 theorem.**

No coordinate survivor, counterexample claim, profile-wide UNSAT claim, or arbitrary-cardinality lift is asserted by this checkpoint.
