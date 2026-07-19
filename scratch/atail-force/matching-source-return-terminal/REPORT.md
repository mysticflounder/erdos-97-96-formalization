# Retained matching source-return terminal audit

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT RADIUS SPLIT AND U5 INGRESS. NO DIRECT
`False`. THE CURRENT SOURCE-RETURN INTERFACE HAS FORGOTTEN THE ORIGINAL
SECOND-APEX COUPLING, SO A TERMINAL MUST ADD A FULL-PARENT CAP/ORDER FIELD OR
CHANGE THE SOURCE SELECTION.**

This lane owns only
`scratch/atail-force/matching-source-return-terminal/`. It does not edit
production Lean, generated files, or planning documents.

## Exact input

The production normal form supplies

```lean
W : RetainedMatchingTwoStepCommonDeletionWalk R
hreturn : W.next = W.first
```

where `R : FrontierCommonDeletionParentResidual F`. Write

```text
O  := S.oppApex1
x  := W.first
y  := W.second
cx := H.centerAt x
cy := H.centerAt y
C  := SelectedClass D.A O radius.
```

The source-return branch gives exactly:

- `x,y` are distinct strict-first-cap members of `C`;
- `y` is absent from the actual shell sourced at `x`;
- `x` is absent from the actual shell sourced at `y`;
- deleting `y` preserves K4 at `O,cx`;
- deleting `x` preserves K4 at `O,cy`; and
- `O,cx,cy` are pairwise distinct.

This is a source-exact mutual-omission cycle. It is not an actual-blocker map
cycle and does not say that either blocker equals the opposite source.

## Theorem-bank preflight

Before adding a local reduction, this audit checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches included:

```text
common deletion two centers two sources mutual omission critical shell convex cap contradiction
two retained radius sources mutual deletion survives opposite blockers strict cap
source return two-cycle selected critical row blocker matching
minimal convex equidistant witness directed two cycle blocker
prescribed deletion criticality common deletion two center
actual blocker two cycle cross incidence selected shell contradiction
```

The closest current/banked consumers are:

- `U5QCriticalTripleClass.two_triple_points_incompatibility`;
- the sibling `mutual_no_p_exact_center_incompatibility` family;
- `u1OpposedOrderConfig_contradiction`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`; and
- the production retained-collision different-pair Kalmanson consumers.

None accepts only a mutual-omission pair. The smallest U5 consumer,
`U5QCriticalTripleClass.two_triple_points_incompatibility`, accepts an
arbitrary non-`p` center but requires one q-critical row to contain two
distinct dangerous-triple points. The larger U5 consumers require one or
more q-critical/deleted row **centers** to be aligned with named
dangerous-triple points, plus their complete named support incidences. The
source-return packet has rows *sourced* at `x,y`, but centered at the
unrelated actual blockers `cx,cy`. Confusing sources with centers would be
the same role error rejected in the earlier paired-common-deletion audit.

## Kernel-checked exact split

The scratch file `MatchingSourceReturnRadiusSplit.lean` proves:

```lean
nonempty_sourceReturnRadiusOutcome
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
  Nonempty (RetainedSourceReturnRadiusOutcome W)
