#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit Lean shards for endpoint finite-shadow search coverage.

Only the *reachable* fixed `.v`/`.w`/`.u` triples get a search certificate.  A
triple is unreachable when the depth-3 state it names is already rejected by the
DFS pruning tests, and `EndpointCertificate.ShadowSearchPruning` proves the
coverage claim for those triples without enumerating the subtree:

* `endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false` — the depth-3 pair
  counts already exceed the bound, so the subtree is empty;
* `endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false` and
  `..._of_crossSep_uv_false` — the fixed `.u` mask is not cross-separated from
  the fixed `.w` (resp. `.v`) mask, so no leaf of the subtree is a valid
  endpoint shadow.

The classification below re-implements the three Lean predicates
(`SurplusCOMPGBank.crossSeparationOKForMasks`, `incrementPairCounts`,
`pairCountsOK`).  It carries no trust: every pruned triple is emitted with a
`by decide` on the corresponding Lean predicate, so a misclassification is a
build error, not an unsound proof.
"""

from __future__ import annotations

import argparse
from pathlib import Path


ESCAPEES = {
    "Q1": [452, 456, 464, 480],
    "Q2": [708, 712, 720, 736],
}
WMASKS = [771, 777, 785, 801]
UMASKS = [
    30,
    46,
    54,
    58,
    60,
    90,
    106,
    114,
    120,
    154,
    170,
    178,
    184,
    284,
    300,
    308,
    312,
    344,
    360,
    368,
    408,
    424,
    432,
    540,
    556,
    564,
    568,
    600,
    616,
    624,
    664,
    680,
    688,
]
CHUNK_SIZE = 8
MODULE_ROOT = "Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards"

# Mirrors of the Lean definitions in `Erdos9796Proof.P97.SurplusCOMPGBank`.
ALL_LABELS = ["u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2"]
LABEL_INDEX = {label: index for index, label in enumerate(ALL_LABELS)}
HULL_POS = {"u": 0, "Q1": 1, "Q2": 2, "v": 3, "s1": 4, "s2": 5, "s3": 6,
            "w": 7, "Pw": 8, "Pu": 9}
LABEL_PAIRS = [(x, y) for i, x in enumerate(ALL_LABELS) for y in ALL_LABELS[i + 1:]]
LABEL_COUNT = len(ALL_LABELS)


def mask_has(mask: int, label: str) -> bool:
    return bool(mask >> LABEL_INDEX[label] & 1)


def between(a: str, b: str, x: str) -> bool:
    da = (HULL_POS[x] + LABEL_COUNT - HULL_POS[a]) % LABEL_COUNT
    db = (HULL_POS[b] + LABEL_COUNT - HULL_POS[a]) % LABEL_COUNT
    return 0 < da < db


def separated(a: str, b: str, x: str, y: str) -> bool:
    return between(a, b, x) != between(a, b, y)


def cross_separation_ok(c: str, cmask: int, cp: str, cpmask: int) -> bool:
    for x, y in LABEL_PAIRS:
        if x in (c, cp) or y in (c, cp):
            continue
        if (mask_has(cmask, x) and mask_has(cmask, y)
                and mask_has(cpmask, x) and mask_has(cpmask, y)):
            if not separated(c, cp, x, y):
                return False
    return True


def increment_pair_counts(center: str, mask: int, counts: list[int]) -> list[int]:
    def hit(pair: tuple[str, str]) -> bool:
        x, y = pair
        if center in (x, y):
            return False
        return mask_has(mask, x) and mask_has(mask, y)

    return [count + (1 if hit(pair) else 0)
            for count, pair in zip(counts, LABEL_PAIRS)]


def depth3_state_counts(vmask: int, wmask: int, umask: int) -> list[int]:
    counts = [0] * len(LABEL_PAIRS)
    counts = increment_pair_counts("v", vmask, counts)
    counts = increment_pair_counts("w", wmask, counts)
    return increment_pair_counts("u", umask, counts)


def classify(vmask: int, wmask: int, umask: int) -> str:
    """`live`, or the name of the pruning route that kills this triple.

    Ordering is deliberate: on the current mask sets every pair-count-dead
    triple is *also* cross-separation dead, so testing the counts first is what
    keeps the `pairCounts` route load-bearing rather than vestigial.
    """
    if not all(count <= 2 for count in depth3_state_counts(vmask, wmask, umask)):
        return "count"
    if not cross_separation_ok("u", umask, "w", wmask):
        return "sep_uw"
    if not cross_separation_ok("u", umask, "v", vmask):
        return "sep_uv"
    return "live"


PRUNING_LEMMA = {
    "count": "endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false",
    "sep_uw": "endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false",
    "sep_uv": "endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false",
}


def write_text_if_changed(path: Path, text: str) -> None:
    if path.exists() and path.read_text() == text:
        return
    path.write_text(text)


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def default_out_dir() -> Path:
    return repo_root() / "lean" / "Erdos9796Proof" / "P97" / "EndpointCertificate" / (
        "ShadowSearchShards"
    )


def chunks(values: list[int], size: int) -> list[tuple[int, list[int]]]:
    return [(start, values[start : start + size]) for start in range(0, len(values), size)]


def module_stem(escapee: str, vmask: int, wmask: int, start: int, chunk: list[int]) -> str:
    stop = start + len(chunk) - 1
    return f"{escapee}V{vmask}W{wmask}U{start:02d}_{stop:02d}"


def theorem_name(escapee: str, vmask: int, wmask: int, umask: int) -> str:
    return f"{escapee.lower()}_v{vmask}_w{wmask}_u{umask:03d}_valid"


def live_umasks(vmask: int, wmask: int, chunk: list[int]) -> list[int]:
    return [umask for umask in chunk if classify(vmask, wmask, umask) == "live"]


def shard_text(escapee: str, vmask: int, wmask: int, start: int, chunk: list[int]) -> str:
    theorem_blocks = []
    for umask in live_umasks(vmask, wmask, chunk):
        theorem_blocks.append(
            f"""/-- Valid shadows in `.{escapee}/{vmask}/{wmask}/{umask}` are row-bank covered. -/
