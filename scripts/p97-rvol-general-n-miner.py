#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine general-cardinality Lean declarations from the sibling p97-rvol repo.

The ordinary certificate-bank census is intentionally path-driven.  p97-rvol
also contains generated theorem banks whose filenames say ``Incidence`` or
``Incompatibility`` rather than ``Certificate``.  This audit scans the complete
P97 source tree, computes source import reachability, and compares declarations
with the canonical formalization repo.

This is a conservative source audit.  ``source-proved`` means only that the
declaration body contains no source ``sorry``/``admit`` token; it is not a
kernel axiom audit.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path


DECL_RE = re.compile(
    r"^\s*(?P<private>private\s+)?"
    r"(?:(?:protected|noncomputable)\s+)*"
    r"(?P<kind>theorem|lemma|def|abbrev|structure|class|inductive)\s+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)"
)
IMPORT_RE = re.compile(r"^\s*import\s+(.+?)\s*$")
NAMESPACE_RE = re.compile(r"^\s*namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)\s*$")
SECTION_RE = re.compile(r"^\s*(?:section)(?:\s+[A-Za-z_][A-Za-z0-9_']*)?\s*$")
END_RE = re.compile(r"^\s*end(?:\s+[A-Za-z_][A-Za-z0-9_'.]*)?\s*$")
SPACE_RE = re.compile(r"\s+")
NUMBER_RE = re.compile(r"\b\d+\b")
STRING_RE = re.compile(r'"(?:[^"\\]|\\.)*"')
SORRY_RE = re.compile(r"\b(?:sorry|admit)\b")

FIXED_CARDINALITY_PATTERNS = (
    re.compile(r"\b(?:A|S|D\.A)\.card\s*(?:=|<|>|<=|>=|\u2264|\u2265)\s*\d+"),
    re.compile(r"\bcard\s+(?:A|S)\s*(?:=|<|>|<=|>=|\u2264|\u2265)\s*\d+"),
    re.compile(r"\bcard_eq_(?:nine|ten|eleven|twelve|\d+)\b"),
    re.compile(r"\b(?:n|N)\s*=\s*\d+\b"),
)

BANK_MARKERS = (
    "Audit",
    "Bank",
    "Census",
    "Certificate",
    "DFS",
    "Enumerator",
    "Generated",
    "Incidence",
    "Obstruction",
)

CANDIDATE_CATEGORIES = {
    "ambient-n",
    "ambient-data-uniform",
    "ambient-set-uniform",
    "abstract-incidence-uniform",
    "metric-point-uniform",
    "scalar-algebra-uniform",
}


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
    bank_like: bool
    source_reachable: bool
    category: str
    fixed_cardinality: bool
    proof_status: str
    local_exact_name: bool
    local_shape_match: bool
    local_module_basename: bool


@dataclass(frozen=True)
class ParsedDeclaration:
    line: int
    kind: str
    name: str
    fq_name: str
    private: bool
    statement: str
    body: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-repo", type=Path, default=Path("../p97-rvol"))
    parser.add_argument("--local-repo", type=Path, default=Path.cwd())
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/p97_rvol_general_n_mining.json"),
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path("certificates/p97_rvol_general_n_mining.md"),
    )
    return parser.parse_args()


def module_name(lean_root: Path, path: Path) -> str:
    return ".".join(path.relative_to(lean_root).with_suffix("").parts)


def source_import_closure(lean_root: Path, entry_module: str) -> set[str]:
    module_paths = {
        module_name(lean_root, path): path for path in lean_root.rglob("*.lean")
    }
    reachable: set[str] = set()
    pending = [entry_module]
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


def strip_comments(text: str) -> str:
    """Remove ordinary Lean comments sufficiently for source-sorry detection."""
    previous = None
    while previous != text:
        previous = text
        text = re.sub(r"/-.*?-/", "", text, flags=re.DOTALL)
    return re.sub(r"--[^\n]*", "", text)