```

For each actual shell, the production two-circle theorem gives

```text
|shell(x) intersect C| <= 2,
|shell(y) intersect C| <= 2.
```

Moreover `x` belongs only to the first intersection and `y` belongs only to
the second. There are exactly two outcomes.

### 1. Joint deletion at three named centers

`RetainedSourceReturnJointDeletion` supplies a point `z in C`, distinct from
`x,y`, omitted by both shells. Exact critical-shell semantics and first-apex
robustness give

```text
K4 survives deleting z at O,
K4 survives deleting z at cx,
K4 survives deleting z at cy,
O, cx, cy are pairwise distinct.
```

The structure stores two source-valid `CommonDeletionTwoCenterPacket`s for
the same deleted source:

```text
(z; O,cx) and (z; O,cy).
```

This branch occurs automatically whenever `|C| >= 5`, but the theorem is
slightly sharper: it also detects a joint omission when `|C| = 4` and the two
two-point bounds fail to cover `C`.

### 2. Exact four-point complementary partition

If no point is omitted by both shells, counting is rigid:

```text
|C| = 4,
shell(x) intersect C = {x,a},
shell(y) intersect C = {y,b},
{x,a} and {y,b} are disjoint,
{x,a} union {y,b} = C.
```

`RetainedSourceReturnExactFourPartition` names `a,b` and proves all four
points `x,a,y,b` are distinct. This is the complete retained-radius incidence
shadow of source return; there is no unclassified fifth point or hidden
overlap.

## Correct finite mining objects

Two additional checked theorems package the split without relabeling source
roles as center roles.

### Joint arm

```lean
RetainedSourceReturnJointDeletion.nonempty_u5Ingress
```

chooses a named point `t` outside `{z,x,y}` in `C` and uses the exact dangerous
triple

```text
q = z, p = O, T = {x,y,t}.
```

It retains the canonical actual shells sourced at `x,y` as q-deleted rows at
`cx,cy`, and retains the canonical actual q-critical row sourced at `z`.

### Exact-four arm

```lean
RetainedSourceReturnExactFourPartition.nonempty_u5Ingress
```

produces two dual U5 surfaces:

- deleting `a`: q-critical at `cx`, q-free at `cy` and `O`;
- deleting `b`: q-critical at `cy`, q-free at `cx` and `O`.

The dangerous triple in each surface is the other three points of `C`.

These packets identify what should be mined next. They do **not** match a
banked incompatibility without further center alignment and support
incidences. In particular, the banked U5 class theorems typically require a
row centered at one of the dangerous triple points, whereas `cx,cy` are only
known carrier blockers.

## Exact missing U5 antecedents

The role audit below is against the actual theorem statements, not theorem
name similarity.

### Joint-deletion ingress

Known for `q=z`, `p=O`, and `T={x,y,t}`:

- the q-deleted row at `cx` is the actual shell sourced at `x`; it contains
  `x`, omits `z` and `y`, and may or may not contain `t`;
- the q-deleted row at `cy` is the actual shell sourced at `y`; it contains
  `y`, omits `z` and `x`, and may or may not contain `t`;
- the q-critical row at `cz := H.centerAt z` is the actual shell sourced at
  `z`, with `z` erased; and
- `cx != cy`, while `O`, `cx`, and `cy` are pairwise distinct.

The closest global sink is

```lean
U5QCriticalTripleClass.two_triple_points_incompatibility
```

but its missing two-dangerous-point premise is not a viable producer here.
`criticalShell_inter_frontierRadiusClass_card_le_two` says every actual shell
meets `C` in at most two points. The shell sourced at `z` already contains
`z`, so its erased q-critical row contains at most one point of `T`. Thus the
smallest U5 sink is **ruled out by the same two-circle bound used in the
split**, rather than merely waiting for another incidence lemma.

For the nearest center-exact bank theorem,
`U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`, the ingress
still lacks all of the load-bearing bridge:

1. two q-critical rows whose centers are two named points of `T`;
2. a q-deleted auxiliary center `u`; and
3. the six cross-row memberships `b,u in Ba`, `a,u in Bb`, and `p,a in Bu`.

The two known rows at `cx,cy` are q-deleted, not q-critical, and no equality
puts either blocker in `T`. For
`CapSelectedRowCounting.outsidePair_unique_capCenter`, the ingress instead
lacks an ordered cap containing `cx,cy` and two distinct points outside that
cap lying in both blocker rows. Mutual omission supplies neither a common
outside pair nor cap placement of the centers.

### Exact-four ingress, first side

For deletion of `a := P.firstPartner`, the dangerous triple is exactly

```text
q = a, p = O, T = C.erase a = {x,y,b}.
```

The retained-class incidences are exact:

- the q-critical row at `cx` meets `T` in exactly `{x}`;
- the q-deleted row at `cy` meets `T` in exactly `{y,b}`; and
- the q-deleted row at `O` is an arbitrary K4 witness after deleting `a`, so
  no named `T` membership is selected.

Consequently `two_triple_points_incompatibility` cannot consume the only
packaged q-critical row: it has exactly one dangerous-triple hit. A larger U5
sink still needs a blocker equality placing `cx` (or another q-critical
center) at a named point of `T`, at least one additional q-critical row, and
the consumer's named cross-support fields (typically including `p=O` in a
nonphysical row). None follows from the exact partition. The outside-pair
sink again lacks same-cap blocker localization and a common pair outside that
cap.

### Exact-four ingress, second side

This is the literal dual with `q=b` and `T={x,a,y}`:

- the q-critical row at `cy` meets `T` in exactly `{y}`;
- the q-deleted row at `cx` meets `T` in exactly `{x,a}`; and
- the q-deleted row at `O` has no selected named `T` incidence.

Its missing bank antecedents are the same after swapping
`(x,cx,a)` with `(y,cy,b)`.

Therefore another support-only census on these three rows cannot make the
existing q-critical row hit two points of `T`; that target is overstrong.
Any productive mining/refactor must add a new source-indexed row together
with actual-blocker center classification, or restore the forgotten
second-apex provenance before selecting `x,y`.

## Why this does not close

The exact split shows that source return is not a thin terminal.

1. A deletion surviving at three distinct centers is not an existing
   contradiction. The witness rows may be different circles.
2. The exact-four partition is a consistent two-circle incidence marginal.
   It supplies no placement of `cx,cy` on `C`, no common outside support pair,
   and no third common point.
3. `R.minimal` cannot prefer a new center. The existing minimal-deletion
   stutter audit constructs singleton returns at old actual blockers.
4. The chosen matching sources retain only first-apex radius and first-cap
   provenance. They are not the original frontier pair and carry no
   second-apex double-deletion survival. Therefore the current source-return
   type cannot visibly use the double-apex consumer which motivated K-A-PAIR.

The exact rational finite-metric regression was replayed:

```text
scratch/atail-force/paired-common-deletion-nonreturn-audit/
  exact_five_paired_cycle_model.py
