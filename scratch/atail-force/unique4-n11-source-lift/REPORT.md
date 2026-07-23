# Card-eleven unique-four fixed-CNF source-lift audit

Date: 2026-07-22

Scope: conditional low-cardinality lift only.  This lane owns no production
Lean and changes no shared closure document.

## Decision

Neither fixed-`n = 11` certificate can currently be applied to
`OriginalUniqueFourResidual` as a Lean theorem.

- **P4 is source-complete at the profile boundary.**  If
  `D.A.card = 11` and `S.oppCap1.card = 4`, the source residual necessarily
  has the exact-two strict-hit distribution assumed by the p4 CNF.
- **P5 is not source-complete.**  If `S.oppCap1.card = 5`, the source residual
  splits into the exact-two distribution encoded by the p5 CNF and an
  `AlignedInteriorFrontier` with at least three strict hits.  The latter is
  absent from the p5 CNF.
- **Neither exact-two leaf has a kernel bridge to its CNF.**  Both DRAT
  artifacts prove only their exact hashed Python-generated formulas.  No
  Lean definition of those formulas, source-to-valuation theorem, or
  kernel-checked LRAT replay against such a formula currently exists.

Accordingly:

> P4 is a plausible complete certificate leaf for the oriented p4 profile,
> and P5 is a plausible certificate leaf only for the exact-two p5 subprofile.
> Neither closes a source `sorry` today.

## New Lean result

[`CardElevenUniqueFourCoverage.lean`](CardElevenUniqueFourCoverage.lean)
kernel-checks the exact source boundary:

```lean
theorem cardEleven_oriented_cap_profile
    (R : OriginalUniqueFourResidual F) (hcard : D.A.card = 11) :
    S.surplusCap.card = 5 ∧
      ((S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) ∨
       (S.oppCap1.card = 5 ∧ S.oppCap2.card = 4))
```

```lean
theorem exactTwo_of_firstOppCap_card_eq_four
    (R : OriginalUniqueFourResidual F)
    (hfirst : S.oppCap1.card = 4) :
    Nonempty (ExactTwoStrictHitDistribution R)
```

The aggregate theorem returns exactly one of:

1. `(surplus, opp1, opp2) = (5,4,5)` with exact two strict hits;
2. `(surplus, opp1, opp2) = (5,5,4)` with exact two strict hits; or
3. `(surplus, opp1, opp2) = (5,5,4)` with an
   `AlignedInteriorFrontier`.

The proof uses the complete source residual, the live cap-count identity,
the two lower bounds on opposite-cap cardinality, `R.noM44`, and the existing
source-clean dichotomy
`exactFour_twoStrict_or_alignedInteriorFrontier`.  On p4, a closed four-point
cap has only two strict interior vertices, so the aligned three-hit arm is
impossible.

The imported `UniqueFourClassCapDistribution` is itself an untracked scratch
module, so validation requires compiling that prerequisite into a temporary
module directory first.  From the repository's `lean/` directory, the exact
clean two-stage command is:

```bash
mkdir -p /tmp/unique4-n11-source-lift-recheck

LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-n11-source-lift-recheck \
  lake env lean -M 16384 -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-class-cap-distribution \
  -o /tmp/unique4-n11-source-lift-recheck/UniqueFourClassCapDistribution.olean \
  ../scratch/atail-force/unique4-class-cap-distribution/UniqueFourClassCapDistribution.lean

LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-n11-source-lift-recheck \
  lake env lean -M 16384 -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-n11-source-lift \
  -o /tmp/unique4-n11-source-lift-recheck/CardElevenUniqueFourCoverage.olean \
  ../scratch/atail-force/unique4-n11-source-lift/CardElevenUniqueFourCoverage.lean
```

