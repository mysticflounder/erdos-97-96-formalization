# Exact-13 nonzero-form cone audit (2026-09-05)

## Scope

This lane reruns the normalized positive-cone query on the next replayed
cell-0 model while excluding all zero projected strict forms.  The exclusion
prevents the cone solver from selecting the ordinary one-form conflict already
reported by the Boolean learner.  The result remains scoped to one decoded
model and does not establish source coverage or a Lean terminal.

The producer also fails closed when a rational denominator exceeds 256 bits or
when primitive natural weights sum above 100,000.  Eight focused tests and
Ruff passed.

## Authenticated run

- Lane base: `1bab3913b63c1852fe5c24ac77a2a7b00d2cca6b`
- Run manifest self-hash:
  `548321007bb333eb6c5c182962ef880772e297ca0e2ed15d6be08678cc9808cc`
- Run manifest file SHA-256:
  `4ff68f51ac2998d0c68cc18165169d3216f8edbab9e04111722ff550c4b222ab`
- Source Boolean event SHA-256:
  `c04594d844603f9a7935c9f6b4f337f01bd3655f3be853b0f15ae24b0cc1c5fd`
- Journal SHA-256:
  `235a147a75a5ad53494ae709b5e8beb861eefa9973a934568b25df87cb51fa39`
- Event self-hash:
  `b3811b94f54fd5bb325c84b2160e2bb8ec7b1f4d1fd1357c704384fcacf0e38c`
- Event file SHA-256:
  `a3618757e6a8c812201b6ad18e500c9c6d8dc15cf2294a9137865df2fb5f12df`

The decoded model has 1,127 projected form representatives, exactly one of
which is zero and was removed.  PIQD's 2,290-command Z3 query returned a
replayed SAT rational cone model.  Exact scaling produced two unit weights:

- form `[12,1,3,6,0]`;
- form `[8,12,3,0,1]`.

The four weighted edge occurrences pair through three provider rows and yield
the six-atom clause

`m_G3_6`, `m_G3_8`, `m_L_12`, `m_L_8`, `m_T_12`, `m_T_6`.

## Consequence

Removing zero projected forms successfully exposes a nontrivial cone
dependence, but this first witness is an equal-weight two-form cancellation.
It is source-sound and compact enough for the existing provider checker, yet
it does not demonstrate additional strength beyond the two-form learner.

The next diagnostic should require at least four positive weights.  That asks
PIQD for a valid higher-support dependence directly and tests whether the
current model admits a compact weighted clause outside the exhaustively
enumerated one-, two-, and equal-weight-three-form families.
