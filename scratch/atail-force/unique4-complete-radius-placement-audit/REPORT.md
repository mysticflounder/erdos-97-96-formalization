# Unique-four complete-radius placement audit

Date: 2026-07-22

Scope: `OriginalUniqueFourResidual`, its late `CriticalShellSystem`, and the two
stored `n = 11` critical-map no-packing fixtures.  This lane changes no
production Lean and makes no arbitrary-cardinality occurrence claim.

## Result

**PROVEN:** both stored no-packing fixtures violate the same source-faithful
complete-radius rule.  The missing rule in the old finite abstraction is not a
new MEC or cap-order hypothesis.  It is the existing erased-source criticality
lock

```lean
CriticalShellSystem.selectedFourClass_support_eq_shell
```

at centers in the fixed blocker image, combined with ordinary symmetry of
Euclidean distance.

The weakest useful positive form is kernel-checked in
[`CompleteRadiusPlacement.lean`](CompleteRadiusPlacement.lean):

```lean
mem_blockerImageSelectedRow_of_twoStep_mutualTriangle
```

Let `anchor`, `middle`, and `blocker` be carrier centers.  Suppose:

```text
middle, blocker are in the selected row at anchor;
anchor, blocker are in the selected row at middle;
middle is in a selected row at blocker;
blocker lies in the image of the fixed critical system.
```

Then `anchor` is also in that selected row at `blocker`.

The proof uses the source whose actual blocker is `blocker`.  Deleting that
source destroys every K4 witness at `blocker`, so any selected four-class there
is the complete four-point critical shell.  The two mutual links identify the
three row radii, and exactness forces the reverse membership.

The theorem's axiom closure is exactly:

```text
propext, Classical.choice, Quot.sound
```

The production theorem

```lean
Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes
```

already supplies the corresponding negative consumer.  No new conditional
consumer is introduced here.

## Exact fixture certificates

[`audit_counterpatterns.py`](audit_counterpatterns.py) independently replays
the row and blocker-map fields and enumerates every three-center violation.
Each fixture has exactly one:

| exact-two profile | anchor | middle | blocker center | critical source | forbidden omission |
|---:|---:|---:|---:|---:|---|
| 4 | 0 | 8 | 6 | 7 | row 6 omits 0 |
| 5 | 5 | 0 | 3 | 10 | row 3 omits 5 |

For profile 4:

```text
row 0 contains 8 and 6;
row 8 contains 0 and 6;
row 6 contains 8 but omits 0.
```

The first two rows force their radii equal; the row-8/row-6 mutual hit forces
the same radius at center 6.  Because source 7 has actual blocker 6, row 6 is
locked to a complete critical shell, so it must contain 0.

For profile 5:

```text
row 5 contains 0 and 3;
row 0 contains 5 and 3;
row 3 contains 0 but omits 5.
```

Source 10 has actual blocker 3, so the same equality chain forces 5 into the
complete row at center 3.

The checkpoint [`audit.json`](audit.json) hash-binds both input fixtures and
the audit source.  Its status is **EXACT FINITE REPLAY**.  The upstream fixture
checks still pass; this audit does not alter what their stated weaker encoding
proved.  It shows only that neither fixture extends to the late critical
system's complete-radius/deletion semantics.

## Hypothesis audit

The rejection uses only:

1. the total fixed critical system;
2. the actual blocker-image fact for one center;
3. `no_qfree` after erasing that source, through
   `selectedFourClass_support_eq_shell`;
4. the five positive selected-row memberships displayed above; and
5. symmetry of `dist`.

It does **not** use:

- `OriginalUniqueFourResidual.noM44`;
- MEC membership or cap localization;
- `bisector_center_mem_interior`;
- `unique_K4_radius` at the first apex;
- universal/minimal strong connectivity; or
- any arbitrary-cardinality reduction.

Thus the weakest omitted source constraint is precisely:

> A selected K4 row at a center in the chosen blocker image is the complete
> critical shell selected for any source blocked there.

The erased-carrier failure is load-bearing because it is what proves that
support lock.  Merely labeling the row center as a blocker, without retaining
`no_qfree`, is insufficient.

## Consequence for the placement route

The old profile-4 and profile-5 artifacts are no longer valid obstructions to
the source-level `ThreeRowMiddleArcPlacement` route.  The checked producer adds
a real row/center positional fact that the previous selected-row abstraction
omitted.

This does **not** yet prove

```lean
∃ P : FixedImageTwoRowIngress R Q,
  Nonempty (ThreeRowMiddleArcPlacement P)
```

for an arbitrary residual.  The next finite search must add the proved
blocker-image support-lock closure before asking for a new no-packing survivor.
If survivors remain, their first missing source implication must be read from
that corrected stream; the two fixtures audited here cannot be reused.

The exact remaining source-level coverage question is:

> Does every source-faithful choice of two fixed-image rows and a late global
> completion row either contain one of these complete-radius mutual triangles,
> or already satisfy the three cyclic gaps of `ThreeRowMiddleArcPlacement`?

This is a conjectured occurrence/coverage statement, not a theorem in this
lane.

## Two completion rows at one center

The weaker robust-branch architecture in which the left and right completion
arcs come from different selected rows at the same center is not adjudicated
by either stored fixture: each exports exactly one row per center.  In
particular, the fixtures cannot be cited against a center carrying either a
class of cardinality at least five or two distinct-radius K4 classes.

That packet should be audited on the robust global-deletion branch as a
separate target.  It should not be forced into a uniform theorem over
`OriginalUniqueFourResidual` and `ExactTwoStrictHitDistribution`; the exact-four
singleton arm has only the one-row source surface established here.

## Replay

Generate and check the exact finite checkpoint:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-complete-radius-placement-audit/audit_counterpatterns.py \
  --output \
  scratch/atail-force/unique4-complete-radius-placement-audit/audit.json

PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-complete-radius-placement-audit/audit_counterpatterns.py \
  --output \
  scratch/atail-force/unique4-complete-radius-placement-audit/audit.json --check
```

Kernel-check the positive producer from the Lake root:

```bash
cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-complete-radius-placement-audit/CompleteRadiusPlacement.lean
```

The focused check is intentionally used because this scratch module is not a
Lake target.  It completed warning-free and printed only the three approved
axioms for both declarations.

## Epistemic boundary

- **PROVEN:** the two positive Lean membership producers and their axiom sets.
- **EXACT FINITE REPLAY:** both stored no-packing fixtures violate the proved
  complete-radius closure, with exactly one minimal three-center certificate
  each.
- **CONJECTURED:** universal occurrence of such a triangle or of the three-row
  cyclic placement in every `OriginalUniqueFourResidual`.
- **NOT CLAIMED:** closure of the exact-four source branch, Euclidean
  realizability or nonrealizability of another finite survivor, or any
  arbitrary-cardinality theorem from the finite replay.
