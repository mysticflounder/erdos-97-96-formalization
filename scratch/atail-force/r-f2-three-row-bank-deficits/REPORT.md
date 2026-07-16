# F2 three-row theorem-bank role-deficit audit

Date: 2026-07-16

Status: **bank census complete; positive uniform producer kernel-checked; no
production `sorry` closed.**

## Scope

This lane audits the exact F2 three-row `2+2` packet against the current
general-`n` U5 theorem banks.  It owns only:

- `bank_role_deficits.py`;
- generated `bank_role_deficits.json`;
- `F2ThreeRowBankDeficitAdapters.lean`; and
- this report.

No production Lean file, closure plan, or protected proof file is authored by
this lane.

## Required theorem-bank preflight

Before deriving a new finite pattern, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current local `U5GlobalIncidenceSupport.lean` and related kernels;
- the exact F2 live-heavy and support-heavy scratch packets; and
- focused `nthdegree docs search --lean` queries for two-dangerous-point,
  adjacent q-critical, q-critical/exact-chain, and tetrahedron consumers.

The registry scan covers every source-proved, source-reachable,
ambient-data-uniform U5 `False` consumer in the current sibling census:

| Scope | Count |
|---|---:|
| All scanned consumers | 170 |
| `U5GlobalIncidence` consumers | 114 |
| Novel sibling shapes among those | 96 |
| Other ambient-data U5 consumers | 56 |

## Exact packet used by the audit

The authoritative original-deletion view is:

```text
d = actual common deleted source
c = actual retained blocker at d
T = (deletedCriticalSupport C).erase d

L = live exact row, centered at p
B = middle exact row, centered at oppApex2
```

It retains:

```text
U5DangerousTriple D d c T
U5QCriticalTripleClass D d c T
U5QDeletedK4Class D d p L
U5QDeletedK4Class D d oppApex2 B

card (L ∩ B) = 2
card (B ∩ deletedCriticalSupport C) = 2
card ((L ∩ B) ∩ deletedCriticalSupport C) = 0
card (L ∩ deletedCriticalSupport C) ≤ 1.
```

The exact F2 middle row is the disjoint `2+2` union of:

- two live-only points; and
- two support-only points.

The support-heavy split now names its two strict support-only points `s,t`
and proves:

```text
s,t ∈ T
s ≠ t
s,t ∈ B
```

Global K4 at `s,t`, relative to the same actual deletion `d`, gives the exact
four combinations:

```text
q-deleted / q-deleted
q-deleted / q-critical
q-critical / q-deleted
q-critical / q-critical.
```

The generated supports and their exact cardinalities are retained.

The JSON also contains a `live_overlap` diagnostic view obtained by changing
the deleted source to a live intersection point.  That view is useful for
rejecting accidental role maps, but it is not the current producer boundary
and is not used for the branch-aware recommendations below.

## Full-bank census result

The declaration-level screen found:

| Classification | Count |
|---|---:|
| Direct match | 0 |
| Conditional current-row match | 6 |
| Impossible current role map | 45 |
| Additional class producers required | 107 |
| Opaque or non-class interface | 12 |

The six nominal conditional matches are not closure-ready:

- four are raw metric/kernel surfaces whose standalone metric or
  noncollinearity hypotheses are not produced by the named class packet; and
- two current class consumers still need six directed center/support or
  selected-packet fields.

Therefore the current three rows do not directly close any banked
incompatibility.

`closest_repairs` in the JSON is deliberately only a syntactic lower-bound
screen.  An unmatched theorem class has not yet been assigned to an actual F2
strict center, so that table must not be used as the producer plan.  The
authoritative results are the curated branch-aware targets below.

## Main bank pattern: a uniform two-off-triple producer

The most useful result is not a conditional contradiction.  It is the
positive consequence obtained by turning the shortest bank consumer into an
upper bound.

Let:

```text
htriple : U5DangerousTriple D d c T
z ∈ T
```

and let global K4 at `z` produce a row support `G`.

### Q-critical output

The current theorem

```text
U5QCriticalTripleClass.two_triple_points_incompatibility
```

implies:

```text
card (G ∩ T) ≤ 1.
```

Since an exact q-critical support has cardinality three:

```text
2 ≤ card (G \ T).
```

### Q-deleted output

The existing two-circle theorem

```text
U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
```

implies, using `d ∉ G`:

```text
card (G ∩ T) ≤ 2.
```

Since the split retains `card G = 4`:

```text
2 ≤ card (G \ T).
```

### Uniform conclusion

At every actual strict support-only center:

```text
every side of the q-deleted/q-critical split
produces at least two support points outside T.
```

Thus both support-heavy centers yield a two-off-deleted-dangerous-triple row
regardless of which of the four split arms occurs.

