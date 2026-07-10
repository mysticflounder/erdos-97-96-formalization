#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Inventory certificate-bank declarations with potentially general-n statements.

This is a source audit, not a Lean parser and not a proof checker.  It keeps the
classification deliberately conservative and records enough source context for
every candidate to be reviewed against the elaborated Lean declaration.
"""

from __future__ import annotations

import argparse
import fnmatch
import hashlib
import json
import re
import tomllib
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path


DECL_RE = re.compile(
    r"^\s*(?:(?:private|protected|noncomputable)\s+)*"
    r"(?P<kind>theorem|lemma|def|abbrev|structure|class|inductive)\s+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)"
)
IMPORT_RE = re.compile(r"^\s*import\s+(.+?)\s*$")
ROW_ID_RE = re.compile(r"\b(?:EpQ\d+|R\d+[A-Za-z0-9_]*|P\d{4,})\b")
STRING_RE = re.compile(r'"(?:[^"\\]|\\.)*"')
NUMBER_RE = re.compile(r"\b\d+\b")
SPACE_RE = re.compile(r"\s+")
JSON_REF_RE = re.compile(r"certificates/[A-Za-z0-9_./-]+\.json")
JSON_SCHEMA_RE = re.compile(r'"schema"\s*:\s*"([^"]+)"')
LEAN_SCHEMA_REF_RE = re.compile(r"\b[A-Za-z0-9_.-]+\.v[0-9]+\b")
N_METADATA_KEY_RE = re.compile(
    r'"(n|n_min|n_max|n_values|loaded_ns|loadedNs|terminal_n|terminalN|'
    r'first_seen_n|last_seen_n)"\s*:'
)

BANK_PATH_MARKERS = (
    "Certificate",
    "Bank",
    "Census",
    "DFS",
    "Enumerator",
    "Generated",
    "Inventory",
)
GENERATED_AUDIT_JSON_NAMES = {
    "general_n_bank_mining.json",
    "grouped_relaxed_general_n_mining.json",
}


@dataclass(frozen=True)
class Declaration:
    path: str
    line: int
    kind: str
    name: str
    statement: str
    bank: str
    source_status: str
    blueprint_skipped: bool
    category: str
    fixed_cardinality: bool
    shape: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument(
        "--json-out", type=Path, default=Path("certificates/general_n_bank_mining.json")
    )
    parser.add_argument(
        "--markdown-out", type=Path, default=Path("certificates/general_n_bank_mining.md")
    )
    return parser.parse_args()


def module_name(repo: Path, path: Path) -> str | None:
    lean_root = repo / "lean"
    try:
        relative = path.relative_to(lean_root)
    except ValueError:
        return None
    return ".".join(relative.with_suffix("").parts)


def live_import_closure(repo: Path) -> set[str]:
    lean_root = repo / "lean"
    module_paths = {
        module: path
        for path in lean_root.rglob("*.lean")
        if (module := module_name(repo, path)) is not None
    }
    reachable: set[str] = set()
    pending = ["Erdos9796"]
    while pending:
        module = pending.pop()
        if module in reachable or module not in module_paths:
            continue
        reachable.add(module)
        text = module_paths[module].read_text(encoding="utf-8", errors="replace")
        for line in text.splitlines():
            match = IMPORT_RE.match(line)
            if match is None:
                continue
            for imported in match.group(1).split():
                if imported in module_paths and imported not in reachable:
                    pending.append(imported)
    return reachable


def mining_skip_patterns(repo: Path) -> list[str]:
    with (repo / ".blueprint.toml").open("rb") as handle:
        config = tomllib.load(handle)
    return list(config.get("mining", {}).get("skip", []))


def is_blueprint_skipped(module: str | None, patterns: list[str]) -> bool:
    return module is not None and any(fnmatch.fnmatchcase(module, pattern) for pattern in patterns)


def bank_name(repo: Path, path: Path) -> str:
    relative = path.relative_to(repo)
    parts = relative.parts
    if parts[0] == "attic":
        if len(parts) > 1 and parts[1] == "surplus-certificate-legacy-2026-07-09":
            return "attic-legacy-surplus-endpoint"
        return "attic-other"
    joined = "/".join(parts)
    if "/EndpointCertificate/" in joined:
        return "endpoint"
    if "/SurplusCertificate/" in joined:
        return "surplus"
    if "/MultiCenter/Certificate/" in joined:
        return "multi-center"
    if path.name == "ErasedPinCountRows.lean":
        return "erased-pin-count-rows"
    if path.name == "ErasedPinOrderedProducer.lean":
        return "erased-pin-ordered-producer"
    if "Census554" in joined:
        return "census-554"
    if "FixedSeedDFS" in joined:
        return "fixed-seed-dfs"
    if "Bank" in path.name:
        return "other-live-bank"
    return "other-live-certificate"


def bank_file(repo: Path, path: Path) -> bool:
    relative = path.relative_to(repo)
    if relative.parts[0] == "attic":
        return True
    if any(marker in part for marker in BANK_PATH_MARKERS for part in relative.parts):
        return True
    try:
        with path.open("r", encoding="utf-8", errors="replace") as handle:
            head = handle.read(8192)
    except OSError:
        return False
    return bool(
        re.search(r"\b(?:certificate|bank|census)\b", head, re.IGNORECASE)
        or re.search(r"generated by `?scripts/", head, re.IGNORECASE)
    )


def declaration_headers(path: Path) -> list[tuple[int, str, str, str]]:
    text = path.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines()
    declarations: list[tuple[int, str, str, str]] = []
    for index, line in enumerate(lines):
        match = DECL_RE.match(line)
        if match is None:
            continue
        header_lines = [line.strip()]
        for continuation in lines[index + 1 : index + 121]:
            if ":=" in " ".join(header_lines) or continuation.strip() == "by":
                break
            if DECL_RE.match(continuation):
                break
            header_lines.append(continuation.strip())
            if ":=" in continuation or continuation.strip().endswith(" where"):
                break
        statement = SPACE_RE.sub(" ", " ".join(header_lines)).strip()
        statement = statement.split(":=", maxsplit=1)[0].strip()
        declarations.append((index + 1, match.group("kind"), match.group("name"), statement))
    return declarations


def has_fixed_cardinality(statement: str) -> bool:
    patterns = (
        r"\b(?:A|S)\.card\s*[=<>]\s*\d+",
        r"\bcard\s+(?:A|S)\s*[=<>]\s*\d+",
        r"\bcard_eq_(?:nine|ten|eleven|twelve|\d+)\b",
        r"\b(?:n|N)\s*=\s*\d+",
    )
    return any(re.search(pattern, statement) for pattern in patterns)


def is_generated_row_path(path: str) -> bool:
    markers = (
        "/TermShards/",
        "/BlockZeros/",
        "/DirectGeneratorZeros/",
        "/ProductBlockZeros/",
        "/RowZeros/Direct/",
        "/RowZeros/Product/",
    )
    if any(marker in path for marker in markers):
        return not path.endswith("/All.lean")
    name = Path(path).name
    return bool(
        re.fullmatch(r"EpQ\d+(?:Generators)?\.lean", name)
        or re.fullmatch(r"R\d+[A-Za-z0-9_]*(?:Generators)?\.lean", name)
    )


def classify(statement: str, kind: str, bank: str, path: str) -> str:
    if kind not in {"theorem", "lemma"}:
        return "definition"

    ambient_set = bool(
        re.search(r"[({]\s*A\s*:\s*Finset\s+(?:\(?(?:Real|ℝ)\s*[×x]\s*(?:Real|ℝ)\)?|ℝ²)", statement)
    )
    n_binder = bool(re.search(r"[({]\s*(?:n|N)\s*:\s*(?:Nat|ℕ)\b", statement))
    n_semantics = bool(
        re.search(
            r"profileOccursAtN|[Ss]tabiliz|[Ii]nventory|\.card|\bcard\b|Fin\s+(?:n|N)\b|"
            r"(?:n|N)\s*[≤<]|[≤<]\s*(?:n|N)\b",
            statement,
        )
    )
    profile_uniform = bool(
        ("JointProfile" in statement and re.search(
            r"[({]\s*profile\s*:\s*JointProfile|threshold\s*:\s*(?:Nat|ℕ)", statement
        ))
        or re.search(
            r"\b(?:FiniteCodeWitnesses|CoversL2FullLocalModuloFrom|CompletesL2FullFrom)\b",
            statement,
        )
    )
    geometry_uniform = ambient_set and not has_fixed_cardinality(statement)
    checker_uniform = bool(
        re.search(r"\b(?:Certificate|Poly|ComputedProductBlock)\b", statement)
        and re.search(r"(?:ν\s*:\s*Nat\s*→\s*ℝ|cert\s*:\s*Certificate|products\s*:\s*List\s+Poly)", statement)
    )
    valuation_soundness = bool(
        checker_uniform and "evalPoly" in statement and re.search(r":\s*False\b", statement)
    )
    local_geometry = bool(
        "pointOf" in statement
        and (
            "centerClass" in statement
            or "EndpointMetricShadow" in statement
            or "shadowOfPointClasses" in statement
        )
    )
    abstract_shadow = bool(
        re.search(
            r"\b(?:OneSidedSeedCandidateRemainder|Shadow|"
            r"isValidOneSidedSeed(?:RelaxedShape)?Shadow|"
            r"fragmentShadowAcceptedBySearch)\b",
            statement,
        )
        and not has_fixed_cardinality(statement)
    )
    row_local = bool(ROW_ID_RE.search(statement) or re.search(r'"s[123]_\d+"', statement))

    if n_binder and n_semantics:
        return "ambient-n"
    if profile_uniform:
        return "profile-uniform"
    if geometry_uniform:
        return "ambient-set-uniform"
    if bank == "attic-legacy-surplus-endpoint":
        return "legacy-fixed-row-expansion"
    if abstract_shadow:
        return "abstract-shadow-uniform"
    if valuation_soundness:
        return "valuation-soundness-uniform"
    if is_generated_row_path(path):
        return "fixed-row-certificate-schema"
    if local_geometry and row_local:
        return "row-local-geometry-schema"
    if local_geometry:
        return "local-geometry-uniform"
    if checker_uniform:
        return "checker-schema"
    return "fixed-or-utility"


def normalized_shape(statement: str, name: str) -> str:
    shape = ROW_ID_RE.sub("<ROW>", statement)
    shape = re.sub(rf"\b{re.escape(name)}\b", "<DECL>", shape, count=1)
    shape = STRING_RE.sub('"<STRING>"', shape)
    shape = NUMBER_RE.sub("<NUM>", shape)
    shape = SPACE_RE.sub(" ", shape).strip()
    digest = hashlib.sha256(shape.encode()).hexdigest()[:16]
    return digest


def scan(repo: Path) -> tuple[list[Declaration], dict[str, dict[str, int]]]:
    patterns = mining_skip_patterns(repo)
    imported_modules = live_import_closure(repo)
    roots = [repo / "lean" / "Erdos9796Proof" / "P97", repo / "attic"]
    declarations: list[Declaration] = []
    file_counts: dict[str, Counter[str]] = defaultdict(Counter)

    for root in roots:
        if not root.exists():
            continue
        for path in root.rglob("*.lean"):
            if not bank_file(repo, path):
                continue
            bank = bank_name(repo, path)
            module = module_name(repo, path)
            if path.is_relative_to(repo / "attic"):
                source_status = "attic-only"
            elif module in imported_modules:
                source_status = "live-imported"
            else:
                source_status = "live-unimported"
            skipped = is_blueprint_skipped(module, patterns)
            file_counts[bank]["files"] += 1
            file_counts[bank]["bytes"] += path.stat().st_size
            file_counts[bank]["blueprint_skipped_files"] += int(skipped)
            file_counts[bank]["live_unimported_files"] += int(
                source_status == "live-unimported"
            )
            for line, kind, name, statement in declaration_headers(path):
                relative_path = str(path.relative_to(repo))
                category = classify(statement, kind, bank, relative_path)
                declarations.append(
                    Declaration(
                        path=relative_path,
                        line=line,
                        kind=kind,
                        name=name,
                        statement=statement,
                        bank=bank,
                        source_status=source_status,
                        blueprint_skipped=skipped,
                        category=category,
                        fixed_cardinality=has_fixed_cardinality(statement),
                        shape=normalized_shape(statement, name),
                    )
                )
                file_counts[bank]["declarations"] += 1
                file_counts[bank][category] += 1
    return declarations, {key: dict(value) for key, value in file_counts.items()}


def candidate_groups(declarations: list[Declaration]) -> list[dict[str, object]]:
    candidates = [
        declaration
        for declaration in declarations
        if declaration.category
        in {
            "ambient-n",
            "profile-uniform",
            "ambient-set-uniform",
            "abstract-shadow-uniform",
            "valuation-soundness-uniform",
            "local-geometry-uniform",
            "row-local-geometry-schema",
        }
    ]
    grouped: dict[tuple[str, str, str], list[Declaration]] = defaultdict(list)
    for declaration in candidates:
        grouped[(declaration.bank, declaration.category, declaration.shape)].append(declaration)

    result: list[dict[str, object]] = []
    for (bank, category, shape), group in grouped.items():
        representative = min(group, key=lambda item: (item.path, item.line))
        result.append(
            {
                "bank": bank,
                "category": category,
                "shape": shape,
                "instances": len(group),
                "source_statuses": sorted({item.source_status for item in group}),
                "blueprint_skipped": any(item.blueprint_skipped for item in group),
                "representative": asdict(representative),
                "members": [
                    {"path": item.path, "line": item.line, "name": item.name}
                    for item in sorted(group, key=lambda item: (item.path, item.line))
                ],
            }
        )
    return sorted(
        result,
        key=lambda item: (
            (
                0
                if item["source_statuses"] == ["attic-only"]
                else 1
                if item["source_statuses"] == ["live-unimported"]
                else 2
            ),
            0 if item["blueprint_skipped"] else 1,
            item["bank"],
            item["category"],
            -int(item["instances"]),
            item["representative"]["name"],
        ),
    )


def live_unimported_file_inventory(
    declarations: list[Declaration],
) -> list[dict[str, object]]:
    candidate_categories = {
        "ambient-n",
        "profile-uniform",
        "ambient-set-uniform",
        "abstract-shadow-uniform",
        "valuation-soundness-uniform",
        "local-geometry-uniform",
        "row-local-geometry-schema",
    }
    grouped: dict[str, list[Declaration]] = defaultdict(list)
    for declaration in declarations:
        if declaration.source_status == "live-unimported":
            grouped[declaration.path].append(declaration)
    return [
        {
            "path": path,
            "bank": rows[0].bank,
            "declarations": len(rows),
            "candidate_instances": sum(
                declaration.category in candidate_categories for declaration in rows
            ),
        }
        for path, rows in sorted(grouped.items())
    ]


def lean_json_references(repo: Path) -> tuple[set[str], set[str]]:
    path_references: set[str] = set()
    schema_references: set[str] = set()
    for path in (repo / "lean").rglob("*.lean"):
        text = path.read_text(encoding="utf-8", errors="replace")
        path_references.update(JSON_REF_RE.findall(text))
        schema_references.update(LEAN_SCHEMA_REF_RE.findall(text))
    return path_references, schema_references


def raw_json_inventory(repo: Path, excluded_paths: set[Path]) -> dict[str, object]:
    path_references, schema_references = lean_json_references(repo)
    area_counts: dict[str, Counter[str]] = defaultdict(Counter)
    n_metadata_artifacts: list[dict[str, object]] = []
    unannotated_artifacts: list[dict[str, object]] = []

    for path in (repo / "certificates").rglob("*.json"):
        if path.resolve() in excluded_paths or path.name in GENERATED_AUDIT_JSON_NAMES:
            continue
        relative = str(path.relative_to(repo))
        area = path.relative_to(repo / "certificates").parts[0]
        size = path.stat().st_size
        with path.open("r", encoding="utf-8", errors="replace") as handle:
            prefix = handle.read(262144)
        schema_match = JSON_SCHEMA_RE.search(prefix)
        schema = schema_match.group(1) if schema_match is not None else None
        n_keys = sorted(set(N_METADATA_KEY_RE.findall(prefix)))
        path_mentioned = relative in path_references
        schema_mentioned = schema is not None and schema in schema_references
        lean_annotation_connected = path_mentioned or schema_mentioned
        artifact = {
            "path": relative,
            "bytes": size,
            "schema": schema,
            "n_metadata_keys": n_keys,
            "lean_path_mentioned": path_mentioned,
            "lean_schema_mentioned": schema_mentioned,
            "lean_annotation_connected": lean_annotation_connected,
        }

        area_counts[area]["files"] += 1
        area_counts[area]["bytes"] += size
        area_counts[area]["lean_annotation_connected"] += int(
            lean_annotation_connected
        )
        area_counts[area]["not_lean_annotation_connected"] += int(
            not lean_annotation_connected
        )
        area_counts[area]["n_metadata_files"] += int(bool(n_keys))
        if n_keys:
            n_metadata_artifacts.append(artifact)
        if not lean_annotation_connected:
            unannotated_artifacts.append(artifact)

    return {
        "summary": {
            "files": sum(counts["files"] for counts in area_counts.values()),
            "bytes": sum(counts["bytes"] for counts in area_counts.values()),
            "lean_annotation_connected": sum(
                counts["lean_annotation_connected"] for counts in area_counts.values()
            ),
            "not_lean_annotation_connected": sum(
                counts["not_lean_annotation_connected"]
                for counts in area_counts.values()
            ),
            "n_metadata_files": len(n_metadata_artifacts),
            "n_metadata_without_lean_annotation": sum(
                int(not artifact["lean_annotation_connected"])
                for artifact in n_metadata_artifacts
            ),
        },
        "areas": {key: dict(value) for key, value in sorted(area_counts.items())},
        "n_metadata_artifacts": sorted(
            n_metadata_artifacts, key=lambda artifact: artifact["path"]
        ),
        "artifacts_without_lean_annotation": sorted(
            unannotated_artifacts, key=lambda artifact: artifact["path"]
        ),
    }


def write_json(
    path: Path,
    declarations: list[Declaration],
    file_counts: dict[str, dict[str, int]],
    groups: list[dict[str, object]],
    raw_json: dict[str, object],
) -> None:
    categories = Counter(declaration.category for declaration in declarations)
    unimported_files = live_unimported_file_inventory(declarations)
    payload = {
        "schema": "general_n_bank_mining.v2",
        "scope": {
            "live_root": "lean/Erdos9796Proof/P97",
            "attic_root": "attic",
            "note": "Source-classification audit; candidates require Lean-level review.",
        },
        "summary": {
            "bank_files": sum(bank.get("files", 0) for bank in file_counts.values()),
            "declarations": len(declarations),
            "categories": dict(sorted(categories.items())),
            "candidate_shape_groups": len(groups),
            "candidate_instances": sum(int(group["instances"]) for group in groups),
            "live_unimported_files": len(unimported_files),
        },
        "banks": dict(sorted(file_counts.items())),
        "live_unimported_files": unimported_files,
        "candidate_groups": groups,
        "raw_json_artifacts": raw_json,
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def write_markdown(
    path: Path,
    declarations: list[Declaration],
    file_counts: dict[str, dict[str, int]],
    groups: list[dict[str, object]],
    raw_json: dict[str, object],
) -> None:
    categories = Counter(declaration.category for declaration in declarations)
    unimported_files = live_unimported_file_inventory(declarations)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# General-n Certificate-Bank Source Census",
        "",
        "This report is generated by `scripts/general-n-bank-miner.py`. It is a",
        "conservative source audit, not a Lean elaboration result. `ambient-n`,",
        "`profile-uniform`, and `ambient-set-uniform` rows are candidates for manual",
        "review.",
        "`abstract-shadow-uniform`, `valuation-soundness-uniform`,",
        "`local-geometry-uniform`, and",
        "`row-local-geometry-schema` rows apply at arbitrary ambient cardinality",
        "only after the corresponding geometric packet bridge.",
        "Raw polynomial checker schemas such as `nu : Nat -> Real` are kept separate",
        "unless their statement is already a semantic contradiction theorem.",
        "",
        "## Summary",
        "",
        f"- Bank files scanned: {sum(bank.get('files', 0) for bank in file_counts.values()):,}",
        f"- Declarations scanned: {len(declarations):,}",
        f"- Candidate instances: {sum(int(group['instances']) for group in groups):,}",
        f"- Deduplicated candidate shapes: {len(groups):,}",
        "",
        "| Category | Declarations |",
        "|---|---:|",
    ]
    for category, count in sorted(categories.items()):
        lines.append(f"| `{category}` | {count:,} |")

    lines.extend(
        [
            "",
            "## Banks",
            "",
            "| Bank | Files | MiB | Unimported files | Blueprint-skipped files | Declarations | Candidates |",
            "|---|---:|---:|---:|---:|---:|---:|",
        ]
    )
    for bank, counts in sorted(file_counts.items()):
        candidate_count = sum(
            counts.get(category, 0)
            for category in (
                "ambient-n",
                "profile-uniform",
                "ambient-set-uniform",
                "abstract-shadow-uniform",
                "valuation-soundness-uniform",
                "local-geometry-uniform",
                "row-local-geometry-schema",
            )
        )
        lines.append(
            f"| `{bank}` | {counts.get('files', 0):,} | "
            f"{counts.get('bytes', 0) / (1024 * 1024):.1f} | "
            f"{counts.get('live_unimported_files', 0):,} | "
            f"{counts.get('blueprint_skipped_files', 0):,} | "
            f"{counts.get('declarations', 0):,} | {candidate_count:,} |"
        )

    lines.extend(
        [
            "",
            "## Live Unimported Files",
            "",
            "These indexed files are not reachable from the `Erdos9796` import root.",
            "",
            "| Path | Bank | Declarations | Candidate instances |",
            "|---|---|---:|---:|",
        ]
    )
    for row in unimported_files:
        lines.append(
            f"| `{row['path']}` | `{row['bank']}` | {row['declarations']:,} | "
            f"{row['candidate_instances']:,} |"
        )

    raw_summary = raw_json["summary"]
    lines.extend(
        [
            "",
            "## Raw JSON Artifacts",
            "",
            f"- JSON files scanned: {raw_summary['files']:,}",
            "- Files with a live Lean path/schema annotation: "
            f"{raw_summary['lean_annotation_connected']:,}",
            "- Files without a live Lean path/schema annotation: "
            f"{raw_summary['not_lean_annotation_connected']:,}",
            f"- Files carrying ambient-`n` metadata keys: {raw_summary['n_metadata_files']:,}",
            "- Ambient-`n` metadata files without a live Lean annotation: "
            f"{raw_summary['n_metadata_without_lean_annotation']:,}",
            "",
            "| Area | JSON files | MiB | Lean-annotated | Unannotated | `n` metadata |",
            "|---|---:|---:|---:|---:|---:|",
        ]
    )
    for area, counts in raw_json["areas"].items():
        lines.append(
            f"| `{area}` | {counts.get('files', 0):,} | "
            f"{counts.get('bytes', 0) / (1024 * 1024):.1f} | "
            f"{counts.get('lean_annotation_connected', 0):,} | "
            f"{counts.get('not_lean_annotation_connected', 0):,} | "
            f"{counts.get('n_metadata_files', 0):,} |"
        )

    if raw_json["n_metadata_artifacts"]:
        lines.extend(
            [
                "",
                "Ambient-`n` metadata artifacts:",
                "",
            ]
        )
        for artifact in raw_json["n_metadata_artifacts"]:
            status = (
                "Lean-annotated"
                if artifact["lean_annotation_connected"]
                else "unannotated"
            )
            keys = ", ".join(f"`{key}`" for key in artifact["n_metadata_keys"])
            lines.append(f"- `{artifact['path']}` ({status}; keys: {keys})")

    lines.extend(
        [
            "",
            "## Deduplicated Candidates",
            "",
            "| Bank | Category | Instances | Status | Representative |",
            "|---|---|---:|---|---|",
        ]
    )
    for group in groups:
        representative = group["representative"]
        status = ", ".join(group["source_statuses"])
        if group["blueprint_skipped"]:
            status += "; blueprint-skipped"
        location = f"`{representative['path']}:{representative['line']}` `{representative['name']}`"
        lines.append(
            f"| `{group['bank']}` | `{group['category']}` | {group['instances']:,} | "
            f"{status} | {location} |"
        )

    lines.extend(
        [
            "",
            "The JSON companion records every member of each deduplicated shape and",
            "the full normalized source statement used for classification.",
        ]
    )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    repo = args.repo.resolve()
    json_out = args.json_out if args.json_out.is_absolute() else repo / args.json_out
    markdown_out = (
        args.markdown_out if args.markdown_out.is_absolute() else repo / args.markdown_out
    )
    declarations, file_counts = scan(repo)
    groups = candidate_groups(declarations)
    raw_json = raw_json_inventory(repo, {json_out.resolve()})
    write_json(json_out, declarations, file_counts, groups, raw_json)
    write_markdown(markdown_out, declarations, file_counts, groups, raw_json)
    print(
        json.dumps(
            {
                "bank_files": sum(bank.get("files", 0) for bank in file_counts.values()),
                "declarations": len(declarations),
                "candidate_instances": sum(int(group["instances"]) for group in groups),
                "candidate_shape_groups": len(groups),
                "raw_json_files": raw_json["summary"]["files"],
                "raw_n_metadata_files": raw_json["summary"]["n_metadata_files"],
                "raw_n_metadata_without_lean_annotation":
                    raw_json["summary"]["n_metadata_without_lean_annotation"],
                "json_out": str(json_out),
                "markdown_out": str(markdown_out),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
