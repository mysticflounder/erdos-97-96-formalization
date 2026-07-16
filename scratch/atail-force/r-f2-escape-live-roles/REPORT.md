# F2 genuine-escape live-role classification

## Scope

This scratch lane starts with the exact generated q-deleted/q-critical rows
from `F2GeneratedEscapePlacement` and classifies a genuine point `y` with:

```text
y ∈ generated support
y ∉ (deletedCriticalSupport C).erase deleted
y ∉ S.oppCap2.
```

It owns only:

```text
scratch/atail-force/r-f2-escape-live-roles/
```

No production source, closure document, proof-blueprint state, protected
scratch lane, or `SurplusM44` file is changed.

## Theorem-bank preflight

Before deriving the role split, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for generated live-row hits,
  q-deleted/q-critical named roles, cap placement, and U5 incidence
  incompatibilities.

The closest indexed U5 results require two or more directed incidences,
reciprocal center membership, or a whole dangerous-triple chain.  A single
generated hit on one named live point does not meet those antecedents.
In particular:

- `U5QCriticalTripleClass.two_triple_points_incompatibility` requires two
  distinct generated support points in the dangerous triple, whereas the
  present point is explicitly outside that triple;
- `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`
  requires two q-critical classes centered at dangerous-triple points, both
  through the dangerous center, plus a cross-center incidence; and
- `U5QCriticalTripleClass.qcritical_exact_tail_radius_incompatibility`
  requires five named exact/q-critical classes and nine directed support
  incidences.

The directly applicable cap consumer is:

```text
false_of_strictOppCap2_row_contains_firstApex_strict_pair.
```

It applies only after the anchored fixed-radius provenance identifies a
second strict-`oppCap1` point on the same fixed first-apex circle.

## Exact live-role split

`GeneratedEscapeLiveRolePacket` retains the generated support, dangerous
triple, cap, and row provenance.  The theorem

```text
generatedEscapeLiveRolePacket
```

proves:

```text
y ∈ surplusCap or y ∈ strictOppCap1Region
```

and the exhaustive role split:

```text
(y ∉ {q,t1,t2,t3} and y ∉ C.B₂)
or y = q
or y = t1
or y = t2
or y = t3.
```

The `q` branch retains `q ∈ surplusCap`.  Each `ti` branch retains the exact
cap alternative:

```text
ti ∈ surplusCap or ti ∈ strictOppCap1Region.
```

The off-live branch is automatically off the retained middle row by
`generated_offDangerous_offLive_not_mem_middle`.  No selected-support
nonmembership is converted into a distance inequality.

## Anchored q-critical source exclusion

The anchored support-heavy packet has:

```text
X.point ∈ strict oppCap1
R.sourcePair.x ∈ the fixed first-apex class
X.point ≠ R.sourcePair.x
6 ≤ card (the ambient fixed first-apex class).
```

If an off-`oppCap2` q-critical support point were
`R.sourcePair.x`, cap coverage would also put the coherent source in strict
`oppCap1`.  The completed q-critical row centered at the strict-`oppCap2`
generated center contains both:

```text
X.point
R.sourcePair.x.
```

The six-point fixed class supplies a selected four-subrow centered at
`S.oppApex1` containing the same pair.  The two centers lie in `oppCap2`,
while the common pair lies outside that cap.  Ordered-cap uniqueness gives a
contradiction.

This is formalized as:

```text
qCritical_support_offOppCap2_ne_coherentSource.
```

Thus a genuine anchored q-critical escape can be:

- genuinely off live and off middle;
- `q`;
- one of `t1,t2,t3` other than the actual coherent predecessor source.

`qCritical_genuineEscape_liveRoles` packages the complete role packet and
the coherent-source exclusion.

## Consumer audit by role

### Off-live / off-middle

This is the useful continuation role.  One such point is not yet enough for
the existing two-off-live successor consumer; that consumer needs a second
distinct off-live point with the corresponding generated-row provenance.

### `q`

This is one generated support hit on the surplus live source.  Existing U5
consumers need reciprocal center membership, another dangerous-triple hit,
or a longer exact/q-critical chain.  Existing cap and MEC consumers need a
second common outside point or a third common circle point.  None is
currently supplied.  In particular, the `q` role does not provide either of
the two dangerous-triple support hits required by
`two_triple_points_incompatibility`.

### `t1`, `t2`, or `t3`

Each role retains only the exact cap alternative stated above.  In the
q-critical constructor, equality with the actual coherent predecessor source
is now impossible.  The other two labels have no fixed-radius provenance in
the current packet, so the ordered-cap pair consumer cannot be applied.
The adjacent-centers U5 theorem is also unavailable: the generated row gives
only one named live support hit and supplies neither a second q-critical
class through the dangerous center nor the required reciprocal center
membership.

In the q-deleted constructor, even the coherent-source role remains a single
directed hit: the deleted source is not adjoined to the generated support, so
the strict outside pair used in the q-critical contradiction is absent.

## Exact remaining packet

No unconditional contradiction follows for all constructors.  The smallest
remaining named-role packet is:

```text
q-deleted:
  one off-dangerous/off-oppCap2 support point which is
  q, t1, t2, or t3;

q-critical:
  the same, but the point is not R.sourcePair.x.
```

Closure now needs one genuinely new incidence:

- a second distinct off-live escape;
- a second common outside point for an ordered-cap consumer; or
- one of the reciprocal/dangerous-chain memberships required by a named U5
  incompatibility.

## Validation

The repository-pinned Lean 4.27 direct single-file check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-escape-live-roles-oleans/F2EscapeLiveRoles.olean \
  ../scratch/atail-force/r-f2-escape-live-roles/F2EscapeLiveRoles.lean
```

It exited successfully.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.  No full `lake-build` was run.
