#!/usr/bin/env python3
"""Verify a QQ unit certificate and emit its geometric Lean replay.

The expensive cofactor extraction is intentionally out of scope here.  This
adapter consumes the independently crosschecked fifteen-generator core and a
certificate containing explicit multipliers, verifies ``sum c_i g_i = 1``
over ``QQ`` with SymPy, and only then emits a scalar ``linear_combination``
replay plus the exact equal-distance and ``normSim`` adapters.

Use ``--mapping-smoke`` without a certificate to emit a small Lean file that
checks every geometric-hypothesis-to-polynomial conversion independently.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
CORE = (
    HERE.parent
    / "bank-clean-unit-independent-audit"
    / "confirm_15_from17.json"
)
DEFAULT_OUTPUT = HERE / "BankClean15ExplicitCertificate.lean"
DEFAULT_SMOKE_OUTPUT = HERE / "BankClean15MappingSmoke.lean"
EXPECTED_CORE_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)
EXPECTED_GROEBNER_JL_CERTIFICATE_SHA256 = (
    "afb111002531a20ca1301afe6d05d8e0184f08183c4b2a7c0acaa0b69d834935"
)
EXPECTED_STREAMING_VERIFIER_SHA256 = (
    "0157c533111f565c4ba6328985101ab17f3f8faf022d9a617cb65e8aa3e9a5d7"
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def load_core(path: Path) -> list[dict[str, str]]:
    document = json.loads(path.read_text(encoding="utf-8"))
    records = [
        {"name": str(record["name"]), "polynomial": str(record["polynomial"])}
        for record in document["generators"]
    ]
    if len(records) != 15 or document["remaining_count"] != 15:
        raise ValueError("expected the pinned fifteen-generator core")
    polynomial_hash = canonical_sha256(
        [record["polynomial"] for record in records]
    )
    if polynomial_hash != EXPECTED_CORE_POLYNOMIAL_SHA256:
        raise ValueError(
            "fifteen-core polynomial stream drift: "
            f"expected {EXPECTED_CORE_POLYNOMIAL_SHA256}, found {polynomial_hash}"
        )
    if document["remaining_polynomial_sha256"] != polynomial_hash:
        raise ValueError("core's recorded polynomial hash is stale")
    if document["crosscheck"] != ["UNIT", "UNIT", "UNIT"]:
        raise ValueError("core has lost its three-solver UNIT crosscheck")
    return records


def certificate_records(
    document: Mapping[str, Any], core: Sequence[Mapping[str, str]]
) -> list[dict[str, str]]:
    def role_names(text: str) -> str:
        mapping = document.get("numeric_role_map", {})
        answer = text
        indexed = sorted(
            ((int(index), str(role)) for role, index in mapping.items()),
            reverse=True,
        )
        for index, role in indexed:
            for axis in ("x", "y"):
                answer = re.sub(
                    rf"\bx{index}{axis}\b", f"{role}{axis}", answer
                )
        return answer

    if "entries" in document:
        entries = document["entries"]
        names = [str(entry["name"]) for entry in entries]
        generators = [role_names(str(entry["generator"])) for entry in entries]
        raw_multipliers: Any = [
            role_names(str(entry["cofactor"])) for entry in entries
        ]
    else:
        names = [str(value) for value in document["generator_names"]]
        generators = [str(value) for value in document["generators"]]
        raw_multipliers = document["multipliers"]
    if isinstance(raw_multipliers, Mapping):
        multiplier_by_name = {
            str(name): str(value) for name, value in raw_multipliers.items()
        }
    else:
        multipliers = [str(value) for value in raw_multipliers]
        if len(multipliers) != len(names):
            raise ValueError("certificate generator/multiplier length mismatch")
        multiplier_by_name = dict(zip(names, multipliers, strict=True))
    if len(names) != len(generators) or len(set(names)) != len(names):
        raise ValueError("certificate generator stream is malformed")
    generator_by_name = dict(zip(names, generators, strict=True))
    if set(generator_by_name) != {record["name"] for record in core}:
        raise ValueError("certificate and core generator-name sets disagree")
    answer = []
    for record in core:
        name = record["name"]
        recorded_expr = sp.sympify(generator_by_name[name].replace("^", "**"))
        core_expr = sp.sympify(record["polynomial"].replace("^", "**"))
        if sp.expand(recorded_expr - core_expr) != 0:
            raise ValueError(f"certificate polynomial drift at {name}")
        answer.append(
            {
                **record,
                "multiplier": multiplier_by_name[name],
            }
        )
    return answer


def symbol_names(texts: Iterable[str]) -> list[str]:
    found = set()
    for text in texts:
        found.update(re.findall(r"\b[A-Z][A-Za-z0-9_]*[xy]\b", text))
    return sorted(found, key=lambda name: (name[:-1], name[-1]))


def parse_poly(
    text: str, symbols: Sequence[sp.Symbol]
) -> sp.Poly:
    local = {str(symbol): symbol for symbol in symbols}
    expression = sp.sympify(text.replace("^", "**"), locals=local)
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def verify_identity(records: Sequence[Mapping[str, str]]) -> dict[str, int]:
    names = symbol_names(
        value
        for record in records
        for value in (record["polynomial"], record["multiplier"])
    )
    if not names:
        raise ValueError("certificate has no coordinate variables")
    symbols_raw = sp.symbols(" ".join(names))
    symbols = (
        (symbols_raw,)
        if isinstance(symbols_raw, sp.Symbol)
        else tuple(symbols_raw)
    )
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    multiplier_polys = []
    for record in records:
        generator = parse_poly(record["polynomial"], symbols)
        multiplier = parse_poly(record["multiplier"], symbols)
        multiplier_polys.append(multiplier)
        total += generator * multiplier
    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise ValueError(
            "exact QQ certificate replay failed: "
            f"expanded residual has {len(total.terms())} terms"
        )
    active = [poly for poly in multiplier_polys if poly]
    return {
        "active_variables": len(symbols),
        "nonzero_multipliers": len(active),
        "multiplier_terms": sum(len(poly.terms()) for poly in active),
        "max_multiplier_degree": max(poly.total_degree() for poly in active),
    }


def verify_with_streaming_verifier(
    certificate_path: Path,
    certificate: Mapping[str, Any],
    verifier_path: Path,
) -> dict[str, int]:
    """Run the pinned sparse-Fraction verifier and require byte stability."""

    certificate_path = certificate_path.resolve()
    verifier_path = verifier_path.resolve()
    if certificate["schema"] != (
        "p97-atail-bank-clean-15-groebner-jl-certificate-v1"
    ):
        raise ValueError("streaming gate only accepts the Groebner.jl schema")
    if certificate["source_polynomial_sha256"] != (
        EXPECTED_CORE_POLYNOMIAL_SHA256
    ):
        raise ValueError("large certificate source polynomial hash drift")
    before = file_sha256(certificate_path)
    if before != EXPECTED_GROEBNER_JL_CERTIFICATE_SHA256:
        raise ValueError(
            "large certificate file hash drift: "
            f"expected {EXPECTED_GROEBNER_JL_CERTIFICATE_SHA256}, found {before}"
        )
    verifier_hash = file_sha256(verifier_path)
    if verifier_hash != EXPECTED_STREAMING_VERIFIER_SHA256:
        raise ValueError(
            "streaming verifier hash drift: "
            f"expected {EXPECTED_STREAMING_VERIFIER_SHA256}, "
            f"found {verifier_hash}"
        )
    process = subprocess.run(
        [sys.executable, str(verifier_path)],
        cwd=verifier_path.parent,
        capture_output=True,
        text=True,
        timeout=1800,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(
            "streaming exact QQ verifier failed:\n"
            + (process.stderr or process.stdout)
        )
    report = json.loads(process.stdout)
    after = file_sha256(certificate_path)
    if after != before or report["output_sha256"] != after:
        raise RuntimeError("streaming verification changed certificate bytes")
    if Path(report["output"]).resolve() != certificate_path.resolve():
        raise RuntimeError("streaming verifier reported a different certificate")
    if report["verified_exact_qq_identity"] is not True:
        raise RuntimeError("streaming verifier did not certify the QQ identity")
    if report["bytes"] != certificate_path.stat().st_size:
        raise RuntimeError("streaming verifier byte count mismatch")
    if report["multiplier_terms"] != certificate["multiplier_term_count"]:
        raise RuntimeError("streaming verifier multiplier count mismatch")
    if report["max_multiplier_degree"] != certificate["max_multiplier_degree"]:
        raise RuntimeError("streaming verifier degree mismatch")
    producer = certificate["producer"]
    if producer["julia_exact_change_matrix_check"] is not True:
        raise RuntimeError("certificate lost its Julia change-matrix check")
    if producer["independent_python_fraction_qq_identity_check"] is not True:
        raise RuntimeError("certificate lost its independent Fraction check")
    return {
        "active_variables": len(certificate["variables"]),
        "nonzero_multipliers": certificate["nonzero_multiplier_count"],
        "multiplier_terms": certificate["multiplier_term_count"],
        "max_multiplier_degree": certificate["max_multiplier_degree"],
    }


def lean_polynomial(text: str) -> str:
    return text.replace("**", "^")


def split_name(name: str) -> tuple[str, str, str]:
    parts = name.split("_")
    if len(parts) != 4 or parts[0] != "ROW":
        raise ValueError(f"unexpected generator name: {name}")
    return parts[1], parts[2], parts[3]


def point(name: str, *, normalized: bool) -> str:
    if not normalized:
        return name
    if name == "O":
        return "(pt 0 0)"
    if name == "A":
        return "(pt 1 0)"
    return name


def hypothesis(name: str, *, normalized: bool) -> str:
    center, pivot, member = split_name(name)
    return (
        f"dist {point(center, normalized=normalized)} "
        f"{point(pivot, normalized=normalized)} = "
        f"dist {point(center, normalized=normalized)} "
        f"{point(member, normalized=normalized)}"
    )


def coordinate_polynomial(text: str) -> str:
    answer = lean_polynomial(text)
    for variable in symbol_names((text,)):
        point_name = variable[:-1]
        coordinate = 0 if variable[-1] == "x" else 1
        answer = re.sub(
            rf"\b{re.escape(variable)}\b",
            f"({point_name} {coordinate})",
            answer,
        )
    return answer


def active_points(records: Sequence[Mapping[str, str]]) -> list[str]:
    names = {
        role
        for record in records
        for role in split_name(record["name"])
        if role not in {"O", "A"}
    }
    return sorted(names)


def scalar_variables(records: Sequence[Mapping[str, str]]) -> list[str]:
    return symbol_names(
        record["polynomial"] for record in records
    )


def mapping_steps(record: Mapping[str, str], *, indent: str = "  ") -> list[str]:
    suffix = record["name"].removeprefix("ROW_")
    squared_hypothesis = hypothesis(
        record["name"], normalized=True
    ).replace(" = ", " ^ 2 = ", 1)
    steps = [
        f"{indent}have h{suffix}_sq :=",
        f"{indent}  congrArg (fun r : ℝ => r ^ 2) h{suffix}",
        f"{indent}change {squared_hypothesis} ^ 2 at h{suffix}_sq",
        f"{indent}rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at h{suffix}_sq",
    ]
    if {"O", "A"} & set(split_name(record["name"])):
        steps.append(
            f"{indent}simp only [pt, Matrix.cons_val_zero, "
            f"Matrix.cons_val_one] at h{suffix}_sq"
        )
    steps.extend(
        (
            f"{indent}have p{suffix} : "
            f"{coordinate_polynomial(record['polynomial'])} = 0 := by",
            f"{indent}  linear_combination h{suffix}_sq",
        )
    )
    return steps


def emit_mapping_smoke(
    core_path: Path, records: Sequence[Mapping[str, str]], output: Path
) -> None:
    lines = [
        "import Erdos9796Proof.P97.Census554.EqualityCore",
        "",
        "/-! Exact smoke tests for the fifteen geometry-to-polynomial maps. -/",
        "",
        "open scoped EuclideanGeometry",
        "",
        "namespace Problem97.ATailBankClean15MappingSmoke",
        "",
        "private theorem bankClean15_dist_sq_coord (x y : ℝ²) :",
        "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
        "  rw [EuclideanSpace.dist_sq_eq]",
        "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
        "",
    ]
    for record in records:
        suffix = record["name"].removeprefix("ROW_")
        binders = " ".join(active_points((record,)))
        lines.extend(
            (
                f"example {{{binders} : ℝ²}}",
                f"    (h{suffix} : {hypothesis(record['name'], normalized=True)}) :",
                f"    {coordinate_polynomial(record['polynomial'])} = 0 := by",
                *mapping_steps(record)[:-2],
                f"  linear_combination h{suffix}_sq",
                "",
            )
        )
    lines.extend(
        (
            "end Problem97.ATailBankClean15MappingSmoke",
            "",
            f"-- Core SHA256: {file_sha256(core_path)}",
        )
    )
    output.write_text("\n".join(lines), encoding="utf-8")


def emit_certificate(
    core_path: Path,
    certificate_path: Path,
    records: Sequence[Mapping[str, str]],
    output: Path,
    statistics: Mapping[str, int],
) -> None:
    points = active_points(records)
    variables = scalar_variables(records)
    scalar_hypotheses = [
        f"    (p{record['name'].removeprefix('ROW_')} : "
        f"{lean_polynomial(record['polynomial'])} = 0)"
        for record in records
    ]
    normalized_hypotheses = [
        f"    (h{record['name'].removeprefix('ROW_')} : "
        f"{hypothesis(record['name'], normalized=True)})"
        for record in records
    ]
    raw_hypotheses = [
        f"    (h{record['name'].removeprefix('ROW_')} : "
        f"{hypothesis(record['name'], normalized=False)})"
        for record in records
    ]
    combination = []
    for record in records:
        multiplier = lean_polynomial(record["multiplier"])
        if record["multiplier"].strip() in {"0", "+0", "-0"}:
            continue
        suffix = record["name"].removeprefix("ROW_")
        connector = "      " if not combination else "      + "
        combination.append(f"{connector}({multiplier}) * p{suffix}")
    if not combination:
        raise ValueError("certificate has no nonzero multipliers")
    mapping = [
        line
        for record in records
        for line in mapping_steps(record)
    ]
    scalar_arguments = " ".join(
        f"({variable} := {variable[:-1]} {0 if variable[-1] == 'x' else 1})"
        for variable in variables
    )
    polynomial_arguments = " ".join(
        f"p{record['name'].removeprefix('ROW_')}" for record in records
    )
    lets = [f"  let {name.lower()} := T {name}" for name in points]
    named_points = " ".join(f"({name} := {name.lower()})" for name in points)
    simpa_names = ", ".join(
        (*[name.lower() for name in points], "hT0", "hT1")
    )
    transport_goals = [
        "  · simpa ["
        + simpa_names
        + "] using map_dist_eq h"
        + record["name"].removeprefix("ROW_")
        for record in records
    ]
    raw_arguments = " ".join(
        f"h{record['name'].removeprefix('ROW_')}" for record in records
    )
    source = "\n".join(
        (
            "import Erdos9796Proof.P97.Census554.EqualityCore",
            "",
            "/-! Kernel replay of the exact bank-clean fifteen-core certificate. -/",
            "",
            "open scoped EuclideanGeometry",
            "",
            "namespace Problem97.ATailBankClean15Explicit",
            "",
            f"-- Core SHA256: {file_sha256(core_path)}",
            f"-- Certificate SHA256: {file_sha256(certificate_path)}",
            f"-- Exact multiplier terms: {statistics['multiplier_terms']}",
            "",
            "set_option maxHeartbeats 80000000 in",
            "set_option maxRecDepth 100000 in",
            "private theorem normalized_bankClean15_scalar",
            f"    ({' '.join(variables)} : ℝ)",
            *scalar_hypotheses,
            "    : False := by",
            "  have impossible : (1 : ℝ) = 0 := by",
            "    linear_combination",
            *combination,
            "  norm_num at impossible",
            "",
            "private theorem bankClean15_dist_sq_coord (x y : ℝ²) :",
            "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
            "  rw [EuclideanSpace.dist_sq_eq]",
            "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
            "",
            "private theorem normalized_bankClean15_incompatible",
            f"    {{{' '.join(points)} : ℝ²}}",
            *normalized_hypotheses,
            "    : False := by",
            *mapping,
            "  exact normalized_bankClean15_scalar",
            f"    {scalar_arguments}",
            f"    {polynomial_arguments}",
            "",
            "theorem bank_clean15_anchor_collision",
            f"    {{O A {' '.join(points)} : ℝ²}}",
            *raw_hypotheses,
            "    : O = A := by",
            "  by_contra hOA",
            "  let T : ℝ² → ℝ² := normSim O A",
            *lets,
            "  have hdist (P Q : ℝ²) :",
            "      dist (T P) (T Q) = (dist O A)⁻¹ * dist P Q := by",
            "    simpa [T] using normSim_dist_image O A hOA P Q",
            "  have hT0 : T O = pt 0 0 := by",
            "    simpa [T] using normSim_fst O A",
            "  have hT1 : T A = pt 1 0 := by",
            "    simpa [T] using normSim_snd O A hOA",
            "  have map_dist_eq {P Q R S : ℝ²}",
            "      (h : dist P Q = dist R S) :",
            "      dist (T P) (T Q) = dist (T R) (T S) := by",
            "    rw [hdist, hdist, h]",
            f"  apply normalized_bankClean15_incompatible {named_points}",
            *transport_goals,
            "",
            "theorem false_of_bank_clean15_rows",
            f"    {{O A {' '.join(points)} : ℝ²}}",
            "    (hOA : O ≠ A)",
            *raw_hypotheses,
            "    : False := by",
            f"  exact hOA (bank_clean15_anchor_collision {raw_arguments})",
            "",
            "#print axioms bank_clean15_anchor_collision",
            "#print axioms false_of_bank_clean15_rows",
            "",
            "end Problem97.ATailBankClean15Explicit",
            "",
        )
    )
    output.write_text(source, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--core", type=Path, default=CORE)
    parser.add_argument("--certificate", type=Path)
    parser.add_argument(
        "--streaming-verifier",
        type=Path,
        help="pinned exact sparse-Fraction verifier for the large certificate",
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--mapping-smoke", action="store_true")
    args = parser.parse_args()
    core = load_core(args.core)
    if args.mapping_smoke:
        output = args.output or DEFAULT_SMOKE_OUTPUT
        emit_mapping_smoke(args.core, core, output)
        print(json.dumps({"output": str(output), "mapping_count": len(core)}))
        return 0
    if args.certificate is None:
        parser.error("--certificate is required unless --mapping-smoke is used")
    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    records = certificate_records(certificate, core)
    if certificate.get("schema") == (
        "p97-atail-bank-clean-15-groebner-jl-certificate-v1"
    ):
        if args.streaming_verifier is None:
            parser.error("the large Groebner.jl certificate requires --streaming-verifier")
        statistics = verify_with_streaming_verifier(
            args.certificate, certificate, args.streaming_verifier
        )
    else:
        statistics = verify_identity(records)
    output = args.output or DEFAULT_OUTPUT
    emit_certificate(args.core, args.certificate, records, output, statistics)
    print(
        json.dumps(
            {
                "output": str(output),
                "output_sha256": file_sha256(output),
                "verified_exact_qq_identity": True,
                **statistics,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
