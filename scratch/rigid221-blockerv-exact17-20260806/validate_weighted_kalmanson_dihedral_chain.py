#!/usr/bin/env python3
"""Recursively validate a dihedral-weighted CNF chain and its lazy root."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import subprocess
import sys


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


edge_validator = load_module(
    "exact17_dihedral_chain_edge_validator",
    HERE / "validate_weighted_kalmanson_dihedral_cnf.py",
)
base_append = edge_validator.base_append


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--terminal-manifest", type=Path, required=True)
    parser.add_argument("--root-validation", type=Path, required=True)
    parser.add_argument("--edge-output-dir", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    current = args.terminal_manifest.resolve()
    edge_output_dir = args.edge_output_dir.resolve()
    edge_output_dir.mkdir(parents=True, exist_ok=False)
    seen: set[Path] = set()
    edges = []
    while True:
        if current in seen:
            raise ValueError(f"manifest cycle: {current}")
        seen.add(current)
        manifest = json.loads(current.read_text())
        if manifest.get("schema") != "p97-rigid221-exact17-weighted-dihedral-cnf-v1":
            break
        edge_output = edge_output_dir / f"edge-{len(edges):04d}.json"
        result = subprocess.run(
            [
                sys.executable,
                str(HERE / "validate_weighted_kalmanson_dihedral_cnf.py"),
                "--manifest",
                str(current),
                "--output",
                str(edge_output),
            ],
            cwd=REPO,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if result.returncode != 0:
            raise RuntimeError(
                f"edge validation failed for {current}: {result.stdout[-1000:]}"
            )
        edge_report = json.loads(edge_output.read_text())
        if edge_report.get("status") != "PASS":
            raise ValueError(f"edge validator did not return PASS: {current}")
        edges.append(
            {
                "manifest": str(current.relative_to(REPO)),
                "manifest_sha256": base_append.sha256(current),
                "validation": str(edge_output.relative_to(REPO)),
                "validation_sha256": base_append.sha256(edge_output),
                "certificates": edge_report["certificates_exactly_replayed"],
                "checked_images": edge_report["checked_images"],
                "appended_clauses": edge_report["appended_clauses"],
            }
        )
        base = manifest["dihedral_weighted_base"]
        current = base_append.resolve_repo_path(base["manifest"]).resolve()
        if base_append.sha256(current) != base.get("manifest_sha256"):
            raise ValueError("parent manifest hash mismatch after edge validation")

    root_manifest = json.loads(current.read_text())
    root_manifest_sha = base_append.sha256(current)
    root_cnf = base_append.resolve_repo_path(root_manifest["cnf"])
    if base_append.sha256(root_cnf) != root_manifest.get("cnf_sha256"):
        raise ValueError("root CNF hash mismatch")

    root_validation_path = args.root_validation.resolve()
    root_validation = json.loads(root_validation_path.read_text())
    if root_validation.get("status") != "PASS":
        raise ValueError("root lazy-chain validation did not return PASS")
    if root_validation.get("terminal_manifest_sha256") != root_manifest_sha:
        raise ValueError("root lazy-chain validation authenticates another manifest")
    if root_validation.get("terminal_cnf_sha256") != root_manifest.get("cnf_sha256"):
        raise ValueError("root lazy-chain validation authenticates another CNF")

    report = {
        "schema": "p97-rigid221-exact17-weighted-dihedral-chain-validation-v1",
        "status": "PASS",
        "terminal_manifest": str(args.terminal_manifest.resolve().relative_to(REPO)),
        "terminal_manifest_sha256": base_append.sha256(args.terminal_manifest.resolve()),
        "dihedral_edges": edges,
        "validated_dihedral_edges": len(edges),
        "root_manifest": str(current.relative_to(REPO)),
        "root_manifest_sha256": root_manifest_sha,
        "root_cnf_sha256": root_manifest["cnf_sha256"],
        "root_validation": str(root_validation_path.relative_to(REPO)),
        "root_validation_sha256": base_append.sha256(root_validation_path),
        "validator_sha256": base_append.sha256(Path(__file__).resolve()),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "PASS",
        "validated_dihedral_edges": len(edges),
        "terminal_manifest_sha256": report["terminal_manifest_sha256"],
        "root_manifest_sha256": root_manifest_sha,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
