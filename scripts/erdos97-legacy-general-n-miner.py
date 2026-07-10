#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine reusable theorem statements from the legacy ``erdos/97`` N9 repo.

The legacy project is dominated by fixed-nine packets and certificate rows.
This audit separates those declarations from statements that are genuinely
uniform over an ambient set, a bounded tuple of plane points, or scalar
polynomial data. It then compares all public candidates with every current P97
module so migrated declarations are not reported as novel.

This is a source audit. ``source-proved`` means no source ``sorry``/``admit``
token occurs in the declaration body; representative novel results still need
a fresh build and kernel audit before use.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import re
import sys
import tomllib
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from types import ModuleType


CANDIDATE_CATEGORIES = {
    "ambient-n",
    "ambient-set-uniform",
    "checker-soundness-uniform",
    "metric-point-uniform",
    "scalar-algebra-uniform",
    "type-uniform-utility",
}

N9_TIED_RE = re.compile(r"\bN9(?!Point\b)[A-Za-z0-9_']+")
N9_LOCAL_RE = re.compile(r"\bn9[A-Za-z0-9_']+")
FALSE_RE = re.compile(r":\s*False\s*$")


@dataclass(frozen=True)
class Declaration:
    path: str
    module: str
    line: int
    kind: str
    name: str
    fq_name: str
    private: bool
    statement: str
    shape: str
    family: str
    source_reachable: bool
    category: str
    proof_status: str
    local_exact_name: bool
    local_shape_match: bool


def load_shared_miner() -> ModuleType:
    path = Path(__file__).with_name("p97-rvol-general-n-miner.py")
    spec = importlib.util.spec_from_file_location("p97_rvol_general_n_miner", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load shared source parser: {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


SHARED = load_shared_miner()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--source-repo", type=Path, default=Path.home() / "projects/math-projects/erdos/97"
    )
    parser.add_argument("--local-repo", type=Path, default=Path.cwd())
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/erdos97_legacy_general_n_mining.json"),
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path("certificates/erdos97_legacy_general_n_mining.md"),
    )
    return parser.parse_args()


def module_name(lean_root: Path, path: Path) -> str:
    return ".".join(path.relative_to(lean_root).with_suffix("").parts)


def project_sources(lean_root: Path) -> list[Path]:
    return sorted(
        path
        for path in lean_root.rglob("*.lean")
        if ".lake" not in path.relative_to(lean_root).parts
    )


def lake_roots(source_repo: Path) -> list[str]:
    with (source_repo / "lean" / "lakefile.toml").open("rb") as handle:
        config = tomllib.load(handle)
    roots: list[str] = []
    for library in config.get("lean_lib", []):
        roots.extend(str(root) for root in library.get("roots", []))
    return roots


def source_import_closure(lean_root: Path, roots: list[str]) -> set[str]:
    module_paths = {
        module_name(lean_root, path): path for path in project_sources(lean_root)
    }
    reachable: set[str] = set()
    pending = list(roots)
    while pending:
        module = pending.pop()
        if module in reachable or module not in module_paths:
            continue
        reachable.add(module)
        text = module_paths[module].read_text(encoding="utf-8", errors="replace")
        for line in text.splitlines():
            match = SHARED.IMPORT_RE.match(line)
            if match is None:
                continue
            for imported in match.group(1).split():
                if imported in module_paths and imported not in reachable:
                    pending.append(imported)
    return reachable


def fixed_nine_statement(statement: str, name: str) -> bool:
    theorem_type = re.sub(rf"\b{re.escape(name)}\b", "<DECL>", statement, count=1)
    return bool(
        N9_TIED_RE.search(theorem_type)
        or N9_LOCAL_RE.search(theorem_type)
        or re.search(r"\bFin\s+9\b", theorem_type)
        or re.search(r"\.card\s*=\s*9\b", theorem_type)
    )


