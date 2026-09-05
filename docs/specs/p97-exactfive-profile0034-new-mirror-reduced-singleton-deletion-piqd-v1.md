# P97 profile 0034 NEW-mirror reduced singleton deletion v1

## Scope

This governed PIQD/Z3 campaign measures every one-group deletion from the two
authenticated reduced unguarded profile-0034 formulas. It is finite-formula
discovery evidence only. All theorem, source-realization, source-completeness,
all-profile, Lean-ingress, closure, promotion, simultaneous-removability, and
minimality claims remain false.

The lane is
`exactfive-profile0034-new-mirror-reduced-singleton-deletion-piqd-20260905`;
its sole run is `run-0001`. Initialization writes only `run_manifest.json`.
The maintained PIQD SMT adapter is the only solver transport. The 19 cells may
run concurrently with a requested worker count from 1 through 20; the default
and maximum are 20. Each cell has a fresh session, exactly one solve, and a
fixed requested timeout of 60,000 ms. There are no assumptions, Boolean guards,
resume, or receipt replay. Default output is silent, `--verbose` prints JSON,
and errors are printed to stderr.

## Parent custody

Before construction or launch, the producer authenticates the completed
reduced-confirmation manifest, launch, terminal, execution commit, parent
custody hash, all six result trees, and exact six-cell dispositions. It also
reconstructs and pins each original GT/LT journal and canonical group list.
The reduced-confirmation parent-custody SHA-256 is
`bbaafb1f39e161ff7387fc6d489643152f9d0e14cd9a5570e2d8c08371930487`;
the resulting singleton-lane parent-custody SHA-256 is
`6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d`.
Supplying a different record remains an error even if that record carries a
valid self-hash.

The GT parent cell has groups edge 00, 01, 03, 04 and source-row equalities
00, 01, 03, 05. Its group-list SHA-256 is
`b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9`;
its 48-assertion, 69-command, 5,365-byte journal has SHA-256
`b890625b9b39c1452de181d776e89addd76deb9b26321b93cb344713e35ba611`.

The LT parent cell has groups edge 00, 01, 03, 04, 06 and source-row
equalities 01, 02, 03, 05. Its group-list SHA-256 is
`c38f1b732a8fc0b8043ca1b4181af97e828c273600273ba98e5b0282aef0a92c`;
its 59-assertion, 80-command, 6,340-byte journal has SHA-256
`4eed0894343ae34a60d1b8b5c3328c4a584cdb7e344dad3dddcb3136e441be22`.

## Target grid

There are exactly 17 targets: eight GT and nine LT. Each reconstructs the
original fixed group list minus exactly the named group. Every target record
pins branch, removed group, retained canonical list and hash, journal hash,
assertion count, command count, and byte count.

