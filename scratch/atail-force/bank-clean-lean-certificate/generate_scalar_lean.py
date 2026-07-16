#!/usr/bin/env python3
"""Emit a scalar-only Lean replay of the exact audited QQ certificate."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
CERTIFICATE = HERE / "unit_certificate_groebner_jl_15.json"
OUTPUT = HERE / "BankClean15ScalarExplicit.lean"
EXPECTED_CERTIFICATE_SHA256 = (
    "afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935"
)
EXPECTED_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    certificate_sha256 = file_sha256(CERTIFICATE)
    if certificate_sha256 != EXPECTED_CERTIFICATE_SHA256:
        raise RuntimeError(
            "verified certificate drift: "
            f"expected {EXPECTED_CERTIFICATE_SHA256}, found {certificate_sha256}"
        )
    document = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    if document["source_polynomial_sha256"] != EXPECTED_POLYNOMIAL_SHA256:
        raise RuntimeError("certificate polynomial stream drift")
    producer = document["producer"]
    if not producer["julia_exact_change_matrix_check"] or not producer[
        "independent_python_fraction_qq_identity_check"
    ]:
        raise RuntimeError("certificate has not passed both exact QQ gates")
    names = [str(value) for value in document["generator_names"]]
    generators = [str(value).replace("**", "^") for value in document["generators"]]
    multipliers = [str(value).replace("**", "^") for value in document["multipliers"]]
    if not (len(names) == len(generators) == len(multipliers) == 15):
        raise RuntimeError("expected fifteen certificate entries")

    lines = [
        "import Mathlib",
        "",
        "/-! Scalar kernel replay of the exact bank-clean 15-core identity. -/",
        "",
        "namespace Problem97.ATailBankClean15ScalarScratch",
        "",
        f"-- Certificate SHA256: {certificate_sha256}",
        f"-- Identity SHA256: {document['raw_identity_sha256']}",
        f"-- Multiplier terms: {document['multiplier_term_count']}",
        "",
        "set_option maxHeartbeats 200000000 in",
        "set_option maxRecDepth 200000 in",
        "theorem normalizedBankClean15Scalar",
        "    (" + " ".join(document["variables"]) + " : ℝ)",
    ]
    for index, (name, generator) in enumerate(
        zip(names, generators, strict=True), start=1
    ):
        lines.append(f"    (h{index:02d} : {generator} = 0) -- {name}")
    lines.extend(
        (
            "    : False := by",
            "  have impossible : (1 : ℝ) = 0 := by",
            "    linear_combination",
        )
    )
    for index, multiplier in enumerate(multipliers, start=1):
        connector = "      " if index == 1 else "      + "
        lines.append(f"{connector}({multiplier}) * h{index:02d}")
    lines.extend(
        (
            "  norm_num at impossible",
            "",
            "#print axioms normalizedBankClean15Scalar",
            "",
            "end Problem97.ATailBankClean15ScalarScratch",
            "",
        )
    )
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(OUTPUT),
                "output_sha256": file_sha256(OUTPUT),
                "bytes": OUTPUT.stat().st_size,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