def classify(statement: str, kind: str, name: str) -> str:
    if kind not in {"theorem", "lemma"}:
        return "definition"
    if fixed_nine_statement(statement, name):
        return "n9-interface"
    if re.search(r"[({]\s*(?:n|N)\s*:\s*(?:Nat|\u2115)\b", statement) and re.search(
        r"\b(?:Fin\s+(?:n|N)|card|Fintype|range)\b", statement
    ):
        return "ambient-n"
    if re.search(r"\b(?:Finset|Set)\s+N9Point\b", statement):
        return "ambient-set-uniform"
    if (
        "unitIdealCertChecker" in statement
        or "SparsePoly" in statement
        or re.search(r"\beval\s+\w+", statement)
    ) and re.search(r"(?:Nat|\u2115)\s*\u2192\s*(?:Real|\u211d)", statement):
        return "checker-soundness-uniform"
    if "N9Point" in statement or re.search(
        r"(?:\u211d\s*\u00d7\s*\u211d|EuclideanSpace\s+\u211d\s*\(Fin\s+2\))",
        statement,
    ):
        return "metric-point-uniform"
    if re.search(r"[({][^)]*:\s*(?:Real|\u211d)\b", statement) and (
        FALSE_RE.search(statement) or "=" in statement or "\u2260" in statement
    ):
        return "scalar-algebra-uniform"
    if re.search(r"[({]\s*[A-Za-z_]\w*\s*:\s*Type", statement):
        return "type-uniform-utility"
    return "fixed-or-utility"


def file_family(stem: str) -> str:
    for prefix in (
        "N9Dim0FiniteRow",
        "N9Msolve1457",
        "N9Residual",
        "N9FourPoint",
        "N9Closure",
        "N9Geometry",
        "N9StructuralReduction",
        "N9Certificates",
    ):
        if stem.startswith(prefix):
            return prefix
    if stem.startswith("tmp") or stem.startswith("rest_"):
        return "scratch"
    return "other"


def is_false_conclusion(statement: str) -> bool:
    return bool(FALSE_RE.search(statement))


def grouped_candidates(declarations: list[Declaration]) -> list[dict[str, object]]:
    groups: dict[tuple[str, str, str], list[Declaration]] = defaultdict(list)
    for row in declarations:
        if row.private or row.category not in CANDIDATE_CATEGORIES:
            continue
        groups[(row.family, row.category, row.shape)].append(row)
    result: list[dict[str, object]] = []
    for (family, category, shape), members in groups.items():
        representative = min(members, key=lambda row: (row.path, row.line))
        result.append(
            {
                "family": family,
                "category": category,
                "shape": shape,
                "instances": len(members),
                "all_source_proved": all(
                    row.proof_status == "source-proved" for row in members
                ),
                "any_source_reachable": any(row.source_reachable for row in members),
                "any_local_exact_name": any(row.local_exact_name for row in members),
                "any_local_shape_match": any(row.local_shape_match for row in members),
                "representative": asdict(representative),
                "members": [
                    {
                        "path": row.path,
                        "line": row.line,
                        "fq_name": row.fq_name,
                    }
                    for row in sorted(members, key=lambda item: (item.path, item.line))
                ],
            }
        )
    return sorted(
        result,
        key=lambda row: (
            row["any_local_exact_name"] or row["any_local_shape_match"],
            not row["all_source_proved"],
            not row["any_source_reachable"],
            row["family"],
            row["category"],
        ),
    )


