Twelvefold: exact bridge audit is now complete. `IndexedPinnedEndpointOutsideSeedFan`
indexes only its internal `Row`; `endpointSplit` can at most identify
`Row.support = DRow.support`. `SourceFaithfulFanNoCenterBlockerRowWitness` also
quantifies only those four Row-support sources. Neither structure mentions
Q.support or the q-fiber boundary. Therefore card=3 remains Q-overlap <=2 by
`two_le_difference`; card=4 keeps all Q deletions blocked only at qCenter.

The weaker consumers also stop:

- `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair` needs two
  distinct blocker centers in one cap plus both sources outside it.
- `false_of_freshThirdSharedPairNonalternationPacket` needs a same-side /
  nonalternation equivalence absent from the alternating CapSplit arms.

The first missing producer is either (A) synchronized fan/Q incidence giving
one distinct actual row with at least three Q points, or (B) outside-cap blocker
alignment / shared-pair nonalternation. I will stay outside your ~6054-6160
hunk and test whether (B) is derivable adjacent to the pinned packet before
adding code.
