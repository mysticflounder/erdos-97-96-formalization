#!/usr/bin/env python3
"""Tier-1 field-provenance classification for record-writing modules.

The dominant failure mode in this corpus is a hardcoded generator constant read
as an achieved result.  This tool separates, per emitted field, a value that was
*computed* from one that was *stamped*.  It parses with ``ast`` and never
executes a writer.

Classes, in order of trust:

``LITERAL``    a bare constant, or a name bound to a module-level constant.
              Carries no trust.
``FLAG_ECHO``  a parameter traceable to an ``argparse`` dest.  It records an
              operator's intent, not a result.  Carries no trust.
``UNKNOWN``    the value crosses a helper call, a re-binding, or more than one
              hop, so ``ast`` cannot follow it.  Carries no trust, exactly as
              ``LITERAL`` does; it is never silently treated as ``COMPUTED``.
``COMPUTED``   derived at run time.  Provisional.
``GUARDED``    computed, or a module constant that a raise-guarded comparison
              checks against an independently computed quantity.  The
              trustworthy class.

Two limits are structural, not incidental.  A raise-guarded comparison of a
constant against a field that was itself stamped with that constant
(``record["x"] != CONST``) is circular and proves nothing, and ``ast`` cannot
separate it from a real check.  Fields on the pre-registered non-result list
therefore have their trust capped: the AST verdict is kept as
``raw_aggregate`` and ``aggregate`` falls back to ``UNKNOWN``.

Usage:
    uv run python scripts/classify_writer_fields.py index --repo-root . \
        --out <run-root>/artifacts/field-provenance.jsonl \
        --summary-out <run-root>/artifacts/field-provenance-summary.json
    uv run python scripts/classify_writer_fields.py classify \
        --module census/card_head/exact12_next_row_arm_static_canary.py \
        --field terminal_promotion_status
"""

from __future__ import annotations

import argparse
import ast
import json
import os
import sys
from collections import Counter
from pathlib import Path, PurePosixPath
from typing import Any

SCHEMA = "nonpiqd-field-provenance/v1"
SUMMARY_SCHEMA = "nonpiqd-field-provenance-summary/v1"

LITERAL = "LITERAL"
FLAG_ECHO = "FLAG_ECHO"
UNKNOWN = "UNKNOWN"
COMPUTED = "COMPUTED"
GUARDED = "GUARDED"

# Aggregation takes the least trustworthy class observed for a field.
TRUST_RANK = {LITERAL: 0, FLAG_ECHO: 0, UNKNOWN: 0, COMPUTED: 1, GUARDED: 2}

# Fields pre-registered as known non-results.  No later stage may promote them.
KNOWN_NON_RESULTS = frozenset(
    {
        "terminal_promotion_status",
        "semantic_status",
        "lean_terminal_ingress_ready",
        "python_exact_polynomial",
    }
)

EXCLUDED_DIR_NAMES = frozenset(
    {".lake", "vendor", "exact-sha-worktrees", "__pycache__", ".git"}
)
EXCLUDED_DIR_SUFFIXES = ("-source",)
EXCLUDED_PREFIXES = ("scratch/exact12-overlay-20260810/",)

_ARGS_NAMESPACES = frozenset({"args", "options", "opts", "ns", "namespace"})
MAX_SOURCE_BYTES = 8 * 1024 * 1024


def is_excluded(rel: str) -> bool:
    if any(rel.startswith(prefix) for prefix in EXCLUDED_PREFIXES):
        return True
    for part in PurePosixPath(rel).parts[:-1]:
        if part in EXCLUDED_DIR_NAMES or part.endswith(EXCLUDED_DIR_SUFFIXES):
            return True
    return False


def argparse_dest(node: ast.Call) -> str | None:
    """Derive the attribute name argparse will populate for one add_argument."""
    for keyword in node.keywords:
        if (
            keyword.arg == "dest"
            and isinstance(keyword.value, ast.Constant)
            and isinstance(keyword.value.value, str)
        ):
            return keyword.value.value
    best: str | None = None
    for arg in node.args:
        if not isinstance(arg, ast.Constant) or not isinstance(arg.value, str):
            continue
        text = arg.value
        if text.startswith("--"):
            return text[2:].replace("-", "_")
        if text.startswith("-"):
            best = best or text[1:].replace("-", "_")
        else:
            best = best or text.replace("-", "_")
    return best


