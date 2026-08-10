"""Append only fresh-model-hit generic two-Kalmanson motif orbits."""

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
COMPILER_SOURCE = ROUND / "compile_accumulated_two_kalmanson_motif_family.py"
EXPORTER_SOURCE = REPO / (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "export_source_faithful_boolean_cnf.py"
)
LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean"
)


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


def clause_bytes(clause: tuple[int, ...]) -> bytes:
    return (" ".join(map(str, clause)) + " 0\n").encode("ascii")


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
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--root-receipt", type=Path)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--family-receipt", type=Path, required=True)
    parser.add_argument("--motif-index", type=int, action="append", required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--fragment", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    args = parser.parse_args()

    compiler = load_module("hit_motif_compiler", COMPILER_SOURCE)
    exporter = load_module("hit_motif_exporter", EXPORTER_SOURCE)
    manifest = json.loads(args.manifest.read_text())
    family = json.loads(args.family_receipt.read_text())
    formula = manifest["normalized_formula"]
    root_hash = sha256(args.root)
    if family["root"]["cnf_sha256"] != formula["sha256"]:
        raise ValueError("family receipt does not match the base manifest")
    root_receipt = None
    if args.root_receipt is None:
        if root_hash != formula["sha256"]:
            raise ValueError("root does not match the base manifest")
        root_variables = int(formula["num_vars"])
        root_clauses = int(formula["num_clauses"])
    else:
        root_receipt = json.loads(args.root_receipt.read_text())
        if root_hash != root_receipt["output_root_sha256"]:
            raise ValueError("root does not match the chained root receipt")
        if root_receipt["inputs"]["manifest_sha256"] != sha256(args.manifest):
            raise ValueError("chained root receipt uses a different manifest")
        root_variables = int(root_receipt["output_variables"])
        root_clauses = int(root_receipt["output_clauses"])
    order = tuple(int(value) for value in manifest["cyclic_order"])
    if order != tuple(family["root"]["cyclic_order"]):
        raise ValueError("cyclic-order mismatch")
    selected_variables = exporter.selected_variables()

    indices = tuple(dict.fromkeys(args.motif_index))
    if len(indices) != len(args.motif_index):
        raise ValueError("duplicate motif index")
    compiled: list[dict[str, object]] = []
    candidate_clauses: set[tuple[int, ...]] = set()
    for index in indices:
        if not 0 <= index < len(family["motifs"]):
            raise ValueError(f"invalid motif index {index}")
        item = family["motifs"][index]
        motif = compiler.parse_motif(item["motif"])
        clauses = compiler.motif_clauses(motif, order, selected_variables)
        digest = compiler.clauses_digest(clauses)
        if len(clauses) != int(item["clause_count"]):
            raise ValueError(f"motif {index} clause count mismatch")
        if digest != item["clause_sha256"]:
            raise ValueError(f"motif {index} clause digest mismatch")
        compiled.append(
            {
                "index": index,
                "motif": item["motif"],
                "candidate_clause_count": len(clauses),
                "candidate_clause_sha256": digest,
            }
        )
        candidate_clauses.update(clauses)

    candidate_lines = {clause_bytes(clause) for clause in candidate_clauses}
    novel_lines = set(candidate_lines)
    observed_root_clauses = 0
    with args.root.open("rb") as source:
        expected_header = f"p cnf {root_variables} {root_clauses}\n".encode()
        if source.readline() != expected_header:
            raise ValueError("root DIMACS header mismatch")
        for line in source:
            if not line.startswith(b"c") and line.strip():
                observed_root_clauses += 1
                novel_lines.discard(line)
    if observed_root_clauses != root_clauses:
        raise ValueError("root DIMACS body count mismatch")

    ordered_novel = sorted(novel_lines)
    fragment_tmp = args.fragment.with_suffix(args.fragment.suffix + ".tmp")
    with fragment_tmp.open("wb") as handle:
        for line in ordered_novel:
            handle.write(line)
        handle.flush()
        os.fsync(handle.fileno())
    fragment_tmp.replace(args.fragment)

    output_clauses = root_clauses + len(ordered_novel)
    output_tmp = args.output_root.with_suffix(args.output_root.suffix + ".tmp")
    with args.root.open("rb") as source, output_tmp.open("wb") as target:
        source.readline()
        target.write(f"p cnf {root_variables} {output_clauses}\n".encode())
        for block in iter(lambda: source.read(1 << 20), b""):
            target.write(block)
        for line in ordered_novel:
            target.write(line)
        target.flush()
        os.fsync(target.fileno())
    output_tmp.replace(args.output_root)

    receipt = {
        "schema": "p97-exact17-two-kalmanson-hit-orbits/v1",
        "status": "checked-source-backed-refinement",
        "lean_consumer": family["lean_consumer"],
        "inputs": {
            "root": str(args.root),
            "root_sha256": root_hash,
            "root_receipt": (
                str(args.root_receipt) if args.root_receipt is not None else None
            ),
            "root_receipt_sha256": (
                sha256(args.root_receipt) if args.root_receipt is not None else None
            ),
            "manifest": str(args.manifest),
            "manifest_sha256": sha256(args.manifest),
            "family_receipt": str(args.family_receipt),
            "family_receipt_sha256": sha256(args.family_receipt),
            "compiler_source": str(COMPILER_SOURCE),
            "compiler_source_sha256": sha256(COMPILER_SOURCE),
            "exporter_source": str(EXPORTER_SOURCE),
            "exporter_source_sha256": sha256(EXPORTER_SOURCE),
            "lean_source": str(LEAN_SOURCE),
            "lean_source_sha256": sha256(LEAN_SOURCE),
        },
        "motifs": compiled,
        "candidate_clause_count_before_cross_motif_dedup": sum(
            int(item["candidate_clause_count"]) for item in compiled
        ),
        "candidate_clause_count": len(candidate_lines),
        "already_present_clause_count": len(candidate_lines) - len(ordered_novel),
        "novel_clause_count": len(ordered_novel),
        "fragment": str(args.fragment),
        "fragment_sha256": sha256(args.fragment),
        "output_root": str(args.output_root),
        "output_root_sha256": sha256(args.output_root),
        "output_variables": root_variables,
        "output_clauses": output_clauses,
    }
    atomic_json(args.receipt, receipt)
    print(
        json.dumps(
            {
                "already_present": receipt["already_present_clause_count"],
                "novel": receipt["novel_clause_count"],
                "output_clauses": output_clauses,
                "output_sha256": receipt["output_root_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
