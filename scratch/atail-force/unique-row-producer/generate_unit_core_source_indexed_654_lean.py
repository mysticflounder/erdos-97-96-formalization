#!/usr/bin/env python3
"""Emit a verified source-indexed QQ certificate as a Lean replay."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
CERTIFICATE = HERE / "unit_core_source_indexed_654_certificate.json"
VERIFICATION = HERE / "unit_core_source_indexed_654_verification.json"
OUTPUT = HERE / "unit_core_source_indexed_654_scalar_certificate.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--certificate", type=Path, default=CERTIFICATE)
    parser.add_argument("--verification", type=Path, default=VERIFICATION)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument(
        "--theorem-name",
        default="normalizedUnitCoreSourceIndexed654Certificate",
    )
    args = parser.parse_args()
    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    verification = json.loads(args.verification.read_text(encoding="utf-8"))
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to emit Lean from an unverified identity")
    if verification["certificate_file_sha256"] != file_sha256(args.certificate):
        raise RuntimeError("certificate hash disagrees with independent replay")

    variable_names = tuple(certificate["variables"])
    variable_name_set = set(variable_names)
    coordinate_token_pattern = re.compile(
        r"(?<![A-Za-z0-9_])x\d+[xy](?![A-Za-z0-9_])"
    )
    active: list[tuple[int, str, str, str]] = []
    used: set[str] = set()
    for index, (name, generator, multiplier) in enumerate(
        zip(
            certificate["generator_names"],
            certificate["generators"],
            certificate["multipliers"],
        ),
        start=1,
    ):
        if multiplier.strip() == "0":
            continue
        tokens = set(coordinate_token_pattern.findall(multiplier))
        tokens.update(coordinate_token_pattern.findall(generator))
        unknown = tokens - variable_name_set
        if unknown:
            raise RuntimeError(f"unknown coordinate variables: {sorted(unknown)}")
        used.update(tokens)
        active.append((index, name, generator, multiplier))
    if len(active) != certificate["nonzero_multiplier_count"]:
        raise RuntimeError("active multiplier count disagrees with certificate")
    variables = [name for name in variable_names if name in used]

    lines = [
        "import Mathlib",
        "",
        "/-!",
        "Generated normalized replay of the independently checked exact QQ",
        "change-matrix certificate for a source-indexed ATAIL row core.",
        "",
        f"Certificate SHA256: {file_sha256(args.certificate)}",
        f"Generator stream SHA256: {certificate['generator_stream_sha256']}",
        f"Raw identity SHA256: {certificate['raw_change_identity_sha256']}",
        "This scalar theorem is an isolated, unbuilt scratch artifact.",
        "-/",
        "",
        "namespace Problem97.ATailUniqueRowProducerScratch",
        "",
        "set_option maxHeartbeats 12000000 in",
        "set_option maxRecDepth 100000 in",
        "set_option linter.unreachableTactic false in",
        "set_option linter.unusedTactic false in",
        "set_option linter.unnecessarySeqFocus false in",
        f"theorem {args.theorem_name}",
        "    (" + " ".join(variables) + " : ℝ)",
    ]
    for index, name, generator, _ in active:
        lines.append(f"    (h{index:02d} : {generator} = 0) -- {name}")
    lines.extend(
        (
            "    : False := by",
            "  have impossible : (1 : ℝ) = 0 := by",
            "    linear_combination",
        )
    )
    for position, (index, _, _, multiplier) in enumerate(active):
        connector = "      " if position == 0 else "      + "
        lines.append(f"{connector}({multiplier}) * h{index:02d}")
    lines.extend(
        (
            "  norm_num at impossible",
            "",
            f"#print axioms {args.theorem_name}",
            "",
            "end Problem97.ATailUniqueRowProducerScratch",
            "",
        )
    )
    args.output.write_text("\n".join(lines), encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "output_sha256": file_sha256(args.output),
                "output_bytes": args.output.stat().st_size,
                "active_hypotheses": len(active),
                "active_variables": len(variables),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