theorem {theorem_name(escapee, vmask, wmask, umask)} :
    endpointDepth3SubtreeValidAllAccepted .{escapee} {vmask} {wmask} {umask} =
      true := by
  native_decide"""
        )
    theorem_text = "\n\n".join(theorem_blocks)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.{escapee}`, `.v = {vmask}`, `.w = {wmask}`

This generated shard checks the *reachable* fixed `.u` subtrees in the endpoint
shadow search.  Each theorem says every valid endpoint shadow in that subtree is
row-bank covered.  Keeping these native computations in small modules lets
downstream coverage proofs import theorem constants instead of re-running the
search.  Triples the DFS pruning tests already reject carry no theorem here;
`EndpointCertificate.ShadowSearchPruning` covers them without enumeration.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

namespace Depth3Cert

{theorem_text}

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
"""


def rcases_line(name: str, count: int) -> str:
    return f"rcases {name} with " + " | ".join(["rfl"] * count)


def exact_lines(escapee: str, vmasks: list[int]) -> str:
    lines = []
    for vmask in vmasks:
        for wmask in WMASKS:
            for umask in UMASKS:
                verdict = classify(vmask, wmask, umask)
                if verdict == "live":
                    lines.append(
                        f"  · exact Depth3Cert.{theorem_name(escapee, vmask, wmask, umask)}"
                    )
                else:
                    lines.append(f"  · exact {PRUNING_LEMMA[verdict]} (by decide)")
    return "\n".join(lines)


def dispatch_theorem(escapee: str, vmasks: list[int], v_masks_name: str) -> str:
    lower = escapee.lower()
    hv_cases = rcases_line("hv", len(vmasks))
    hw_cases = rcases_line("hw", len(WMASKS))
    hu_cases = rcases_line("hu", len(UMASKS))
    return f"""/-- Dispatch fixed `.v`/`.w`/`.u` candidate membership in the `.{escapee}`
endpoint branch to the generated depth-3 valid-subtree certificates. -/
theorem endpointDepth3SubtreeValidAllAccepted_{lower}_of_mem
    {{vmask wmask umask : Nat}}
    (hv : vmask ∈ {v_masks_name})
    (hw : wmask ∈ endpointWMasks)
    (hu : umask ∈ endpointUMasks) :
    endpointDepth3SubtreeValidAllAccepted .{escapee} vmask wmask umask =
      true := by
  simp [{v_masks_name}, endpointWMasks, endpointUMasks] at hv hw hu
  {hv_cases} <;>
    {hw_cases} <;>
    {hu_cases}
{exact_lines(escapee, vmasks)}
"""