def scan(source_repo: Path, local_repo: Path) -> tuple[list[Declaration], dict[str, object]]:
    source_root = source_repo / "lean"
    local_root = local_repo / "lean" / "Erdos9796Proof" / "P97"
    roots = lake_roots(source_repo)
    reachable = source_import_closure(source_root, roots)
    source_paths = project_sources(source_root)

    parsed_rows: list[tuple[Path, str, str, list[object]]] = []
    source_names: set[str] = set()
    source_shapes: set[str] = set()
    for path in source_paths:
        module = module_name(source_root, path)
        relative = str(path.relative_to(source_repo))
        parsed = SHARED.declaration_headers(path)
        parsed_rows.append((path, module, relative, parsed))
        for declaration in parsed:
            source_names.add(declaration.fq_name)
            source_shapes.add(
                SHARED.normalized_shape(declaration.statement, declaration.name)
            )

    local_names, local_shapes, _ = SHARED.local_inventory(
        local_root, source_names, source_shapes
    )
    declarations: list[Declaration] = []
    modules: list[dict[str, object]] = []
    for path, module, relative, parsed in parsed_rows:
        modules.append(
            {
                "path": relative,
                "module": module,
                "bytes": path.stat().st_size,
                "family": file_family(path.stem),
                "source_reachable": module in reachable,
                "lake_root": module in roots,
                "declarations": len(parsed),
            }
        )
        for declaration in parsed:
            shape = SHARED.normalized_shape(declaration.statement, declaration.name)
            code = SHARED.strip_comments(declaration.body)
            if declaration.kind in {"theorem", "lemma"}:
                proof_status = (
                    "has-sorry" if SHARED.SORRY_RE.search(code) else "source-proved"
                )
            else:
                proof_status = "declaration"
            declarations.append(
                Declaration(
                    path=relative,
                    module=module,
                    line=declaration.line,
                    kind=declaration.kind,
                    name=declaration.name,
                    fq_name=declaration.fq_name,
                    private=declaration.private,
                    statement=declaration.statement,
                    shape=shape,
                    family=file_family(path.stem),
                    source_reachable=module in reachable,
                    category=classify(
                        declaration.statement, declaration.kind, declaration.name
                    ),
                    proof_status=proof_status,
                    local_exact_name=declaration.fq_name in local_names,
                    local_shape_match=shape in local_shapes,
                )
            )
    return declarations, {"modules": modules, "lake_roots": roots}


def candidate_rows(declarations: list[Declaration]) -> list[Declaration]:
    return [
        row
        for row in declarations
        if not row.private and row.category in CANDIDATE_CATEGORIES
    ]


def novel_rows(declarations: list[Declaration]) -> list[Declaration]:
    return [
        row
        for row in candidate_rows(declarations)
        if not row.local_exact_name and not row.local_shape_match
    ]


def summary(declarations: list[Declaration], metadata: dict[str, object]) -> dict[str, object]:
    candidates = candidate_rows(declarations)
    novel = novel_rows(declarations)
    return {
        "source_modules": len(metadata["modules"]),
        "lake_root_modules": len(metadata["lake_roots"]),
        "source_reachable_modules": sum(
            bool(row["source_reachable"]) for row in metadata["modules"]
        ),
        "declarations": len(declarations),
        "theorems_and_lemmas": sum(
            row.kind in {"theorem", "lemma"} for row in declarations
        ),
        "source_has_sorry": sum(row.proof_status == "has-sorry" for row in declarations),
        "candidate_instances": len(candidates),
        "candidate_source_proved": sum(
            row.proof_status == "source-proved" for row in candidates
        ),
        "candidate_exact_name_matches": sum(row.local_exact_name for row in candidates),
        "candidate_shape_matches": sum(row.local_shape_match for row in candidates),
        "novel_candidate_instances": len(novel),
        "novel_source_proved": sum(row.proof_status == "source-proved" for row in novel),
        "novel_contradiction_consumers": sum(
            row.proof_status == "source-proved" and is_false_conclusion(row.statement)
            for row in novel
        ),
        "categories": dict(sorted(Counter(row.category for row in declarations).items())),
    }


def family_summary(
    declarations: list[Declaration], metadata: dict[str, object]
) -> list[dict[str, object]]:
    counts: dict[str, Counter[str]] = defaultdict(Counter)
    for module in metadata["modules"]:
        family = str(module["family"])
        counts[family]["modules"] += 1
        counts[family]["reachable_modules"] += int(bool(module["source_reachable"]))
        counts[family]["bytes"] += int(module["bytes"])
    for row in declarations:
        family = row.family
        counts[family]["declarations"] += 1
        if not row.private and row.category in CANDIDATE_CATEGORIES:
            counts[family]["candidates"] += 1
            counts[family]["novel_candidates"] += int(
                not row.local_exact_name and not row.local_shape_match
            )
            counts[family]["novel_false"] += int(
                not row.local_exact_name
                and not row.local_shape_match
                and row.proof_status == "source-proved"
                and is_false_conclusion(row.statement)
            )
    return [
        {"family": family, **dict(values)}
        for family, values in sorted(
            counts.items(), key=lambda item: (-item[1]["novel_candidates"], item[0])
        )
    ]


