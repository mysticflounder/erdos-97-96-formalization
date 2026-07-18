# Exact-six physical-apex distribution bridge

Date: 2026-07-18

Status: **KERNEL-CHECKED SOURCE-LEVEL CAP SPLIT.  THIS CORRECTS THE INPUT TO
THE STRICT-KALMANSON/MEC GATES BUT DOES NOT BY ITSELF IMPLY `False` OR CLOSE A
PRODUCTION `sorry`.**

This lane owns only
`scratch/atail-force/exact6-physical-apex-distribution/`.  It does not edit
production Lean, shared plans, proof-blueprint state, `ShellCurvature`,
`SurplusM44`, `U1LargeCapRouteBTail`, or git state.

## The checked split

For

```lean
profile : LargeCapUniqueFiveSecondApexRadius D S
hcap : S.oppCap2.card = 6
```

the strict physical cap has four positions, while the complete physical-apex
radius class has cardinality five.  The file proves:

```lean
physicalVertices_card_eq_three_or_four
```

so the class has either three or four strict-cap hits.

In the card-three arm,

```lean
adjacentClassHits_card_eq_one_of_physicalVertices_card_eq_three
```

proves that the two remaining class points occupy the two adjacent-cap
one-hit slots: the complete class meets each adjacent closed cap exactly
once.  This is stronger than merely placing two private completion labels on
the complementary boundary chain.

In the card-four arm,

```lean
exists_adjacentClassHit_of_physicalVertices_card_eq_four
```

proves that the fifth class point lies outside the strict physical cap and in
the union of the two adjacent closed caps.

The two placement helpers

```lean
not_mem_physicalCapInterior_of_not_mem_class_of_card_four
capInterior_eq_insert_physicalVertices_of_offClass_mem_card_three
```

also pin the continuation unused point's possible role.  If all four strict
positions are physical, every off-class point is outside the strict cap.  If
there are three physical positions and an off-class point lies in the strict
cap, it is the unique fourth position.

## Why this matters to the live gate

The first 21-role strict-Kalmanson draft put both private physical-apex shell
completions on the same adjacent side.  That is not source-faithful: a circle
centered at a Moser apex meets either adjacent cap at most once.  The
card-three branch must put one completion on each side of the apex.  The
card-four branch has one adjacent-union completion.

The theorem does not place either mutual blocker in the physical cap and does
not manufacture anonymous rows.  Those facts remain intentionally absent.

## Required bank preflight

Before adding the bridge, the existing registries and indexed Lean corpus
were checked for an exact-six physical-apex class distribution theorem:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for exact radius classes,
  adjacent-cap one-hit bounds, and cap-six interiors.

The proof reuses the production adjacent-cap one-hit and class-cover lemmas;
no banked declaration packaged this exact-five/exact-six split.

## Validation

From `lean/`:

```bash
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact6-physical-apex-distribution/\
ExactSixPhysicalApexDistribution.lean
```

The focused elaboration exits zero.  All five printed theorems depend only
on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.

## Closure effect

- **PROVEN / KERNEL-CHECKED:** exact physical-shell cap distribution and
  unused-position classification.
- **OPEN:** whether the corrected four-row strict-Kalmanson/MEC surface is
  inconsistent in any of the seven source-role orbits.
- **PRODUCTION `sorry` CLOSED:** none.