class ModuleFacts:
    """Everything the classifier needs from one parsed module."""

    def __init__(self, tree: ast.Module) -> None:
        self.module_constants: dict[str, Any] = {}
        self.module_schema: str | None = None
        self.argparse_dests: set[str] = set()
        self.guarded_names: set[str] = set()
        self.flag_echo_params: set[tuple[str, str]] = set()
        self.claims_vectors: dict[str, list[str]] = {}
        self._collect(tree)

    def _collect(self, tree: ast.Module) -> None:
        assigned: Counter[str] = Counter()
        for node in tree.body:
            if not isinstance(node, ast.Assign) or len(node.targets) != 1:
                continue
            target = node.targets[0]
            if not isinstance(target, ast.Name):
                continue
            assigned[target.id] += 1
            if isinstance(node.value, ast.Constant):
                self.module_constants[target.id] = node.value.value
                if "SCHEMA" in target.id and isinstance(node.value.value, str):
                    self.module_schema = self.module_schema or node.value.value
            elif isinstance(node.value, ast.Tuple | ast.List) and "CLAIMS" in target.id:
                items = [
                    e.value
                    for e in node.value.elts
                    if isinstance(e, ast.Constant) and isinstance(e.value, str)
                ]
                if items:
                    self.claims_vectors[target.id] = items
        # A name rebound at module level is not a stable constant.
        for name, count in assigned.items():
            if count > 1:
                self.module_constants.pop(name, None)

        for node in ast.walk(tree):
            if isinstance(node, ast.Call):
                func = node.func
                name = (
                    func.attr
                    if isinstance(func, ast.Attribute)
                    else (func.id if isinstance(func, ast.Name) else None)
                )
                if name == "add_argument":
                    dest = argparse_dest(node)
                    if dest:
                        self.argparse_dests.add(dest)
                # One interprocedural hop: `callee(param=<expr over args.dest>)`.
                for keyword in node.keywords:
                    if keyword.arg and self._mentions_args(keyword.value) and name:
                        self.flag_echo_params.add((name, keyword.arg))
            if isinstance(node, ast.If) and self._raises(node):
                self.guarded_names.update(self._guarded_by(node.test))

    @staticmethod
    def _mentions_args(node: ast.AST) -> bool:
        for sub in ast.walk(node):
            if (
                isinstance(sub, ast.Attribute)
                and isinstance(sub.value, ast.Name)
                and sub.value.id in _ARGS_NAMESPACES
            ):
                return True
        return False

    @staticmethod
    def _raises(node: ast.If) -> bool:
        """Only a raise that is a direct statement of the body is a guard.

        A nested raise means the outer test dispatches on a value and some
        inner condition raises.  Promoting on that pattern falsely marks a
        stamped status constant as checked -- the worst error direction, since
        GUARDED is the trustworthy class.
        """
        return any(isinstance(statement, ast.Raise) for statement in node.body)

    @staticmethod
    def _guarded_by(test: ast.AST) -> set[str]:
        """Names a raise-guarded comparison checks against a computed side.

        `len(reused) != EXPECTED_REUSED_REQUIREMENT_COUNT` guards the constant.
        `status == TERMINAL_STATUS` does not: both sides are plain names, so
        the comparison dispatches rather than checks.  Requiring a computed
        side under-promotes rather than over-promotes, which is the safe
        direction: LITERAL and UNKNOWN both floor at the same trust level.
        """
        computed = (
            ast.Call,
            ast.Subscript,
            ast.BinOp,
            ast.Attribute,
            ast.ListComp,
            ast.DictComp,
            ast.SetComp,
            ast.GeneratorExp,
        )
        found: set[str] = set()
        for node in ast.walk(test):
            if not isinstance(node, ast.Compare):
                continue
            sides = [node.left, *node.comparators]
            has_computed = any(isinstance(side, computed) for side in sides)
            if not has_computed:
                continue
            for side in sides:
                if isinstance(side, ast.Name):
                    found.add(side.id)
        return found


