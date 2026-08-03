# Round 12 global theorem-bank audit

## Status: NOT FOUND (source-only)

Target audited: `Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7153`.

I ran exactly one global indexed query:

```text
nthdegree docs search --lean --agentic 'positive cross-cap rich two-hit full-shell incidence from retained common-deletion tri-apex all-large caps'
```

It found no theorem that derives a positive cross-cap rich two-hit or full-shell
incidence from the retained-common-deletion input and tri-apex all-large data.
The mandatory P97 bank registries were also checked: the general-n mining
report, the RVOL concise/JSON census, and the two legacy/general-theorem
concise/JSON censuses.  None supplies that producer shape.

No Lean, Lake, solver, certificate replay, or kernel gate was run.  Thus this
is a source-level non-discovery report, not a claim of checked closure.

## Exact near candidates

| Candidate | Source / import | Why it is not the required producer |
| --- | --- | --- |
| `exists_three_hit_of_two_collisionRows_capCross_normalForm` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:14268`; current module `Erdos9796Proof.P97.ATail.FrontierLiveClosure` | Produces a three-hit rich slice only after two distinct-radius `RetainedInteriorBlockerCollision` packets and further cross-omission data.  It does not consume `RetainedOmissionAllLargeNormalForm` and does not yield a common shell with rich double hits at two cap indices. |
| `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:15214`; current module | Its proof calls `false_of_frontierAllLargeCapsTriApex_all_low_hits` (`:15175`), whose retained branch calls `false_of_retainedInteriorDirectedOmission_and_all_low_hits` (`:7181-7183`), which calls the audited core.  Reusing it here is circular. |
| `Problem97.U1Depth5.CriticalRowPacket.full_shell_exact` | `lean/RVOL/P97/U1Depth5Prefix.lean:525`; import `RVOL.P97.U1Depth5Prefix` | Source-proved bank theorem, but it only identifies four selected row points after an already-given shell-radius equality.  It neither creates a cross-cap hit nor establishes full-shell membership from the E1 inputs. |
| cross-cap edge / cap-witness separation | `lean/Erdos9796Proof/P97/Dumitrescu/L7.lean:203`; import `Erdos9796Proof.P97.Dumitrescu.L7` | A negative compatibility fact: cross-cap edges are not cap-witness pairs.  It cannot provide the requested positive incidence. |

## Consequence

There is no reusable, importable positive-incidence producer for the E1 core.
The local finite equality shadow in
`scratch/triapex-incidence-obstruction/retained-core-producer-audit.md` also
realizes the paired common deletion while avoiding double hits at two cap
indices; therefore a pure selected-class/cardinality/deletion-survival bridge
cannot establish the missing incidence.  The next direct target must add a
genuine geometric bridge (for example convex/MEC order, EDM/power, or a
Ptolemy/Kalmanson constraint), rather than another incidence-bank wrapper.
