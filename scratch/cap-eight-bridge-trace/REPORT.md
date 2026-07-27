# Cap-eight bridge trace

Date: 2026-07-27

## Verdict

There is **no qualifying source-clean/kernel-clean theorem** in the import
closure of
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` that combines

```lean
8 ≤ (S.capByIndex S.oppIndex1).card
```

(or the corresponding large-cap branch) with the live counterexample /
collision / tri-apex data and produces `False`, a three-hit conclusion, a
positive shell incidence, or a strictly stronger reusable intermediate.

The first declaration that performs exactly this bridge is admitted. Every
source-text-clean wrapper that appears to close the route depends transitively
on that admission (`sorryAx`). The downstream `False` and positive-three-hit
theorems are therefore both axiom-dirty and circular as candidates for proving
the missing bridge.

## Exact cap-eight route

The exhaustive exact-text scan in `FrontierLiveClosure.lean` found the cap-eight
fact at lines 5483, 5587, 5819, and 6145.

1. `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
   (line 5437) explicitly consumes `hcapEightOrCross`, together with
   `CounterexampleData`, two collision rows, localized mutual-omission cycles,
   unique-four shell data, and
   `FrontierAllLargeCapsTriApexRobustResidual`. It concludes either a three-hit
   witness or one of four cross-hit equalities. Its body is literally `sorry`,
   and `#print axioms` reports `sorryAx`.

2. `exists_three_hit_of_two_collisionRows_capCross_normalForm` (line 5524)
   consumes the same large-cap disjunction and eliminates the cross-hit
   alternatives to conclude a three-hit witness. Its own source body has no
   `sorry`, but it directly calls declaration 1; `#print axioms` reports
   `sorryAx`.

3. `exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
   (line 5660) derives the local `hcapEightOrCross` at line 5818 from the two
   exact-four/two-interior collision rows and tri-apex data, then invokes
   declaration 2. It is source-text-clean but `#print axioms` reports
   `sorryAx`.

4. `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
   (line 5942) constructs a second local cap-eight-or-cross fact at line 6143.
   It lies downstream of the same admitted three-hit bridge and likewise
   reports `sorryAx`.

The following downstream wrappers all report `sorryAx` as well:

- `false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits`
- `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
- `false_of_exactFourCollision_secondRadius_and_all_low_hits`
- `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits`
- `false_of_retainedInteriorBlockerCollision_and_all_low_hits`
- `false_of_frontierAllLargeCapsTriApex_all_low_hits`
- `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex`
- `false_of_frontierAllLargeCapsTriApexUniformMetricResidual`
- `false_of_frontierAllLargeCapsTriApexRobustResidual`

`proof-blueprint spine` confirms the decisive edge:

```text
exists_three_hit_of_two_collisionRows_capCross_normalForm
└─ exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows [sorry]
   └─ sorryAx
```

## Kernel-clean near-bridges (insufficient)

These declarations have no `sorryAx` in `#print axioms`, but none converts the
global cap-eight fact into the localized selected-radius/shell data needed by
the live route.

### Global cap size to global interior size

```lean
Problem97.ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
  (S : SurplusCapPacket A) (i : Fin 3) :
  (S.capInteriorByIndex i).card + 2 = (S.capByIndex i).card
```

This turns cap-eight into a lower bound of six on the entire cap interior. It
does not select a radius class or produce shell hits.

### Rich structure to a metric pattern

```lean
Problem97.ATailApexRichClassStructure.
  oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
  (hconv : ConvexIndep A) (i : Fin 3)
  (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
  OppositeCapRichClassInteriorPattern A S i
```

The conclusion gives either one radius with at least four cap-interior points,
or two distinct radii with at least two each. This is a useful stronger metric
pattern, but cap-eight alone does not supply `ApexRichClassStructure`.

Also clean:

```lean
fullyDeletionRobustAt_of_apexRichClassStructure
  (hrich : ApexRichClassStructure D.A p) :
  FullyDeletionRobustAt D p
```

Again, the missing input is rich structure, not merely cap size.

### Two localized hits to positive shell incidence

```lean
criticalShellCenter_mem_capInteriorByIndex_of_two_hits
  ...
  (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
  (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
  (htwo :
    2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)).card) :
  H.centerAt x hx ∈ S.capInteriorByIndex i
```

This is the relevant clean positive-incidence lemma. It requires a particular
radius with two shell hits and rich structure; cap-eight gives neither.

### Localized selected-class size to an omission packet

```lean
nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three
  ...
  (hthree :
    3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1).card) :
  Nonempty (RetainedInteriorDirectedOmission R)
```

and

```lean
nonempty_retainedInteriorDirectedOmission_of_collision_of_frontierClass_card_ge_five
  ...
  (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
  Nonempty (RetainedInteriorDirectedOmission R)
```

Both are clean, but their hypotheses concern one selected radius class. The
global cap-eight cardinality does not imply either hypothesis.

## Exact missing bridge

After the clean identity

```lean
8 ≤ cap.card  ⟹  6 ≤ capInterior.card
```

the route still needs a theorem forcing those global interior points into one
or more controlled selected-radius classes and then relating those classes to
critical-shell supports/collision rows. The only declaration currently making
that transition is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`, and
it is the admitted frontier.

## Evidence and limits

- Exact occurrences were found with `rg`; the only other `8 ≤` in the ATail
  directory is an unrelated `candidates.card` bound in
  `ExactFourRobustCapExpansion.lean`.
- Axiom traces are in `trace.log`; the checked declarations and signatures are
  in `AxiomTrace.lean`.
- `proof-blueprint refs --check` reported four stale and thirteen never-mined
  symbols in the current project index. No index refresh or build was run in
  this shared worktree. The decisive dependency was independently confirmed by
  current source inspection and `#print axioms` against the existing build.
- No production file was edited.