_LOCALS_CACHE: dict[int, dict[str, Any]] = {}


def _function_locals(
    function: ast.FunctionDef | ast.AsyncFunctionDef,
) -> dict[str, Any]:
    """Single-assignment local bindings inside one function body (memoized)."""
    cached = _LOCALS_CACHE.get(id(function))
    if cached is not None:
        return cached
    counts: Counter[str] = Counter()
    values: dict[str, ast.AST] = {}
    for node in ast.walk(function):
        if isinstance(node, ast.Assign) and len(node.targets) == 1:
            target = node.targets[0]
            if isinstance(target, ast.Name):
                counts[target.id] += 1
                values[target.id] = node.value
        elif isinstance(node, ast.For) and isinstance(node.target, ast.Name):
            counts[node.target.id] += 2  # loop-bound: never a stable single value
    result = {name: value for name, value in values.items() if counts[name] == 1}
    _LOCALS_CACHE[id(function)] = result
    return result


def classify_value(
    value: ast.AST,
    facts: ModuleFacts,
    function: ast.FunctionDef | ast.AsyncFunctionDef | None,
    depth: int = 0,
) -> tuple[str, str]:
    """Return (class, detail) for one dict value expression."""
    if depth > 2:
        return (UNKNOWN, "trace depth exceeded")
    if isinstance(value, ast.Constant):
        return (LITERAL, f"constant {value.value!r}"[:120])
    if isinstance(value, ast.Name):
        name = value.id
        if function is not None:
            params = [a.arg for a in function.args.args + function.args.kwonlyargs]
            if name in params:
                if (
                    function.name,
                    name,
                ) in facts.flag_echo_params or name in facts.argparse_dests:
                    return (FLAG_ECHO, f"parameter {name} carries an argparse dest")
                return (UNKNOWN, f"parameter {name} of {function.name}")
            local = _function_locals(function).get(name)
            if local is not None:
                inner, detail = classify_value(local, facts, function, depth + 1)
                return (inner, f"local {name}: {detail}")
        if name in facts.module_constants:
            if name in facts.guarded_names:
                return (GUARDED, f"module constant {name} checked by a raise guard")
            return (
                LITERAL,
                f"module constant {name}={facts.module_constants[name]!r}"[:120],
            )
        return (UNKNOWN, f"unresolved name {name}")
    if isinstance(value, ast.Attribute):
        if isinstance(value.value, ast.Name) and value.value.id in _ARGS_NAMESPACES:
            return (FLAG_ECHO, f"argparse dest {value.attr}")
        return (COMPUTED, "attribute access")
    if isinstance(value, ast.UnaryOp):
        inner, detail = classify_value(value.operand, facts, function, depth + 1)
        if inner in (FLAG_ECHO, LITERAL):
            return (inner, f"unary over {detail}")
        return (COMPUTED, "unary operation")
    if isinstance(value, ast.Compare):
        return (COMPUTED, "comparison")
    if isinstance(value, ast.Call):
        return (COMPUTED, "call")
    if isinstance(value, ast.BinOp | ast.BoolOp):
        return (COMPUTED, "operation")
    if isinstance(value, ast.Subscript):
        return (COMPUTED, "subscript")
    if isinstance(value, ast.ListComp | ast.DictComp | ast.SetComp | ast.GeneratorExp):
        return (COMPUTED, "comprehension")
    if isinstance(value, ast.IfExp):
        left, _ = classify_value(value.body, facts, function, depth + 1)
        right, _ = classify_value(value.orelse, facts, function, depth + 1)
        if left == right == LITERAL:
            return (COMPUTED, "conditional over literals")
        return (COMPUTED, "conditional")
    if isinstance(value, ast.Dict | ast.List | ast.Tuple | ast.Set):
        elements = value.values if isinstance(value, ast.Dict) else value.elts
        if elements and all(isinstance(e, ast.Constant) for e in elements):
            return (LITERAL, "literal container")
        return (COMPUTED, "container")
    return (UNKNOWN, type(value).__name__)


