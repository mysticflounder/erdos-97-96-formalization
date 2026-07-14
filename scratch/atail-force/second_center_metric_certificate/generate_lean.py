#!/usr/bin/env python3
"""Generate an unimported Lean replay of the verified normalized certificate."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
DEFAULT_CERTIFICATE = HERE / "certificate_normalized_cegar_456_5row.json"
DEFAULT_VERIFICATION = HERE / "verification_normalized_cegar_456_5row.json"
DEFAULT_OUTPUT = HERE / "generated_normalized_cegar_456_5row.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lean_polynomial(text: str) -> str:
    # Singular and Lean share the syntax used by this certificate: integer and
    # rational literals, +, -, *, parentheses, and natural-number powers.
    if "//" in text or "**" in text:
        raise ValueError("unexpected non-Singular polynomial syntax")
    return text


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate", type=Path, default=DEFAULT_CERTIFICATE)
    parser.add_argument("--verification", type=Path, default=DEFAULT_VERIFICATION)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    verification = json.loads(args.verification.read_text(encoding="utf-8"))
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to generate Lean from an unverified certificate")
    if verification["certificate_file_sha256"] != file_sha256(args.certificate):
        raise RuntimeError("certificate hash does not match independent verification")

    symbols = sp.symbols(" ".join(certificate["variables"]))
    if isinstance(symbols, sp.Symbol):
        symbols = (symbols,)
    locals_map = {str(symbol): symbol for symbol in symbols}
    active: list[tuple[int, str, str]] = []
    used_symbols: set[sp.Symbol] = set()
    for index, (generator, multiplier) in enumerate(
        zip(certificate["generators"], certificate["multipliers"]), start=1
    ):
        multiplier_expr = sp.sympify(multiplier.replace("^", "**"), locals=locals_map)
        if multiplier_expr == 0:
            continue
        generator_expr = sp.sympify(generator.replace("^", "**"), locals=locals_map)
        used_symbols.update(generator_expr.free_symbols)
        used_symbols.update(multiplier_expr.free_symbols)
        active.append((index, generator, multiplier))

    ordered_variables = [
        variable for variable in certificate["variables"]
        if locals_map[variable] in used_symbols
    ]
    lines = [
        "import Mathlib",
        "",
        "/-!",
        "Generated, unimported kernel replay of the independently verified",
        "five-row normalized CEGAR Nullstellensatz certificate.",
        "",
        f"Certificate SHA256: {file_sha256(args.certificate)}",
        f"Generator SHA256: {certificate['generator_sha256']}",
        f"Row-set SHA256: {certificate['row_set_sha256']}",
        "Regenerate with: `UV_CACHE_DIR=/tmp/uv-cache uv run python "
        "scratch/atail-force/second_center_metric_certificate/generate_lean.py`",
        "-/",
        "",
        "namespace Problem97.ATAILForceScratch",
        "",
        "set_option maxHeartbeats 10000000 in",
        "set_option maxRecDepth 100000 in",
        "set_option linter.unreachableTactic false in",
        "set_option linter.unusedTactic false in",
        "set_option linter.unnecessarySeqFocus false in",
        "theorem normalizedCegar456FiveRowCertificate",
        "    (" + " ".join(ordered_variables) + " : ℝ)",
    ]
    for index, generator, _ in active:
        lines.append(f"    (h{index:02d} : {lean_polynomial(generator)} = 0)")
    lines.extend((
        "    : False := by",
        "  have impossible : (1 : ℝ) = 0 := by",
        "    linear_combination",
    ))
    for position, (index, _, multiplier) in enumerate(active):
        connector = "      " if position == 0 else "      + "
        lines.append(
            connector + f"({lean_polynomial(multiplier)}) * h{index:02d}"
        )
    lines.extend((
        "  norm_num at impossible",
        "",
        "#print axioms normalizedCegar456FiveRowCertificate",
        "",
        "end Problem97.ATAILForceScratch",
        "",
    ))
    args.output.write_text("\n".join(lines), encoding="utf-8")
    print(json.dumps({
        "output": str(args.output),
        "output_sha256": file_sha256(args.output),
        "active_hypotheses": len(active),
        "active_variables": len(ordered_variables),
        "output_bytes": args.output.stat().st_size,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
