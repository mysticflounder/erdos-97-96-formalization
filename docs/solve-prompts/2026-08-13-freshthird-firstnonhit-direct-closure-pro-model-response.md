INTERFACE-INSUFFICIENT

This is an Outcome B.2 result: an explicit model blocks the current **packet-projection/incidence route**, but it is not a Euclidean realization, not a `CounterexampleData` model, and not a refutation of the live theorem. The unresolved mathematical content must therefore be supplied by a genuinely global Euclidean, cap-order, or minimality theorem omitted by the projection. This is the distinction required by the prompt. 

## 1. Exact theorem statement

The correct eventual target remains the direct contradiction:

```lean
theorem false_of_freshThird_firstNonHit_core
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    False := by
  -- genuinely new proof
```

The currently stated existential is already contradictory under the two-circle theorem, so proving it and then consuming it is the wrong dependency direction. The compatibility existential should eventually be recovered by `False.elim`, as specified in the prompt.  The current source still has the existential as a `sorry`, with `false_of_freshThird_firstNonHit` immediately unpacking it and applying the two-circle consumer. ([GitHub][1])

### Recommended minimal structural refactor

The single next theorem should not restate a three-overlap or blocked-deletion triple. It should expose the missing **source identities and common actual-blocker fiber**:

```lean
structure FreshThirdQRowActualBlockerFiberPacket
    (Q : FreshThirdBlockerFiber P Pρ) : Type where
  target : CriticalShellSystem.CarrierVertex D.A

  target_center_ne :
    H.centerAt target.1 target.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2

  sources : Finset (CriticalShellSystem.CarrierVertex D.A)

  sources_card :
    3 ≤ sources.card

  sources_subset_fiber :
    sources ⊆ ATailSurvivalCover.actualBlockerFiber H target

  values_subset_qRow :
    sources.image (fun source => source.1) ⊆
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
```

Its source-level producer is the exact missing theorem:

```lean
theorem freshThird_firstNonHit_qRowActualBlockerFiberPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FreshThirdQRowActualBlockerFiberPacket
      (P := P) (Pρ := Pρ) Q
```

That producer is **not proved here**. It is the recommended new frontier.

This packet is more structural than the current existential:

* It retains three genuine carrier sources rather than three anonymous overlap points.
* It records that they share one actual blocker.
* Their membership in the target selected row is derived, rather than assumed.
* It exposes source identities to any later cap, cyclic-order, or radius argument.

For this particular actual-fiber landing, every field is necessary: without `target_center_ne`, the two-circle terminal does not apply; without three sources, there is no contradiction; without a common fiber, the sources need not lie in one row; and without Q-row membership, they yield no Q overlap.

The packet has an entirely clean consumer:

```lean
theorem false_of_freshThirdQRowActualBlockerFiberPacket
    (Q : FreshThirdBlockerFiber P Pρ)
    (K :
      FreshThirdQRowActualBlockerFiberPacket
        (P := P) (Pρ := Pρ) Q) :
    False := by
  classical
  let V :=
    K.sources.image
      (fun source : CriticalShellSystem.CarrierVertex D.A => source.1)

  have hV_target :
      V ⊆
        (H.selectedAt K.target.1
          K.target.2).toCriticalFourShell.support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsource, rfl⟩
    have hfiber := K.sources_subset_fiber hsource
    have hblocker := (Finset.mem_filter.mp hfiber).2
    have hcenter :
        H.centerAt source.1 source.2 =
          H.centerAt K.target.1 K.target.2 :=
      congrArg Subtype.val hblocker
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 K.target.2 hcenter
    rw [← hsupports]
    exact
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support

  have hV_inter :
      V ⊆
        (H.selectedAt K.target.1
              K.target.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hV_target hz, K.values_subset_qRow hz⟩

  have hV_card : V.card = K.sources.card := by
    exact Finset.card_image_of_injective _ Subtype.val_injective

  have hthree :
      3 ≤
        ((H.selectedAt K.target.1
              K.target.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card := by
    calc
      3 ≤ V.card := by
        rw [hV_card]
        exact K.sources_card
      _ ≤ _ := Finset.card_le_card hV_inter

  exact
    ATailMinimalUniqueFourCover
      .false_of_centerAt_selectedFourClass_inter_card_ge_three
        H K.target.1 K.target.2
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass
        K.target_center_ne
        (by
          simpa only [CriticalFourShell.toSelectedFourClass] using hthree)
```

The two upstream facts needed by this consumer are already present: equality of actual blockers identifies selected supports, and actual-blocker fibers inject into exact four-point supports.  The final contradiction is the clean distinct-center two-circle theorem. ([GitHub][2])

## 2. Mathematical argument

### 2.1 The two named rows are exhausted

For the first source, `FreshThirdCapSourceNonHit` has only:

1. `.sameBlocker`, where its center and selected support equal the Q center and row; or
2. `.sourceRowOmission`, where the surviving deletion forces a distinct center, hence its exact four-point row intersects the Q row in at most two points.

The proved theorem `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two` states exactly this. 

