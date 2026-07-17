# Survival-cover geometry checkpoint

Date: 2026-07-16

## Result

The primary card-at-least-fourteen producer is now **PROVEN and
kernel-checked** in the adjacent bank-match lane:

```lean
Problem97.ATailSurvivalCoverBankMatchScratch.
  exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen
```

On the actual `SurvivorPairRelocationPacket` surface, assuming the existing
non-card-four and support hypotheses and `14 ≤ D.A.card`, it returns:

- a deleted point equal to `P.q` or `P.w`;
- two named sources outside `qBlockerFiber P`;
- two distinct actual blockers;
- survival of the same deletion at both blocker centers; and
- a kernel-built `Nonempty (CommonDeletionTwoCenterPacket ...)`.

The count is sharp at the level used here.  The known `q`-blocker fiber has
cardinality at most four, so card at least fourteen leaves at least ten
outside sources.  One of the two survival colors has at least five sources.
Every actual-blocker source fiber has cardinality at most four, because equal
actual blockers lock the selected supports and every source belongs to the
resulting four-point support.  Thus the five-source color contains two
distinct actual blockers, and the existing constructor packages their two
survival facts as `CommonDeletionTwoCenterPacket`.

This is genuine producer progress.  It does **not** by itself close a
production `sorry` or prove `False`.

## Exact remaining gap after card at least fourteen

The two centers in the generic packet are arbitrary actual blockers.  The
theorem does not identify them with `p`, `oppApex2`, or the named F2/postmix
centers, and it does not put them in one common cap.  Consequently it does not
instantiate the aligned F2/postmix continuation handlers.  Expanding a
generic `CommonDeletionTwoCenterPacket` using the present bank is nonterminal:
it returns to the same kind of row/survival surface rather than producing a
contradiction.

The smallest source-valid next field is therefore one of:

1. a direct consumer that is uniform in the packet's arbitrary actual-blocker
   centers; or
2. a physical-role alignment/localization theorem identifying those centers
   with the named F2/postmix roles required by an existing consumer.

No distinct double-blocked blocker should be requested: that target is
refuted on the relevant abstraction.

## Complementary card-at-least-eleven reduction

`SurvivalCoverGeometry.lean` kernel-checks the strongest additional
MEC/cap-order reduction found in this lane:

1. MEC cap lower bounds give all three closed caps cardinality at least four.
2. The surplus cap has cardinality at least five.
3. Global no-`IsM44` makes one opposite cap have cardinality at least five.
4. The cap-sum identity therefore gives `11 ≤ D.A.card`.
5. Seven sources remain outside the known blocker fiber.
6. Pigeonholing by `survival color × actual-blocker closed cap` gives two
   distinct sources of one survival color whose actual blockers occupy one
   closed cap.

The resulting exact split is:

- **equal blockers:** one selected critical shell contains both sources and
  omits the common deleted frontier point;
- **distinct blockers:** cap geometry gives two honest distinct ordered ranks,
  and both selected rows omit the same frontier point.

Neither arm is contradictory with the current data.  In the distinct-blocker
arm, the smallest field matching the existing sink
`false_of_two_cap_center_rows_common_outside_pair` is two distinct points
outside the common cap that lie in both selected supports.  Survival cover and
cap placement do not produce that pair.  In the equal-blocker arm, the shared
four-point shell is likewise not a contradiction by itself.

The legacy `SameCapBlockerEdge` route is not used: its extra endpoint-radius
equality is not supplied by this surface.

## Finite regression

`verify_finite_regression.py` is an exact finite abstraction of only the data
used after the counting step.  It has ten outside sources, two survival colors
of size five, and actual-blocker fibers of sizes `(4,1)` in each color.  The
two blockers in each color occupy different caps, and their abstract
four-supports intersect in exactly one point.

This is **not** a Euclidean model, a `CriticalShellSystem`, or a counterexample
to the parent theorem.  It is a regression showing that the finite
survival-cover/fiber facts alone do not imply either same-cap localization or
a two-point common support.  Any proposed next theorem must visibly consume
additional geometry or physical-role provenance.

## Validation

Focused raw Lean checks are appropriate because these are unimported scratch
modules.  Both the current bank-match file and this lane compiled successfully
with a temporary scratch `LEAN_PATH` and a 16 GiB Lean memory cap.

The checked declarations report only the standard project axiom closure:

```text
[propext, Classical.choice, Quot.sound]
```

This includes the card-at-least-fourteen bank theorem and every declaration in
`SurvivalCoverGeometry.lean`.  No declaration in the owned Lean file uses
`sorry`, `admit`, a new `axiom`, `native_decide`, or `unsafe`.

The finite regression is run with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-survival-cover uv run python \
  scratch/atail-force/survival-cover-geometry/verify_finite_regression.py
```

Expected output:

```text
finite survival-cover regression: PASS
```

Before theorem development, this lane checked the required general-n and
sibling-bank registries and ran targeted `nthdegree docs search --lean`
queries for survival-cover, cap-order, critical-map, blocker-fiber, and common
support consumers.  No stronger already-importable producer was found.

## Closure status

- Card at least fourteen source-faithful common-deletion producer:
  **PROVEN / KERNEL-CHECKED**.
- Card at least eleven no-`IsM44` MEC/cap-order normal form:
  **PROVEN / KERNEL-CHECKED**.
- Uniform consumer or physical-role alignment for arbitrary blocker centers:
  **MISSING**.
- Production `sorry` closed by this scratch lane: **none**.
