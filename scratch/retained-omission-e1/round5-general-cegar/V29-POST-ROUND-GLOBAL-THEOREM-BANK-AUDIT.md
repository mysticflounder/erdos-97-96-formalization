# Post-v29 global theorem-bank audit: `false_of_retainedOmission_triApexAllLarge_core`

Date: 2026-08-02
Scope: read-only theorem-bank and indexed-Lean search after v29; no Lean edits,
wrappers, builds, or solver reruns.

## Round status

The v29 artifact is
`artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json`.
The checked summary is:

```json
{"case_count":67,"complete":false,"child_contract_valid":true,
 "counts":{"unknown":67},"elapsed_seconds":982.8299145838246}
```

Thus v29 supplies no UNSAT cut or certificate for this residual; all 67 child
cases remain `UNKNOWN`.  `child_contract_valid=true` is a contract check, not
closure evidence.

## Mandatory theorem-bank registries

The required registry census was run with:

```bash
for f in certificates/p97_rvol_general_n_mining.json \
         certificates/erdos97_legacy_general_n_mining.json \
         certificates/erdos_general_theorem_p97_mining.json; do
  n=$(jq '[.. | objects |
    select((tostring|test("retainedOmission|triApexAllLarge|cross.?cap|K8";"i")))]
    | length' "$f")
  echo "$f $n"
done
```

Output:

```text
certificates/p97_rvol_general_n_mining.json 0
certificates/erdos97_legacy_general_n_mining.json 0
certificates/erdos_general_theorem_p97_mining.json 0
```

No declaration, source path, or import-reachability record in the three
mandatory banks matches the retained-omission/tri-apex/K8 cross-cap query.

## Indexed Lean search

Exact target search:

```text
nthdegree docs search --lean --agentic
  "false_of_retainedOmission_triApexAllLarge_core K8 cross-cap incidence retained omission tri-apex"
```

Result: “No exact matching chunk was found in the merged Lean corpus for
`false_of_retainedOmission_triApexAllLarge_core` (cross-cap retention omission
tri-apex). The query set surfaced related retained/tri-apex lemmas (including
other `false_of_*` low-hit contradiction branches), but not this exact theorem
name or statement.”

A second focused search did find the existing one-hit bank:

```text
nthdegree docs search --lean --agentic
  "criticalShell_inter_otherRichCapSlice_card_le_one K8 cross-cap incidence retained omission"
```

It returned handles `0V87EW` and `GEBP6W`, corresponding respectively to
`criticalShell_inter_otherRichCapSlice_card_le_one` and
`exists_criticalShell_center_with_otherRichCapSlice_card_le_one`.

## Source scan and candidate bridge

`rg` places the live target only at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7233-7244`; its body is
`by sorry`.  The public wrapper at lines 7247-7262 constructs
`RetainedOmissionAllLargeNormalForm` and calls this core, so it is not an
independent consumer.

The closest source-clean theorem-bank facts are:

* `criticalShell_inter_otherRichCapSlice_card_le_one`
  (`FrontierLiveClosure.lean:6688-6705`): after a shell blocker is known to lie
  in cap `i`, and `i ≠ j` with apex `j` rich, every *fixed radius* selected-class
  slice in cap `j` has intersection cardinality at most one.
* `exists_criticalShell_center_with_otherRichCapSlice_card_le_one`
  (`FrontierLiveClosure.lean:7210-7227`): the tri-apex context supplies a cap
  localization and the preceding per-radius bound for every other rich cap.
* `false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`
  (`FrontierLiveClosure.lean:6665-6683`) is the contradiction producer, but it
  requires an explicit `2 ≤ card (...)` in one same-radius slice of a distinct
  cap.  No such hypothesis is present in the normalized Q input.
* `commonPhysicalPair_center_mem_capInteriorByIndex`
  (`ATail/TwoCenterCapLocalization.lean:121-155`) requires two distinct
  cap-interior points with equal distances from both the carrier center and
  the indexed apex.  No Q-to-this-packet adapter was found.

`RetainedOmissionAllLargeNormalForm` (`FrontierLiveClosure.lean:6813-6859`)
contains paired-common-deletion and reverse-hit/fresh-common-deletion arms.
Its fresh/reverse packets do not, by themselves, expose two points in a
single selected-class radius slice of a *different* cap.  The missing bridge
is therefore an auditable K8 cross-cap incidence extraction (or another direct
metric contradiction) from Q to one of the source-clean consumers above.

## Verdict

**NO-GO for promotion.**  The required theorem-bank registries and indexed
Lean corpus contain no source-faithful consumer or bridge for
`false_of_retainedOmission_triApexAllLarge_core`.  Existing one-hit and
two-hit lemmas are useful producers but do not close the normalized residual.
The 67 v29 `UNKNOWN` outcomes cannot be promoted to a theorem or wrapper.

No plan file was changed: this audit records the frontier without modifying the
frozen proof plan or introducing production obligations.
