# Actual-parent common-system audit

Date: 2026-07-14

Status: **KERNEL-PROVED POLARITY AND ROW COLLAPSE; PINNED FINITE-SHADOW
COUNTERMODEL; NO K-A CLOSURE.**

## Verdict

Restoring the concrete `CriticalShellSystem` retained by
`u1_largeCap_routeB_tail_false` does recover more than the weakened K-A-PAIR
signature, but it does not force any current closing producer.

The decisive parent-specific fact is that on the actual `t2_t20` branch the
additional `f2` source is `t2`. Because both rows were constructed from the
same system, the `f2` row is the original `t2` row: same blocker center and
same complete support. It is not a sixth row on this branch.

At the resulting `p`-centered dangerous row, common provenance has an exact
polarity:

```text
not K4 after deleting z at p  <->  z in {q,t1,t2,t3}.
```

Thus all four dangerous members are deletion-critical at `p`, while every
off-dangerous point preserves the existing K4 row at `p`. In particular `u`
survives deletion at `p`, so the system's chosen blocker for `u` differs from
`p`. This is a genuine second center, but it has no cap or Moser-apex
localization.

The same polarity also explains why this cannot manufacture a current h4/h5
edge. An outside endpoint is provably at a different `p`-distance from every
member of the exact dangerous row. Common provenance certifies old-row
membership; it does not add a new point to that row.

## Kernel-checked results

`CommonSystemParent.lean` proves eight no-`sorry` declarations:

- `deletion_blocked_iff_mem_selected_support`: at every chosen blocker center,
  the deletion-critical sources are exactly the members of its selected exact
  support;
- `parent_t2_row_eq_system_row`: constructor-level `t2` row provenance;
- `parent_f2_row_collapses_to_t2_row`: the exact `t2_t20` collapse;
- `parent_p_deletion_blocked_iff_mem_dangerous` and its member corollary;
- `parent_u_deletion_survives_at_p`;
- `parent_u_blocker_ne_p`; and
- `parent_p_dist_ne_of_mem_dangerous_of_not_mem_dangerous`, the metric
  no-extension result.

The isolated direct Lean check exits zero. Every printed declaration has
axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, named axiom, or `native_decide` in the file.

## Consumer-by-consumer consequence

### h4/h5 row extension

**Not forced.** At `p` the desired off-row extension is the negation of the
proved exact polarity: an outside point's deletion preserves K4 there and its
distance differs from every dangerous-row member. At any other row center,
common provenance gives only the same diagonal fact for that row. To fire h4
or h5 one still needs a new prescribed-center statement such as

```text
not K4 after deleting f at d
```

or its mirror, where `f` is currently outside the exact row at `d`. No parent
field identifies the blocker chosen for that source with the required `d` or
`f` center.

### strict-apex new pair

**Not forced.** Neither `MT` nor the common row constructor identifies any
`centerAt` with either opposite Moser apex. The `f2` row cannot help on
`t2_t20`, because it is the old `t2` row. Producing a genuinely new strict
pair still requires the descent newness premise: at least one endpoint must
lie outside the relevant initial exact apex row.

### same-cap second center

**Only center separation is proved.** The parent proves
`H.centerAt u != p`; it does not place `H.centerAt u` in the surplus cap (or
any prescribed cap), and it supplies no cross-membership of a chosen pair in
the `u` row. The existing pointwise-override API is consistent with this:
constructor provenance cannot by itself select a favorable certified blocker.

### direct contradiction

**None follows from the retained interface.** The common system adds exact
deletion semantics to already stored rows, but no off-row equality, apex
alignment, cap localization, or reciprocal cross-incidence. The actual parent
also retains `hnoRem`; for a source in the carrier this guarantees that some
center blocks K4 after deletion, which is exactly the existential information
used to build `CriticalShellSystem`. It does not prescribe one of the current
h4/h5 centers.

## Pinned finite-shadow countermodel

`audit_shadow.py --check` replays the refreshed 23 current-bank-clean card-12
`(5,5,5)` shadows together with the h4/h5 and two apex-completion checkpoints.
In the stored-row abstraction every center has one exact four-row and no
alternate K4 radius is represented. The audit constructs a total blocker map
for all 12 sources by choosing, for each source, a row which contains it. It
forces the actual parent placement

```text
p = 0, t2 = 1, row(p) = {1,2,3,4}, centerAt(t2) = p,
```

and orients the first slot as `t2`, so the `t2_t20`/f2 collapse is realized.

Exact within that abstraction:

- all 23 shadows admit a total common blocker map;
- all 23 maps avoid the preferred h4/h5 prescribed-center alignment because
  the right endpoint is outside that center's exact row;
- all 23 admit a blocker for `u=5` outside the surplus cap;
- 22 of 23 retain missing first-apex strict-pair equalities, and all 23 retain
  two missing second-apex strict-pair equalities; shard 20 is the separate
  immediate-terminal phenomenon where all first-apex strict pairs are old.

This is a sharp negative result for the encoded common-provenance interface,
not a Euclidean counterexample. The abstraction omits coordinates, alternate
radius classes, convexity, MEC optimality, all live placements, and all larger
cardinalities. It therefore does not refute a genuinely geometric producer and
does not close K-A-PAIR.

## Minimum-disc Lemma 4.14

The locally ingested BKOS Lemma 4.14 concerns the unique smallest disc
`md(P,R)` enclosing `P` with a prescribed set `R` on its boundary, and how that
optimum changes when one point is inserted or deleted. There is no legitimate
bridge from the current common-system fields to that lemma:

- `CriticalShellSystem.centerAt source` is a carrier point supporting an exact
  four-point equal-distance class;
- `no_qfree_at` says deletion destroys every K4 witness at that chosen center;
- neither field says the center/radius encloses the carrier or minimizes an
  enclosing radius; and
- `MT` describes the one global MEC/Moser boundary triangle, but no theorem
  identifies a chosen blocker center with the global MEC center or with a
  constrained optimum after deletion.

Taking the three Moser vertices as the prescribed boundary set only recovers
the already fixed global circumdisc; it does not constrain the source-to-
blocker map. A usable application would first require a new theorem proving
that a relevant blocker row is the boundary of a specified constrained
minimum enclosing disc. That antecedent is absent and must not be assumed.

## Theorem-bank and index preflight

The required sibling, legacy, and older-general P97 registries were checked,
followed by indexed searches for common critical-system provenance,
deletion-critical exact support, `false_of_center_p_t2_t20`, f2-row coupling,
and prescribed-center row extension. The closest current theorem is
`cross_deletion_survives_iff_not_mem_selected_support`, from which the exact
negative polarity above is derived. The bank contains no theorem supplying
the missing off-row prescribed center, apex alignment, cap-local blocker, or
strict-pair newness premise.

## Validation

From the repository root:

```bash
.venv/bin/python \
  scratch/atail-force/common-system-parent/audit_shadow.py --check
```

Result:

```text
PASS: common-system parent shadow matches pinned checkpoint
```

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/common-system-parent/CommonSystemParent.lean
```

The direct single-file check exits zero. No full Lake build was run.

## Next honest theorem

Do not widen K-A merely to pass the common system. The provenance transport is
now exhausted. A closing theorem must use the geometry omitted by the exact
interface result and force one of:

1. prescribed deletion criticality at the current h4/h5 off-row center;
2. a descent pair with an endpoint outside the relevant initial apex row; or
3. a cap-local second center together with the required cross-membership.

Any of these enters an existing consumer. Common provenance alone enters none.
