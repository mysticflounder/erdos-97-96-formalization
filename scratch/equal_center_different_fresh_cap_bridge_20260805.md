# Equal-center / canonical-source / different-fresh-cap bridge audit (2026-08-05)

## Proven source ingress

The live file already has the source-clean producer chain:

* `false_or_freshCap_ne_opp_of_commonRadius_distinctCaps` (`FrontierLiveClosure.lean:11700`) consumes the common-radius packet, equal source-center hypothesis, source/fresh cap memberships, distinct caps, and the exact two-row overlap.  It proves either `False`, or
  `sourceCap = S.oppIndex1`, `freshCap ≠ S.oppIndex1`, and
  `Q.source₁`, `Q.source₂ ∉ S.capByIndex S.oppIndex1`.
* `freshThird_commonRadius_distinctCaps_dual_packet` (`:11831`) transports that split through the equal source-center row and identifies both source cap indices and both fresh cap indices across rows.
* `freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` (`:11957`) packages the surviving arm as a boundary-indexed shared-pair alternation.
* `freshThird_canonicalDifferentCap_boundary` (`:12090`) adds the zero-cut cap-block order (`DirectBoundaryBlocks ∨ MirrorBoundaryBlocks`).

The only geometric facts used to force the packet are `equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair` (canonical cap/source row intersection) and `capInteriorByIndex_ne_of_mem_of_mem_ne` (equal centers imply equal cap index).  No existing field forces a third shell equality or a reciprocal incidence between the canonical source row and the noncanonical fresh-cap row.

## Exact missing ingress

The packet carries only:

* source center in `capInteriorByIndex S.oppIndex1`;
* fresh center in `capInteriorByIndex freshCap`, `freshCap ≠ S.oppIndex1`;
* both shared endpoints outside `capByIndex S.oppIndex1`;
* equal-radius memberships of those endpoints in both selected rows, exposed as the shared-pair `SurplusCOMPGBank.btw` equivalence.

The cap-block lemmas locate strict interiors, but do not locate either shared endpoint in the fresh cap or in a specific interval.  Thus they cannot produce the four strict boundary inequalities needed by `false_of_two_selected_rows_shared_late_pair`, nor can they identify a third point in the source row.  A shell-equality route would additionally need an explicit third point `R` with two support memberships and a center-equality/radius equality; none is present in the packet.

## Minimal next theorem contract

The first honest consumer should therefore ask for the missing order/incidence explicitly, e.g.

```lean
theorem false_of_canonicalDifferentCap_orderedSharedPair
    (B : BoundaryIndexing D.A)
    (iSource iFresh i₁ i₂ : Fin B.n)
    (horder : iSource < iFresh ∧ iFresh < i₁ ∧ i₁ < i₂)
    (hsourceRow : SelectedFourClass D.A (B.boundary iSource))
    (hfreshRow  : SelectedFourClass D.A (B.boundary iFresh))
    (h₁source : B.boundary i₁ ∈ hsourceRow.support)
    (h₂source : B.boundary i₂ ∈ hsourceRow.support)
    (h₁fresh  : B.boundary i₁ ∈ hfreshRow.support)
    (h₂fresh  : B.boundary i₂ ∈ hfreshRow.support) : False
```

The proof is a direct application of `dist_add_dist_lt_diagonal_sum_of_ccw` (or, once the boundary cardinality is identified, `false_of_two_selected_rows_shared_late_pair`), followed by the two support-radius equalities and `linarith`.  Producing `horder` from `freshThird_canonicalDifferentCap_boundary` is the unresolved mathematical bridge; adding a helper that claims it from the current packet alone would be unsound.