```

It passed with digest
`db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa`
and paired cycle `1 -> 2 -> 1`. That model is not Euclidean/convex/MEC, so it
does not refute a full-geometric theorem. It does reject any attempt to make
the checked radius/incidence packet itself contradictory.

## Narrowest honest next theorem

There are two viable continuations.

1. **Keep the current matching selection.** Classify `cx,cy` relative to the
   exact dangerous triple and cap partition, then prove one additional
   source-valid field which immediately feeds a banked consumer:
   - one blocker equals a named dangerous-triple point together with the
     required support memberships; or
   - two blocker rows have a named common outside pair in one cap; or
   - a fixed boundary order supplies one of the production Kalmanson cyclic
     terminals.

2. **Refactor the selection boundary.** Choose the matching pair from a set
   which retains original second-apex/double-deletion provenance, rather than
   arbitrary strict-first-cap points of the first-apex radius. This is the
   shorter route if the intended consumer is genuinely double-apex: the
   information is absent from `RetainedMatchingTwoStepCommonDeletionWalk` and
   cannot be reconstructed by local incidence mining.

The first route now has a precise finite object (`JointU5Ingress` or the two
`ExactFourU5Ingress` sides). The second route is the higher-level correction
if those center-alignment classifications continue to survive.

No production `sorry` is closed by this scratch checkpoint.

## Validation

Direct scratch elaboration against the current project environment:

```bash
cd lean
lake env lean -s 65536 \
  ../scratch/atail-force/matching-source-return-terminal/\
MatchingSourceReturnRadiusSplit.lean
```

Result: exit `0`. All three printed declarations depend exactly on:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level custom axiom,
`native_decide`, or `unsafe` declaration. The regression was replayed with:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

and returned `status: PASS` with the pinned digest above.