`F2ThreeRowBankDeficitAdapters.lean` kernel-checks:

```text
false_of_qCritical_inter_dangerous_card_ge_two
qCritical_inter_dangerous_card_le_one
qCritical_two_le_support_sdiff_dangerous_card
qDeleted_two_le_support_sdiff_dangerous_card
```

This is a genuine general theorem pattern exposed by the bank.  It is a
positive producer, not a production closure.

## Exact remaining bridge

The two guaranteed points lie outside the deleted-source dangerous triple
`T`.  The checked common-deletion expansion theorem instead wants two sources
outside the retained live row.  Those statements are not interchangeable.

The correct next mining object is therefore:

```text
one actual generated support G at a named strict F2 center z,
with all of the following retained:

- original deleted source d;
- original blocker c;
- whether G is q-deleted or q-critical;
- G \ T;
- membership relative to the live row L and middle row B;
- cap/MEC placement; and
- retained critical-source provenance.
```

The first question is:

```text
where do the two guaranteed points of G \ T lie relative to L?
```

Useful successful outputs would be:

1. two genuinely off-live sources, feeding the existing
   successor/second-center-alignment theorem;
2. the three exact adjacent-center incidences on a both-q-critical branch; or
3. the five selected-class tetrahedron incidences on an all-q-deleted branch.

Mining anonymous fixed-cardinality supports, the diagnostic `live_overlap`
view, or raw metric kernels without these roles would again target the wrong
object.

## Conditional bank terminals

### 1. Forbidden two-dangerous-hit terminal

For a q-critical generated row at a support-heavy center `z ∈ T`, the exact
single-field conditional terminal is:

```text
2 ≤ card (G ∩ T).
```

The Lean adapter closes immediately through
`two_triple_points_incompatibility`; the required center inequality is
automatic from `z ∈ T`.

This is the forbidden side of the dichotomy.  It should not be the default
mining target: the useful unconditional consequence is the two-off-`T`
producer above.

### 2. Both-q-critical adjacent terminal

The support-heavy K4 split already kernel-checks a conditional application of:

```text
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility.
```

For generated supports `Gₛ,Gₜ`, its exact missing fields are:

```text
c ∈ Gₛ
c ∈ Gₜ
t ∈ Gₛ ∨ s ∈ Gₜ.
```

No one of these follows from F2 cell membership or global K4 alone.

### 3. Both-q-deleted tetrahedron terminal

For two distinct strict middle-row centers `x,y` whose generated rows are
q-deleted, choose a third point `w ∈ B` distinct from `x,y`.  The actual
middle row at `oppApex2` supplies the third selected class.

The local selected-class tetrahedron adapter closes if:

```text
y,w ∈ generated support at x
x,w,oppApex2 ∈ generated support at y.
```

These are five genuine generated-row incidences.  The current packet supplies
none of them automatically.  The both-q-deleted support-heavy arm also
constructs a new same-deletion common-deletion packet retaining both generated
supports; a progress/recurrence argument may be more promising than mining
all five tetrahedron incidences directly.

### 4. Longer q-critical/exact families

The mutual-no-`p`, rank-one-radius-child, and rank-two-mixed families are not
the next targets.  Under source-faithful substitution they require multiple
generated class roles and several directed center/support incidences.  They
are strictly farther than the one-row two-off-`T` producer on every
q-critical support-heavy branch and do not solve the all-q-deleted branch.

## Reproduction

The structured census is regenerated with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 \
  uv run python \
  scratch/atail-force/r-f2-three-row-bank-deficits/bank_role_deficits.py \
  --check \
  --output \
  scratch/atail-force/r-f2-three-row-bank-deficits/bank_role_deficits.json
```

It exits successfully and checks the expected `114/96/56` registry split,
the exact class signatures of the principal consumers, and negative-control
role maps.

The deliberate Lean check was:

```bash
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-f2-three-row-bank-deficits/F2ThreeRowBankDeficitAdapters.lean
```

It exits successfully under Lean `4.27.0`.  Every printed theorem depends
only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.

No full `lake-build` was run.  A later attempt to display the local
`lake-build` wrapper help unexpectedly executed its proof-blueprint refresh;
the resulting protected generated-doc diff was reported to the root owner and
was neither edited nor reverted by this lane.

## Closure status

No production `sorry` is closed by this audit.

What is now closed is the theorem-selection question for the F2 support-heavy
split:

- the bank does provide a uniform positive producer;
- its exact output is two generated support points outside the actual
  deleted-source dangerous triple; and
- the remaining mathematical bridge is to classify those points against the
  retained live row and cap/MEC/provenance data.

That is the next source-faithful object to analyze.
