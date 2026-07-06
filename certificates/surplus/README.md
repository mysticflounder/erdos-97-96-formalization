<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus COMP-G Bank

This directory stores the local 135-row pinned surplus COMP-G pattern bank.

The JSON file has schema `pinned_surplus_comp_g_bank.v2`.  It records the
joined incidence rows from the rvol pinned surplus shadow together with the
COMP-G verdict metadata and a canonical proof-facing shadow signature:

```text
135 rows = 41 s1 + 71 s2 + 23 s3
K_v = {Pu, Pw, u, s*} in every row
2 base C-empty rows
133 no-valid-real rows after forced-pair/Rabinowitsch follow-up
135 unique ten-class bitset shadows over label order
  u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2
```

Regenerate the bank from the sibling `../p97-rvol` checkout:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --emit-bank certificates/surplus/pinned_surplus_comp_g_bank.json
```

Emit the Lean incidence-shadow module:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --emit-lean-shadow lean/Erdos9796Proof/P97/SurplusCOMPGBank.lean
```

Check the committed bank against the current rvol source artifacts:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --check-bank certificates/surplus/pinned_surplus_comp_g_bank.json
```

This is a pattern/verdict bank, not yet a Lean-checkable algebraic certificate
set.  `Erdos9796Proof.P97.SurplusCOMPGBank` checks the finite incidence bank in
Lean with `native_decide`, exposes
`SurplusCOMPGBank.shadowInBank : Shadow -> Bool`, and also checks the pinned
fragment enumeration via `isValidPinnedFragment`,
`validFragmentShadowKeys`, and
`shadowInBank_of_fragmentShadowInEnumeration`.

The generated Lean module also contains a finite-search certificate bridge.
The Python generator computes the DFS census from the normalized candidate-mask,
separation, and no-three rules, verifies before emission that this computed
census is the same 135 tagged rows as the bank, then emits
`rawFragmentSearchEntries`.  Lean checks the emitted search certificate with
`candidate_masks_match_filter`, `raw_fragment_search_entries_length`,
`raw_fragment_search_entries_all_valid`,
`raw_fragment_search_shadow_keys_unique`,
`fragment_search_entries_eq_validFragmentEntries`, and exposes
`shadowInBank_of_fragmentShadowAcceptedBySearch`.

The proof-facing bridge is wired through
`Problem97.pinnedSurplusCOMPGBankBridge`, which is consumed by the current
P97/P96 spine residual
`Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`.  Its current
axiom closure is the `native_decide` closure: `propext`, `Lean.ofReduceBool`,
and `Lean.trustCompiler`.  The generated module and emitter have no `unsafe`,
`extern`, or `implemented_by` declarations, but `Lean.trustCompiler` remains a
blueprint-reported trust surface unless the incidence certificate is later
reworked into a pure-kernel/sharded proof.

It does not yet prove that a formal geometric residual matches one of the rows.
The remaining proof work is the faithfulness bridge from the formal local
residual to a `Shadow` satisfying `fragmentShadowAcceptedBySearch = true`,
followed by either Lean-checkable COMP-G certificates or an explicitly accepted
external-certificate boundary.