def declaration_headers(
    path: Path, *, include_body: bool = True
) -> list[ParsedDeclaration]:
    text = path.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines()
    namespace_stack: list[tuple[str, str]] = []
    raw: list[tuple[int, str, str, str, bool, str]] = []

    for index, line in enumerate(lines):
        namespace_match = NAMESPACE_RE.match(line)
        if namespace_match is not None:
            namespace_stack.append(("namespace", namespace_match.group(1)))
            continue
        if SECTION_RE.match(line):
            namespace_stack.append(("section", ""))
            continue
        if END_RE.match(line):
            if namespace_stack:
                namespace_stack.pop()
            continue

        match = DECL_RE.match(line)
        if match is None:
            continue
        header_lines = [line.strip()]
        for continuation in lines[index + 1 : index + 161]:
            joined = " ".join(header_lines)
            if ":=" in joined or continuation.strip() == "by":
                break
            if DECL_RE.match(continuation):
                break
            header_lines.append(continuation.strip())
            if ":=" in continuation or continuation.strip().endswith(" where"):
                break
        statement = SPACE_RE.sub(" ", " ".join(header_lines)).strip()
        statement = statement.split(":=", maxsplit=1)[0].strip()
        namespaces = [name for kind, name in namespace_stack if kind == "namespace"]
        name = match.group("name")
        if name.startswith("Problem97."):
            fq_name = name
        else:
            fq_name = ".".join([*namespaces, name]) if namespaces else name
        raw.append(
            (
                index,
                match.group("kind"),
                name,
                fq_name,
                match.group("private") is not None,
                statement,
            )
        )

    result: list[ParsedDeclaration] = []
    for position, row in enumerate(raw):
        index, kind, name, fq_name, private, statement = row
        end_index = raw[position + 1][0] if position + 1 < len(raw) else len(lines)
        body = "\n".join(lines[index:end_index]) if include_body else ""
        result.append(
            ParsedDeclaration(
                line=index + 1,
                kind=kind,
                name=name,
                fq_name=fq_name,
                private=private,
                statement=statement,
                body=body,
            )
        )
    return result


def has_fixed_cardinality(statement: str) -> bool:
    return any(pattern.search(statement) for pattern in FIXED_CARDINALITY_PATTERNS)


def classify(statement: str, kind: str) -> str:
    if kind not in {"theorem", "lemma"}:
        return "definition"
    if has_fixed_cardinality(statement):
        return "fixed-cardinality"
    if re.search(r"[({]\s*(?:n|N)\s*:\s*(?:Nat|\u2115)\b", statement):
        return "ambient-n"
    if "CounterexampleData" in statement:
        return "ambient-data-uniform"
    if re.search(r"\b(?:Finset|Set)\s+(?:\u211d\u00b2|Point|\(.*Real.*\))", statement):
        return "ambient-set-uniform"
    if re.search(
        r"\b(?:U5[A-Za-z0-9_'.]*Class|PointClass|CriticalSourceRows|"
        r"EndpointMetricShadow|JointProfile|Incidence)\b",
        statement,
    ):
        return "abstract-incidence-uniform"
    if ("\u211d\u00b2" in statement or "EuclideanSpace \u211d (Fin 2)" in statement) and re.search(
        r":\s*(?:False|[A-Za-z0-9_'.]*\s*=)", statement
    ):
        return "metric-point-uniform"
    if re.search(r"[({][^)]*:\s*(?:Real|\u211d)\b", statement) and re.search(
        r":\s*False\s*$", statement
    ):
        return "scalar-algebra-uniform"
    return "fixed-or-utility"


def normalized_shape(statement: str, name: str) -> str:
    shape = re.sub(rf"\b{re.escape(name)}\b", "<DECL>", statement, count=1)
    shape = STRING_RE.sub('"<STRING>"', shape)
    shape = NUMBER_RE.sub("<NUM>", shape)
    subscript_digits = "\u2080\u2081\u2082\u2083\u2084\u2085\u2086\u2087\u2088\u2089"
    shape = shape.translate(str.maketrans(subscript_digits, "0000000000"))
    shape = SPACE_RE.sub(" ", shape).strip()
    return hashlib.sha256(shape.encode()).hexdigest()[:16]


def file_family(stem: str) -> str:
    if stem.startswith("U5GlobalIncidence"):
        return "U5GlobalIncidence"
    if stem == "U1TwoLargeCapObstruction":
        return stem
    for marker in ("Certificate", "Bank", "Census", "Audit", "Obstruction"):
        if marker in stem:
            return marker.lower()
    lane = re.match(r"^(U\d+)", stem)
    if lane is not None:
        return lane.group(1)
    return "other"


def bank_like(path: Path, text: str) -> bool:
    if any(marker in path.stem for marker in BANK_MARKERS):
        return True
    head = text[:16384]
    return bool(
        re.search(r"\b(?:generated|certificate|incompatibility bank)\b", head, re.IGNORECASE)
    )


