#!/usr/bin/env python3
"""Emit the owned normalized five-row certificate as a Lean replay."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
CERTIFICATE = HERE / "unit_core_654_05_certificate.json"
VERIFICATION = HERE / "unit_core_654_05_verification.json"
OUTPUT = HERE / "unit_core_654_05_scalar_certificate.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    certificate = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    verification = json.loads(VERIFICATION.read_text(encoding="utf-8"))
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to emit Lean from an unverified identity")
    if verification["certificate_file_sha256"] != file_sha256(CERTIFICATE):
        raise RuntimeError("certificate hash disagrees with independent replay")

    symbols_raw = sp.symbols(" ".join(certificate["variables"]))
    symbols = (symbols_raw,) if isinstance(symbols_raw, sp.Symbol) else symbols_raw
    locals_map = {str(symbol): symbol for symbol in symbols}
    active: list[tuple[int, str, str, str]] = []
    used: set[sp.Symbol] = set()
    for index, (name, generator, multiplier) in enumerate(zip(
        certificate["generator_names"],
        certificate["generators"],
        certificate["multipliers"],
    ), start=1):
        multiplier_expr = sp.sympify(multiplier.replace("^", "**"), locals=locals_map)
        if multiplier_expr == 0:
            continue
        generator_expr = sp.sympify(generator.replace("^", "**"), locals=locals_map)
        used.update(multiplier_expr.free_symbols)
        used.update(generator_expr.free_symbols)
        active.append((index, name, generator, multiplier))
    variables = [name for name in certificate["variables"] if locals_map[name] in used]

    lines = [
        "import Mathlib",
        "",
        "/-!",
        "Generated normalized replay of the independently checked exact QQ",
        "change-matrix certificate for ATAIL unit core 654-05.",
        "",
        f"Certificate SHA256: {file_sha256(CERTIFICATE)}",
        f"Generator stream SHA256: {certificate['generator_stream_sha256']}",
        f"Raw identity SHA256: {certificate['raw_change_identity_sha256']}",
        "This scalar theorem is an isolated scratch artifact; the invariant",
        "distance-equality wrapper lives in `unit_core_654_05_collision.lean`.",
        "-/",
        "",
        "namespace Problem97.ATailUniqueRowProducerScratch",
        "",
        "set_option maxHeartbeats 12000000 in",
        "set_option maxRecDepth 100000 in",
        "set_option linter.unreachableTactic false in",
        "set_option linter.unusedTactic false in",
        "set_option linter.unnecessarySeqFocus false in",
        "theorem normalizedUnitCore65405Certificate",
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
        "#print axioms normalizedUnitCore65405Certificate",
        "",
        "end Problem97.ATailUniqueRowProducerScratch",
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


if __name__ == "__main__":
    main()

