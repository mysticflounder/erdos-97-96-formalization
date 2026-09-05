# P97 n=12 recovery: independently checked canonical-tail certificate

Date: 2026-09-05.

## Result and boundary

A new exact partition closes 19 of 170 canonical minimum-row cases under the saved 777,108-clause bank. A standalone proof tree is accepted by an independent standard-library Python checker: 19 cases, 989 nodes, 20,462 justified domain reductions, and 748 contradiction leaves. Five deliberately corrupted proofs are rejected.

This is NOT completion of n=12, NOT nineteen of the previously advertised 79 Hamming subproblems, and NOT a new Lean or P97 closure. The other 151 cases in this new partition remain unresolved. The geometric soundness of every original bank family is a separate obligation; this package proves a finite implication from the specified bank.

## Recovery boundary

The mounted recovery inputs include the incremental C++ solver, the r219 affine-cube certificate, and the complete r220 bank. They do not include the original twelve-row Hamming pivot or the layer-completion/tail ledgers. Requests for that exact data were posted in project messages 15454 and 15457. I have not invented a replacement pivot or credited the missing ledgers as verified.

Original bank: n12-bank-r220-antichain.p97monotone.
SHA-256: 1cbf12d01d0be74be503f8ab8aa0e1da2355f4061daca3f407083e283492c709.

## Why the previous partition did not resolve the compute bottleneck

There are 330 loopless four-support choices at each of twelve centers. Relative to any fixed pivot, exact Hamming layer k contains binomial(12,k) times 329^k raw row systems.

Layers 10 through 12 account for 99.99940021877106% of raw row systems. Layer 12 alone accounts for 96.4236343956171%. These proportions are before bank constraints, not measurements of surviving feasible systems. They nevertheless show why reducing the number of outer case labels to 79 did not establish a comparable reduction in search complexity.

## New exact normalization

For each center c, encode its selected support by the bit mask of cyclic offsets from c. Take the minimum over every center and both orientations. Rotate/reflect the entire row system so that this minimum is the row at zero.

The original bank was independently checked under the two generators of the dihedral group: every rotated clause and every reflected clause is present, with zero missing images. Therefore this normalization preserves existence of a model of the full bank. No source roles or arbitrary relabelings are silently identified.

The 330 possible zero-centered rows give 170 representatives under reflection. The nineteen largest masks, from 2070 through 3078, are:

2070, 2074, 2086, 2090, 2098, 2118, 2122, 2130, 2146, 2182, 2186, 2194, 2210, 2310, 2314, 2322, 2566, 2570, 3078.

For a particular mask m, row zero equals m. Every other row has both its forward and reflected offset mask at least m. These are the exact initial domains replayed by the checker.

## Proof and compression

The incremental C++ row-domain search excluded all nineteen cases. Its conflict explanations were reduced to a 2,827-clause subset of the original bank. An independent Boolean encoding using the installed Z3 library returned UNSAT on that subset and the nineteen-case scope. A tracked core reduced it further to 1,727 original clauses.

The final certificate no longer depends on Z3: a separate Python generator builds an explicit exhaustive domain-search tree, and a different Python checker validates every step using sets of support masks rather than the generator's bitsets.

For each domain reduction, the checker verifies that all other rows in a specific forbidden membership clause are forced to satisfy their positive requirements, and removes only the supports forbidden by that clause. For each branch, it verifies that the children cover exactly the remaining domain. Every leaf has a fully forced forbidden clause or a domain exhausted by checked reductions.

Core SHA-256:
7de839f9e1d950923d7b0b63331d65695875d6968960b44250d5d00174802ecc.

Proof SHA-256:
4351a0d9aebad75009322f8f060cbba651cab7cb764188cdd33a3fc83a45c9f2.

The original clause-index map independently verifies that every one of the 1,727 clauses is a byte-exact line of the authenticated 777,108-clause bank. An earlier explanation collector omitted reasons for branches pruned before recursion; its extracted subset was SAT. That failed intermediate result is not used. The repaired collector includes those reasons, and the final independent proof checker establishes full branch coverage.

## Reproduction

Extract the replay archive and run, from its directory:

```sh
python3 verify_replay.py
```

This regenerates the proof, checks its exact hash, runs the independent checker, and rejects five tampered proofs. The compact transport archive omits the deterministic proof JSON; the full certificate archive includes it.

To also recheck the original-bank subset mapping:

```sh
python3 verify_replay.py --full-bank /path/to/n12-bank-r220-antichain.p97monotone
```

Only Python's standard library is needed for this certificate replay. The discovery experiments used C++ and the installed Z3 library, but neither is trusted by the final proof-tree checker.

## Experiments not promoted to results

Global eager and lazy Boolean, row-domain, and guarded linear-arithmetic probes remained inconclusive. A subbank SAT model is not a full-bank survivor. Bounded search exhaustion is not UNSAT. The remaining canonical cells have not been excluded by the nineteen-cell certificate.

The next computational target is the unresolved canonical prefix, reusing small proof cores and explicit tree certificates rather than restarting the unsupported historical Hamming tail. Restoring the exact original pivot and ledgers would permit a separate faithful reconciliation of that older campaign.
