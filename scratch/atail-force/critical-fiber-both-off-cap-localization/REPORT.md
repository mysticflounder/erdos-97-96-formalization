# Critical-fiber both-off cap localization

Date: 2026-07-17

Status: **KERNEL-CHECKED SOURCE-FAITHFUL CAP/MEC NORMAL FORM; NONTERMINAL.
THE HONEST BOTH-OFF ARM REMAINS OPEN. NO PRODUCTION `sorry` IS CLOSED.**

## Question and source discipline

This lane starts from the production

```lean
FrontierCommonDeletionCriticalFiber R
```

and retains the honest `bothOff` alternative from the first-apex row-hit
audit:

```text
source1 notin SelectedClass D.A S.oppApex1 radius
source2 notin SelectedClass D.A S.oppApex1 radius.
```

The exact critical fiber is load-bearing.  The checked cap conclusions use
both named source memberships in their one shared exact four-point support,
including the second membership transported from the second source's own
`no_qfree` fact.  A consequence available for an anonymous selected row was
not counted as progress on the collision.

## Required bank preflight

Before deriving the normal form, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpora for critical-source blocker fibers,
endpoint shells, cap-local selected rows, sources outside their blocker's cap,
and same-cap outside-pair consumers.  The relevant reusable results were:

- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- `CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one`;
- `CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one`;
- `SurplusCapPacket.capByIndex_cgn4g_capData_oriented`; and
- the sibling theorem
  `short_endpoint_shell_meets_adjacent_cap_card_le_one`, whose mathematical
  content is already available from the preceding production results.

The archived `U1kSourcePushout` / `samecap_wrongSide_*` theorems require a
named same-cap blocker edge and additional endpoint-use/order data.  They do
not accept either honest residual below.  No registered theorem consumes a
critical source lying outside its common blocker's cap, nor the complementary
two fresh shell points, as a contradiction.

## Checked input packet

`CriticalFiberBothOff R` contains:

- the production source-faithful critical fiber;
- both distinct source identities;
- equality of their chosen blocker vertices;
- one exact support of cardinality four containing both sources;
- deletion criticality of either source at that common blocker; and
- both source failures to lie on the retained first-apex radius.

The two radius failures are exported in metric form as

```lean
CriticalFiberBothOff.source₁_firstApex_dist_ne_radius
CriticalFiberBothOff.source₂_firstApex_dist_ne_radius.
```

Thus this lane does not turn `bothOff` into a weaker unlabeled cap count.

## Strongest checked exhaustive theorem

The main theorem is

```lean
nonempty_criticalFiberBothOffCapOutcome
    (B : CriticalFiberBothOff R) :
    Nonempty (CriticalFiberBothOffCapOutcome B).
```

It uses the full Moser cap partition to split the common blocker.

### 1. Common blocker is a Moser vertex

The blocker is an endpoint of **both** adjacent indexed caps.  For each of
those two distinct cap indices, the theorem retains a
`TriangleBlockerLocalization` proving:

```text
card (commonSupport inter cap) <= 1
3 <= card (commonSupport \ cap)
source1 notin cap or source2 notin cap.
```

The last disjunction is source-specific.  If both named sources were in the
cap, their two-element set would be contained in a cap-side shell whose card
is at most one.  The proof therefore uses both source identities, their
distinctness, and both common-support memberships.

The simultaneous two-cap form is strictly stronger than choosing one
convenient cap: one named collision source is forced outside each adjacent
cap, although the disjunction need not choose the same source twice.

### 2. Common blocker is in a strict cap interior

For the unique indexed cap containing that strict interior, the theorem
proves:

```text
card (commonSupport inter cap) <= 2
2 <= card (commonSupport \ cap)
```

and the exact source-role trichotomy:

```text
source1 notin cap
or source2 notin cap
or (source1, source2 in cap
    and commonSupport inter cap = {source1, source2}).
```

Hence if both collision sources lie in the blocker's cap, they exactly
exhaust its cap-side shell points and the two complementary support points
are genuinely fresh relative to both sources.

Both alternatives retain the two first-apex radius failures.

## Does this advance the both-off arm?

It advances the **localization**, but it does not close the branch.

The endpoint case proves more than the generic two-outside-points extraction:
three support points lie outside each adjacent cap, and at least one of the
named critical sources is among the points excluded from that cap.  The
interior case isolates the only way both sources can remain cap-local: they
must be exactly the two cap-side support points.

However, neither fact is contradictory:

- a source may lie outside the cap containing its chosen blocker;
- an endpoint-centered exact shell may have three or four points outside an
  adjacent cap; and
- an interior-centered exact shell may have precisely its two critical
  sources inside and two fresh points outside.

The prior outside-pair blocker audit shows why recursively taking the actual
blockers of the fresh outside pair does not finish the proof: a distinct
cross-bisector blocker is expelled from the common blocker's cap, while the
remaining outcome is mutual omission.

## Exact next consumer boundary

There is no current immediate terminal match.  A load-bearing successor must
consume one of these exact source-valid packets:

1. **endpoint/outside-source consumer** — a direct contradiction using a
   named deletion-critical source outside an adjacent cap of its Moser-vertex
   blocker, together with the source's exact common shell and full parent
   order; or
2. **interior/two-fresh-points consumer** — a theorem using the two named
   cap-side critical sources plus the two complementary outside support
   points to produce an existing ordered row packet, a distinct same-cap
   bisector center, or `False` directly.

Merely extracting an outside pair is not an acceptable successor because it
holds for every carrier-centered selected row and forgets the collision.
Likewise, the archived same-cap source-pushout statements do not apply without
new endpoint-use and source/blocker same-cap data.

## Validation and scope

The owned Lean file elaborates without `sorry`, `admit`, declared axioms,
`native_decide`, unsafe code, heartbeat overrides, or linter suppression.
The three displayed axiom closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The direct single-file scratch elaboration used the project environment, the
16 GiB memory cap, and a 65,536 KiB thread stack.  Only files under
`scratch/atail-force/critical-fiber-both-off-cap-localization/` were created.
No production file, plan document, generated blueprint, protected unique-row
artifact, `SurplusM44`, or shell-curvature file was modified.