def local_inventory(
    local_root: Path,
    source_names: set[str],
    source_shapes: set[str],
) -> tuple[set[str], set[str], set[str]]:
    """Index local counterparts of source modules.

    The canonical repo contains very large generated endpoint banks unrelated to
    p97-rvol. Parse their headers without bodies, and retain only exact names or
    normalized shapes that occur in the sibling source inventory.
    """
    names: set[str] = set()
    shapes: set[str] = set()
    basenames: set[str] = set()
    for path in local_root.rglob("*.lean"):
        basenames.add(path.stem)
        for declaration in declaration_headers(path, include_body=False):
            if declaration.private:
                continue
            if declaration.fq_name in source_names:
                names.add(declaration.fq_name)
            shape = normalized_shape(declaration.statement, declaration.name)
            if shape in source_shapes:
                shapes.add(shape)
    return names, shapes, basenames


def scan(source_repo: Path, local_repo: Path) -> tuple[list[Declaration], dict[str, object]]:
    source_lean = source_repo / "lean"
    source_root = source_lean / "RVOL" / "P97"
    local_root = local_repo / "lean" / "Erdos9796Proof" / "P97"
    if not source_root.is_dir():
        raise SystemExit(f"missing p97-rvol source root: {source_root}")
    if not local_root.is_dir():
        raise SystemExit(f"missing local P97 source root: {local_root}")

    reachable = source_import_closure(source_lean, "RVOL")
    source_paths = sorted(source_root.rglob("*.lean"))
    source_rows: list[
        tuple[Path, str, str, bool, list[ParsedDeclaration]]
    ] = []
    source_names: set[str] = set()
    source_shapes: set[str] = set()
    for path in source_paths:
        module = module_name(source_lean, path)
        relative = str(path.relative_to(source_repo))
        text = path.read_text(encoding="utf-8", errors="replace")
        is_bank = bank_like(path, text)
        parsed = declaration_headers(path)
        source_rows.append((path, module, relative, is_bank, parsed))
        for declaration in parsed:
            source_names.add(declaration.fq_name)
            source_shapes.add(
                normalized_shape(declaration.statement, declaration.name)
            )
    local_names, local_shapes, local_basenames = local_inventory(
        local_root, source_names, source_shapes
    )
    declarations: list[Declaration] = []
    module_rows: list[dict[str, object]] = []

    for path, module, relative, is_bank, parsed in source_rows:
        module_rows.append(
            {
                "path": relative,
                "module": module,
                "bytes": path.stat().st_size,
                "family": file_family(path.stem),
                "bank_like": is_bank,
                "source_reachable": module in reachable,
                "local_module_basename": path.stem in local_basenames,
                "declarations": len(parsed),
            }
        )
        for declaration in parsed:
            statement_shape = normalized_shape(declaration.statement, declaration.name)
            code = strip_comments(declaration.body)
            if declaration.kind in {"theorem", "lemma"}:
                proof_status = "has-sorry" if SORRY_RE.search(code) else "source-proved"
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
                    shape=statement_shape,
                    family=file_family(path.stem),
                    bank_like=is_bank,
                    source_reachable=module in reachable,
                    category=classify(declaration.statement, declaration.kind),
                    fixed_cardinality=has_fixed_cardinality(declaration.statement),
                    proof_status=proof_status,
                    local_exact_name=declaration.fq_name in local_names,
                    local_shape_match=statement_shape in local_shapes,
                    local_module_basename=path.stem in local_basenames,
                )
            )

    metadata = {
        "source_repo": str(source_repo),
        "local_repo": str(local_repo),
        "source_import_root": "RVOL",
        "source_reachable_modules": len(reachable),
        "modules": module_rows,
    }
    return declarations, metadata


