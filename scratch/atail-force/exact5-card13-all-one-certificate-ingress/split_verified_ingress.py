#!/usr/bin/env python3
"""Split one generated packed ingress into scalable Lean modules.

`generate_all_one_ingress.py` emits one self-contained file.  At the full
7,256-obligation endpoint, Lean's snapshot traversal over that monolith is an
unnecessarily expensive serial gate.  This deterministic postprocessor keeps
the generated declarations verbatim while separating the assignment, the 114
chunk bridges, and the itemwise certificate endpoint.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path


ORBIT_NAMES = {
    "left": "Left",
    "middle": "Middle",
    "right": "Right",
}
EXPECTED_CHUNKS = 114


def module_preamble(namespace: str, import_name: str, description: str) -> str:
    return f"""/-
{description}
-/
import {import_name}

namespace {namespace}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=sorted(ORBIT_NAMES), required=True)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()

    title = ORBIT_NAMES[args.orbit]
    namespace = f"Problem97.ATailExactFiveCard13AllOneCertificate.{title}"
    verified_module = f"AllOne{title}Verified"
    assignment_module = f"{verified_module}Assignment"

    source = args.input.read_text(encoding="utf-8")
    bridge_matches = list(
        re.finditer(r"^theorem sourceChunk(\d{3})_each_of_flat", source, re.MULTILINE)
    )
    expected_indices = list(range(EXPECTED_CHUNKS))
    actual_indices = [int(match.group(1)) for match in bridge_matches]
    if actual_indices != expected_indices:
        raise ValueError(
            f"expected dense bridge indices {expected_indices}, got {actual_indices}"
        )

    first_bridge = bridge_matches[0].start()
    assignment = source[:first_bridge].rstrip()
    expected_import = f"import {verified_module}"
    if expected_import not in assignment:
        raise ValueError(f"input does not contain {expected_import!r}")
    if f"namespace {namespace}" not in assignment:
        raise ValueError(f"input does not open expected namespace {namespace!r}")

    print_marker = source.index("#print axioms sourceChunk000_each_of_flat")
    endpoint_start = source.index(
        "/-- Complete itemwise chunk facts contradict the verified LRAT endpoint. -/"
    )
    flat_start = source.index(
        "/-- The exact packed source-core assertions contradict the verified endpoint. -/"
    )
    if not (first_bridge < print_marker < endpoint_start < flat_start):
        raise ValueError("generated ingress declarations occur in an unexpected order")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    (args.output_dir / f"{assignment_module}.lean").write_text(
        assignment + f"\n\nend {namespace}\n", encoding="utf-8"
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
                namespace,
                assignment_module,
                f"Generated packed-source bridge for verified {args.orbit} "
                f"chunk {chunk:03d}.",
            )
            + theorem
            + f"\n\nend {namespace}\n"
        )
        output = args.output_dir / f"{verified_module}BridgeChunk{chunk:03d}.lean"
        output.write_text(text, encoding="utf-8")

    endpoint = source[endpoint_start:flat_start].rstrip()
    endpoint_text = (
        module_preamble(
            namespace,
            assignment_module,
            f"Generated itemwise endpoint for the persisted verified "
            f"{args.orbit} certificate.",
        )
        + endpoint
        + "\n\n#print axioms false_of_sourceChunks_each"
        + f"\n\nend {namespace}\n"
    )
    (args.output_dir / f"{verified_module}Endpoint.lean").write_text(
        endpoint_text, encoding="utf-8"
    )

    print(f"orbit={args.orbit}")
    print("assignment_modules=1")
    print(f"bridge_modules={EXPECTED_CHUNKS}")
    print("endpoint_modules=1")


if __name__ == "__main__":
    main()
