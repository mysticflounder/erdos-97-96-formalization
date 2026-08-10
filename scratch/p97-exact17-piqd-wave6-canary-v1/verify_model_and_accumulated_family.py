"""Authenticate the PIQD wave-6 model and test the accumulated motif family."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
from types import ModuleType

REPO = Path(__file__).resolve().parents[2]
ROUND = REPO / "scratch/p97-exact17-piqd-refinement-round3-v1"
ANALYZER_SOURCE = REPO / (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "analyze_source_faithful_boolean_model.py"
)
COMPILER_SOURCE = ROUND / "compile_accumulated_two_kalmanson_motif_family.py"


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def atomic_json(path: Path, payload: object) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--root-receipt", type=Path)
    parser.add_argument("--family-receipt", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--linear-timeout-ms", type=int, default=300_000)
    args = parser.parse_args()

    analyzer = load_module("wave6_canary_analyzer", ANALYZER_SOURCE)
    compiler = load_module("wave6_canary_compiler", COMPILER_SOURCE)

    manifest = json.loads(args.manifest.read_text())
    formula = manifest["normalized_formula"]
    variables = int(formula["num_vars"])
    clauses = int(formula["num_clauses"])
    expected_cnf_sha256 = formula["sha256"]
    root_receipt = None
    if args.root_receipt is not None:
        root_receipt = json.loads(args.root_receipt.read_text())
        variables = int(root_receipt["output_variables"])
        clauses = int(root_receipt["output_clauses"])
        expected_cnf_sha256 = root_receipt["output_root_sha256"]
        if root_receipt["inputs"]["manifest_sha256"] != sha256(args.manifest):
            raise ValueError("root receipt is bound to a different manifest")
    if sha256(args.cnf) != expected_cnf_sha256:
        raise ValueError("CNF does not match its authenticated root")

    model_payload = json.loads(args.model.read_text())
    signed = tuple(int(value) for value in model_payload["model"])
    assignment = {abs(value): value > 0 for value in signed}
    if len(signed) != variables or set(assignment) != set(range(1, variables + 1)):
        raise ValueError("PIQD model is not a total exact assignment")
    analyzer.verify_dimacs(args.cnf, assignment, clauses)

    expected_order = tuple(int(value) for value in manifest["cyclic_order"])
    source_order = analyzer.export.source.normalized_order(0, (0, 1))
    if source_order != expected_order:
        raise ValueError("source order does not match the wave-6 manifest")

    analysis = analyzer.analyze_verified_assignment(
        order_index=0,
        positions=(0, 1),
        variable_count=variables,
        clause_count=clauses,
        assignment=assignment,
        cnf_description=str(args.cnf),
        model_description=str(args.model),
        linear_timeout_ms=args.linear_timeout_ms,
        always_linear_replay=True,
        minimize_first_bank_witness=True,
        minimize_all_bank_witnesses=False,
        schema="p97-exact17-piqd-wave6-canary-analysis/v1",
    )

    receipt = json.loads(args.family_receipt.read_text())
    root = receipt["root"]
    if root["cnf_sha256"] != formula["sha256"]:
        raise ValueError("family receipt is bound to a different base CNF")
    if tuple(root["cyclic_order"]) != expected_order:
        raise ValueError("family receipt is bound to a different cyclic order")

    selected_variables = analyzer.export.selected_variables()
    family_hits: list[dict[str, object]] = []
    tested_clause_count = 0
    for index, item in enumerate(receipt["motifs"]):
        motif = compiler.parse_motif(item["motif"])
        motif_clauses = compiler.motif_clauses(
            motif, expected_order, selected_variables
        )
        if len(motif_clauses) != int(item["clause_count"]):
            raise ValueError(f"motif {index} clause count disagrees with receipt")
        tested_clause_count += len(motif_clauses)
        violated = [
            clause
            for clause in motif_clauses
            if not analyzer.clause_satisfied(clause, assignment)
        ]
        if violated:
            family_hits.append(
                {
                    "motif_index": index,
                    "motif": item["motif"],
                    "violated_clause_count": len(violated),
                    "first_violated_clause": list(violated[0]),
                }
            )

    if tested_clause_count != int(receipt["compiled_clause_count"]):
        raise ValueError("tested family size disagrees with receipt")

    output = {
        "schema": "p97-exact17-piqd-postwave-family-gate/v2",
        "status": (
            "fresh-model-hit-by-accumulated-family"
            if family_hits
            else "fresh-model-missed-by-accumulated-family"
        ),
        "inputs": {
            "cnf": str(args.cnf),
            "cnf_sha256": sha256(args.cnf),
            "manifest": str(args.manifest),
            "manifest_sha256": sha256(args.manifest),
            "root_receipt": (
                str(args.root_receipt) if args.root_receipt is not None else None
            ),
            "root_receipt_sha256": (
                sha256(args.root_receipt) if args.root_receipt is not None else None
            ),
            "model": str(args.model),
            "model_sha256": sha256(args.model),
            "family_receipt": str(args.family_receipt),
            "family_receipt_sha256": sha256(args.family_receipt),
        },
        "piqd_model_total": True,
        "cnf_assignment_verified": True,
        "source_analysis": analysis,
        "family": {
            "motif_count": len(receipt["motifs"]),
            "tested_clause_count": tested_clause_count,
            "family_sha256": receipt["family_sha256"],
            "hit_count": len(family_hits),
            "hits": family_hits,
        },
    }
    atomic_json(args.output, output)
    print(
        json.dumps(
            {
                "bank_hit_count": len(analysis["bank_hits"]),
                "family_hit_count": len(family_hits),
                "linear_status": analysis["linear_status"],
                "status": output["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
