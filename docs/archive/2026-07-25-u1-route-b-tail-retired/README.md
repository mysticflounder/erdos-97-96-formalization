# Retired U1 Route-B tail implementation

Archived: 2026-07-25.

The production file formerly contained two multi-thousand-line commented
implementations around the live
`u1_largeCap_routeB_tail_liveData_false` replacement.

- `helper-relabel-tree.lean.txt` preserves the unique helper/relabel payload
  formerly at `U1LargeCapRouteBTail.lean:3418-8055`.
  SHA-256:
  `0a2ea7587aeff7156f31bc6fb60a25414cd01f4e6b2c6dfecd401e7974f7bd2e`.
- `compat-wrappers.lean.txt` preserves the two final commented compatibility
  wrappers removed with the retired tree.
  SHA-256:
  `a414d2ae3d7280b7cf3f0cbc5c20f67ee9443ab551bcc9556ef24f35f6b6be34`.
- The former dispatcher payload is already preserved byte-for-byte in
  `scratch/p1b-fidelity-audit/candidate.lean:7801-9194`; both copies had
  SHA-256
  `6ca2cd304fccae8646a8ac4eb9546921bc504e942f9a6cfed844a95c4e1805d8`
  before the production comment was removed.
- `scratch/p1b-fidelity-audit/AUDIT.md` records the associated fidelity audit.

These are historical sources, not compiled production modules and not current
proof obligations. The live routing replacement calls
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`; that route
still depends on the two explicit frontier theorem holes and was not proved by
retiring these comments.
