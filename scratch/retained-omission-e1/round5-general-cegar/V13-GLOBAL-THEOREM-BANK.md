# V13 global theorem-bank checkpoint

Date: 2026-08-02

## Verdict

**NOT FOUND (source-only audit).**  No current theorem-bank entry, accumulated
retained-omission report, or checked literature item closes
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
from its live inputs `R`, `Q`, and `G`.

V13 does not change the honest universal missing-bridge diagnosis.  It adds one
sound **exact-`n = 15` Boolean projection** for the arbitrary `globalK4` witness,
but all 16 replay cases remain `UNKNOWN`.  This is neither an `UNSAT` result nor
a counterexample.  The universal Lean target is still open, and no exact-15
result has been lifted to it.

There is one concrete refinement if work remains in the exact-15 CEGAR lane:
apply the same apex-profile compatibility rule to the packet-B1 selected
four-sets.  That rule is elementary under the exact profile hypotheses and
would reject every pinned first model in the earlier v11 structural census.
It is not a universal theorem from `TriApexAllLargeContext`, and it does not
predict that a new Boolean model, nonlinear model, or all-case proof will fail.

## Verification and trust boundary

Audited artifact:
`scratch/retained-omission-e1/round5-general-cegar/artifacts-v13-canary/20260802T110226.865850Z-v11-16-replay-pid84479`.

- **ARTIFACT-RECORDED:** the pinned v13 summary reports 16 `unknown` results,
  each with `reason_unknown = canceled`; all 16 Boolean prepasses are
  `sat_no_cut`, with zero learned cuts and zero power cuts.  The full-solver
  budget was 600,000 ms per case and the Boolean budget 30,000 ms per case.
  Its own source contract says the scope is only the normalized exact-15
  `(6,6,6)` cap-profile slice.
- **SOURCE-INSPECTED:** `round5_cegar_v13.py` says explicitly that v13 is v12
  plus global-K4/profile compatibility and remains an external exact-15
  experiment, not universal Lean closure.
- **BANK-INSPECTED:** the mandatory current, sibling-RVOL, legacy, and older
  general-theorem registries and their JSON inventories were checked, together
  with the accumulated retained-omission bank reports listed below.
- **LITERATURE-INSPECTED:** the primary sources below were checked for a
  matching small finite circle-incidence/classification theorem.
- **NOT RUN:** no Lean, Lake, proof-blueprint, solver, certificate replay,
  generator, or fresh kernel/axiom gate was run in this checkpoint.  “Source
  proved” below therefore retains the registry's source-level meaning and is
  not a fresh transitive kernel audit.

## What v13 actually adds

For a rich apex in the exact-15 encoding, v13 uses the exhaustive profiles:

- `S`: one exact six-point distance class and no unnamed radius of
  multiplicity four;
- `D`: two named, disjoint exact four-point distance classes and no unnamed
  third radius of multiplicity four.

Thus an arbitrary selected four-set on one common positive radius about that
apex is a four-subset of the `S` class, or is exactly one of the two `D`
classes.  V13 asserts this only for `globalK4`.  Depending on the apex profile,
the replay formulas contain 3 or 17 assertions in the new
`apex_global_k4_profile_compatibility` family.

The preceding v11 census found that the global-K4 rule failed at 30 apex
instances across 15 of its 16 pinned first models.  When the same semantically
implied test was extended to all active apex-centred four-sets—global K4 plus
packet B1—it failed at 53 instances and in all 16 pinned v11 models.  V13's
16 Boolean formulas nevertheless again have satisfying no-cut models.  This
shows only that the global-K4 projection was insufficient; it does not show
that any Euclidean configuration exists.

### Selected four-sets are not automatically full shells

The packet-B1 objects in `CommonDeletionTwoCenterPacket` are selected
four-point witnesses on a common radius.  They must not be silently promoted
to the full ambient distance class.  Under an exact `D` profile, containment
plus both cardinalities being four proves equality with a named full class.
Under an exact `S` profile, the valid conclusion is only containment in the
six-class.  Without exact-profile exhaustiveness, neither conclusion follows.

