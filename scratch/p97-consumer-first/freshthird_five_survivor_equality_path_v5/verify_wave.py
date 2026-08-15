"""Independent artifact and equality-closure verifier for v5."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parent


def load_wave() -> Any:
    path = ROOT / "run_wave.py"
    spec = importlib.util.spec_from_file_location(
        "freshthird_equality_v5_verify_import", path
    )
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot import run_wave.py")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


W = load_wave()


def semantic_to_flat(value: dict[str, Any]) -> dict[str, int | bool]:
    model: dict[str, int | bool] = {
        name: int(slot) for name, slot in value["roles"].items()
    }
    for row in W.V2.ROWS:
        support = set(value["rows"][row])
        model.update({W.V2.sym(row, i): i in support for i in W.POINTS})
    return model


class DSU:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        a, b = self.find(left), self.find(right)
        if a != b:
            self.parent[max(a, b)] = min(a, b)


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("diagonal distance")
    return min(a, b), max(a, b)


def independent_conflicts(model: dict[str, int | bool]) -> list[dict[str, Any]]:
    """Second implementation: union-find, not runner BFS/provenance code."""
    dsu = DSU()
    supports: dict[str, set[int]] = {}
    for row, center_role in W.ROW_CENTERS.items():
        center = int(model[center_role])
        support = {i for i in W.POINTS if model[W.V2.sym(row, i)] is True}
        if len(support) != 4 or center in support:
            raise ValueError(f"bad support for {row}")
        supports[row] = support
        distances = [edge(center, p) for p in sorted(support)]
        for item in distances[1:]:
            dsu.union(distances[0], item)
    result: list[dict[str, Any]] = []
    for row, center_role in sorted(W.EXACT_ROWS.items()):
        center = int(model[center_role])
        for member in sorted(supports[row]):
            for outsider in W.POINTS:
                if (
                    outsider != center
                    and outsider not in supports[row]
                    and dsu.find(edge(center, member))
                    == dsu.find(edge(center, outsider))
                ):
                    result.append(
                        {"exact_row": row, "member": member, "excluded": outsider}
                    )
    return result


def verify_journal() -> list[str]:
    errors: list[str] = []
    previous = "0" * 64
    for line_number, line in enumerate(
        (ROOT / "journal.jsonl").read_text().splitlines(), 1
    ):
        record = json.loads(line)
        digest = record.pop("record_sha256", None)
        if record.get("previous_sha256") != previous:
            errors.append(f"journal line {line_number}: chain predecessor mismatch")
        expected = hashlib.sha256(W.canonical_json(record).encode()).hexdigest()
        if digest != expected:
            errors.append(f"journal line {line_number}: record hash mismatch")
        previous = str(digest)
    return errors


def verify_checksums() -> list[str]:
    errors: list[str] = []
    for line in (ROOT / "SHA256SUMS").read_text().splitlines():
        digest, relative = line.split("  ", 1)
        path = ROOT / relative
        if not path.is_file() or W.sha256_file(path) != digest:
            errors.append(f"checksum mismatch: {relative}")
    return errors


def verify() -> list[str]:
    errors = verify_journal()
    results = json.loads((ROOT / "results.json").read_text())
    manifest = json.loads((ROOT / "manifest.json").read_text())
    if manifest.get("scope") != "finite exact-17 structural support model only":
        errors.append("scope is not finite exact-17")
    if len(results.get("tags", [])) != 8:
        errors.append("result does not cover eight tags")
    for smt_path in ROOT.glob("artifacts/**/*.smt2"):
        if smt_path.read_text().count("(check-sat)") != 1:
            errors.append(f"not exactly one check-sat: {smt_path.relative_to(ROOT)}")
    for tag_result in results.get("tags", []):
        tag = next(
            (
                candidate
                for candidate in W.V2.TAGS
                if candidate.name == tag_result["tag"]
            ),
            None,
        )
        if tag is None:
            errors.append(f"unknown tag {tag_result['tag']}")
            continue
        if tag_result["classification"] == "DUAL_SAT_VALIDATED_EQUALITY_CLEAN":
            for solver in ("z3", "cvc5"):
                model = semantic_to_flat(tag_result[f"{solver}_model"])
                structural = W.validate_structural(tag, model)
                if structural:
                    errors.append(
                        f"{tag.name}/{solver}: structural validation {structural}"
                    )
                conflicts = independent_conflicts(model)
                if conflicts:
                    errors.append(
                        f"{tag.name}/{solver}: independent closure conflict {conflicts[0]}"
                    )
        elif tag_result["classification"] != "DUAL_UNSAT_EQUALITY_PATH_FINITE_TAG":
            errors.append(
                f"nonterminal classification {tag.name}: {tag_result['classification']}"
            )
        for cut in tag_result.get("cuts", []):
            iteration = int(cut["candidate_iteration"])
            solver = cut["discovery_solver"]
            model_path = (
                ROOT
                / "artifacts"
                / tag.name
                / f"candidate_{iteration:03d}.{solver}.model.json"
            )
            if not model_path.is_file():
                errors.append(f"missing source model for {cut['cut_id']}")
                continue
            model = semantic_to_flat(json.loads(model_path.read_text()))
            cut_errors = W.validate_cut(cut, model)
            if cut_errors:
                errors.append(f"{cut['cut_id']}: {cut_errors}")
            for atom_index in range(len(cut["source_atoms"])):
                dropped = dict(cut)
                dropped["source_atoms"] = (
                    cut["source_atoms"][:atom_index]
                    + cut["source_atoms"][atom_index + 1 :]
                )
                if not W.validate_cut(dropped, model):
                    errors.append(
                        f"{cut['cut_id']}: drop-one atom {atom_index} still accepted"
                    )
            if any(
                atom["kind"] == "support"
                and not atom["value"]
                and atom["name"] not in W.EXACT_ROWS
                for atom in cut["source_atoms"]
            ):
                errors.append(f"{cut['cut_id']}: non-exact offsupport atom")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checksums", action="store_true")
    args = parser.parse_args()
    errors = verify()
    if args.checksums:
        errors.extend(verify_checksums())
    if errors:
        print("FAIL")
        for error in errors[:50]:
            print(error)
        return 1
    print(
        "PASS: eight tags, structural models, equality closure, cut provenance, journal, and SMT shape verified"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
