# P97 first-fiber compatibility island

Historical diagnostic archive, extracted from base HEAD
`beb71db498ad47cca5c343a76a359423ff47f9e2` on 2026-08-30.

The three fragments preserve an 11-declaration first-fiber compatibility
island: adapters around `false_of_twoCapSources_firstFiberDescentResidual`
and its former one-/two-source fiber callers.  The island is not part of the
current production proof route and is therefore kept for source audit and
manual replay rather than as a live import.

These files are intentionally outside `lean/`.  They are not production
imports, are not Lake targets, and are not proof-promotion or theorem-bank
authority.  No Lake build is implied by their presence.  A future replay must
copy or extract a fragment into an explicit diagnostic source location,
restore any surrounding declarations it needs, and adapt imports or names if
the live source has changed; then validate it with the chosen diagnostic Lake
target.  The archive itself is not expected to compile standalone.

Owned source spans at the extraction base:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:819-882`
  (`false_of_twoCapSources_firstFiberDescentResidual`,
  `false_of_twoCapSources_freshOutsideFirstBlockerFiber`, and
  `false_of_twoCapSources_freshOutsideSecondBlockerFiber`).
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean:2044-2186`
  (`false_of_twoCapSources_oneSidedDeletionSurvival_frame`,
  `false_of_twoCapSources_oneSidedDeletionSurvival`, and
  `false_of_twoCapSources_firstFiber`).
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceAlignedLowHits.lean:94-247`
  (`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`,
  `false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius`,
  `false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii`,
  `false_of_capSource_freshOutsideFirstBlockerFiber`, and
  `false_of_capSource_freshOutsideSecondBlockerFiber`).

The live files retain their imports and surrounding declarations.  The
copied prologues below preserve the original copyright, namespaces, section
variables, and include/omit context needed to identify the declarations.