def grouped_candidates(declarations: list[Declaration]) -> list[dict[str, object]]:
    groups: dict[tuple[str, str, str], list[Declaration]] = defaultdict(list)
    for declaration in declarations:
        if declaration.category not in CANDIDATE_CATEGORIES or declaration.private:
            continue
        groups[(declaration.family, declaration.category, declaration.shape)].append(declaration)
    rows: list[dict[str, object]] = []
    for (family, category, shape), members in groups.items():
        representative = min(members, key=lambda row: (row.path, row.line))
        rows.append(
            {
                "family": family,
                "category": category,
                "shape": shape,
                "instances": len(members),
                "all_source_proved": all(row.proof_status == "source-proved" for row in members),
                "any_source_reachable": any(row.source_reachable for row in members),
                "any_local_exact_name": any(row.local_exact_name for row in members),
                "any_local_shape_match": any(row.local_shape_match for row in members),
                "representative": asdict(representative),
                "members": [
                    {
                        "path": row.path,
                        "line": row.line,
                        "fq_name": row.fq_name,
                        "proof_status": row.proof_status,
                        "source_reachable": row.source_reachable,
                        "local_exact_name": row.local_exact_name,
                    }
                    for row in sorted(members, key=lambda item: (item.path, item.line))
                ],
            }
        )
    return sorted(
        rows,
        key=lambda row: (
            row["any_local_shape_match"],
            not row["all_source_proved"],
            not row["any_source_reachable"],
            row["family"],
            row["category"],
            -int(row["instances"]),
        ),
    )


def is_false_conclusion(statement: str) -> bool:
    return bool(re.search(r":\s*False\s*$", statement))


def contradiction_summary(declarations: list[Declaration]) -> list[dict[str, object]]:
    counts: dict[tuple[str, str, str], int] = Counter()
    for row in declarations:
        if (
            row.category not in CANDIDATE_CATEGORIES
            or row.private
            or row.proof_status != "source-proved"
            or row.local_exact_name
            or row.local_shape_match
            or not is_false_conclusion(row.statement)
        ):
            continue
        reachability = "RVOL-reachable" if row.source_reachable else "unimported"
        counts[(row.family, row.category, reachability)] += 1
    return [
        {
            "family": family,
            "category": category,
            "reachability": reachability,
            "count": count,
        }
        for (family, category, reachability), count in sorted(
            counts.items(), key=lambda item: (-item[1], item[0])
        )
    ]


def focused_findings(
    declarations: list[Declaration], metadata: dict[str, object]
) -> dict[str, object]:
    u5_modules = [
        row for row in metadata["modules"] if row["family"] == "U5GlobalIncidence"
    ]
    u5_novel_false = [
        row
        for row in declarations
        if row.family == "U5GlobalIncidence"
        and row.category in CANDIDATE_CATEGORIES
        and not row.private
        and row.proof_status == "source-proved"
        and not row.local_exact_name
        and not row.local_shape_match
        and is_false_conclusion(row.statement)
    ]
    unimported_false = [
        row
        for row in declarations
        if row.category in CANDIDATE_CATEGORIES
        and not row.private
        and not row.source_reachable
        and row.proof_status == "source-proved"
        and not row.local_exact_name
        and not row.local_shape_match
        and is_false_conclusion(row.statement)
    ]
    return {
        "u5_global_incidence": {
            "modules": len(u5_modules),
            "modules_absent_by_basename": sum(
                not bool(row["local_module_basename"]) for row in u5_modules
            ),
            "novel_class_incompatibility_consumers": sum(
                row.category == "ambient-data-uniform" for row in u5_novel_false
            ),
            "novel_metric_incompatibility_consumers": sum(
                row.category == "metric-point-uniform" for row in u5_novel_false
            ),
            "novel_scalar_incompatibility_consumers": sum(
                row.category == "scalar-algebra-uniform" for row in u5_novel_false
            ),
            "novel_other_contradiction_consumers": sum(
                row.category
                not in {
                    "ambient-data-uniform",
                    "metric-point-uniform",
                    "scalar-algebra-uniform",
                }
                for row in u5_novel_false
            ),
        },
        "unimported": {
            "source_proved_novel_contradiction_consumers": len(unimported_false),
            "generated_u1_source_unit_consumers": sum(
                "U1Depth5SourceUnitGenerated.cert_" in row.fq_name for row in unimported_false
            ),
            "standalone_metric_consumers": sum(
                row.category == "metric-point-uniform" for row in unimported_false
            ),
        },
    }