The second source has four possible interactions. Its local boundary is the same:

* `.sameBlocker`: same Q center and support;
* `.sourceRowOmission`: distinct center and overlap at most two;
* `.distinctBlockersDifferentCaps`: exact intersection `{Q.source₁, Q.source₂}`;
* `.sameCapWithInternalFiberSource`: the same exact two-point intersection.

This is formalized by `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two`. ([GitHub][1])

Thus neither named source row can supply the desired distinct-center three-overlap. Any proof must produce a **third selected row** or use a different contradiction.

### 2.2 The right ingress arm is not tied to `C`

The common-radius structure contains its own field

```lean
surface : TwoCapSourceThirdCanonicalRowSurface P Pρ
```

and its source-membership facts refer to that `surface`. Nothing in the structure says `surface = C`. ([GitHub][3])

Moreover, the producer’s right branch invokes the common-radius source producer from `C.cap_card_ge_eight`; it does not package an equality between the resulting common-radius surface and the input `C`. ([GitHub][4])

Therefore the right arm cannot be destructured and silently used as common-radius provenance for `C.firstSource` or `C.secondSource`. The prompt explicitly warns against that transport. 

### 2.3 Explicit abstract model

I constructed an executable family of finite models for the following clearly identified packet projection:

* Every selected row contains exactly four carrier values.
* Every `centerAt` value is itself a carrier value and has its own selected row.
* Every source lies in the row at its actual blocker.
* Sources with equal actual blockers share a row.
* Every actual-blocker fiber has cardinality at most four and is contained in that row.
* Rows at distinct centers intersect in at most two values.
* Single- and double-deletion survival are interpreted extensionally by omission from the selected support.
* The named `FreshThirdBlockerFiber`, canonical-source, NonHit, interaction, cap-membership, and chosen ingress-arm fields are all represented.

The center map is carrier-recursive: center labels are reified as carrier points and assigned into disjoint two-center gadgets, so there is no separate noncarrier “center sort.”

Let the named carrier points be

[
p_1,p_2,\quad r_1,r_2,\quad q_1,q_2,\quad c_1,c_2.
]

The retained rows are

[
K_P={p_1,p_2,p'_1,p'_2},\qquad
K_R={r_1,r_2,r'_1,r'_2}.
]

The Q row begins with ({q_1,q_2}). It also contains (c_1) precisely in the NonHit `.sameBlocker` arm, and (c_2) precisely in the interaction `.sameBlocker` arm; fresh fillers complete it to cardinality four.

The first canonical row is:

[
K_{c_1} =
\begin{cases}
K_Q, & \text{NonHit `.sameBlocker`};\
{c_1,a_1,a_2,a_3}, & \text{NonHit `.sourceRowOmission`}.
\end{cases}
]

The second canonical row is:

[
K_{c_2} =
\begin{cases}
K_Q, & \text{interaction `.sameBlocker`};\
{c_2,b_1,b_2,b_3},
& \text{interaction `.sourceRowOmission`};\
{c_2,q_1,q_2,b_1},
& \text{either geometric interaction}.
\end{cases}
]

For `.distinctBlockersDifferentCaps`, the source-row center and Q center are placed in different abstract strict caps. For `.sameCapWithInternalFiberSource`, they are placed in the same cap and one Q source lies in that cap. Center-cap placement is ordinary carrier-point cap placement, not a separate relation.

In the aligned ingress arm:

* (c_1) and (c_2) occupy different singleton first-apex radius slices;
* every represented first-cap radius slice with at least two points is one of the two retained radii;
* one retained endpoint from each pair is omitted from each canonical row;
* both corresponding double deletions survive at the canonical source centers;
* the first-apex failure and nonempty minimal-deletion-core fields are represented.

In the common-radius arm, two independent sources (d_1,d_2) occupy a new two-point radius slice and form an independent common-radius surface. No equality with the live surface `C` is imposed, matching the actual type.

All remaining row fillers and all center-points are completed with exact-four blocker-fiber gadgets. The construction ensures that every pair of distinct-center rows meets in at most two points.

Consequently:

* A named same-blocker row can meet (K_Q) in four points, but it has the **same center**, so it fails the target center inequality.
* Every distinct-center named row meets (K_Q) in zero or two points.
* Every auxiliary, center-recursion, or garbage row meets (K_Q) in at most two points.

Thus no source satisfies the target existential.

The model deliberately omits:

1. actual Euclidean coordinates and the full distance equations;
2. convexity, genuine strict-cap geometry, and cyclic order;
3. the full restored-shell/minimality semantics inside `MinimalDeletionCore`;
4. any carrier-wide theorem coupling the ingress packet to the Q row.

Those omitted facts are exactly where a proof of the live theorem may still reside. Therefore this model blocks only the local packet/incidence inference; it does not falsify the live Lean theorem.

The repository’s earlier independent 15-point artifact already establishes satisfiability of a corrected FirstNonHit incidence projection and explicitly disclaims Euclidean realization, a P97 countermodel, general-(n) scope, or Lean closure. ([GitHub][5]) The new model strengthens that diagnosis by covering every constructor and both ingress arms and by closing the `centerAt` map recursively on carrier points.

