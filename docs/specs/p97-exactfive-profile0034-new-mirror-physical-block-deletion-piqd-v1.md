# P97 exact-five profile 0034 NEW-mirror physical block deletion

This lane probes the authenticated NEW-mirror source queries using PIQD and
Z3.  It submits full formulas first, then removes complete physical blocks:
the thirteen supporting-edge blocks (eleven assertions each), eleven named
source-row equalities, `radius-branch`, and `source-strict`.  The authenticated
source order is `U,p,a,s,d,c2,q,O,y,x,v,t,u`; the parent journal hashes are
`db29694cf075b978bb586fde6b5490fa0aa3cf318635cef59cddbf4c18c3862a` (lt) and
`9a5c4cfd3154224d46f3cb81df6c5e4a13f0ecc8783e9bfaadcdeb9040402cbf` (gt).

Deletion is unguarded and physical: no Boolean assumptions are introduced.
Only custody-valid raw UNSAT accepts a deletion; SAT, unresolved SAT, UNKNOWN,
transport loss, malformed artifacts, and errors retain the block.  SAT model
controls are replayed over exact rational coordinates.  Claims remain false;
UNSAT is discovery-only and does not establish a theorem or promotion.

The producer creates immutable checkpoint-bound manifests, launch and terminal
records, per-query PIQD custody artifacts, round journals, and a strict offline
verification path.  The default worker bound is 20 and each branch has a
bounded query cap of 128.  This specification and the producer are not a
solver launch authorization.