def summarize(declarations: list[Declaration], metadata: dict[str, object]) -> dict[str, object]:
    candidates = [
        row
        for row in declarations
        if row.category in CANDIDATE_CATEGORIES and not row.private
    ]
    modules = metadata["modules"]
    return {
        "source_modules": len(modules),
        "source_reachable_modules": metadata["source_reachable_modules"],
        "bank_like_modules": sum(bool(row["bank_like"]) for row in modules),
        "modules_absent_by_basename": sum(
            not bool(row["local_module_basename"]) for row in modules
        ),
        "declarations": len(declarations),
        "theorems_and_lemmas": sum(row.kind in {"theorem", "lemma"} for row in declarations),
        "candidate_instances": len(candidates),
        "candidate_source_proved": sum(row.proof_status == "source-proved" for row in candidates),
        "candidate_has_sorry": sum(row.proof_status == "has-sorry" for row in candidates),
        "candidate_source_reachable": sum(row.source_reachable for row in candidates),
        "candidate_absent_exact_name": sum(not row.local_exact_name for row in candidates),
        "candidate_absent_shape": sum(not row.local_shape_match for row in candidates),
        "candidate_exact_name_statement_drift": sum(
            row.local_exact_name and not row.local_shape_match for row in candidates
        ),
        "proved_reachable_candidates_absent_shape": sum(
            row.proof_status == "source-proved"
            and row.source_reachable
            and not row.local_shape_match
            for row in candidates
        ),
        "source_proved_novel_false_consumers": sum(
            row.proof_status == "source-proved"
            and not row.local_exact_name
            and not row.local_shape_match
            and is_false_conclusion(row.statement)
            for row in candidates
        ),
        "source_proved_novel_false_consumers_reachable": sum(
            row.proof_status == "source-proved"
            and row.source_reachable
            and not row.local_exact_name
            and not row.local_shape_match
            and is_false_conclusion(row.statement)
            for row in candidates
        ),
        "source_proved_novel_false_consumers_unimported": sum(
            row.proof_status == "source-proved"
            and not row.source_reachable
            and not row.local_exact_name
            and not row.local_shape_match
            and is_false_conclusion(row.statement)
            for row in candidates
        ),
        "categories": dict(sorted(Counter(row.category for row in declarations).items())),
    }


def family_summary(
    declarations: list[Declaration], modules: list[dict[str, object]]
) -> list[dict[str, object]]:
    module_counts: dict[str, Counter[str]] = defaultdict(Counter)
    for row in modules:
        family = str(row["family"])
        module_counts[family]["modules"] += 1
        module_counts[family]["reachable_modules"] += int(bool(row["source_reachable"]))
        module_counts[family]["bank_like_modules"] += int(bool(row["bank_like"]))
        module_counts[family]["absent_modules"] += int(not bool(row["local_module_basename"]))
        module_counts[family]["bytes"] += int(row["bytes"])
    for row in declarations:
        counts = module_counts[row.family]
        counts["declarations"] += 1
        if row.category in CANDIDATE_CATEGORIES and not row.private:
            counts["candidates"] += 1
            counts["source_proved_candidates"] += int(row.proof_status == "source-proved")
            counts["novel_shape_candidates"] += int(not row.local_shape_match)
    return [
        {"family": family, **dict(counts)}
        for family, counts in sorted(
            module_counts.items(), key=lambda item: (-item[1]["candidates"], item[0])
        )
    ]