## 3. Constructor ledger

Each row below was checked under **both** ingress arms, giving (2\times4\times2=16) variants.

| NonHit arm        | Second interaction             | Q-fiber card in model | (K_{c_1}\cap K_Q) | (K_{c_2}\cap K_Q) | Largest distinct-center Q overlap | Aligned | Common radius |
| ----------------- | ------------------------------ | --------------------: | ----------------: | ----------------: | --------------------------------: | ------- | ------------- |
| sameBlocker       | sameBlocker                    |                     4 |    4, same center |    4, same center |                                 0 | PASS    | PASS          |
| sameBlocker       | sourceRowOmission              |                     3 |    4, same center |                 0 |                                 1 | PASS    | PASS          |
| sameBlocker       | distinctBlockersDifferentCaps  |                     3 |    4, same center |                 2 |                                 2 | PASS    | PASS          |
| sameBlocker       | sameCapWithInternalFiberSource |                     3 |    4, same center |                 2 |                                 2 | PASS    | PASS          |
| sourceRowOmission | sameBlocker                    |                     3 |                 0 |    4, same center |                                 1 | PASS    | PASS          |
| sourceRowOmission | sourceRowOmission              |                     2 |                 0 |                 0 |                                 1 | PASS    | PASS          |
| sourceRowOmission | distinctBlockersDifferentCaps  |                     2 |                 0 |                 2 |                                 2 | PASS    | PASS          |
| sourceRowOmission | sameCapWithInternalFiberSource |                     2 |                 0 |                 2 |                                 2 | PASS    | PASS          |

The apparent four-point overlaps in the table are harmless because they occur only at the Q center. The desired witness requires a different center.

This accounts for both NonHit constructors, all four interaction constructors, and both ingress arms, as required. 

## 4. Provenance ledger

Here, **CLEAN** means source-clean relative to the active residual by declaration/body inspection. It does not substitute for a kernel `#print axioms` run.

| Declaration or fact                                                                                 | Source                                     | Status                          | Use                                                                                     |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------ | ------------------------------- | --------------------------------------------------------------------------------------- |
| `FreshThirdBlockerFiber`                                                                            | `BlockerMultiplicityGeometry.lean`         | CLEAN definition                | Q sources, common actual blocker, freshness, mutual shell incidence                     |
| `CapSourceThirdCanonicalRowWitness`                                                                 | `TwoSourceCanonicalSurface.lean`           | CLEAN definition                | Complete named canonical-source packet                                                  |
| `TwoCapSourceThirdCanonicalRowSurface`                                                              | same                                       | CLEAN definition                | Live surface `C`                                                                        |
| `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`                                                  | same                                       | CLEAN definition                | Independent `.surface`; no equality to `C` ([GitHub][3])                                |
| `false_of_crossBlockerCoincidence`                                                                  | same                                       | OPEN, UNUSED                    | Contains `sorry`; neither model nor proposed consumer uses it ([GitHub][3])             |
| `FreshThirdCapSourceInteraction`                                                                    | `TwoSourceFreshThirdFiber.lean`            | CLEAN definition                | Four constructor arms ([GitHub][6])                                                     |
| `FreshThirdCrossRowHit`, `FreshThirdCrossRowResidual`                                               | same                                       | CLEAN definitions               | Existing alternative landing vocabulary ([GitHub][6])                                   |
| `FreshThirdCapSourceNonHit`                                                                         | same                                       | CLEAN definition                | Two constructor arms                                                                    |
| `false_of_twoCapSources_firstFiberDescentResidual`                                                  | same                                       | OPEN, UNUSED                    | Separate enlarged-fiber residual; not used here ([GitHub][6])                           |
| `FreshThirdAlignedRetainedConsumerPacket`                                                           | `TwoSourceFreshThirdRetainedProducer.lean` | CLEAN relative to this residual | Aligned singleton radii and deletion-core ingress ([GitHub][4])                         |
| `FreshThirdAcyclicCanonicalConsumerPacket` and producer                                             | same                                       | CLEAN relative to this residual | Aligned/common-radius disjunction; source file contains no direct `sorry` ([GitHub][4]) |
| `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two`                                           | `TwoSourceFreshThirdResidual.lean`         | CLEAN                           | Excludes first named row                                                                |
| `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two`                                      | same                                       | CLEAN                           | Excludes second named row                                                               |
| `actualBlockerFiber`, `selectedSupports_eq_of_actualBlockers_eq`, `actualBlockerFiber_card_le_four` | `SurvivalCover.lean`                       | CLEAN; file has no `sorry`      | Proposed structural packet consumer                                                     |
| `false_of_centerAt_selectedFourClass_inter_card_ge_three`                                           | `MinimalUniqueFourCover.lean`              | CLEAN; file has no `sorry`      | Final two-circle contradiction ([GitHub][2])                                            |
| `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`                                   | `TwoSourceFreshThirdResidual.lean`         | OPEN                            | Active `sorry` ([GitHub][1])                                                            |
| `false_of_freshThird_firstNonHit`                                                                   | same                                       | CIRCULAR for present purposes   | Calls the active existential ([GitHub][1])                                              |
| `false_of_freshThird_secondNonHit`                                                                  | same                                       | CIRCULAR                        | Swaps the surface and calls the first-non-hit wrapper ([GitHub][1])                     |
| `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`                                | same                                       | CIRCULAR                        | Its firstNonHit arm calls the wrapper directly ([GitHub][1])                            |
| `false_of_freshThirdEqualCenter_noncanonicalInteractions`                                           | same                                       | OPEN, UNUSED for this result    | Contains two separate residual `sorry`s ([GitHub][1])                                   |