def write_json(
    path: Path,
    declarations: list[Declaration],
    metadata: dict[str, object],
    groups: list[dict[str, object]],
) -> None:
    payload = {
        "schema": "erdos97_legacy_general_n_mining.v1",
        "scope": {
            "source_root": "~/projects/math-projects/erdos/97/lean",
            "local_root": "lean/Erdos9796Proof/P97",
            "note": "Source audit; N9-interface declarations are excluded from general-n candidates.",
        },
        "summary": summary(declarations, metadata),
        "families": family_summary(declarations, metadata),
        "modules": metadata["modules"],
        "candidate_groups": groups,
        "candidate_declarations": [asdict(row) for row in candidate_rows(declarations)],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def write_markdown(
    path: Path,
    declarations: list[Declaration],
    metadata: dict[str, object],
    groups: list[dict[str, object]],
) -> None:
    totals = summary(declarations, metadata)
    families = family_summary(declarations, metadata)
    novel = sorted(novel_rows(declarations), key=lambda row: (row.path, row.line))
    novel_false = [
        row
        for row in novel
        if row.proof_status == "source-proved" and is_false_conclusion(row.statement)
    ]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Legacy erdos/97 General-n Source Census",
        "",
        "Generated by `scripts/erdos97-legacy-general-n-miner.py`. Explicit",
        "`N9Config`, `N9Vertex`, and other fixed-nine interfaces are excluded from",
        "the general-n candidate count even when their proof uses a bounded local",
        "configuration.",
        "",
        "## Summary",
        "",
        f"- Lean modules: {totals['source_modules']:,}",
        f"- Lake-root/import-reachable modules: {totals['source_reachable_modules']:,}",
        f"- Theorems and lemmas: {totals['theorems_and_lemmas']:,}",
        f"- General-n/local-uniform candidates: {totals['candidate_instances']:,}",
        f"- Exact-name matches already here: {totals['candidate_exact_name_matches']:,}",
        f"- Statement-shape matches already here: {totals['candidate_shape_matches']:,}",
        f"- Novel candidate instances: {totals['novel_candidate_instances']:,}",
        f"- Novel source-proved candidates: {totals['novel_source_proved']:,}",
        f"- Novel contradiction consumers: {totals['novel_contradiction_consumers']:,}",
        f"- Deduplicated candidate shapes: {len(groups):,}",
        "",
        "## Families",
        "",
        "| Family | Modules | Reachable | MiB | Declarations | Candidates | Novel | Novel `False` |",
        "|---|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in families:
        lines.append(
            f"| `{row['family']}` | {row.get('modules', 0):,} | "
            f"{row.get('reachable_modules', 0):,} | "
            f"{row.get('bytes', 0) / (1024 * 1024):.1f} | "
            f"{row.get('declarations', 0):,} | {row.get('candidates', 0):,} | "
            f"{row.get('novel_candidates', 0):,} | {row.get('novel_false', 0):,} |"
        )
    lines.extend(
        [
            "",
            "## Novel Contradiction Consumers",
            "",
        ]
    )
    if novel_false:
        for row in novel_false:
            lines.append(f"- `{row.path}:{row.line}` `{row.fq_name}`")
    else:
        lines.append("None.")
    lines.extend(
        [
            "",
            "## Complete Data",
            "",
            "The JSON companion contains every candidate statement, normalized",
            "shape, source path, proof-status classification, and current-repo",
            "name/shape match.",
        ]
    )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    declarations, metadata = scan(args.source_repo.resolve(), args.local_repo.resolve())
    groups = grouped_candidates(declarations)
    write_json(args.json_out, declarations, metadata, groups)
    write_markdown(args.markdown_out, declarations, metadata, groups)
    print(json.dumps(summary(declarations, metadata), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