def write_json(
    path: Path,
    declarations: list[Declaration],
    metadata: dict[str, object],
    groups: list[dict[str, object]],
) -> None:
    payload = {
        "schema": "p97_rvol_general_n_mining.v1",
        "scope": {
            "source_root": "lean/RVOL/P97",
            "local_root": "lean/Erdos9796Proof/P97",
            "note": "Conservative source audit; source-proved is not a kernel axiom audit.",
        },
        "summary": summarize(declarations, metadata),
        "focused_findings": focused_findings(declarations, metadata),
        "contradiction_summary": contradiction_summary(declarations),
        "families": family_summary(declarations, metadata["modules"]),
        "modules": metadata["modules"],
        "candidate_groups": groups,
        "candidate_declarations": [
            asdict(row)
            for row in declarations
            if row.category in CANDIDATE_CATEGORIES and not row.private
        ],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def write_markdown(
    path: Path,
    declarations: list[Declaration],
    metadata: dict[str, object],
    groups: list[dict[str, object]],
) -> None:
    summary = summarize(declarations, metadata)
    families = family_summary(declarations, metadata["modules"])
    novel_groups = [
        row
        for row in groups
        if not row["any_local_exact_name"] and not row["any_local_shape_match"]
    ]
    contradiction_rows = contradiction_summary(declarations)
    unimported_false = sorted(
        [
            row
            for row in declarations
            if row.category in CANDIDATE_CATEGORIES
            and not row.private
            and not row.source_reachable
            and row.proof_status == "source-proved"
            and not row.local_exact_name
            and not row.local_shape_match
            and is_false_conclusion(row.statement)
        ],
        key=lambda row: (row.path, row.line),
    )
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# p97-rvol General-n Source Census",
        "",
        "Generated by `scripts/p97-rvol-general-n-miner.py`. This scans every",
        "Lean module under the sibling repo's `lean/RVOL/P97`, including theorem",
        "banks whose paths do not contain `Certificate` or `Bank`.",
        "",
        "`source-proved` is a source-level no-`sorry` classification, not a kernel",
        "axiom audit. `Novel shape` means the normalized declaration header has no",
        "match in the current formalization repo; it does not establish mathematical",
        "independence or immediate applicability to the proof spine.",
        "",
        "## Summary",
        "",
        f"- Source P97 modules: {summary['source_modules']:,}",
        f"- Reachable from `RVOL`: {summary['source_reachable_modules']:,}",
        f"- Bank-like modules: {summary['bank_like_modules']:,}",
        f"- Modules absent here by basename: {summary['modules_absent_by_basename']:,}",
        f"- Theorems and lemmas: {summary['theorems_and_lemmas']:,}",
        f"- General-n candidate instances: {summary['candidate_instances']:,}",
        f"- Source-proved candidates: {summary['candidate_source_proved']:,}",
        f"- Candidates with source `sorry`: {summary['candidate_has_sorry']:,}",
        "- Candidate headers absent here by normalized shape: "
        f"{summary['candidate_absent_shape']:,}",
        "- Exact-name matches with statement-shape drift: "
        f"{summary['candidate_exact_name_statement_drift']:,}",
        "- Source-proved, RVOL-reachable candidate headers absent here by shape: "
        f"{summary['proved_reachable_candidates_absent_shape']:,}",
        "- Source-proved novel contradiction consumers: "
        f"{summary['source_proved_novel_false_consumers']:,} "
        f"({summary['source_proved_novel_false_consumers_reachable']:,} RVOL-reachable; "
        f"{summary['source_proved_novel_false_consumers_unimported']:,} unimported)",
        f"- Deduplicated candidate shapes: {len(groups):,}",
        f"- Deduplicated novel shapes: {len(novel_groups):,}",
        "",
        "## Families",
        "",
        "| Family | Modules | RVOL-reachable | Absent modules | MiB | "
        "Declarations | Candidates | Source-proved candidates | "
        "Novel-shape candidates |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in families:
        lines.append(
            f"| `{row['family']}` | {row.get('modules', 0):,} | "
            f"{row.get('reachable_modules', 0):,} | {row.get('absent_modules', 0):,} | "
            f"{row.get('bytes', 0) / (1024 * 1024):.1f} | "
            f"{row.get('declarations', 0):,} | {row.get('candidates', 0):,} | "
            f"{row.get('source_proved_candidates', 0):,} | "
            f"{row.get('novel_shape_candidates', 0):,} |"
        )

    lines.extend(
        [
            "",
            "## Contradiction Consumers",
            "",
            "These are source-proved general-n candidates with conclusion `False`",
            "whose exact name and normalized declaration header are both absent",
            "from this repo.",
            "",
            "| Family | Category | Reachability | Consumers |",
            "|---|---|---|---:|",
        ]
    )
    for row in contradiction_rows:
        lines.append(
            f"| `{row['family']}` | `{row['category']}` | "
            f"{row['reachability']} | {row['count']:,} |"
        )

    lines.extend(
        [
            "",
            "## Unimported Contradiction Consumers",
            "",
            "These files are outside the `RVOL` import closure. They are the sibling",
            "repo analogue of an attic/unbuilt certificate bank.",
            "",
        ]
    )
    for row in unimported_false:
        lines.append(f"- `{row.path}:{row.line}` `{row.fq_name}`")

    lines.extend(
        [
            "",
            "## Complete Data",
            "",
            f"The JSON companion records all {len(groups):,} deduplicated candidate",
            f"shapes, including all {len(novel_groups):,} novel shapes, every candidate",
            "declaration, module reachability, and exact source statements. The",
            "generated Markdown intentionally lists only the contradiction-consumer",
            "surface; packet projections and adapters remain available in JSON.",
        ]
    )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    source_repo = args.source_repo.resolve()
    local_repo = args.local_repo.resolve()
    declarations, metadata = scan(source_repo, local_repo)
    groups = grouped_candidates(declarations)
    write_json(args.json_out, declarations, metadata, groups)
    write_markdown(args.markdown_out, declarations, metadata, groups)
    print(json.dumps(summarize(declarations, metadata), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
