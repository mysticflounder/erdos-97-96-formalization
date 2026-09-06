# Exact13 weighted provider bank bridge audit

Lane: `exact13-weighted-provider-bank-bridge-20260906`

Owner: `luna-swarm-gap-weaver`

Authorization: coordinator #16507; claim #16509. Source scope is one new standalone
Lean module, this audit, and the exact checkpoint. No aggregate is owned here.

Reuse preflight: read-only design audit #16498 searched the indexed project corpus
at `0ea1d2300`, inspected the provider checker, and found the generic positive-bank
boundary but no weighted-provider center congruence or coverage API. The immediate
consumer is the existing source-backed positional cancellation theorem. The first
missing glue is checker center congruence; actual checked bank data and exhaustive
source coverage remain separate, unfilled obligations.

The source uses Input.toExclusive, center congruence, Entry/Covers/BankCovers, and
conditional consumers only. No concrete bank, unconditional contradiction, or
certificate coverage is claimed. The focused build and six public trust probes passed.

## Implemented API

`Input.toExclusive` copies the source fields into the occurrence input without
reconstructing coarse/source-role witnesses or changing the source data.
`checkProviderStepChain_congr_centerOf`, `checkProviderPath_congr_centerOf`, and
`check_congr_centerOf` prove that equality of provider centers preserves the
corresponding Boolean checker. Chain induction keeps the exact listed row choices
fixed; no equality of full support functions is needed.

`Entry` contains centers, explicit positional choices, weighted cancellation data,
and a successful check using an empty support function. This pattern is for
checking only: no geometric realization or positive incidence is asserted for it.
`Entry.Covers` separately requires center equality and source-entitled candidates
whose positional choice list equals the entry list. `BankCovers` quantifies over
every source input and requires a covering entry in the finite list.

`false_of_entry` transports the successful check to the actual positional pattern
and uses `false_of_checked_positional_candidates` with the explicit candidate
predicate proofs. `false_of_bank` specializes the explicit exhaustive coverage
premise. There is no declaration constructing a concrete bank or proving its
coverage. Empty supports in the check pattern never supply source positivity.

## Math-skeptic audit

**Verdict**: CERTIFIED for the six statements below under their explicit premises.

**Claims audited**: 6; each PROVEN — Lean-formalized, with the listed transitive
axiom set verified by the focused check.

| Declaration | Checked claim | Axioms |
| --- | --- | --- |
| `toExclusive` | The projection preserves the actual source fields. | `propext, Classical.choice, Quot.sound` |
| `checkProviderStepChain_congr_centerOf` | Fixed choices and equal centers preserve the chain check. | `propext, Quot.sound` |
| `checkProviderPath_congr_centerOf` | The preceding congruence preserves path checking. | `propext, Quot.sound` |
| `check_congr_centerOf` | Fixed choices and equal centers preserve weighted cancellation checking. | `propext, Classical.choice, Quot.sound` |
| `false_of_entry` | A checked entry plus actual endpoint coverage yields a contradiction. | `propext, Classical.choice, Quot.sound` |
| `false_of_bank` | A finite bank plus exhaustive source coverage yields a contradiction. | `propext, Classical.choice, Quot.sound` |

No claim identifies endpoint positivity with center congruence. The explicit
candidate-predicate premises in Covers are essential. No `sorryAx`, custom axiom,
or `Lean.ofReduceBool` appears in any probe; the source scan found no `sorry`,
`admit`, declared axiom, or `native_decide`.

## Focused validation

Both exact13 dependency sources were compiled from current bytes with
`lake env lean -M 16384 -o <overlay module path> <source path>`, separately:
`CardGeThirteenExact13SourceOrderBridge` and
`CardGeThirteenExact13ExclusiveApex18`. Both returned `LEAN-EXIT=0`.
The existing build tree lacked SourceOrderBridge.olean, and the ExclusiveApex18
artifact predated its constructor, so simply checking against that tree would not
have tested the intended imports.

The validation overlay was `run-0001/artifacts/lean/`. It held those fresh artifacts
and recursively links missing files/directories to the existing
`lean/.lake/build/lib/lean/` package tree, preserving freshly compiled artifacts.
This is needed because Lean resolves the package from one artifact root; an
incomplete package overlay does not fall back for missing sibling modules.
The overlay and its links are runtime artifacts, not retained source or bank data.

The new module was then compiled with the overlay prepended to the `LEAN_PATH`
supplied by `lake env`:

```text
lake env bash -c 'LEAN_PATH="<absolute registered overlay>:$LEAN_PATH" lean -M 16384 -o <overlay module path> Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13WeightedProviderBankBridge.lean'
```

Final result: `LEAN-EXIT=0`, six public axiom probes, no warnings/errors.
No full repository build or aggregate ingress validation is claimed.
The module remains standalone because no aggregate path belongs to this lane.

Validation HEAD: `60e9d5127d0e05c67c84c11b6966d8651806dd6d`.

Source SHA-256: `cd213fa15551c1fe1c334be32d4050371334c9dbbd363431b8e72c20d6d9c878`.

Final log SHA-256: `b5d0925afcc25659dc1f7cecb4aefc66ef2d915e8249363ec175d2a176852e5f`.

## Retained scope

The checkpoint preserves lane base
`0ea1d2300c95c62d6e8db45410f82d36fe33cb1b`. Exact owned paths are the new source,
this audit, and the checkpoint; the registered run manifest is the only durable
runtime receipt. Source digests authenticate all three checked Lean files. Logs,
compiled artifacts, and existing-artifact links remain below the registered run.

The initial index contained foreign staged paths. They were left untouched and
cleared before this lane reached staging. No foreign source/history edit or
aggregate import is part of this implementation.

## Runtime hygiene repair

The successful build overlay contained symbolic links, which the hygiene checker
forbids inside a generated root. A fresh tracked-reference scan found no source
consumer of the exact overlay path, and a process scan found no active Lean writer
using it. The overlay was moved intact, without deletion, to
`scratch/quarantine/exact13-weighted-provider-bank-bridge-20260906/run-0001-lean-overlay`.
Its 4,657 original links and three freshly compiled artifacts remain preserved.
Regular copies of the three compiled artifacts were retained under
`run-0001/artifacts/compiled/`. The registered generated root now contains no
symbolic links; the source and its successful validation result are unchanged.
The runtime quarantine receipt records the scan, move, and complete link map.

Quarantine receipt SHA-256: `112b3c2f5fbd347887f057d168ab27e931aad0a9074d96aa3edb654a0e75d111`.