This is compatible with the prior Ptolemy/Plücker and positive-overlap audits:
canonical critical shells and named rich `SelectedClass` values are full
classes, while packet rows are generally selected subsets.  The existing
packet-B2/full-critical-row identification is a specific theorem, not a
license to treat packet B1 as a full shell.

## Why the v13 fact does not feed the live universal target

The live source has

```lean
def ApexRichClassStructure (A : Finset ℝ²) (p : ℝ²) : Prop :=
  (∃ r : ℝ, 0 < r ∧ 6 ≤ (SelectedClass A p r).card) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass A p r₁).card ∧
      4 ≤ (SelectedClass A p r₂).card)
```

and `TriApexAllLargeContext.apex_rich` supplies this at three apices.  These are
lower bounds.  They do not say that the six-class has exactly six points, that
the two four-classes have exactly four, that they exhaust every K4 radius, or
that `D.A.card = 15`.  In particular, the general `S` branch permits another
four-point radius, and the general `D` branch permits an unnamed third
four-point radius.

The core at `FrontierLiveClosure.lean:7231` consumes arbitrary finite
`CounterexampleData`, a `RetainedOmissionAllLargeNormalForm`, and the lower-bound
context.  Therefore a theorem implementing the v13 projection cannot be
applied to this core unless one first proves either:

1. a genuinely universal geometric/profile exhaustion theorem from `R/Q/G`,
   or
2. a sound reduction of this live branch to the normalized exact-15 slice,
   followed by an actual certified exact-15 terminal.

Neither bridge was found.  The v13 artifact supplies neither one.

## Global theorem-bank results

### Mandatory registries

