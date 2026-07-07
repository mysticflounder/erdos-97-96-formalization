#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit Lean shards for endpoint finite-shadow search coverage."""

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


def shard_text(escapee: str, vmask: int, wmask: int, start: int, chunk: list[int]) -> str:
    theorem_blocks = []
    for umask in chunk:
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

This generated shard checks fixed `.u` subtrees in the endpoint shadow search.
Each theorem says every valid endpoint shadow in that subtree is row-bank
covered.  Keeping these native computations in small modules lets downstream
coverage proofs import theorem constants instead of re-running the search.
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
                lines.append(
                    f"  · exact Depth3Cert.{theorem_name(escapee, vmask, wmask, umask)}"
                )
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

{imports}

/-!
# Endpoint finite shadow search shards

This generated coordinator imports every fixed depth-3 endpoint search shard.
-/

{coverage_theorems()}
"""


def emit(out_dir: Path) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    module_names: list[str] = []
    for escapee, vmasks in ESCAPEES.items():
        for vmask in vmasks:
            for wmask in WMASKS:
                for start, chunk in chunks(UMASKS, CHUNK_SIZE):
                    stem = module_stem(escapee, vmask, wmask, start, chunk)
                    module_names.append(stem)
                    write_text_if_changed(
                        out_dir / f"{stem}.lean",
                        shard_text(escapee, vmask, wmask, start, chunk),
                    )
    write_text_if_changed(out_dir / "All.lean", all_imports(module_names))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=default_out_dir(),
        help="directory where Lean shard modules should be written",
    )
    args = parser.parse_args()
    emit(args.out_dir)
    print(f"emitted endpoint shadow search shards: {args.out_dir}")


if __name__ == "__main__":
    main()
