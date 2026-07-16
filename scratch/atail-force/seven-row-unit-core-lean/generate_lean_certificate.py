#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit the independently verified QQ identity as a Lean replay."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
CERTIFICATE = HERE / "seven_row_unit_certificate.json"
VERIFICATION = HERE / "seven_row_unit_verification.json"
OUTPUT = HERE / "SevenRowUnitCoreScalar.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    verification = json.loads(VERIFICATION.read_text(encoding="utf-8"))
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to emit from an unverified identity")
    if verification["certificate_file_sha256"] != file_sha256(CERTIFICATE):
        raise RuntimeError("certificate hash disagrees with verification")
    symbols_raw = sp.symbols(" ".join(certificate["variables"]))
    symbols = (
        (symbols_raw,) if isinstance(symbols_raw, sp.Symbol) else tuple(symbols_raw)
    )
    local = {str(symbol): symbol for symbol in symbols}
    active = []
    used: set[sp.Symbol] = set()
    for index, (name, generator, multiplier) in enumerate(
        zip(
            certificate["generator_names"],
            certificate["generators"],
            certificate["multipliers"],
        ),
        start=1,
    ):
        multiplier_expr = sp.sympify(multiplier.replace("^", "**"), locals=local)
        if multiplier_expr == 0:
            continue
        generator_expr = sp.sympify(generator.replace("^", "**"), locals=local)
        used.update(multiplier_expr.free_symbols)
        used.update(generator_expr.free_symbols)
        active.append((index, name, generator, multiplier))
    variables = [name for name in certificate["variables"] if local[name] in used]
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "import Mathlib",
        "",
        "/-!",
        "Generated kernel replay of the independently checked exact QQ",
        "change-matrix certificate for the seven selected four-row core.",
        "",
        f"Certificate SHA256: {file_sha256(CERTIFICATE)}",
        f"Generator stream SHA256: {certificate['generator_stream_sha256']}",
        f"Identity SHA256: {certificate['raw_change_identity_sha256']}",
        "-/",
        "",
        "namespace Problem97.ATailSevenRowScratch",
        "",
        "set_option maxHeartbeats 20000000 in",
        "set_option maxRecDepth 100000 in",
        "set_option linter.unreachableTactic false in",
        "set_option linter.unusedTactic false in",
        "set_option linter.unnecessarySeqFocus false in",
        "theorem normalizedSevenRowCertificate",
        "    (" + " ".join(variables) + " : ℝ)",
    ]
    for index, name, generator, _ in active:
        lines.append(f"    (h{index:02d} : {generator} = 0) -- {name}")
    lines.extend((
        "    : False := by",
        "  have impossible : (1 : ℝ) = 0 := by",
        "    linear_combination",
    ))
    for position, (index, _, _, multiplier) in enumerate(active):
        connector = "      " if position == 0 else "      + "
        lines.append(f"{connector}({multiplier}) * h{index:02d}")
    lines.extend((
        "  norm_num at impossible",
        "",
        "#print axioms normalizedSevenRowCertificate",
        "",
        "end Problem97.ATailSevenRowScratch",
        "",
    ))
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(json.dumps({
        "output": str(OUTPUT),
        "output_sha256": file_sha256(OUTPUT),
        "output_bytes": OUTPUT.stat().st_size,
        "active_hypotheses": len(active),
        "active_variables": len(variables),
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