def coverage_theorems() -> str:
    return f"""
namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

{dispatch_theorem("Q1", ESCAPEES["Q1"], "endpointQ1VMasks")}

{dispatch_theorem("Q2", ESCAPEES["Q2"], "endpointQ2VMasks")}

/-- Dispatch endpoint candidate membership to the generated depth-3
valid-subtree certificates. -/
theorem endpointDepth3SubtreeValidAllAccepted_of_mem_candidates
    {{escapee : Label}} {{vmask wmask umask : Nat}}
    (hesc : escapee ∈ endpointSearchEscapees)
    (hv : vmask ∈ endpointCandidateMasks escapee .v)
    (hw : wmask ∈ endpointCandidateMasks escapee .w)
    (hu : umask ∈ endpointCandidateMasks escapee .u) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask =
      true := by
  simp [endpointSearchEscapees] at hesc
  rcases hesc with rfl | rfl
  · rw [endpointCandidateMasks_q1_v] at hv
    rw [endpointCandidateMasks_q1_w] at hw
    rw [endpointCandidateMasks_q1_u] at hu
    exact endpointDepth3SubtreeValidAllAccepted_q1_of_mem hv hw hu
  · rw [endpointCandidateMasks_q2_v] at hv
    rw [endpointCandidateMasks_q2_w] at hw
    rw [endpointCandidateMasks_q2_u] at hu
    exact endpointDepth3SubtreeValidAllAccepted_q2_of_mem hv hw hu

end Search

end ShadowBank

end EndpointCertificate

end Problem97
"""


def all_imports(module_names: list[str]) -> str:
    imports = "\n".join(f"import {MODULE_ROOT}.{name}" for name in module_names)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchPruning
{imports}

/-!
# Endpoint finite shadow search shards

This generated coordinator imports every reachable fixed depth-3 endpoint search
shard and dispatches the unreachable triples to the enumeration-free pruning
lemmas in `EndpointCertificate.ShadowSearchPruning`.
-/

{coverage_theorems()}
"""


def emit(out_dir: Path) -> tuple[list[str], list[Path]]:
    """Write the live shards and `All.lean`; delete fully-pruned shard modules.

    Returns the module stems written and the stale module paths removed.
    """
    out_dir.mkdir(parents=True, exist_ok=True)
    module_names: list[str] = []
    stale: list[Path] = []
    for escapee, vmasks in ESCAPEES.items():
        for vmask in vmasks:
            for wmask in WMASKS:
                for start, chunk in chunks(UMASKS, CHUNK_SIZE):
                    stem = module_stem(escapee, vmask, wmask, start, chunk)
                    path = out_dir / f"{stem}.lean"
                    if not live_umasks(vmask, wmask, chunk):
                        # Every triple in this window is pruned; no module.
                        if path.exists():
                            stale.append(path)
                        continue
                    module_names.append(stem)
                    write_text_if_changed(
                        path, shard_text(escapee, vmask, wmask, start, chunk)
                    )
    for path in stale:
        path.unlink()
    write_text_if_changed(out_dir / "All.lean", all_imports(module_names))
    return module_names, stale


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=default_out_dir(),
        help="directory where Lean shard modules should be written",
    )
    args = parser.parse_args()
    module_names, stale = emit(args.out_dir)
    verdicts = [classify(vmask, wmask, umask)
                for vmasks in ESCAPEES.values()
                for vmask in vmasks
                for wmask in WMASKS
                for umask in UMASKS]
    live = verdicts.count("live")
    print(f"emitted endpoint shadow search shards: {args.out_dir}")
    print(f"  triples: {len(verdicts)} total, {live} certified, "
          f"{len(verdicts) - live} pruned "
          f"(count={verdicts.count('count')}, "
          f"sep_uw={verdicts.count('sep_uw')}, "
          f"sep_uv={verdicts.count('sep_uv')})")
    print(f"  modules: {len(module_names)} written, {len(stale)} removed")


if __name__ == "__main__":
    main()