| Branch | Removed group | Retained hash | Journal hash | A/C/B |
|---|---|---|---|---:|
| GT | edge-index-00 | `4561ff28581955ff9dc8e9d184019dd3be3b7d2dc7b36cf1ef5f0a75879b97cd` | `54f8e604275b035c969fb8fb654dfee9bcd5ae024ffa869c6b91ed3fc58531f2` | 37/58/4500 |
| GT | edge-index-01 | `d1703572ac43239b77436977fd4417e8019e3d2e4158c94b9f9c508eb5a83267` | `3000a2a71305fbb0257a1ec3ad522683bd631aadb9ca15402f3d57e1efa50e4a` | 37/58/4230 |
| GT | edge-index-03 | `030ad0b23e6bcf807c0be5a4d2b26ebc5ea073820131a63beb9e05b1bdf9fc74` | `1f8047bbb07595319f82f1a71e8dd59fa1d283ddb4d3792be4fcf53a6e1b4594` | 37/58/4290 |
| GT | edge-index-04 | `f1f87804e78046d672ef38d6c0114df9eeb594006791b611d8acbf02b904ba9e` | `e964e27452f2e8fad1acc5c1c9edb2afa735529b7b1cb3c7f2d49bcd49446913` | 37/58/4290 |
| GT | source-row-equality-00 | `c5cb0beb9fab593a0036f0b17c7df081cf8eaf29e3f5e496dd0a43956c2af6fe` | `45af2320e8cc50ac90ae4ef0e8942dcf26f8b5355ae6be050f42b2aa6f5e87a2` | 47/68/5208 |
| GT | source-row-equality-01 | `710338be372110a24111afe73a8dfc80e3f9aa4ae94e2f49833993509fdc86c6` | `bfdb51b1f0a6cbecc0a1b54431306ec1f83559198c4036effacd8d184c654cef` | 47/68/5208 |
| GT | source-row-equality-03 | `d34cc6364a85dc2d7f08b21f8c03eea6ff28056fe5660d86acfd5b24a81e2c83` | `d2b7ba30a7029ea60667bb4e6fe5c87a41c6958848796d1693ade7f5e9bcdece` | 47/68/5240 |
| GT | source-row-equality-05 | `7629a61afeae318e1f1fb8eea22eb582fdb940d47f30cabd27737ddae3017f2d` | `2684cdb4fa7343bd0f50d2d006732e33c64896efba78f36d4344bc864c447d71` | 47/68/5188 |
| LT | edge-index-00 | `4a29e022e956280271b1b8436b49211f60161948ecbbc355a0579ba973a6857f` | `504acf4f402778e147b219d668d690a71add8d48b5fd21ffb1275c0b0b8e3190` | 48/69/5475 |
| LT | edge-index-01 | `6f59c240df12cba102450094ca66b46069865ae77a34d3f391dcf70da8314d39` | `38f6c6aa227ac6351f2447909818dd51c743aedfaf6dfd57b78cf59f9a5b8d52` | 48/69/5205 |
| LT | edge-index-03 | `cb624ad63558ae3758f870779d205dfbdf590f43e3d5775668e7a5369d260b74` | `da4d0d0908f48717605fd7c12498f69fc7d4d0dec46f3c9736c76c3c23262c64` | 48/69/5265 |
| LT | edge-index-04 | `32ff01d39b13e306700a4da1f8c738a2939d4e5832b1f3fbcb970306f73de109` | `47a60f2e757700ddb3c736ea51d08a587260ec15ee2833c7f8c54755fd0d7c38` | 48/69/5265 |
| LT | edge-index-06 | `bc0b94f59b4d673fa4bc7b1937e8669a741c1007ac4039061c2296baf16ade12` | `58b2d4a8a6608112273a0d6c6718a037668991b5493912c84553ef4aba7bee6c` | 48/69/5365 |
| LT | source-row-equality-01 | `dc832af877317081fcb85f864b81d7c41ddcbfcd8a5b952e758a79689618cfac` | `591f548fffb00671704c08ec284891e525a01fcd8891e5d1191f35ffa249b64d` | 58/79/6183 |
| LT | source-row-equality-02 | `aa69de1ce1e77a97dea4ac8335fa887d63e95b7bd33dc562e0dfd562a48cb85a` | `c0dfa425e4271dcba73a0dc5990632e685381650a91ba81ac839c421c9f9469e` | 58/79/6183 |
| LT | source-row-equality-03 | `df1c7d7f23ee9d8e7af29d33eb0cb9deafc5f135f59496870a96a6590f9c05a3` | `ca15a9cf7003a1e3138e753dd1b1df90d2a70cc81ffc80d5a6d6a2fda5755ca0` | 58/79/6215 |
| LT | source-row-equality-05 | `7a4a47fbdcce92a556b906f6e095690a41286bb3e8f469ad3905da19fcbee94f` | `acdd51fcf96a1644e7db4983291a1a7b9863dc6c4d41029b407897dd0577f9cb` | 58/79/6163 |

`A/C/B` means assertion count, command count, and journal byte count.

## Verdict and custody rules

Fresh Z3 positive and negative controls validate the transport. Raw UNSAT is
discovery-only. SAT is accepted only after total exact-rational readback
satisfies every retained assertion. Algebraic or otherwise unsupported values,
rejected replay, verifier failure, UNKNOWN, transport loss, and custody failure
are unresolved; no rounding is permitted.

A leave-one `SAT_REPLAYED` result says only that the omitted group is necessary
relative to that original fixed cell. A leave-one `UNSAT_CUSTODY_VALID` result
marks the group as a candidate removal and requires a fresh sequential rerun.
No collection of singleton results establishes that several groups can be
removed together, and no singleton result establishes minimality.

Artifacts are create-once and content-bound. Reads use nonblocking, no-follow
descriptor access followed by regular-file and single-link checks. Symlinks,
FIFOs, hard links, replacement races, unbound files, incomplete trees, session
reuse, solve-index drift, and source drift fail closed. Offline verification,
initialization, and parent checking make no transport call. A partial launch
cannot resume; it requires a new governed run identifier.

Offline verification revalidates the exact session-create, empty pre-append,
post-append journal, frontier, solve request, live and closed session, receipt,
solve, lifecycle, and artifact inventories. It locally recomputes the PIQD
result digest and, for SAT, reruns the exact-rational semantic verifier from the
stored model and values. A completed SAT, UNSAT, or UNKNOWN response reached
through transport loss, reconciliation, request retry, receipt resumption, or
replay is rejected rather than used as a cell decision.