This was rerun from a fresh temporary module directory and passed.  The
`OriginalUniqueResidualDispatch.olean` and
`card_five_interior_critical_frontier.olean` prerequisites are intentionally
read from their owning scratch directories in `LEAN_PATH`.  All three printed
theorem closures are exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`.

## Exact certificate facts retained

The external certificate reports remain authoritative for the hashed Boolean
formulas:

| projection | variables | clauses | CNF SHA-256 | DRAT SHA-256 | status |
|---|---:|---:|---|---|---|
| p4 | 12,672 | 2,765,403 | `d1ff6359442edebbafa2ea9a01aa77c439a681b62a186e73cdbf528028fdb536` | `8460ec3f078691772de38bf2d47e5a973917cb4290cb9e8aea3adfe30f881f62` | external `drat-trim`: `s VERIFIED` |
| p5 | 12,672 | 2,768,417 | `cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1` | `21d83f574691d268aabe24badc7d4cb2a836a4a0b80a851845334096293d0841` | external `drat-trim`: `s VERIFIED` |

Both terminal encoders explicitly use:

```text
strict_cap_minimality_overlay = true
pair_minimality_overlay = false
exact_two_strict_hit_overlay = true
```

This is why the p5 aligned arm cannot be silently included in the certificate
claim.

## Missing-field matrix

The question in this table is not whether the mathematical fact exists in the
project.  It is whether a checked theorem currently maps the source object to
the **exact Boolean atom and auxiliary-variable semantics used by the terminal
CNF**.

| CNF component | Source support | Exact Lean-to-CNF bridge | Consequence |
|---|---|---|---|
| `n = 11` and oriented `(5,4,5)/(5,5,4)` cap blocks | **PROVEN** in the new Lean file | missing encoder-label record | finite carrier can be enumerated, but the DIMACS numbering is not yet a Lean object |
| exact-two `2+1+1` first-apex class | **PROVEN** for p4; supplied by the p5 exact-two branch | missing atom assignment theorem | p4 profile assumption is source-faithful; p5 covers only one branch |
| p5 aligned three-hit branch | **NOT RULED OUT BY THE SOURCE SPLIT**; the exhaustive alternative is `AlignedInteriorFrontier` | absent from terminal CNF | p5 certificate is not full source coverage |
| one selected four-row at every carrier center | global K4 and `FaithfulCarrierPattern` constructors exist | no packaged simultaneous assignment matching encoder row IDs | must select rows late and prove every encoded row atom |
| prescribed first-apex exact class and actual critical supports | residual/frontier and critical-system fields exist | no exact encoder assignment theorem | semantic data exist, but Python comments/hashes are not a proof |
| second-apex double-deletion row | carried by the frontier | no Boolean-row adapter | source fact is not tied to terminal variable IDs |
| complete distance-equality partition atoms | definable from real distances | no Lean finite quotient/valuation matching the encoder | every equality and disequality clause still needs soundness |
| selected-row strong connectivity | follows from minimality for a source-faithful selected pattern | no clause-family proof | Python minimality clauses remain outside the kernel |
| strict-cap minimal-deletion overlay | source theorem family exists | no exact auxiliary witness assignment | every overlay clause needs a checked extension valuation |
| own-cap, endpoint, circle-intersection, alternation, planar, Kalmanson, and U5 banks | many generic Lean consumers are kernel-checked | no theorem proving all emitted clauses for the exact bank snapshot | source-file hashes and occurrence replay do not establish clause soundness |
| direct shell-curvature auxiliary variables | source-clean curvature consumers exist | no checked construction of the row-pattern/arc valuation | direct-overlay clauses remain an unverified encoding boundary |
| terminal UNSAT | externally DRAT-verified | no Lean-generated CNF plus LRAT replay | cannot eliminate a source residual in Lean |

The existing p4 terminal occurrence and four p5 seed occurrences do reach
kernel-checked generic consumers.  That verifies the meaning of those
particular appended cuts; it does not verify the millions of base and overlay
clauses or establish that every source residual extends to a valuation.

## Existing infrastructure that makes a future lift feasible

The project already has both sides of the intended architecture:

- `FaithfulCarrierPattern` and its prescribed-class constructors can choose
  source-valid selected rows while retaining specified exact/critical
  classes.
- `Std.Tactic.BVDecide.Reflect.verifyCert_correct` is already used by
  `Census554/CoverCnf.lean`.
- `exact5-bv-encoding-profile/raw-lrat/RawLRATSmoke.lean` demonstrates raw
  LRAT replay in this repository.

What is missing is the middle:

```text
OriginalUniqueFourResidual + card = 11 + exact-two profile
  -> Nonempty (satisfying valuation of a Lean-defined terminal CNF).
```

Only after that implication compiles does an LRAT proof of the same
Lean-generated CNF turn external UNSAT into a source contradiction.

## Recommended next work

1. Define a small Lean `CardElevenExactTwoProjection` carrying:
   - a boundary-order equivalence with `Fin 11`;
   - the oriented cap blocks;
   - the selected row at every center;
   - the exact first-apex class and critical supports; and
   - the auxiliary witnesses needed by each enabled overlay.
2. Define the terminal CNF in Lean from that record, keeping the Boolean
   names and clause order stable.
3. Prove clause-family soundness incrementally.  The acceptance test for each
   family is a source-to-valuation theorem, not equality with Python output.
4. Regenerate a byte-identical DIMACS file from the Lean definition, then
   import an LRAT proof and check it with the existing reflective checker.
5. Separately close or encode the p5 `alignedP5` branch.  Without this step,
   p4 plus p5 exact-two cannot cover card eleven.

Do **not** begin by importing the giant DRAT proof.  The bridge is not fully
specified, and proof replay without a Lean-generated formula would certify
the wrong endpoint.

## Theorem-bank and indexed-corpus preflight

Before this audit, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.md`;
- `certificates/erdos97_legacy_general_n_mining.md`;
- `certificates/erdos_general_theorem_p97_mining.md`; and
- indexed Lean searches for the fixed-card-eleven unique-four surface,
  exact-row occurrence consumers, faithful-carrier constructors, and
  LRAT/DRAT checking.

The search found the existing generic p4/p5 consumers and certificate
infrastructure described above.  It did not find an existing source-to-CNF
bridge for either terminal projection.

## Epistemic summary

- **PROVEN in Lean:** the card-eleven oriented cap split; p4 forces exact two;
  complete source coverage is p4 exact-two / p5 exact-two / p5 aligned.
- **PROVEN externally:** each exact hashed fixed-`n = 11` terminal CNF is
  UNSAT by `drat-trim`.
- **EMPIRICALLY/structurally verified:** Python source hashes, transported
  schema occurrences, and terminal DIMACS replay.
- **NOT PROVEN:** source residual implies satisfiability of either exact
  terminal CNF.
- **NOT COVERED:** the p5 aligned three-hit source branch.
- **NO SOURCE SORRY CLOSED** by this lane.