def _enclosing_functions(
    tree: ast.Module,
) -> dict[int, ast.FunctionDef | ast.AsyncFunctionDef]:
    owner: dict[int, Any] = {}
    for node in ast.walk(tree):
        if isinstance(node, ast.FunctionDef | ast.AsyncFunctionDef):
            for sub in ast.walk(node):
                owner.setdefault(id(sub), node)
    return owner


def classify_module(path: Path, rel: str) -> dict[str, Any] | None:
    try:
        raw = path.read_bytes()
        if len(raw) > MAX_SOURCE_BYTES:
            return None
        tree = ast.parse(raw.decode("utf-8", errors="replace"), filename=str(path))
    except (OSError, SyntaxError, ValueError):
        return None

    _LOCALS_CACHE.clear()
    facts = ModuleFacts(tree)
    owner = _enclosing_functions(tree)
    fields: dict[str, dict[str, Any]] = {}

    for node in ast.walk(tree):
        if not isinstance(node, ast.Dict):
            continue
        merge_present = any(key is None for key in node.keys)
        local_schema = None
        for key, value in zip(node.keys, node.values):
            if (
                isinstance(key, ast.Constant)
                and key.value == "schema"
                and isinstance(value, ast.Constant)
                and isinstance(value.value, str)
            ):
                local_schema = value.value
        schema = local_schema or facts.module_schema
        for key, value in zip(node.keys, node.values):
            if not isinstance(key, ast.Constant) or not isinstance(key.value, str):
                continue
            function = owner.get(id(value)) or owner.get(id(node))
            klass, detail = classify_value(value, facts, function)
            entry = fields.setdefault(
                key.value,
                {"aggregate": None, "classes": [], "schemas": [], "sites": []},
            )
            entry["sites"].append(
                {
                    "line": getattr(value, "lineno", getattr(node, "lineno", 0)),
                    "class": klass,
                    "detail": detail,
                    "merge_present": merge_present,
                }
            )
            if klass not in entry["classes"]:
                entry["classes"].append(klass)
            if schema and schema not in entry["schemas"]:
                entry["schemas"].append(schema)

    if not fields:
        return None
    for name, entry in fields.items():
        raw = min(entry["classes"], key=lambda c: (TRUST_RANK[c], c))
        entry["raw_aggregate"] = raw
        entry["known_non_result"] = name in KNOWN_NON_RESULTS
        # A pre-registered non-result may never be promoted.  The guard
        # detector cannot separate a constant checked against an
        # independently computed quantity (`len(rows) != EXPECTED`) from one
        # checked against a field stamped with that same constant
        # (`record["x"] != CONST`).  The second is circular and proves
        # nothing, so the human pre-registration overrides the AST verdict.
        if entry["known_non_result"] and TRUST_RANK[raw] > 0:
            entry["aggregate"] = UNKNOWN
            entry["trust_capped"] = True
        else:
            entry["aggregate"] = raw
            entry["trust_capped"] = False
        entry["classes"].sort()
        entry["schemas"].sort()
        entry["sites"].sort(key=lambda s: s["line"])
    return {
        "schema": SCHEMA,
        "module": rel,
        "module_schema": facts.module_schema,
        "claims_vectors": {
            k: sorted(v) for k, v in sorted(facts.claims_vectors.items())
        },
        "fields": dict(sorted(fields.items())),
    }


def walk_modules(repo: Path) -> list[str]:
    out: list[str] = []
    for root in ("census", "scripts", "scratch"):
        base = repo / root
        if not base.is_dir():
            continue
        for dirpath, dirnames, filenames in os.walk(base):
            dirnames[:] = [
                d
                for d in dirnames
                if d not in EXCLUDED_DIR_NAMES and not d.endswith(EXCLUDED_DIR_SUFFIXES)
            ]
            for name in sorted(filenames):
                if not name.endswith(".py"):
                    continue
                rel = str((Path(dirpath) / name).relative_to(repo))
                if not is_excluded(rel):
                    out.append(rel)
    return sorted(out)