## 5. Circularity audit

The abstract model imports no Lean theorem and assumes no contradictory terminal. It validates a finite list of structural predicates directly.

The proposed packet consumer has only these proof dependencies:

1. `Finset` image and cardinality facts;
2. `actualBlockerFiber`;
3. `selectedSupports_eq_of_actualBlockers_eq`;
4. own-source membership in the selected critical shell;
5. `false_of_centerAt_selectedFourClass_inter_card_ge_three`.

None of those declarations imports or calls:

* the active existential;
* `false_of_freshThird_firstNonHit`;
* the reflected second-non-hit wrapper;
* the normalized remaining residual;
* the normalized common-radius core;
* another FreshThird `False` residual.

The new **producer**, not the consumer, is the sole mathematical obligation. It must be proved directly from the original hypotheses. It may not call any of the downstream wrappers.

The eventual dependency direction must be:

```text
original ingress
  └─ freshThird_firstNonHit_qRowActualBlockerFiberPacket
       └─ false_of_freshThirdQRowActualBlockerFiberPacket
            └─ false_of_freshThird_firstNonHit_core
                 ├─ compatibility existential via False.elim
                 └─ legacy False wrapper as an alias
```

It must not be:

```text
existential sorry
  └─ legacy False wrapper
       └─ new core
```

I could not execute Lean 4.27 or a kernel `#print axioms` audit in this environment. Therefore the circularity conclusion above is a source-level dependency audit, not a claim that a new declaration has already typechecked or passed kernel axiom inspection. That limitation alone prevents a `PROVEN` verdict under the prompt’s acceptance criteria. 

## 6. Lean landing plan

### Declaration order

