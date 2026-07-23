# Unique-four singleton-core terminal audit

Date: 2026-07-22

Scope: only the singleton constructor of
`exists_strictCap_collision_or_singletonCore_or_packedCore R`, after the
exact `2+1+1` class/cap distribution `Q` has been retained. This lane changes
no production Lean and does not claim closure of the original unique-four
arm.

## Result

**PROVEN / KERNEL-CHECKED:** the singleton branch has a stronger unconditional
geometric output than the previous audit recorded. Its installed complete
critical row contains a named pair of distinct carrier points outside the
physical cap containing the fresh center.

The checked packet is

```lean
SingletonCoreOutsidePairIngress R Q
```

and the constructor is

```lean
nonempty_singletonCoreOutsidePairIngress
```

It retains:

- the full `OriginalUniqueFourResidual R` and exact-two distribution `Q`;
- the strict-cap center and its carrier membership;
- the original global-deletion set `V`, its protected-set provenance, its
  blocking and restoration fields, and the singleton cardinality;
- the actual `MinimalDeletionCore`;
- the singleton source and its original protected-role provenance;
- the exact critical shell installed by overriding the late fixed critical
  system at precisely that source;
- the installed blocker center and exact support equality; and
- two distinct carrier points outside the center's indexed cap, both in the
  installed actual row and equidistant from the singleton center.

The proof uses

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
```

on the installed exact four-shell. At most two of its four support points lie
in the center's cap, so at least two lie outside it. No first-apex-class
membership is needed for the outside pair.

This corrects the older conjectural target in
`unique4-global-coupling/REPORT.md`. That target required the outside pair to
belong simultaneously to the exact first-apex class and the singleton shell,
or else required an alternative M44 packet. Those extra requirements are not
needed to enter the ordered-cap terminal.

## Exact terminal boundary

The remaining occurrence statement is named

```lean
HasSameCapActualRowRepeat P
```

for `P : SingletonCoreOutsidePairIngress R Q`. It asks for one source in the
installed critical system whose actual blocker center:

1. lies in the same indexed physical cap as `P.center`;
2. differs from `P.center`; and
3. has an actual critical row containing both extracted outside points.

The checked theorem

```lean
false_of_hasSameCapActualRowRepeat
```

feeds exactly those data to

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

and proves `False`.

Therefore the first missing singleton producer is precisely:

```lean
(P : SingletonCoreOutsidePairIngress R Q) ->
  HasSameCapActualRowRepeat P
```

or a direct alternative-M44 packet. The outside pair itself is no longer
missing.

## Complete-radius theorem audit

The new complete-radius theorem

```lean
mem_blockerImageSelectedRow_of_twoStep_mutualTriangle
```

does apply at the installed singleton center once its five cross-row
memberships are supplied. The singleton source data do not supply those
memberships:

- one actual row and its mandatory source incidence are present;
- no second actual center is localized to the same cap;
- no second row is known to contain either extracted outside point; and
- no two-step mutual selected-row triangle is forced by the
  global-deletion output.

The checked theorem

```lean
SingletonCoreOutsidePairIngress.selectedRow_support_eq_shell
```

also shows that every selected four-row at the installed blocker center has
exactly the singleton shell's support. Thus the singleton arm has no
two-completion-row flexibility at that center: selecting another four-subset
cannot manufacture the missing cross-row occurrence. This is the singleton
counterpart to the robust-arm split, where a five-point class or two distinct
radii really can provide independent completion rows.

Consequently the complete-radius theorem is a valid downstream closure rule,
but it is not by itself the singleton occurrence producer.

## Theorem-bank audit

Before formalizing the extraction, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpora were also searched for singleton minimal-deletion
cores, complete critical shells, same-cap outside pairs, and mutual
selected-row triangles. The relevant reusable consumer is the production
ordered-cap theorem above. The banked U5 singleton-tail contradictions need
their own dangerous-triple and multirow metric packets and do not consume the
present singleton source surface.

No banked theorem produces the same-cap repeated actual row from this packet.

## Regression boundary

The existing protected-singleton exact regression still passes. It realizes
the protected strict-interior singleton shell, the exact unique-four
first-apex data, and no alternative M44 packet, but deliberately fails
carrier-wide K4. Thus it confirms that the local singleton packet alone does
not force the missing row occurrence.

The existing total-critical-system regression also remains the correct
adversarial boundary: total criticality plus a protected singleton can coexist
with a strict-MEC-interior fresh center. It is an exact-five rather than
exact-four model and also lacks carrier-wide K4, so it does not refute a
future proof using the full `R` and `Q` source data.

These are exact Euclidean regression models for stated subsurfaces, not P97
counterexamples.

## Validation

The focused scratch check completed with `-DwarningAsError=true` and printed
only:

```text
propext, Classical.choice, Quot.sound
```

for:

```lean
nonempty_singletonCoreOutsidePairIngress
SingletonCoreOutsidePairIngress.selectedRow_support_eq_shell
false_of_hasSameCapActualRowRepeat
```

The file contains no `sorry`, `admit`, custom `axiom`, `unsafe`, or
`native_decide`.

The protected-singleton checkpoint replay passed:

```text
PASS: protected singleton strict-interior regression matches checkpoint.json
```

The total-critical-system checkpoint replay also passed:

```text
PASS: total-CSS strict-interior independence matches checkpoint.json
```

Replay commands:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with sympy python \
  scratch/atail-force/unique4-mec-interior-eliminator/\
verify_protected_singleton_interior.py --check

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with sympy python \
  scratch/atail-force/unique4-mec-interior-eliminator/\
verify_total_css_interior_independence.py --check
```

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the full singleton outside-pair ingress, its
  complete-radius support lock, and the immediate same-cap repeat terminal.
- **PROVEN:** the old first-apex-class requirement on the extracted pair was
  stronger than necessary for the available ordered-cap consumer.
- **CONJECTURED / OPEN:** production of
  `HasSameCapActualRowRepeat P` from the full exact-four source data, or a
  complete alternative-M44 packet.
- **NOT CLAIMED:** `False` from the singleton output alone, closure of an
  on-spine `sorry`, or closure of the original unique-four arm.