def summarize(records: list[dict[str, Any]]) -> dict[str, Any]:
    aggregate = Counter()
    per_site = Counter()
    non_result_hits: list[dict[str, Any]] = []
    unknown_fields: list[dict[str, str]] = []
    capped: list[dict[str, Any]] = []
    claims_vectors: dict[str, list[str]] = {}
    for record in records:
        for name, entry in record["fields"].items():
            aggregate[entry["aggregate"]] += 1
            for site in entry["sites"]:
                per_site[site["class"]] += 1
            if entry["known_non_result"]:
                non_result_hits.append(
                    {
                        "module": record["module"],
                        "field": name,
                        "aggregate": entry["aggregate"],
                    }
                )
            if entry["aggregate"] == UNKNOWN:
                unknown_fields.append({"module": record["module"], "field": name})
            if entry.get("trust_capped"):
                capped.append(
                    {
                        "module": record["module"],
                        "field": name,
                        "raw_aggregate": entry["raw_aggregate"],
                    }
                )
        for vector, items in record["claims_vectors"].items():
            claims_vectors.setdefault(f"{record['module']}::{vector}", items)
    return {
        "schema": SUMMARY_SCHEMA,
        "modules": len(records),
        "fields": sum(len(r["fields"]) for r in records),
        "aggregate_by_class": dict(aggregate.most_common()),
        "sites_by_class": dict(per_site.most_common()),
        "known_non_result_fields": sorted(
            non_result_hits, key=lambda r: (r["field"], r["module"])
        ),
        "trust_capped_fields": sorted(capped, key=lambda r: (r["field"], r["module"])),
        "unknown_field_count": len(unknown_fields),
        "unknown_fields_sample": unknown_fields[:200],
        "claims_vectors": dict(sorted(claims_vectors.items())),
    }


def cmd_index(args: argparse.Namespace) -> int:
    repo = Path(args.repo_root).resolve()
    modules = walk_modules(repo)
    sys.stderr.write(f"scanning {len(modules)} modules\n")
    records: list[dict[str, Any]] = []
    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as handle:
        for index, rel in enumerate(modules, 1):
            record = classify_module(repo / rel, rel)
            if record is None:
                continue
            records.append(record)
            handle.write(json.dumps(record, sort_keys=True) + "\n")
            if index % 2000 == 0:
                sys.stderr.write(f"  scanned {index}/{len(modules)}\n")
    summary = summarize(records)
    summary_path = Path(args.summary_out)
    summary_path.parent.mkdir(parents=True, exist_ok=True)
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    sys.stderr.write(f"wrote {out_path} and {summary_path}\n")
    printable = {k: v for k, v in summary.items() if k != "unknown_fields_sample"}
    print(json.dumps(printable, indent=2, sort_keys=True))
    return 0


def cmd_classify(args: argparse.Namespace) -> int:
    repo = Path(args.repo_root).resolve()
    rel = str(Path(args.module))
    record = classify_module(repo / rel, rel)
    if record is None:
        sys.stderr.write(f"{rel}: no classifiable dict literal\n")
        return 1
    if args.field:
        entry = record["fields"].get(args.field)
        if entry is None:
            sys.stderr.write(f"{rel}: field {args.field} not written here\n")
            return 1
        print(
            json.dumps(
                {"module": rel, "field": args.field, **entry}, indent=2, sort_keys=True
            )
        )
        return 0
    print(json.dumps(record, indent=2, sort_keys=True))
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    index = sub.add_parser("index", help="classify every writer module")
    index.add_argument("--repo-root", default=".")
    index.add_argument("--out", required=True)
    index.add_argument("--summary-out", required=True)
    index.set_defaults(func=cmd_index)
    classify = sub.add_parser(
        "classify", help="classify one module, optionally one field"
    )
    classify.add_argument("--repo-root", default=".")
    classify.add_argument("--module", required=True)
    classify.add_argument("--field", default=None)
    classify.set_defaults(func=cmd_classify)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    sys.exit(main())