Create:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  FreshThirdQRowActualBlockerFiber.lean
```

with imports no stronger than:

```lean
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
```

Then:

1. Define `FreshThirdQRowActualBlockerFiberPacket`.

2. Prove `false_of_freshThirdQRowActualBlockerFiberPacket`.

3. Import that file into `TwoSourceFreshThirdResidual.lean`.

4. Prove the sole new source theorem:

   ```lean
   freshThird_firstNonHit_qRowActualBlockerFiberPacket
   ```

5. Define the direct core:

   ```lean
   theorem false_of_freshThird_firstNonHit_core
       (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
       (Q : FreshThirdBlockerFiber P Pρ)
       (hingress :
         FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
       (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
       (secondInteraction :
         FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
       False := by
     exact
       false_of_freshThirdQRowActualBlockerFiberPacket
         (P := P) (Pρ := Pρ) Q
         (freshThird_firstNonHit_qRowActualBlockerFiberPacket
           (P := P) (Pρ := Pρ)
           C Q hingress data secondInteraction)
   ```

6. Reimplement the compatibility existential:

   ```lean
   theorem exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three
       ... :
       ∃ source : CriticalShellSystem.CarrierVertex D.A, ... := by
     exact
       (false_of_freshThird_firstNonHit_core
         (P := P) (Pρ := Pρ)
         C Q hingress data secondInteraction).elim
   ```

7. Make the old wrapper a thin alias:

   ```lean
   theorem false_of_freshThird_firstNonHit
       ... :
       False :=
     false_of_freshThird_firstNonHit_core
       (P := P) (Pρ := Pρ)
       C Q hingress data secondInteraction
   ```

8. Leave the second-non-hit symmetry and normalized spine wired through that direct core.

### Common-radius provenance hygiene

A separate API correction is advisable:

```lean
abbrev FreshThirdAcyclicCanonicalConsumerPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C ∨
    ∃ Ccr : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ,
      FreshThirdCommonSurfaceRel C Ccr.surface
```

`FreshThirdCommonSurfaceRel` must state only source-entitled transport facts. It should not be set to equality unless the producer genuinely constructs the common-radius packet from the same sources as `C`.

This provenance correction alone does **not** close FirstNonHit. It merely prevents invalid transport and makes any future common-radius argument state its actual bridge.

### Required validation after implementation

Run, at minimum:

```lean
#print axioms false_of_freshThirdQRowActualBlockerFiberPacket
#print axioms freshThird_firstNonHit_qRowActualBlockerFiberPacket
#print axioms false_of_freshThird_firstNonHit_core
#print axioms exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three
#print axioms false_of_freshThird_firstNonHit
```

The first and direct-core outputs must not contain `sorryAx`, and the existential’s axiom set must arise only through the direct core.

## 7. Computational contract

The computation used here is an explicit satisfiable model checker, not an UNSAT solver wave.

### Variables

For each constructor/ingress combination, the executable model defines:

* a finite carrier;
* a carrier-valued `centerAt` map;
* one exact-four selected support for every represented center;
* actual-blocker fibers;
* strict-cap memberships;
* selected radius slices;
* single- and double-deletion survival predicates;
* named P, Pρ, Q, and canonical sources;
* an aligned deletion-core projection or an independent common-radius surface.

### Checked clauses

The checker validates:

* all selected supports have cardinality four;
* all row centers are carrier points;
* every source lies in its own actual-blocker row;
* equal blockers share supports;
* actual-blocker fibers have cardinality at most four;
* distinct centers have support intersection at most two;
* deletion survival is exactly omission from the row;
* all named blocker-fiber and canonical-source projection fields;
* the selected NonHit constructor;
* the selected interaction constructor;
* exactly one selected ingress arm;
* absence of any distinct-center three-overlap witness.

All 16 variants pass.

### Scope boundary

No live-arbitrary-cardinality-to-quotient theorem has been proved, and no quotient-to-named-Lean-terminal theorem has been proved. Therefore the symbolic Q-support quotient remains `NO-RUN`. A larger finite search would not change the logical status.

Before any future UNSAT wave, both declarations would be needed in substance:

```lean
theorem liveFirstNonHit_induces_qSupportQuotient
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    Nonempty (FreshThirdFirstNonHitQSupportQuotient ...)
```

and

```lean
theorem false_of_freshThirdFirstNonHitQSupportQuotient
    (M : FreshThirdFirstNonHitQSupportQuotient ...) :
    False
```

The first must encode every arbitrary-cardinality live instance. The second must derive a named clean terminal from quotient clauses. Neither direction is currently available, so no solver wave is authorized.

### Reproducibility artifacts

* [Executable 16-case carrier-recursive model](sandbox:/mnt/data/freshthird_firstnonhit_interface_model.py)
  SHA-256: `c2fb9da1b11197f17c14b7d7fe60a8c3d59e8e05f089e63492ad232a99edabe0`

* [Exact JSON report](sandbox:/mnt/data/freshthird_firstnonhit_interface_model_report.json)
  SHA-256: `a1f0bf2ee62217982517ac5755abd4e1d71e22fb82ac69f6d5e2e84ace480411`

* [Execution log](sandbox:/mnt/data/freshthird_firstnonhit_interface_model.log)
  SHA-256: `e1381de91df003794ce48ec74da95027cdf90c9cc0e2ca04fe8072a39e2823dd`

## 8. Plan delta

The current plan already concludes that the corrected pure blocker/row abstraction is satisfiable, that the cap-fan route cannot synchronize three deletions at one actual center, and that the next admissible step is a genuinely carrier-wide source theorem or a proved general-cardinality lift. ([GitHub][5])

On current `main`, the plan jumps from §13.24.1.12 directly to §13.25. Thus the prompt’s reference to an existing §13.24.1.13 is stale. ([GitHub][5]) Insert the following before §13.25:

```markdown
#### 13.24.1.13 FirstNonHit full constructor-ingress packet model and actual-fiber gate (2026-08-13)

A new explicit packet-projection family covers all `2 × 4 × 2 = 16`
combinations of:

- `FreshThirdCapSourceNonHit`;
- `FreshThirdCapSourceInteraction`; and
- `FreshThirdAcyclicCanonicalConsumerPacket`.

Unlike the earlier isolated incidence model, every `centerAt` value in this
family is itself a carrier point with its own recursively assigned exact-four
selected row. Center-cap placement is ordinary carrier-point cap placement.
Every selected row has cardinality four, every source lies in its actual row,
equal actual blockers share supports, every actual-blocker fiber has
cardinality at most four, deletion survival is interpreted by row omission,
and distinct-center rows intersect in at most two points.

All 16 variants are satisfiable and none contains a distinct-center selected
row meeting the Q row in three points. This is an abstract API model only:
it is not a Euclidean realization, not a `CounterexampleData` model, not a P97
counterexample, and not a refutation of the live Lean theorem. The omitted
semantics are the full Euclidean distance equations, convex/cyclic cap
geometry, restored-shell minimality semantics, and any carrier-wide theorem
coupling the ingress packet to Q.

Accordingly, local constructor, row-incidence, blocker-fiber-cardinality, and
deletion-omission reasoning are exhausted. No further fixed-cardinality or
four-bit quotient run is authorized.

The single next theorem is:

`freshThird_firstNonHit_qRowActualBlockerFiberPacket`

It must produce three genuine carrier sources lying both in the Q row and in
one actual-blocker fiber whose center differs from the Q center. Its clean
consumer derives the three-overlap through
`selectedSupports_eq_of_actualBlockers_eq` and closes with
`false_of_centerAt_selectedFourClass_inter_card_ge_three`.

The common-radius ingress arm remains provenance-separated from the live
surface `C`; any use of its source rows requires an explicit source theorem
relating `C` to the common-radius surface.

The four-bit Q-support quotient remains `NO-RUN` until both an
arbitrary-cardinality live-to-quotient theorem and a quotient-to-named-Lean-
terminal theorem are proved.
```

The strongest honest conclusion is therefore: the direct contradiction may still follow from the full Euclidean/minimality hypotheses, but it does not follow from the presently exploited packet projection. The frontier should be concentrated on the one carrier-wide actual-fiber producer above, not another local constructor split or bounded search.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean"
[2]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean"
[3]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean"
[4]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean"
[5]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/computational-closure-plan-2026-07-28.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/computational-closure-plan-2026-07-28.md"
[6]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean"


FOLLOWUP:
## The productive way to use coordinates

Do **not** coordinatize the entire arbitrary-size carrier and ask a solver to rediscover the theorem. Instead:

1. Extract a fixed collection of six to roughly ten **named carrier points** from the live hypotheses.
2. Prove in Lean that every live arbitrary-cardinality instance produces that finite metric packet.
3. Normalize two of those points by a Euclidean similarity.
4. Eliminate the remaining coordinates using exact polynomial equalities and signed-area inequalities.
5. Import only the minimized algebraic contradiction back into Lean.

That avoids the finite-to-universal problem. The attached prompt correctly notes that the earlier frozen-coordinate and exact-cardinality runs did not provide such an ingress theorem. 

The repository already contains almost exactly the coordinate consumer we need in `TwoTripleRowSixPointEuclideanObstruction.lean`, and `TwoSourceFreshThirdResidual.lean` already imports and uses it elsewhere. 

## 1. The six-point coordinate contradiction

Suppose two selected rows have distinct centers (B,F), share two carrier points (A,D), and have additional support points (C,E):

[
BA=BC=BD,
\qquad
FA=FD=FE.
]

Assume their convex boundary order is, up to cyclic rotation and reversal,

[
A<B<C<D<E<F.
]

Normalize the common chord:

[
A=(0,0),\qquad D=(1,0).
]

Write

[
B=(b_x,u),\qquad F=(f_x,v).
]

Because (BA=BD),

[
b_x^2+u^2=(b_x-1)^2+u^2,
]

so

[
b_x=\frac12.
]

Likewise (FA=FD) gives

[
f_x=\frac12.
]

Thus both centers lie on the perpendicular bisector of the common chord:

[
B=\left(\frac12,u\right),
\qquad
F=\left(\frac12,v\right).
]

Now let

[
C=(x,y),\qquad E=(r,s).
]

The two remaining circle equations are

[
BC^2=BA^2
\quad\Longrightarrow\quad
x^2-x+y^2-2uy=0,
\tag{1}
]

and

[
FE^2=FA^2
\quad\Longrightarrow\quad
r^2-r+s^2-2vs=0.
\tag{2}
]

The cyclic order gives signed-area inequalities. With a consistent orientation, the important consequences are

[
u>0,\qquad y>0,\qquad v<0,\qquad s<0,
]

together with

[
\frac y2-ux<0,
\tag{3}
]

and

[
rv-\frac s2<0.
\tag{4}
]

From (3), (y<2ux). Since (u,y>0), this first implies (x>0). If (x\leq1), then (y<2u), while (1) rearranges to

[
x(x-1)=y(2u-y)>0,
]

contradicting (0<x\leq1). Therefore

[
x>1.
]

Similarly, (4) together with (v,s<0) and equation (2) gives

[
r>1.
]

But the orientation of (C,D,E) gives

[
(1-x)s+y(r-1)<0.
\tag{5}
]

Both summands on the left are strictly positive:

[
1-x<0,\quad s<0
\quad\Longrightarrow\quad
(1-x)s>0,
]

and

[
y>0,\quad r-1>0
\quad\Longrightarrow\quad
y(r-1)>0.
]

That contradicts (5).

This is exactly the sort of proof Lean handles well after normalization: `ring_nf` produces (1) and (2), and `nlinarith` performs the sign elimination. The existing repository theorem uses four distance equalities and seven `signedArea2` inequalities in essentially this form. 

## 2. How this maps onto FirstNonHit

For either geometric `secondInteraction` constructor,

* `.distinctBlockersDifferentCaps`, or
* `.sameCapWithInternalFiberSource`,

set

[
\begin{aligned}
A &= Q.source_1,\
D &= Q.source_2,\
B &= H.centerAt(C.secondSource),\
F &= H.centerAt(Q.source_1).
\end{aligned}
]

The constructor already tells us that:

* (B\neq F);
* the row centered at (B) contains both (A) and (D);
* the Q row centered at (F) contains both (A) and (D);
* the exact intersection of the two supports is ({A,D}).

Both rows have exactly four support points, so each has two remainders outside the common pair. Choose

[
C\in K_B\setminus K_F,\qquad
E\in K_F\setminus K_B.
]

Then all four metric equalities needed by the six-point theorem are automatic:

[
BA=BD,\qquad BA=BC,\qquad
FA=FD,\qquad FA=FE.
]

The two geometric interaction constructors expose precisely the positive shared-pair incidence needed for this setup. The other constructors expose either equal centers or an omitted endpoint instead. 

So, in those two constructor arms, **the distance equations are not the missing part**. The only missing inputs are the orientation signs for the six points.

Schematically, the Lean landing would look like:

```lean
let A := Q.source₁.1
let D := Q.source₂.1
let B := H.centerAt C.secondSource.1 C.secondSource.2
let F := H.centerAt Q.source₁.1 Q.source₁.2

obtain ⟨X, hX_source, hX_notQ⟩ := sourceRow_has_remainder ...
obtain ⟨Y, hY_Q, hY_notSource⟩ := qRow_has_remainder ...

have hBA_BD : dist B A = dist B D := by
  exact selectedRow_equidistant_of_mem hA_source hD_source

have hBA_BX : dist B A = dist B X := by
  exact selectedRow_equidistant_of_mem hA_source hX_source

have hFA_FD : dist F A = dist F D := by
  exact selectedRow_equidistant_of_mem hA_Q hD_Q

have hFA_FY : dist F A = dist F Y := by
  exact selectedRow_equidistant_of_mem hA_Q hY_Q

-- Remaining obligation:
have horder : SixPointCyclicOrder A B X D Y F := by
  ...

exact
  TwoTripleRowSixPointEuclideanObstruction
    .false_of_six_ccw_two_triple_row_equalities
      horder hBA_BX hBA_BD hFA_FD hFA_FY
```

The theorem and helper names inside the equality derivations may differ, but that is the exact mathematical adapter.

## 3. What the coordinate search should investigate

The next computation should therefore not ask:

> Are all FirstNonHit equations globally inconsistent?

It should ask the much smaller question:

> For each choice of one source-row remainder and one Q-row remainder, which six-point cyclic orders are compatible with the live cap and boundary-order facts, and which are compatible with the four circle equations?

There are only two choices of remainder on each side and finitely many cyclic orders. The workflow is:

* Enumerate the order types consistent with the already-proved shared-pair separation and cap memberships.
* For each surviving order type, translate it into `signedArea2` signs.
* Add the four squared-distance equalities.
* Decide the resulting exact real polynomial system.
* Minimize every UNSAT system to the smallest set of orientation signs.
* Search the Lean source specifically for those signs or for the boundary interval fact that implies them.

This is a genuinely universal coordinate experiment because the six points are selected from exact four-point supports in an arbitrary live instance. There is no `Fin 17`, `MAXN`, or assumption that the whole counterexample has fixed size.

### The likely missing geometric lemma

The shared-pair theorem gives the alternation of (B) and (F) across the chord (AD), but it does not by itself locate the two chosen remainders (C,E) in the required wedges.

The source already contains a stronger pattern:

```text
three shared-pair cyclic separations
    ⟹ six-point forbidden order
    ⟹ coordinate contradiction.
```

In `false_of_threeRowCyclicSeparationTriangle_at_sharedPointZero`, a third selected row synchronizes the two remainder pairs, and three applications of shared-pair cyclic separation provide the complete six-point order required by the Euclidean theorem. 

That tells us exactly how geometry can close the gap:

* either derive the required remainder placement directly from cap intervals; or
* produce a third row that shares the source-row remainder pair and the Q-row remainder pair, allowing the existing three-separation theorem to fire.

The first alternative is likely weaker and should be tested first. In particular, search for a lemma of the form:

```lean
∃ X ∈ sourceSupport \ qSupport,
  ∃ Y ∈ qSupport \ sourceSupport,
    -- a small collection of boundary-index inequalities
```

It should expose only the missing wedge placement, not package the complete contradictory six-point metric packet.

## 4. Using the full distance equations in the omission arms

The coordinate route above immediately applies only to the two geometric interaction constructors. The other two need a different metric extraction.

### `.sameBlocker`

Here the named source row has the same center and support as the Q row. A two-circle coordinate theorem cannot apply because there are not two distinct circles.

Coordinates become useful only after the aligned/deletion ingress produces another actual center. Once it does, that new row can be compared with the Q circle.

### `.sourceRowOmission`

Here we know that a particular Q endpoint is omitted from the source row. That gives a potential **exact-off-circle contradiction**:

1. The row’s selected support defines its radius.
2. Exactness says the omitted endpoint is not on that selected circle.
3. Other row equations might nevertheless force its distance to the center to equal the selected radius.

The right discovery representation is initially an equality graph on distance edges.

For a row centered at (c) with support (u_0,u_1,u_2,u_3), record

[
d(c,u_0)=d(c,u_1)=d(c,u_2)=d(c,u_3).
]

Every retained row, actual-blocker equality, and support equality contributes more edge equalities. Compute the transitive closure symbolically on **named roles**, not frozen carrier indices.

A contradiction is obtained if the closure proves

[
d(c,q_{\mathrm{deleted}})=d(c,u_0)
]

while the exact selected-row theorem gives

[
d(c,q_{\mathrm{deleted}})\neq d(c,u_0).
]

This is much cheaper than a coordinate solver and should be run first. Earlier frozen assignments produced examples of this kind, but those equality paths were assignment-specific rather than universally sourced; that is why they became useful cuts rather than a proof of FirstNonHit. 

If the role-level equality closure does not force the omitted endpoint onto the circle, then use coordinates on the smallest equality component that contains it.

## 5. Why squared-distance equations are especially useful

For points (c,u,v\in\mathbb R^2),

[
|c-u|^2=|c-v|^2
]

expands to

[
2c\cdot(v-u)=|v|^2-|u|^2.
]

Although squared-distance constraints look quadratic globally, an equal-distance equation is **linear in the center coordinates**.

Consequences:

* One shared pair puts a center on one perpendicular bisector.
* Two independent equal-distance pairs often determine the center uniquely.
* Two rows sharing the same independent pair data are forced to have the same center.
* After normalizing a shared chord, one center coordinate disappears immediately.
* The remaining circle equations are low-degree and usually suitable for `nlinarith`.

This is why the proof should eliminate centers first, before expanding every coordinate equation indiscriminately.

Use squared distances rather than introducing radius variables or square roots:

```text
sqdist(c, u₁) = sqdist(c, u₀)
sqdist(c, u₂) = sqdist(c, u₀)
sqdist(c, u₃) = sqdist(c, u₀)
```

A row with four support points needs only three independent equations.

## 6. What to extract from the aligned ingress

The aligned ingress is considerably more coordinate-rich than the bare interaction interface. It contains:

* distinct first-apex distances for the two canonical sources;
* singleton strict first-cap radius slices;
* retained-radius control for every non-singleton first-cap slice;
* a deletion-core packet for each canonical source. 

These translate into:

### Retained equal-radius equations

For retained pair (p_1,p_2) at first apex (O),

[
|O-p_1|^2=|O-p_2|^2.
]

Likewise for the second retained pair.

### Distinct-radius disequalities

[
|O-p_1|^2\neq|O-r_1|^2.
]

### Singleton-slice disequalities

For canonical source (s) and every other strict first-cap carrier (t),

[
|O-s|^2\neq|O-t|^2.
]

### Deletion-core row equations

Each source’s fixed deletion core supplies actual selected-row centers and support points, hence further equal-distance equations.

The best aligned-arm coordinate search is therefore:

1. Start with the Q row and the second canonical row.
2. Add only the deletion-core rows that share a named point with those rows.
3. Add retained first-apex equations for named points already present.
4. Compute distance-equality closure.
5. Enumerate six-point order motifs.
6. Add singleton-radius disequalities only after the equality and order reductions.

This keeps the model small and preserves a clear source map for every equation.

## 7. The common-radius ingress must be treated separately

The right ingress arm contains a `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`, but its internal `.surface` is not definitionally the live surface `C`. Therefore its coordinate equations cannot simply be assigned to `C.firstSource` and `C.secondSource`. 

There are only two valid uses of coordinates in that arm:

1. Derive a contradiction entirely within the independent common-radius surface.
2. First prove an explicit relation between that surface and `C`, identifying whichever sources, rows, radii, or cap positions are actually shared.

Without such a bridge, mixing their equations would silently add a premise.

## 8. A concrete two-lane attack

### Lane A: geometric interaction arms

For `.distinctBlockersDifferentCaps` and `.sameCapWithInternalFiberSource`:

* extract the two common endpoints and four candidate remainders;
* enumerate the four remainder pairs;
* derive all currently available boundary signs;
* test each remaining order type against the four circle equations;
* minimize any contradiction;
* formalize the smallest missing remainder-placement lemma;
* invoke the existing six-point Euclidean obstruction.

This could close half of the `secondInteraction` constructor surface without touching the harder omission cases.

### Lane B: same-blocker and omission arms

For `.sameBlocker` and `.sourceRowOmission`:

* construct a symbolic distance-edge equality graph from Q, the two canonical rows, and aligned deletion-core rows;
* look first for an exact-off-circle equality path;
* next look for a newly forced shared pair with a distinct center;
* only then introduce coordinate variables and orientation signs.

The key discipline is that every solver variable represents a named role selected by a source theorem. Solver UNSAT then proves a fixed universal metric lemma, rather than a statement about a frozen finite carrier.

## Bottom line

The full Euclidean equations can contribute in two precise ways:

1. **Two-circle/order elimination:** two distinct rows sharing a chord, plus suitable cyclic placement of one remainder from each row, give the existing six-point polynomial contradiction.
2. **Exact-off-circle closure:** row equalities from several selected classes may force an omitted point onto a circle that exactness says it does not lie on.

For the geometric interaction constructors, the distance equalities are already present; the frontier is a **remainder-order lemma**. For the omission constructors, the frontier is a **role-parametric equality path or newly forced shared pair**. A whole-carrier coordinate model would obscure both of these much smaller proof obligations.