The following were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`;
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

The sibling RVOL census contains 500 novel source-proved contradiction
consumers, including 96 U5 ambient class-level families backed by 88 metric and
112 scalar-algebra kernels, plus 18 unimported U1 source-unit consumers.  The
legacy and older-general censuses contain 39 and 38 contradiction consumers,
respectively.  This is a large negative search checkpoint, not evidence that
the relevant statement is impossible: none of those consumers manufactures
its required labelled packet/cross-membership hypotheses from the E1 `R/Q/G`
inputs.

### Closest reusable theorems

| Candidate | Status in the accumulated bank | First hypothesis not produced by `R/Q/G` |
|---|---|---|
| `criticalShell_inter_selectedClass_card_le_two_of_apexRich` | Current, import-reachable, source proved.  It says a canonical critical full shell meets any full radius class at a rich apex in at most two points. | A positive lower bound of at least three, or the stronger routed other-cap double hit that first forces the shell centre into the wrong cap. |
| `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` followed by disjoint cap interiors | Current source-clean terminal used in the positive-overlap plan. | For the reverse shell, two members in one rich full slice of a cap different from the already-known first cap. |
| `eq_of_equidistant_three_noncollinear` / legacy `three_common_equidistant_centers_eq` | Present in the RVOL/legacy banks, source proved there. | Three named common points, all six centre-to-point equalities, noncollinearity, and distinctness of the two centres. |
| Kalmanson/two-centre parity terminals and the source-proved cyclic-alternation consumer | Existing accumulated bank near-hits. | A labelled common chord/equality pair and certified cyclic order from each normal-form arm.  The exact-15 Boolean clauses do not constitute this producer in Lean. |
| U5 global-incidence families | Numerous source-proved bank terminals. | Their classified packet, dangerous-triple, or cross-membership hypotheses.  No consumer derives those labels from `RetainedOmissionAllLargeNormalForm`. |
| U1 source-unit consumers and `U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction` | Source-level near-hits in sibling banks, some unimported. | Their row-slot/localized U1 packets; the E1 normal form does not instantiate them. |
| Exact-15 finite Boolean obstruction | No all-16 theorem or certificate found.  One older individual case had a 31-clause Boolean core, but v13 ends with 16 `UNKNOWN`. | A proved finite terminal for every normalized case, plus a theorem connecting the universal branch to that exact finite encoding. |

The legacy common-centre uniqueness lemma and the current two-circle bound are
the strongest classical geometric matches.  They are terminals after positive
incidence has been established; they do not create that incidence.

### Accumulated retained-omission reports

The v2/v3 global audits, five-support audit, positive-overlap plan,
Ptolemy/Plücker audit, full-multiplicity audit, and round-12 global audit agree
on the same boundary:

- the normal form gives useful omissions and selected packet rows;
- the bank contains many contradictions once appropriate positive cross-hits,
  common chords, or full-shell intersections are named;
- no non-circular producer derives those positive facts from `R/Q/G`;
- pure cardinality/deletion-survival incidence shadows admit models avoiding
  the desired double hit;
- the first universal bridge must therefore add real geometry—convex/MEC
  order, EDM/power, Kalmanson/Ptolemy, or an equivalent metric mechanism.

## One-shot indexed searches

Exactly one `nthdegree docs search --lean --agentic` call was made for each of
the following two candidate shapes, with no retry:

1. **Exact-profile containment:** any selected four distinct equal-radius
   points at an exact `S6` or `D4+D4` apex, with all other radius classes of
   size at most three, lie in the `S` class or equal one of the `D` classes.
2. **Two-centre terminal/producer:** a retained-omission theorem yielding either
   three noncollinear points common to two equal-distance centres or a
   three-point intersection of a canonical critical circle and a rich apex
   circle.

Both commands completed with empty stdout, so they returned no candidate.  An
empty indexed response is recorded only as a search miss; the manual registry
audit above supplies the near-hits and their missing hypotheses.

## Literature checkpoint

- Erdős's 1987 primary article states the historical three-neighbour
  conjecture, records Danzer's convex nonagon counterexample to it, and then
  asks the present four-neighbour question.  It does not give the retained
  shell/profile classification needed here: [P. Erdős, *Some combinatorial and
  metric problems in geometry*](https://combinatorica.hu/~p_erdos/1987-27.pdf).
- Georgiev, Gómez-Serrano, Tao, and Wagner report a direct computational search
  for a counterexample to this problem.  Their search recovered configurations
  with three equidistant neighbours per vertex but did not find one with four.
  That is negative search evidence, not a proof or an `UNKNOWN`-to-`UNSAT`
  upgrade: [*Mathematical exploration and discovery at scale*, Section 6.53](https://arxiv.org/abs/2511.02864).
- The ordinary-circle structure literature proves asymptotic bounds and
  classifications for sets spanning few ordinary circles or many four-point
  circles.  Its hypotheses and sufficiently-large-`n` conclusions do not name
  the exact-15 apex profiles, packet deletions, or retained normal-form arms:
  [Lin et al., *On sets defining few ordinary circles*](https://arxiv.org/abs/1607.06597).

No checked source contains a small-`n` theorem that upgrades the existing
pairwise circle-intersection bound into the required positive packet incidence.

## Exact next statements

### If continuing the exact-15 CEGAR lane

Add a theorem-sound Boolean projection with the following mathematical shape:

```text
packetB1_profile_compatibility_exact15:
  if B is the four-point B1 support at apex a and all points of B have one
  positive distance from a, then
    profile(a) = S  -> B ⊆ S_support(a),
    profile(a) = D  -> B = D1_support(a) or B = D2_support(a).
```

This uses selected-set equal-radius data plus the exact profile exhaustion; it
does **not** assume B1 is a full shell.  It is the only newly isolated omission
that is both sound for the encoded slice and witnessed in all 16 pinned v11
first models.  After adding it, the result must be classified afresh; the v11
models give no guarantee about replacement models.

### If advancing the universal Lean lane

The smallest stable producer remains the other-cap rich double hit:

```text
∃ j r, firstIndex ≠ j ∧
  2 ≤ |reverseCriticalShell ∩
    (SelectedClass A (apex j) r ∩ capInterior j)|.
```

Together with the already-known location of the reverse blocker in the first
cap, `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` puts the same
centre in a different cap and closes by cap-interior disjointness.  The bank
does not derive this producer, and prior finite incidence shadows show it is
not a consequence of selected-class cardinality and deletion survival alone.

An alternative route must prove the entire exact-15 reduction and a certified
all-case finite terminal.  Until one of these routes is established, v13 is an
exact-slice diagnostic refinement only and should not be reported as progress
on universal kernel closure.
