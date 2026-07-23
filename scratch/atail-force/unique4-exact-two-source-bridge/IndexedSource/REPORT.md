# IndexedSource: p5 source-to-formula bridge (valuation lane)

Lane anchor: session `c188f5d9`. Companion lane `019f9077` owns the
trimmed-certificate materializer half; this directory is the Lean-side
valuation half only.

## Deliverable

For the selected p5 dense formula `p5.greedy-family-largest-seed0.json`
(18 retained families, 9,412 clauses, 616 dense vars), interpret every
dense Boolean atom over the actual `(5,5,4)` exact-two boundary packet's
own geometry and prove the interpretation satisfies every retained
clause family — in both packet orientations:

- direct branch: CNF index `i` ↦ boundary position `i`;
- mirror branch: CNF index `i` ↦ boundary position `ρ(i) = -i mod 11`
  (explicit reindexing; `ρ` fixes the first apex and reverses the
  cycle, factored as `ρ = (· + 1) ∘ (10 - ·)` so all order-sensitive
  consumers run over the still-CCW shifted boundary).

No solver-selected row assignment appears anywhere: every atom value is
a geometric membership (`m_c_p` ↦ `rowMem`), metric equality
(`eq_c_l_r` ↦ `radiusEq`), or distinguished-class membership
(`class_p` ↦ `classHit`) of the packet's own fields.

## Modules (build order)

| module | content |
|---|---|
| `IndexedSourceValuation` | atom interpretation, transport `σ`, 18 per-family Sat predicates, `DenseFamilySatisfaction` record, bridge lemmas |
| `GenericFamilies` | families 1–4 (any injective `σ`), 6–7 (any `σ` fixing 0), shared support/congr helpers |
| `CyclicAlternationCore` | family 5 mono/anti core over the four bisector-parity terminals + direct instance |
| `DirectKalmanson` | families 17–18 direct: sorted-targets → ordered-tuple dispatch into ETSD seeded + RKD retained-bank terminals |
| `DirectCapFamilies` | families 8–16 direct: closed-cap image counting, strict-interior characterization, endpoint/own-cap counting via `capByIndex_cgn4g_capData_oriented` |
| `DirectSatisfaction` | direct aggregate record |
| `MirrorTransport` | `reflFin`, shifted boundary + CCW/injective/image side conditions, `patternCode` transport bridge, family 5 mirror (anti arm) |
| `MirrorKalmanson` | families 17–18 mirror: role reflection of a fully-true mirror cut to a reflected occurrence over the shifted boundary; forward → RKD reflected ctors, reflected → normalized, schemas 5/8 → `MirrorSchema58` normalized terminals |
| `MirrorCapFamilies` | families 8–16 mirror: mirror closed-cap position sets `{7,8,9,10,0}/{3..7}/{0,1,2,3}`, strict positions `{4,5,6}`, same endpoint vertices |
| `MirrorSatisfaction` | mirror aggregate record + `exists_satisfying_p5_packet` branch dispatch from `nonempty_p5DirectBoundaryPacket_or_mirror` |

Top-level statement (`MirrorSatisfaction.lean`):

```
theorem exists_satisfying_p5_packet :
    (∃ P : P5DirectBoundaryPacket R profile distribution,
        DirectSatisfaction P.core) ∨
    (∃ P : P5MirrorBoundaryPacket R profile distribution,
        MirrorSatisfaction P.core)
```

## Validation status

{{NEEDS_PROOF}} — ALL TEN MODULES ARE DRAFTED BUT NOT YET COMPILED. The
shared `lean/.lake/lake-build.lock` is held by the companion lane's
materializer (pid 767, 2h budget); `validate.sh` (lock-acquiring, full
LEAN_PATH chain, `-DwarningAsError=true`) builds all ten modules in
order once the lock frees. Expected axiom closure after the fix-loop:
exactly `propext`, `Classical.choice`, `Quot.sound`. No claim in this
report is validated until `validate.sh` passes and the `#print axioms`
output is checked.

## What this does and does not prove

- It maps each retained family, quantified over its full emittable
  instance set, to a geometric satisfaction proof. The clause-level
  bridge (per-clause instance authentication against the trimmed CNF)
  is the companion lane's occurrence map; composition happens at the
  `DenseFamilySatisfaction` seam documented in `FAMILY_ROUTES.md`.
- Combined with the companion lane's trimmed UNSAT-replay theorem this
  yields the p5 contradiction. Neither half alone closes any production
  `sorry`; `false_of_originalFrontierUniqueRadiusArm` additionally needs
  the p4 profile and the arbitrary-cardinality reduction.
- No UNSAT certificate is replayed in this directory.
