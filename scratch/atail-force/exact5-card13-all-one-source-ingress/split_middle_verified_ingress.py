#!/usr/bin/env python3
"""Split the generated middle packed ingress into parallel Lean modules.

`generate_all_one_ingress.py` intentionally emits one self-contained file.
For the 7,256-assertion endpoint that monolith is an unnecessarily serial
elaboration gate.  This deterministic postprocessor preserves its declarations
verbatim while separating the assignment, 114 chunk bridges, and endpoint.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path


NAMESPACE = "Problem97.ATailExactFiveCard13AllOneCertificate.Middle"


def module_preamble(import_name: str, description: str) -> str:
    return f"""/-
{description}
-/
import {import_name}

namespace {NAMESPACE}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()

    source = args.input.read_text(encoding="utf-8")
    bridge_matches = list(
        re.finditer(r"^theorem sourceChunk(\d{3})_each_of_flat", source, re.MULTILINE)
    )
    if [int(match.group(1)) for match in bridge_matches] != list(range(114)):
        raise ValueError("expected exactly the dense 114 middle bridge theorems")

    first_bridge = bridge_matches[0].start()
    assignment = source[:first_bridge].rstrip()
    if "import AllOneMiddleVerified" not in assignment:
        raise ValueError("input does not import the persisted verified module")

    print_marker = source.index("#print axioms sourceChunk000_each_of_flat")
    args.output_dir.mkdir(parents=True, exist_ok=True)
    (args.output_dir / "AllOneMiddleVerifiedAssignment.lean").write_text(
        assignment + f"\n\nend {NAMESPACE}\n", encoding="utf-8"
    )

    for index, match in enumerate(bridge_matches):
        end = (
            bridge_matches[index + 1].start()
            if index + 1 < len(bridge_matches)
            else print_marker
        )
        theorem = source[match.start() : end].rstrip()
        chunk = int(match.group(1))
        text = (
            module_preamble(
                "AllOneMiddleVerifiedAssignment",
                f"Generated packed-source bridge for verified middle chunk {chunk:03d}.",
            )
            + theorem
            + f"\n\nend {NAMESPACE}\n"
        )
        (args.output_dir / f"AllOneMiddleVerifiedBridgeChunk{chunk:03d}.lean").write_text(
            text, encoding="utf-8"
        )

    endpoint_start = source.index(
        "/-- Complete itemwise chunk facts contradict the verified LRAT endpoint. -/"
    )
    flat_start = source.index(
        "/-- The exact packed source-core assertions contradict the verified endpoint. -/"
    )
    endpoint = source[endpoint_start:flat_start].rstrip()
    endpoint_text = (
        module_preamble(
            "AllOneMiddleVerifiedAssignment",
            "Generated itemwise endpoint for the persisted verified middle certificate.",
        )
        + endpoint
        + "\n\n#print axioms false_of_sourceChunks_each"
        + f"\n\nend {NAMESPACE}\n"
    )
    (args.output_dir / "AllOneMiddleVerifiedEndpoint.lean").write_text(
        endpoint_text, encoding="utf-8"
    )

    print("assignment_modules=1")
    print("bridge_modules=114")
    print("endpoint_modules=1")


if __name__ == "__main__":
    main()
