# Strict-Kalmanson n=11 augmented-bank custody and motif-orbit audit

**Local date:** 2026-09-03

**Scope:** the announced 375,144-clause n=11 bank and its six-role planar motif layer

**Result:** motif layer reconstructed; full bank and UNSAT claim remain unauthenticated

## Outcome

Conversation message `#10544` announced a 375,144-clause bank with SHA-256

```text
59f743e7b9230bb30d39fd1ef33108ce3a40bc3a989d0a53b9a9703e19a7761f
```

and an exact `EXACT_MASTER_UNSAT` result for the last n=11 row-0 cell. The
message carried no attachment. A read-only recovery search found no copy of
the bank, its 42,504-clause base, its CNF, a producer manifest, replay output,
or a proof receipt in the repository, git objects, local project scratch, or
Downloads. A direct custody request and a Pro consult produced no artifact by
the end of this audit.

The full-bank digest, search counts, 109/110-cell premise, and UNSAT verdict
therefore remain **announcement-only**. They must not be cited as an exact
computational closure.

One large subclaim is now independently reproducible. The six-role
equilateral-chain motif has exactly 332,640 distinct directed membership
clauses at n=11, and all four occurrences in the retained survivor are found
by the new detector.

## Reconstructed Euclidean motif

For six distinct roles `A,B,C,D,E,F`, retain these memberships:

```text
row(A) contains {B,C,D}
row(B) contains {A,C,F}
row(C) contains {A,D,E}
row(E) contains {C,D,F}
```

They are twelve directed atoms `(center, member)`. Under a planar realization,
the row equalities make `ABC`, `ACD`, and `CDE` equilateral with a common side
length, while `BF` and `EF` have that length. The first two pairs of
equilateral third vertices force `C` to be the midpoint of `B,E`; the two
radius-length circles centered at `B,E` are tangent there, forcing `F=C`.
This contradicts injectivity.

The source-clean statement is
`Problem97.false_of_realizes_three_equilateral_chain` in
`lean/Erdos9796Proof/P97/ATail/ThreeEquilateralChainCollision.lean`. The source
file used here has SHA-256
`c60b0d4da6b40989d55a95a57b5241d34cf46a67f29fc42d809af63d87f72e4b`.
The theorem consumes the twelve memberships and the three role inequalities
`B≠D`, `A≠E`, and `F≠C`; its `Realizes` input supplies both equidistance and
point injectivity.

No cyclic-order, Kalmanson, or triangle-inequality premise is needed. This is
the additional planar Euclidean ingredient exposed by the strict-Kalmanson
survivor, not a strict-Kalmanson collapse.

## Orbit count and serialization

The directed atom pattern has only the identity role automorphism. This was
checked exhaustively over all 720 permutations of the six roles. Every role
appears in an atom, so equality of two labeled clauses would induce a role
automorphism. Distinct injections therefore give distinct clauses, and

```text
P(11,6) = 11·10·9·8·7·6 = 332,640.
```

`scripts/generate_strict_kalmanson_n11_chain_bank.py` streams the complete
orbit in lexicographic injection order. It hashes a versioned canonical JSONL
format without materializing the bank by default. For n=11 it reports:

```text
schema        p97-strict-kalmanson-chain-bank-jsonl/v1
clauses       332,640
atoms/clause  12
stream bytes  37,649,201
stream SHA256 e78e8db92ff880df312af4bab2bb1d89aed9d43d3cd51e42af1687de743b8925
```

This digest authenticates the newly specified motif-only JSONL stream. It is
not the announced full-bank digest and cannot be compared byte-for-byte with
that digest until the original serialization and 42,504-clause base arrive.

## Survivor extraction

Running the detector on
`certificates/p97_strict_kalmanson_n11_survivor.json` finds exactly four
ordered embeddings:

```text
(A,B,C,D,E,F) = (0,1,2,6,4,10)
(A,B,C,D,E,F) = (3,5,7,9,8,10)
(A,B,C,D,E,F) = (6,4,2,0,1,10)
(A,B,C,D,E,F) = (9,8,7,3,5,10)
```

Thus the retained abstract strict-Kalmanson metric is killed by a
Lean-verified planar motif even though it survives the abstract strict metric
constraints.

## Minimization boundary

The generated orbit has no duplicates and admits no reduction by a directed
role-symmetry quotient. In that precise bookkeeping sense, the 332,640 count
is irredundant.

The twelve-atom support is **syntactically full** for the current Lean wrapper:
all twelve memberships and all three distinctness assumptions are used. This
does not prove mathematical inclusion-minimality. That stronger label requires
a checked injective planar realization after each single antecedent deletion,
or another complete independence argument. No such deletion-witness bank is
present, and this audit does not claim it.

The full 375,144-clause bank cannot be minimized or authenticated without the
missing 42,504 base clauses and their family provenance.

## Reproduction

```bash
uv run python scripts/generate_strict_kalmanson_n11_chain_bank.py \
  --survivor certificates/p97_strict_kalmanson_n11_survivor.json
uv run pytest -q scripts/test_generate_strict_kalmanson_n11_chain_bank.py
uv run --with ruff ruff check \
  scripts/generate_strict_kalmanson_n11_chain_bank.py \
  scripts/test_generate_strict_kalmanson_n11_chain_bank.py
```

The focused suite has eleven tests. It checks the exact atom pattern, trivial
automorphism group, ordered-injection counts, duplicate freedom on a complete
n=7 orbit, pinned n=6 and n=11 stream digests, and the four survivor hits.

## Next promotion gate

To upgrade the n=11 finite closure, recover or independently reconstruct all
42,504 base clauses with per-family provenance; reproduce the original byte
ordering or publish a new versioned bank; encode the complete fixed-cardinality
problem to CNF; and retain a solver proof that passes independent DRAT/LRAT
checking. Until those steps pass, the claimed Euclidean-augmented n=11 finite
closure remains unverified. The pure all-center strict-Kalmanson impossibility
is already false at n=11 because of the retained survivor; this motif is one
proved and reproducible Euclidean separator.
