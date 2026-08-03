# V21 FreshThird residual probe

Date: 2026-08-02

## Scope

This is a bounded external-Z3 probe, not a Lean proof. It reuses the
authenticated v8 exact-`n=15`, `(6,6,6)` relaxation and adds explicit selectors
for two fresh source labels and an unordered pair of fresh `Q` labels. The
three modes target the remaining normalized residual arms:

* `equal-center`: selected source rows have exact support `{s1,s2,q1,q2}` and
  selected source blockers are equal;
* `same-blocker`: a selected source row is identified with the selected `Q`
  row and its blocker;
* `omission`: one selected `Q` point is omitted from a selected source row.

The probe has no finite-coverage claim and no Lean theorem or kernel ingress.

## Runs

All runs used schema 21, seed 97, a 60,000 ms solver timeout, and the same
v8 base script (`e0c98be80b2729cf50ee1d9da6c081fc4db2095e66abfb3c85abfbf5799b7162`).

| mode | artifact | status | reason | constraints | elapsed |
| --- | --- | --- | --- | ---: | ---: |
| equal-center | `artifacts-v21-probe/20260802T170824.948230Z/result.json` | `unknown` | `canceled` | 20,620 | 63.53 s |
| same-blocker | `artifacts-v21-probe/20260802T171006.898507Z/result.json` | `unknown` | `canceled` | 20,605 | 63.55 s |
| omission | `artifacts-v21-probe/20260802T171114.555974Z/result.json` | `unknown` | `canceled` | 20,577 | 63.27 s |

`canceled` is the timeout result from the wrapper. None of these runs is an
`unsat` result, so they produce no Boolean cut, core, or generalized family.

## Consequence for the live sorry

V21 supplies no source-clean producer for
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`, and it does
not establish any of its three residual arms. The existing Lean bridges remain
unchanged: distinct-center two-hit is closed, while equal-center common
endpoint omission and the same-blocker/common-omission branches still have no
contradiction consumer. The target therefore remains an open, on-spine Lean
obligation.

Trust classification: **external solver probe / UNKNOWN**, not theorem-level
closure. The next useful step is a global theorem-bank audit of these exact
selectors (recorded separately), followed by either a source-clean incidence
producer or a materially smaller incremental cube if the bank is empty.
