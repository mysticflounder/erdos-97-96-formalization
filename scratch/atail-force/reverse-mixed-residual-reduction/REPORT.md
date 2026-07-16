# Reverse-mixed residual reduction report

Date: 2026-07-14

## Scope

This lane attacks the three choice-free apex-shell shapes left by
`mixed-parent-producer/MixedParentProducer.lean`:

1. the apex critical shell omits both continuation centers `x,y`;
2. it hits only `y`, with blocker center aligned to `x` or `u`;
3. it hits only `x`, with blocker center aligned to `y` or `v`.

It does not edit the production tree, `SurplusM44`, the unique-row producer,
or shared closure documentation.

## Theorem-bank preflight

The mandated registries were searched before deriving the reduction:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md`;
- `certificates/erdos97_legacy_general_n_mining.md`;
- `certificates/erdos_general_theorem_p97_mining.md`.

Focused `nthdegree docs search --lean` queries covered reverse-mixed apex
shells, selected-four-class/source incidence, aligned support, and prescribed
deletion criticality.  The closest reusable results were the critical-shell
existence theorems, `selectedFourClass_support_eq_shell`,
`selectedFourClass_support_eq_criticalShell_of_source_mem`, and the existing
cross-deletion equivalences.  No indexed theorem eliminates any of the three
residual shapes.

## Kernel-checked result

`ReverseMixedResidualReduction.lean` proves the following exact sharpening.

### Both omitted

`BothOmittedRobustApexShellPacket` records that the chosen apex shell:

- omits both `x` and `y`;
- survives deletion of `x`, deletion of `y`, and successive deletion of
  `x` then `y`;
- is still the exact selected class after both deletions; and
- supplies the unique positive radius carrying four points after both
  deletions.

The uniqueness proof genuinely uses apex-deletion criticality.  Any other
four-point radius after deleting `x,y` would either contain the apex and hence
equal the critical-shell radius, or avoid the apex and survive its additional
deletion, contradicting the recorded blocker fact.

### One hit, aligned

`AlignedKnownRowResidual` identifies each aligned critical shell with an
already-existing row, not merely with a row having the same radius:

- center `x`: shell support equals `P.rowX.support`;
- center `u`: shell support equals `Ku.support`;
- center `y`: shell support equals `P.rowY.support`;
- center `v`: shell support equals `Kv.support`.

The equality follows from exact critical-shell support, equal center, and the
fact that both rows contain the deleted common apex.

### Choice and full-parent ordering

`nonempty_reverseMixedApexShellReduction` chooses the certified shell only
after `x,y,u,v` are known.  `exists_installed_reverseMixedApexShellReduction`
then installs it with `CriticalShellSystem.overrideAt`, producing a favorable
retained system whose apex-selected support is definitionally the chosen
shell.  Nothing is required of an arbitrary preselected apex row.

`fullParent_installed_reverseMixedApexShellReduction` ties the local surplus
packet to the actual circumscribed-MEC/cap-triple leaf and consumes the
no-`IsM44` hypothesis through `exists_secondLargeCap_of_noM44`.  Its exact
output is:

- a genuine second cap of cardinality at least five; and
- the late-installed five-way residual reduction above.

At present those two outputs are parallel facts.  The theorem bank contains
no result coupling the second large cap to one of these exact critical rows.

## Epistemic status

The three shapes are **reduced, not eliminated**.

- The four aligned arms are precise prescribed-deletion-criticality inputs
  for the existing `h4`/`h5` edge; they are not local contradictions.
- The both-omitted arm is the robust double-deletion continuation packet that
  the robust-arm coupling must consume.
- No-`IsM44` alone currently contributes the second-large-cap witness, not a
  support-localization theorem for the chosen critical shell.

Consequently the next theorem should couple global cap/MEC order to these
five exact packets.  Further mining of the old local reverse-mixed incidence
object cannot distinguish the four aligned cases: the pinned exact
`Q(sqrt(3))` regression realizes all four in its stated partial abstraction.

## Aligned-edge polarity audit

`ReverseMixedAlignedOmissionAudit.lean` checks that the h4/h5 wording above
must be read only as an interface match, not as a newly produced metric edge.
For the row-X, Ku, row-Y, and Kv alignments, respectively, the corresponding
radius equality already follows from the two named members of that existing
row.  The proof uses neither the certified critical shell nor its deletion
failure.  Wiring the generic prescribed-deletion radius adapter would
therefore double-count an equality already present in the reverse-mixed
packet.

The smallest genuine terminal is instead `ApexCriticalOmissionPacket`: a
second selected row at the aligned center whose support omits the common apex.
`false_of_apexCriticalShell_and_omission` closes immediately because that row
would survive deletion of the certified critical source.  Production of this
alternate row, or an equivalent second-radius/role-map fact, is open.  The
same omission polarity applies to the both-omitted shell; its robust double-
deletion data concern deletion of `x,y`, not deletion of the apex.

## Validation

Focused Lean check from `lean/`:

```text
LEAN_PATH=/tmp/p97-mixed-parent-coupling:/tmp/p97-joint-transition-oleans \
  lake env lean \
  -R ../scratch/atail-force/reverse-mixed-residual-reduction \
  -M 16384 \
  -o /tmp/p97-mixed-parent-coupling/ReverseMixedResidualReduction.olean \
  ../scratch/atail-force/reverse-mixed-residual-reduction/ReverseMixedResidualReduction.lean
```

Result: success.  All printed theorem dependencies are exactly
`[propext, Classical.choice, Quot.sound]`.

The same axiom audit succeeds for
`ReverseMixedAlignedOmissionAudit.lean`.

Pinned exact regression:

```text
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/mixed-parent-coupling/verify_cap_quotient_regression.py
```

Result: success for all four aligned blocker cases.  Its documented scope is
only exact `Q(sqrt(3))` geometry plus a finite incidence/cap-side shadow; it is
not a full `CounterexampleData`, MEC, global-K4, or total-CSS model.
