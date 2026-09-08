"""Plan the Prove2Me decomposition of the P97 counting proof.

This is a consumer of the two Lean-produced oracles described in
``references/upload_full_project.md``.  It deliberately does not infer Lean
declaration boundaries, proof cuts, or dependencies from source text.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import defaultdict, deque
from collections.abc import Iterable
from itertools import pairwise
from pathlib import Path
from typing import Any

TARGET = "Problem97.counterexample_card_ge_nine"
RUN_ROOT = Path("../scratch/runs/prove2me-counting-transfer-20260907/run-0001")
DEFAULT_GRAPH = RUN_ROOT / "artifacts/decl_graph.jsonl"
DEFAULT_SKETCH_DIR = RUN_ROOT / "artifacts/sketch"
DEFAULT_SOURCE_ROOT = Path("../.worktrees/mathlib-v4331-migration-20260907/lean")
DEFAULT_OUTPUT = Path("submissions/counting-transfer/plan.json")
DEFAULT_PLATFORM_ROOT = Path("submissions/counting-transfer/platform")
DEFAULT_GENERATION_MANIFEST = Path("submissions/counting-transfer/generation-manifest.json")
DEFAULT_ADAPTER = DEFAULT_PLATFORM_ROOT / "Definitions/Def_Erdos9796Counting_Adapter.lean"
DEFAULT_ROOT_STUB = Path("Theorems/Thm_Erdos9796Mission_counterexample_card_ge_nine.lean")
ADAPTER_MODULE = "Definitions.Def_Erdos9796Counting_Adapter"
FOUNDATION_MODULE = "Definitions.Def_Erdos9796Counting_Foundation"
ROOT_PLATFORM_NAME = "Erdos9796Mission.counterexample_card_ge_nine"
PROJECT_IMPORT_PREFIXES = (
    "Erdos9796Proof",
    "FormalConjectures",
    "FormalConjecturesForMathlib",
)
PORTABILITY_COMMAND = b"set_option linter.style.moduleDocstring false"
BAD_ATTRIBUTION_PHRASES = (
    "Planar point sets with many isosceles triangles",
    "Planar point sets with many isosceles\n  triangles",
    "Fox–Pach",
    "Fox-Pach",
    "Fox, J. and Pach, J.",
)
CANONICAL_DUMITRESCU = (
    "Adrian Dumitrescu (2006), *On Distinct Distances from a Vertex of a "
    "Convex Polygon*, Discrete & Computational Geometry 36, 503–509. "
    "DOI: 10.1007/s00454-006-1262-y."
)
CANONICAL_NPPZ = (
    "Gabriel Nivasch, János Pach, Rom Pinchasi, and Shira Zerbib, *The Number "
    "of Distinct Distances from a Vertex of a Convex Polygon*, Journal of "
    "Computational Geometry 4 (2013), 1–12; arXiv:1207.1266 (2012 preprint)."
)
DOCUMENTATION_REPLACEMENTS = (
    (
        (
            "* Fox, J. and Pach, J. (2012). *Erdős-Szekeres-type theorems for monotone\n"
            "  paths and convex bodies.* arXiv:1207.1266 §2.\n"
            "* Nivasch, G., Pach, J., Pinchasi, R., and Zerbib, S. (2012).\n"
            "  *The number of distinct distances from a vertex of a convex polygon.*\n"
            "  arXiv:1207.1266 §2 (Corollary 9)."
        ),
        f"* {CANONICAL_NPPZ.removesuffix('.')}, Corollary 9.",
    ),
    (
        "Dumitrescu, A. (2006). *Planar point sets with many isosceles\n  triangles.*",
        CANONICAL_DUMITRESCU,
    ),
    (
        (
            "Fox, J. and Pach, J. (2012). *Erdős-Szekeres-type theorems for monotone\n"
            "  paths and convex bodies.* arXiv:1207.1266 §2, Definition 5, Lemma 6,\n"
            "  Corollary 7."
        ),
        CANONICAL_NPPZ,
    ),
    (
        (
            "Fox, J. and Pach, J. (2012). *Erdős-Szekeres-type theorems for monotone\n"
            "  paths and convex bodies.* arXiv:1207.1266 §2."
        ),
        CANONICAL_NPPZ,
    ),
    (
        (
            "Nivasch, G., Pach, J., Pinchasi, R., and Zerbib, S. (2012).\n"
            "  *The number of distinct distances from a vertex of a convex polygon.*\n"
            "  arXiv:1207.1266 §2"
        ),
        CANONICAL_NPPZ.removesuffix("."),
    ),
    (
        "Dumitrescu 2006 / Fox–Pach 2012 / Nivasch–Pach–Pinchasi–Zerbib 2012",
        "Dumitrescu 2006 / Nivasch–Pach–Pinchasi–Zerbib 2013 (2012 preprint)",
    ),
    ("Planar point sets with many isosceles triangles", CANONICAL_DUMITRESCU),
    ("Planar point sets with many isosceles\n  triangles", CANONICAL_DUMITRESCU),
    ("Fox–Pach 2012", "Nivasch–Pach–Pinchasi–Zerbib 2013"),
    ("Fox-Pach 2012", "Nivasch–Pach–Pinchasi–Zerbib 2013"),
    ("Fox–Pach", "Nivasch–Pach–Pinchasi–Zerbib"),
    ("Fox-Pach", "Nivasch–Pach–Pinchasi–Zerbib"),
    ("Nivasch–Pach–Pinchasi–Zerbib 2012", "Nivasch–Pach–Pinchasi–Zerbib 2013"),
)

DEFINITION_KINDS = {"def", "inductive"}
THEOREM_KIND = "theorem"


class PlanError(RuntimeError):
    """An extractor artifact is absent or internally inconsistent."""


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    if not path.is_file():
        raise PlanError(f"missing JSONL artifact: {path}")
    rows: list[dict[str, Any]] = []
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, 1):
            if not line.strip():
                continue
            try:
                row = json.loads(line)
            except json.JSONDecodeError as error:
                raise PlanError(f"{path}:{line_number}: invalid JSON: {error}") from error
            if not isinstance(row, dict):
                raise PlanError(f"{path}:{line_number}: expected a JSON object")
            rows.append(row)
    return rows


def module_path(root: Path, module: str) -> Path:
    return root.joinpath(*module.split(".")).with_suffix(".lean")


def sketch_path(root: Path, module: str) -> Path:
    return root / f"{module.replace('.', '_')}.jsonl"


def fact_id(module: str, fact: dict[str, Any]) -> str:
    start = fact["declStart"]["offset"]
    end = fact["declEnd"]["offset"]
    return f"{module}:{start}:{end}"


def short_name_matches(user_name: str, name_text: str | None) -> bool:
    if name_text is None:
        return False
    return user_name == name_text or user_name.endswith(f".{name_text}")


def row_value_dependencies(row: dict[str, Any]) -> list[str]:
    return sorted(set(row["valueDeps"] + row.get("syntaxDeps", [])))


def row_dependencies(row: dict[str, Any]) -> list[str]:
    return sorted(set(row["typeDeps"] + row_value_dependencies(row)))


def join_decl_fact(
    row: dict[str, Any], facts: list[dict[str, Any]]
) -> tuple[dict[str, Any], str]:
    """Join a graph row to its unique enclosing Stage 2 declaration command."""
    start_line = row["startLine"]
    end_line = row["endLine"]
    candidates = [
        fact
        for fact in facts
        if fact.get("kind") == "decl"
        and fact["declStart"]["line"] <= start_line
        and end_line <= fact["declEnd"]["line"]
    ]
    named = [
        fact
        for fact in candidates
        if short_name_matches(row["userName"], fact.get("nameText"))
    ]
    if len(named) == 1:
        return named[0], "containment+userName"
    if len(candidates) == 1:
        return candidates[0], "containment"
    if not candidates:
        raise PlanError(
            f"no Stage 2 declaration contains {row['name']} "
            f"at {row['module']}:{start_line}-{end_line}"
        )
    rendered = ", ".join(
        f"{fact.get('nameText')}@{fact['declStart']['line']}-"
        f"{fact['declEnd']['line']}" for fact in candidates
    )
    raise PlanError(f"ambiguous Stage 2 join for {row['name']}: {rendered}")


def reachable_names(
    roots: Iterable[str],
    rows_by_name: dict[str, dict[str, Any]],
    constructors: dict[str, list[str]],
) -> tuple[set[str], set[str]]:
    """Traverse exact graph edges, including inductive-to-constructor edges."""
    reached: set[str] = set()
    missing: set[str] = set()
    work = deque(sorted(set(roots)))
    while work:
        name = work.popleft()
        if name in reached:
            continue
        row = rows_by_name.get(name)
        if row is None:
            missing.add(name)
            continue
        reached.add(name)
        dependencies = row_dependencies(row)
        if row["kind"] == "inductive":
            dependencies += constructors.get(name, [])
        for dependency in sorted(set(dependencies)):
            if dependency not in reached:
                work.append(dependency)
    return reached, missing


def dependency_closure(
    seeds: Iterable[str], rows_by_name: dict[str, dict[str, Any]], *, value_only_at_root: bool
) -> set[str]:
    """Close graph dependencies; optionally enter through proof/body edges only."""
    reached: set[str] = set()
    work: deque[str] = deque()
    for seed in sorted(set(seeds)):
        row = rows_by_name[seed]
        deps = row_value_dependencies(row) if value_only_at_root else row_dependencies(row)
        work.extend(sorted(set(deps)))
    while work:
        name = work.popleft()
        if name in reached or name not in rows_by_name:
            continue
        reached.add(name)
        row = rows_by_name[name]
        work.extend(row_dependencies(row))
    return reached


def command_is_definition(command: dict[str, Any]) -> bool:
    return command["is_instance"] or bool(DEFINITION_KINDS.intersection(command["kinds"]))


def command_is_theorem(command: dict[str, Any]) -> bool:
    return THEOREM_KIND in command["kinds"] and not command_is_definition(command)


def proof_closure_commands(
    command: dict[str, Any],
    commands_by_id: dict[str, dict[str, Any]],
    command_for_name: dict[str, str],
    rows_by_name: dict[str, dict[str, Any]],
    stop_nodes: set[str],
) -> set[str]:
    seeds: set[str] = set()
    for name in command["names"]:
        seeds.update(row_value_dependencies(rows_by_name[name]))
    reached_commands: set[str] = set()
    seen_names: set[str] = set()
    work = deque(sorted(seeds))
    while work:
        name = work.popleft()
        if name in seen_names or name not in rows_by_name:
            continue
        seen_names.add(name)
        dependency_command = command_for_name.get(name)
        if dependency_command is not None and dependency_command != command["id"]:
            reached_commands.add(dependency_command)
            if dependency_command in stop_nodes:
                continue
        row = rows_by_name[name]
        work.extend(row_dependencies(row))
    return reached_commands


def leaves_first_order(
    items: Iterable[str], dependencies: dict[str, set[str]]
) -> tuple[list[str], list[str]]:
    """Return dependencies-before-consumers order and any cyclic remainder."""
    remaining = {item: set(dependencies.get(item, set())) for item in items}
    order: list[str] = []
    while remaining:
        ready = sorted(item for item, deps in remaining.items() if not deps)
        if not ready:
            return order, sorted(remaining)
        order.extend(ready)
        for item in ready:
            del remaining[item]
        ready_set = set(ready)
        for deps in remaining.values():
            deps.difference_update(ready_set)
    return order, []


def resolve_stage2_constant(
    const: str,
    module: str,
    rows_by_name: dict[str, dict[str, Any]],
    rows_by_user_name: dict[str, list[dict[str, Any]]],
) -> str | None:
    if const in rows_by_name:
        return const
    exact_user = rows_by_user_name.get(const, [])
    if len(exact_user) == 1:
        return exact_user[0]["name"]
    private_matches = [
        row for user_name, rows in rows_by_user_name.items() for row in rows
        if row["module"] == module and const.endswith(f".{user_name}")
    ]
    if len(private_matches) == 1:
        return private_matches[0]["name"]
    return None


def augment_reachability_from_syntax(
    reached: set[str],
    rows_by_name: dict[str, dict[str, Any]],
    stage2_by_module: dict[str, list[dict[str, Any]]],
    constructors: dict[str, list[str]],
) -> tuple[set[str], set[str], set[str], dict[str, set[str]]]:
    """Add project constants referenced syntactically inside selected commands."""
    rows_by_user_name: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in rows_by_name.values():
        rows_by_user_name[row["userName"]].append(row)
    syntax_roots: set[str] = set()
    unresolved: set[str] = set()
    command_syntax_dependencies: dict[str, set[str]] = defaultdict(set)

    while True:
        selected_facts: dict[str, dict[str, dict[str, Any]]] = defaultdict(dict)
        for name in sorted(reached):
            row = rows_by_name[name]
            if row["startLine"] == 0:
                continue
            fact, _ = join_decl_fact(row, stage2_by_module[row["module"]])
            selected_facts[row["module"]][fact_id(row["module"], fact)] = fact

        newly_referenced: set[str] = set()
        for module, facts_by_id in selected_facts.items():
            for ref in stage2_by_module[module]:
                if ref.get("kind") != "ref":
                    continue
                start, end = offset_range(ref)
                containing = [
                    cid for cid, fact in facts_by_id.items()
                    if fact["declStart"]["offset"] <= start
                    and end <= fact["declEnd"]["offset"]
                ]
                if not containing:
                    continue
                if len(containing) != 1:
                    raise PlanError(
                        f"Stage 2 reference belongs to multiple selected commands: {module}:{start}"
                    )
                dependency = resolve_stage2_constant(
                    ref["const"], module, rows_by_name, rows_by_user_name
                )
                if dependency is None:
                    unresolved.add(ref["const"])
                    continue
                command_syntax_dependencies[containing[0]].add(dependency)
                if dependency not in reached:
                    newly_referenced.add(dependency)
        if not newly_referenced:
            break
        syntax_roots.update(newly_referenced)
        added, missing = reachable_names(newly_referenced, rows_by_name, constructors)
        unresolved.update(missing)
        reached.update(added)

    # Recompute command syntax edges for the final selected command set so the
    # downstream proof-closure and import planners see every new command too.
    command_syntax_dependencies.clear()
    selected_facts = defaultdict(dict)
    for name in sorted(reached):
        row = rows_by_name[name]
        if row["startLine"] == 0:
            continue
        fact, _ = join_decl_fact(row, stage2_by_module[row["module"]])
        selected_facts[row["module"]][fact_id(row["module"], fact)] = fact
    for module, facts_by_id in selected_facts.items():
        for ref in stage2_by_module[module]:
            if ref.get("kind") != "ref":
                continue
            start, end = offset_range(ref)
            containing = [
                cid for cid, fact in facts_by_id.items()
                if fact["declStart"]["offset"] <= start
                and end <= fact["declEnd"]["offset"]
            ]
            if len(containing) != 1:
                continue
            dependency = resolve_stage2_constant(
                ref["const"], module, rows_by_name, rows_by_user_name
            )
            if dependency is not None:
                command_syntax_dependencies[containing[0]].add(dependency)
    return reached, syntax_roots, unresolved, command_syntax_dependencies


def build_plan(args: argparse.Namespace) -> dict[str, Any]:
    graph_path = args.graph.resolve()
    sketch_dir = args.sketch_dir.resolve()
    source_root = args.source_root.resolve()
    graph_rows = read_jsonl(graph_path)

    required_keys = {
        "name", "module", "kind", "isPrivate", "isInstance", "userName",
        "startLine", "endLine", "typeDeps", "valueDeps",
    }
    for index, row in enumerate(graph_rows, 1):
        absent = required_keys.difference(row)
        if absent:
            raise PlanError(f"graph row {index} is missing keys: {sorted(absent)}")

    rows_by_name: dict[str, dict[str, Any]] = {}
    for row in graph_rows:
        if row["name"] in rows_by_name:
            raise PlanError(f"duplicate graph declaration: {row['name']}")
        rows_by_name[row["name"]] = row
    if args.target not in rows_by_name:
        raise PlanError(f"target absent from declaration graph: {args.target}")

    modules = sorted({row["module"] for row in graph_rows})
    stage2_by_module: dict[str, list[dict[str, Any]]] = {}
    stage2_paths: dict[str, Path] = {}
    source_paths: dict[str, Path] = {}
    for module in modules:
        source = module_path(source_root, module)
        sketch = sketch_path(sketch_dir, module)
        if not source.is_file():
            raise PlanError(f"missing source module {module}: {source}")
        facts = read_jsonl(sketch)
        if not any(fact.get("kind") == "decl" for fact in facts):
            raise PlanError(f"Stage 2 artifact has no declaration facts: {sketch}")
        source_paths[module] = source
        stage2_paths[module] = sketch
        stage2_by_module[module] = facts

    constructors: dict[str, list[str]] = defaultdict(list)
    for row in graph_rows:
        if row["kind"] != "ctor":
            continue
        for dependency in row["typeDeps"]:
            parent = rows_by_name.get(dependency)
            if parent is not None and parent["kind"] == "inductive":
                constructors[dependency].append(row["name"])

    instance_roots = sorted(
        row["name"] for row in graph_rows
        if row["isInstance"] and row["module"] in stage2_by_module
    )
    reached, missing_dependencies = reachable_names(
        [args.target, *instance_roots], rows_by_name, constructors
    )
    kernel_reachable_count = len(reached)
    reached, syntax_only_roots, unresolved_syntax_refs, command_syntax_dependencies = (
        augment_reachability_from_syntax(
            reached, rows_by_name, stage2_by_module, constructors
        )
    )
    source_backed_names = sorted(
        name for name in reached if rows_by_name[name]["startLine"] > 0
    )
    spanless_names = sorted(reached.difference(source_backed_names))

    commands_by_id: dict[str, dict[str, Any]] = {}
    command_for_name: dict[str, str] = {}
    join_counts: dict[str, int] = defaultdict(int)
    for name in source_backed_names:
        row = rows_by_name[name]
        fact, method = join_decl_fact(row, stage2_by_module[row["module"]])
        cid = fact_id(row["module"], fact)
        join_counts[method] += 1
        command_for_name[name] = cid
        command = commands_by_id.setdefault(
            cid,
            {
                "id": cid,
                "module": row["module"],
                "source": str(source_paths[row["module"]]),
                "names": [],
                "user_names": [],
                "kinds": [],
                "is_private": bool(fact.get("privateTok")),
                "is_instance": False,
                "stage2": fact,
                "join_methods": [],
            },
        )
        command["names"].append(name)
        command["user_names"].append(row["userName"])
        command["kinds"].append(row["kind"])
        command["is_private"] = command["is_private"] or row["isPrivate"]
        command["is_instance"] = command["is_instance"] or row["isInstance"]
        command["join_methods"].append(method)

    for command in commands_by_id.values():
        for key in ("names", "user_names", "kinds", "join_methods"):
            command[key] = sorted(set(command[key]))
        val_start = command["stage2"].get("valStart")
        command["proof_lines"] = (
            command["stage2"]["declEnd"]["line"] - val_start["line"]
            if val_start is not None else None
        )
        command["has_docstring"] = command["stage2"].get("docstring") is not None
        syntax_dependencies = command_syntax_dependencies.get(command["id"], set()).difference(
            command["names"]
        )
        primary_names = [
            name for name in command["names"]
            if short_name_matches(rows_by_name[name]["userName"], command["stage2"].get("nameText"))
        ]
        if syntax_dependencies:
            if len(primary_names) != 1:
                raise PlanError(
                    f"cannot attach Stage 2 syntax dependencies to {command['id']}"
                )
            rows_by_name[primary_names[0]]["syntaxDeps"] = sorted(syntax_dependencies)

    # Private material needed by a public definition must become importable.
    public_definition_names = [
        name for name in source_backed_names
        if command_is_definition(commands_by_id[command_for_name[name]])
        and not commands_by_id[command_for_name[name]]["is_private"]
    ]
    definition_dependency_names = dependency_closure(
        public_definition_names, rows_by_name, value_only_at_root=False
    )
    deprivatized_commands = {
        command_for_name[name]
        for name in definition_dependency_names
        if name in command_for_name and commands_by_id[command_for_name[name]]["is_private"]
    }

    # A private declaration in any surviving statement cannot remain local to a solution.
    for consumer_name in source_backed_names:
        consumer_command = commands_by_id[command_for_name[consumer_name]]
        if consumer_command["is_private"]:
            continue
        for dependency in rows_by_name[consumer_name]["typeDeps"]:
            dependency_command = command_for_name.get(dependency)
            if dependency_command and commands_by_id[dependency_command]["is_private"]:
                deprivatized_commands.add(dependency_command)

    definition_commands = {
        cid for cid, command in commands_by_id.items()
        if command_is_definition(command)
        and (not command["is_private"] or cid in deprivatized_commands)
    }
    definition_names = [
        name for cid in definition_commands for name in commands_by_id[cid]["names"]
    ]
    definition_body_closure = dependency_closure(
        definition_names, rows_by_name, value_only_at_root=True
    )
    embedded_theorem_commands = {
        command_for_name[name]
        for name in definition_body_closure
        if name in command_for_name
        and command_is_theorem(commands_by_id[command_for_name[name]])
    }
    # Anything private pulled into a definition bundle is explicitly de-privatized.
    for cid in embedded_theorem_commands:
        if commands_by_id[cid]["is_private"]:
            deprivatized_commands.add(cid)

    theorem_commands = {
        cid for cid, command in commands_by_id.items() if command_is_theorem(command)
    }
    target_command = command_for_name.get(args.target)
    if target_command is None:
        raise PlanError("target was dropped as spanless; extractor output is unusable")

    direct_consumers: dict[str, set[str]] = defaultdict(set)
    for consumer_name in source_backed_names:
        consumer_cid = command_for_name[consumer_name]
        for dependency in row_value_dependencies(rows_by_name[consumer_name]):
            dependency_cid = command_for_name.get(dependency)
            if dependency_cid and dependency_cid != consumer_cid:
                direct_consumers[dependency_cid].add(consumer_cid)

    explicit_promotions = set(args.promote)
    unknown_promotions = sorted(explicit_promotions.difference(command_for_name))
    if unknown_promotions:
        raise PlanError(f"--promote names absent from reachable graph: {unknown_promotions}")
    explicit_promotion_commands = {command_for_name[name] for name in explicit_promotions}

    node_commands = {target_command}
    for cid in theorem_commands.difference(embedded_theorem_commands):
        command = commands_by_id[cid]
        proof_lines = command["proof_lines"]
        importable = not command["is_private"] or cid in deprivatized_commands
        if importable and proof_lines is not None and proof_lines > 40:
            node_commands.add(cid)
        if importable and cid in explicit_promotion_commands:
            node_commands.add(cid)

    # Medium theorem promotion is a fixpoint because the set of node proof
    # closures determines the "used by at least two nodes" signal.
    while True:
        proof_users: dict[str, set[str]] = defaultdict(set)
        for node_cid in sorted(node_commands):
            closure = proof_closure_commands(
                commands_by_id[node_cid], commands_by_id, command_for_name,
                rows_by_name, node_commands.difference({node_cid}),
            )
            for dependency_cid in closure:
                proof_users[dependency_cid].add(node_cid)
        additions: set[str] = set()
        for cid in theorem_commands.difference(embedded_theorem_commands | node_commands):
            command = commands_by_id[cid]
            proof_lines = command["proof_lines"]
            if command["is_private"] and cid not in deprivatized_commands:
                continue
            if proof_lines is None or not 11 <= proof_lines <= 40:
                continue
            cross_file = any(
                commands_by_id[consumer]["module"] != command["module"]
                for consumer in direct_consumers.get(cid, set())
            )
            if command["has_docstring"] or cross_file or len(proof_users.get(cid, set())) >= 2:
                additions.add(cid)
        if not additions:
            break
        node_commands.update(additions)

    final_proof_users: dict[str, set[str]] = defaultdict(set)
    node_edges: dict[str, set[str]] = defaultdict(set)
    for node_cid in sorted(node_commands):
        closure = proof_closure_commands(
            commands_by_id[node_cid], commands_by_id, command_for_name,
            rows_by_name, node_commands.difference({node_cid}),
        )
        for dependency_cid in closure:
            final_proof_users[dependency_cid].add(node_cid)
            if dependency_cid in node_commands:
                node_edges[node_cid].add(dependency_cid)

    inline_commands = (
        set(commands_by_id) - definition_commands - embedded_theorem_commands - node_commands
    )
    classifications: dict[str, str] = {}
    for cid in definition_commands:
        classifications[cid] = "def-material"
    for cid in embedded_theorem_commands:
        classifications[cid] = "def-embedded-theorem"
    for cid in node_commands:
        classifications[cid] = "node"
    for cid in inline_commands:
        classifications[cid] = "inline-helper"

    for cid, command in commands_by_id.items():
        command["classification"] = classifications[cid]
        command["deprivatize"] = cid in deprivatized_commands
        command["proof_user_nodes"] = sorted(final_proof_users.get(cid, set()))
        command["direct_consumer_commands"] = sorted(direct_consumers.get(cid, set()))
        command["promotion_signals"] = {
            "target": cid == target_command,
            "proof_over_40_lines": (
                command["proof_lines"] is not None and command["proof_lines"] > 40
            ),
            "used_by_at_least_two_nodes": len(final_proof_users.get(cid, set())) >= 2,
            "used_across_files": any(
                commands_by_id[consumer]["module"] != command["module"]
                for consumer in direct_consumers.get(cid, set())
            ),
            "has_docstring": command["has_docstring"],
            "named_in_source_paper": cid in explicit_promotion_commands,
        }

    bundles = []
    for module in modules:
        command_ids = sorted(
            (definition_commands | embedded_theorem_commands).intersection(
                cid for cid, command in commands_by_id.items() if command["module"] == module
            ),
            key=lambda cid: commands_by_id[cid]["stage2"]["declStart"]["offset"],
        )
        if command_ids:
            bundles.append({"module": module, "commands": command_ids})

    bundle_modules = {bundle["module"] for bundle in bundles}
    bundle_edges: dict[str, set[str]] = defaultdict(set)
    for cid in definition_commands | embedded_theorem_commands:
        command = commands_by_id[cid]
        for name in command["names"]:
            row = rows_by_name[name]
            for dependency in row_dependencies(row):
                dependency_cid = command_for_name.get(dependency)
                if dependency_cid not in definition_commands | embedded_theorem_commands:
                    continue
                dependency_module = commands_by_id[dependency_cid]["module"]
                if dependency_module != command["module"]:
                    bundle_edges[command["module"]].add(dependency_module)
    bundle_order, cyclic_bundles = leaves_first_order(bundle_modules, bundle_edges)
    node_order, cyclic_nodes = leaves_first_order(node_commands, node_edges)

    node_inline_helpers: dict[str, list[str]] = {}
    for node_cid in sorted(node_commands):
        closure = proof_closure_commands(
            commands_by_id[node_cid], commands_by_id, command_for_name,
            rows_by_name, node_commands.difference({node_cid}),
        )
        node_inline_helpers[node_cid] = sorted(closure.intersection(inline_commands))

    ref_count = sum(
        1 for facts in stage2_by_module.values() for fact in facts if fact.get("kind") == "ref"
    )
    diagnostics: list[dict[str, Any]] = []
    if not instance_roots:
        diagnostics.append({
            "severity": "info",
            "code": "no_instance_roots",
            "message": "Stage 1 reports no instances in the participating modules.",
        })
    if unresolved_syntax_refs:
        diagnostics.append({
            "severity": "info",
            "code": "unresolved_stage2_project_references",
            "count": len(unresolved_syntax_refs),
            "names": sorted(unresolved_syntax_refs),
            "message": (
                "Stage 2 references with no Stage 1 project declaration remain external "
                "to the extracted project graph."
            ),
        })
    if ref_count == 0:
        diagnostics.append({
            "severity": "error",
            "code": "stage2_reference_facts_missing",
            "message": (
                "Stage 2 emitted no ref facts. Re-run it with the declaration namespace "
                "prefix Problem97 before namespace wrapping or identifier renaming."
            ),
        })
    if missing_dependencies:
        diagnostics.append({
            "severity": "error",
            "code": "missing_graph_dependencies",
            "names": sorted(missing_dependencies),
        })
    val_start_missing = sorted(
        cid for cid in theorem_commands if commands_by_id[cid]["proof_lines"] is None
    )
    if val_start_missing:
        diagnostics.append({
            "severity": "error",
            "code": "theorem_proof_cut_missing",
            "commands": val_start_missing,
        })
    if cyclic_bundles:
        diagnostics.append({
            "severity": "error",
            "code": "definition_bundle_cycle",
            "modules": cyclic_bundles,
        })
    if cyclic_nodes:
        diagnostics.append({
            "severity": "error",
            "code": "theorem_node_cycle",
            "commands": cyclic_nodes,
        })

    command_list = sorted(
        commands_by_id.values(),
        key=lambda command: (
            command["module"], command["stage2"]["declStart"]["offset"], command["id"]
        ),
    )
    declaration_list = []
    for name in source_backed_names:
        row = rows_by_name[name]
        cid = command_for_name[name]
        declaration_list.append({
            "name": name,
            "user_name": row["userName"],
            "module": row["module"],
            "kind": row["kind"],
            "is_private": row["isPrivate"],
            "is_instance": row["isInstance"],
            "start_line": row["startLine"],
            "end_line": row["endLine"],
            "type_deps": sorted(row["typeDeps"]),
            "kernel_value_deps": sorted(row["valueDeps"]),
            "syntax_deps": sorted(row.get("syntaxDeps", [])),
            "value_deps": row_value_dependencies(row),
            "command": cid,
            "classification": classifications[cid],
        })

    return {
        "schema": "prove2me-full-project-plan/v1",
        "target": args.target,
        "inputs": {
            "declaration_graph": {"path": str(graph_path), "sha256": sha256(graph_path)},
            "source_root": str(source_root),
            "sketch_dir": str(sketch_dir),
            "modules": [
                {
                    "module": module,
                    "source": str(source_paths[module]),
                    "source_sha256": sha256(source_paths[module]),
                    "sketch": str(stage2_paths[module]),
                    "sketch_sha256": sha256(stage2_paths[module]),
                }
                for module in modules
            ],
        },
        "roots": {
            "targets": [args.target],
            "instances": instance_roots,
            "syntax_only": sorted(syntax_only_roots),
        },
        "counts": {
            "graph_rows": len(graph_rows),
            "participating_modules": len(modules),
            "kernel_reachable_rows": kernel_reachable_count,
            "syntax_only_roots_added": len(syntax_only_roots),
            "syntax_augmented_rows_added": len(reached) - kernel_reachable_count,
            "reachable_rows_before_span_filter": len(reached),
            "reachable_spanless_rows": len(spanless_names),
            "reachable_source_rows": len(source_backed_names),
            "source_commands": len(command_list),
            "definition_bundles": len(bundles),
            "def_material_commands": len(definition_commands),
            "def_embedded_theorem_commands": len(embedded_theorem_commands),
            "node_commands": len(node_commands),
            "inline_helper_commands": len(inline_commands),
            "stage2_ref_facts": ref_count,
        },
        "join_counts": dict(sorted(join_counts.items())),
        "spanless_reachable": spanless_names,
        "definitions_bundles": bundles,
        "definition_bundle_edges": {
            module: sorted(bundle_edges.get(module, set())) for module in sorted(bundle_modules)
        },
        "definition_bundle_order": bundle_order,
        "nodes": sorted(node_commands),
        "node_edges": {
            cid: sorted(node_edges.get(cid, set())) for cid in sorted(node_commands)
        },
        "node_upload_order": node_order,
        "node_inline_helpers": node_inline_helpers,
        "inline_helpers": sorted(inline_commands),
        "def_embedded_theorems": sorted(embedded_theorem_commands),
        "deprivatized_commands": sorted(deprivatized_commands),
        "commands": command_list,
        "declarations": declaration_list,
        "diagnostics": diagnostics,
        "generation_ready": not any(item["severity"] == "error" for item in diagnostics),
    }


def definition_module(module: str) -> str:
    prefix = "Erdos9796Proof.P97."
    if not module.startswith(prefix):
        raise PlanError(f"unexpected source module outside P97: {module}")
    suffix = module.removeprefix(prefix).replace(".", "_")
    return f"Definitions.Def_Erdos9796Counting_{suffix}"


def platform_theorem_name(command: dict[str, Any], target: str) -> str:
    if target in command["names"]:
        return ROOT_PLATFORM_NAME
    if len(command["user_names"]) != 1:
        raise PlanError(f"node command does not have one user name: {command['id']}")
    name = command["user_names"][0]
    if any(not part or not part.replace("_", "a").isalnum() for part in name.split(".")):
        raise PlanError(f"platform theorem name is not conservative ASCII: {name}")
    if not name.isascii():
        raise PlanError(f"platform theorem name is not ASCII: {name}")
    return name


def theorem_module(theorem_name: str) -> str:
    return f"Theorems.Thm_{theorem_name.replace('.', '_')}"


def command_maps(plan: dict[str, Any]) -> tuple[dict[str, Any], dict[str, str]]:
    commands = {command["id"]: command for command in plan["commands"]}
    command_for_name = {
        name: command["id"] for command in plan["commands"] for name in command["names"]
    }
    return commands, command_for_name


def offset_range(item: dict[str, Any]) -> tuple[int, int]:
    return item["start"]["offset"], item["end"]["offset"]


def inside_any(start: int, end: int, ranges: Iterable[tuple[int, int]]) -> bool:
    return any(left <= start and end <= right for left, right in ranges)


def apply_edits(source: bytes, edits: list[dict[str, Any]]) -> bytes:
    ordered = sorted(edits, key=lambda edit: (edit["start"], edit["end"], edit["reason"]))
    previous_end = 0
    for edit in ordered:
        start, end = edit["start"], edit["end"]
        if not (0 <= start <= end <= len(source)):
            raise PlanError(f"edit outside source: {edit}")
        if start < previous_end:
            raise PlanError(f"overlapping exact edits near byte {start}: {edit['reason']}")
        previous_end = end
    result = source
    for edit in reversed(ordered):
        result = result[: edit["start"]] + edit["replacement"] + result[edit["end"] :]
    return result


def portability_edits(source: bytes) -> list[dict[str, Any]]:
    edits: list[dict[str, Any]] = []
    cursor = 0
    while True:
        start = source.find(PORTABILITY_COMMAND, cursor)
        if start < 0:
            break
        line_start = source.rfind(b"\n", 0, start) + 1
        line_end = source.find(b"\n", start)
        if line_end < 0:
            line_end = len(source)
        else:
            line_end += 1
        if source[line_start:start].strip() or source[start + len(PORTABILITY_COMMAND) : line_end].strip():
            raise PlanError("unsupported linter command is not an exact standalone command")
        edits.append({
            "start": line_start,
            "end": line_end,
            "replacement": b"",
            "reason": "source-digest-guarded portability edit",
        })
        cursor = line_end
    return edits


def block_depth_after(line: str, initial_depth: int) -> int:
    depth = initial_depth
    index = 0
    in_string = False
    escaped = False
    while index < len(line):
        if depth:
            if line.startswith("/-", index):
                depth += 1
                index += 2
            elif line.startswith("-/", index):
                depth -= 1
                index += 2
            else:
                index += 1
            continue
        char = line[index]
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
            index += 1
            continue
        if line.startswith("--", index):
            break
        if line.startswith("/-", index):
            depth += 1
            index += 2
        elif char == '"':
            in_string = True
            index += 1
        else:
            index += 1
    return depth


def lean_ascii_tokens(source: bytes) -> list[tuple[str, int, int]]:
    """Return ASCII identifier tokens outside Lean comments and strings."""
    tokens: list[tuple[str, int, int]] = []
    index = 0
    block_depth = 0
    in_string = False
    escaped = False
    while index < len(source):
        if block_depth:
            if source.startswith(b"/-", index):
                block_depth += 1
                index += 2
            elif source.startswith(b"-/", index):
                block_depth -= 1
                index += 2
            else:
                index += 1
            continue
        if in_string:
            byte = source[index]
            if escaped:
                escaped = False
            elif byte == ord("\\"):
                escaped = True
            elif byte == ord('"'):
                in_string = False
            index += 1
            continue
        if source.startswith(b"--", index):
            newline = source.find(b"\n", index)
            index = len(source) if newline < 0 else newline + 1
            continue
        if source.startswith(b"/-", index):
            block_depth = 1
            index += 2
            continue
        if source[index] == ord('"'):
            in_string = True
            index += 1
            continue
        byte = source[index]
        if chr(byte).isascii() and (chr(byte).isalpha() or byte == ord("_")):
            start = index
            index += 1
            while index < len(source):
                next_byte = source[index]
                char = chr(next_byte)
                if not char.isascii() or not (char.isalnum() or next_byte == ord("_")):
                    break
                index += 1
            tokens.append((source[start:index].decode("ascii"), start, index))
            continue
        index += 1
    if block_depth or in_string:
        raise PlanError("unterminated comment or string during guarded token scan")
    return tokens


def lean_comment_spans(source: bytes) -> list[tuple[int, int]]:
    """Return outer line/block comment spans while skipping string literals."""
    spans: list[tuple[int, int]] = []
    index = 0
    in_string = False
    escaped = False
    while index < len(source):
        if in_string:
            byte = source[index]
            if escaped:
                escaped = False
            elif byte == ord("\\"):
                escaped = True
            elif byte == ord('"'):
                in_string = False
            index += 1
            continue
        if source.startswith(b"--", index):
            end = source.find(b"\n", index)
            end = len(source) if end < 0 else end
            spans.append((index, end))
            index = end
            continue
        if source.startswith(b"/-", index):
            start = index
            depth = 1
            index += 2
            while index < len(source) and depth:
                if source.startswith(b"/-", index):
                    depth += 1
                    index += 2
                elif source.startswith(b"-/", index):
                    depth -= 1
                    index += 2
                else:
                    index += 1
            if depth:
                raise PlanError("unterminated block comment during documentation scan")
            spans.append((start, index))
            continue
        if source[index] == ord('"'):
            in_string = True
        index += 1
    if in_string:
        raise PlanError("unterminated string during documentation scan")
    return spans


def documentation_edits(source: bytes) -> list[dict[str, Any]]:
    comment_spans = lean_comment_spans(source)
    for wrong, _ in DOCUMENTATION_REPLACEMENTS:
        needle = wrong.encode("utf-8")
        offset = 0
        while (start := source.find(needle, offset)) >= 0:
            end = start + len(needle)
            if not inside_any(start, end, comment_spans):
                raise PlanError(
                    "documentation attribution replacement matched outside a Lean comment"
                )
            offset = end
    edits: list[dict[str, Any]] = []
    for start, end in comment_spans:
        original = source[start:end].decode("utf-8")
        corrected = original
        for wrong, replacement in DOCUMENTATION_REPLACEMENTS:
            corrected = corrected.replace(wrong, replacement)
        if corrected != original:
            edits.append({
                "start": start,
                "end": end,
                "replacement": corrected.encode("utf-8"),
                "reason": "source-digest-guarded documentation attribution correction",
            })
    return edits


def declaration_kind_edit(prefix: bytes, binding_start: int) -> dict[str, Any] | None:
    candidates = [
        (token, start, end)
        for token, start, end in lean_ascii_tokens(prefix[:binding_start])
        if token in {"theorem", "lemma"}
    ]
    if len(candidates) != 1:
        raise PlanError(
            f"expected one theorem/lemma token before Stage 2 binding, found {len(candidates)}"
        )
    token, start, end = candidates[0]
    if token == "theorem":
        return None
    return {
        "start": start,
        "end": end,
        "replacement": b"theorem",
        "reason": "guarded declaration-kind token lemma→theorem",
    }


def solution_declaration_counts(content: str) -> tuple[int, int]:
    tokens = [token for token, _, _ in lean_ascii_tokens(content.encode("utf-8"))]
    theorem_count = sum(
        tokens[index : index + 2] == ["theorem", "solution"]
        for index in range(len(tokens) - 1)
    )
    lemma_count = sum(
        tokens[index : index + 2] == ["lemma", "solution"]
        for index in range(len(tokens) - 1)
    )
    return theorem_count, lemma_count


def is_scaffold_command(line: str, keyword: str) -> bool:
    code = line.rstrip("\r\n")
    return code == keyword or code.startswith(f"{keyword} ")


def flatten_scaffolding(text: str) -> tuple[str, int]:
    """Remove only lexical top-level namespace/section delimiters."""
    depth = 0
    flattened = 0
    output: list[str] = []
    for line in text.splitlines(keepends=True):
        at_top_level = depth == 0
        if at_top_level and any(
            is_scaffold_command(line, keyword) for keyword in ("namespace", "section", "end")
        ):
            output.append("\n" if line.endswith("\n") else "")
            flattened += 1
        else:
            output.append(line)
        depth = block_depth_after(line, depth)
    if depth != 0:
        raise PlanError("unbalanced block comment after skeleton subtraction")
    return "".join(output), flattened


def import_lines(text: str) -> tuple[list[int], list[str], list[str]]:
    indices: list[int] = []
    modules: list[str] = []
    comments: list[str] = []
    depth = 0
    for index, line in enumerate(text.splitlines(keepends=True)):
        if depth == 0 and line.startswith("import "):
            indices.append(index)
            code, separator, comment = line.rstrip("\r\n").partition("--")
            modules.extend(code.removeprefix("import ").split())
            if separator and comment.strip():
                comments.append(f"-- {comment.strip()}\n")
        depth = block_depth_after(line, depth)
    return indices, modules, comments


def rewrite_imports(text: str, imports: Iterable[str], provenance: str) -> tuple[str, list[str]]:
    lines = text.splitlines(keepends=True)
    indices, original_modules, comments = import_lines(text)
    if not indices:
        raise PlanError("source fragment has no import header to replace")
    generated = [f"/- {provenance} -/\n"]
    generated.extend(f"import {module}\n" for module in sorted(set(imports)))
    generated.extend(comments)
    generated.append("\n")
    first = indices[0]
    index_set = set(indices)
    output: list[str] = []
    for index, line in enumerate(lines):
        if index == first:
            output.extend(generated)
        if index not in index_set:
            output.append(line)
    return "".join(output), original_modules


def insert_after_imports(text: str, addition: str) -> str:
    lines = text.splitlines(keepends=True)
    indices, _, _ = import_lines(text)
    if not indices:
        raise PlanError("generated file has no imports")
    lines.insert(indices[-1] + 1, addition)
    return "".join(lines)


def namespace_opens(command_ids: Iterable[str], commands: dict[str, Any]) -> list[str]:
    prefixes: set[str] = set()
    for cid in command_ids:
        for name in commands[cid]["user_names"]:
            parts = name.split(".")[:-1]
            for end in range(1, len(parts) + 1):
                prefixes.add(".".join(parts[:end]))
    return sorted(prefixes, key=lambda name: (name.count("."), name))


def nonproject_imports(modules: Iterable[str]) -> list[str]:
    return sorted({
        module for module in modules
        if not module.startswith(PROJECT_IMPORT_PREFIXES)
    })


def source_context(plan: dict[str, Any]) -> dict[str, dict[str, Any]]:
    context: dict[str, dict[str, Any]] = {}
    for module in plan["inputs"]["modules"]:
        source_path = Path(module["source"])
        sketch_path_value = Path(module["sketch"])
        if sha256(source_path) != module["source_sha256"]:
            raise PlanError(f"source digest changed after extraction: {source_path}")
        if sha256(sketch_path_value) != module["sketch_sha256"]:
            raise PlanError(f"Stage 2 digest changed after planning: {sketch_path_value}")
        facts = read_jsonl(sketch_path_value)
        context[module["module"]] = {
            "source_path": source_path,
            "source_sha256": module["source_sha256"],
            "source": source_path.read_bytes(),
            "decls": [fact for fact in facts if fact.get("kind") == "decl"],
            "refs": [fact for fact in facts if fact.get("kind") == "ref"],
        }
    return context


def binding_ref(
    command: dict[str, Any], context: dict[str, Any]
) -> dict[str, Any]:
    fact = command["stage2"]
    name_text = fact.get("nameText")
    if name_text is None:
        raise PlanError(f"cannot platformize anonymous declaration: {command['id']}")
    start = fact["declStart"]["offset"]
    end = fact["declEnd"]["offset"]
    source = context["source"]
    candidates = []
    for ref in context["refs"]:
        ref_start, ref_end = offset_range(ref)
        refers_to_command = ref["const"] in command["names"] or any(
            ref["const"].endswith(f".{user_name}")
            for user_name in command["user_names"]
        )
        if not (start <= ref_start and ref_end <= end) or not refers_to_command:
            continue
        if source[ref_start:ref_end].decode("utf-8") == name_text:
            candidates.append(ref)
    if len(candidates) != 1:
        raise PlanError(
            f"expected one exact binding ref for {command['id']}, found {len(candidates)}"
        )
    return candidates[0]


def skeleton_bytes(
    module: str,
    keep_commands: set[str],
    plan: dict[str, Any],
    contexts: dict[str, dict[str, Any]],
    *,
    proof_cut: str | None = None,
    binding_replacements: dict[str, str] | None = None,
    force_theorem_commands: set[str] | None = None,
    prefix_replacements: dict[str, bytes] | None = None,
    strip_docstrings: set[str] | None = None,
    flatten_private: bool = False,
) -> tuple[bytes, dict[str, Any]]:
    commands, _ = command_maps(plan)
    context = contexts[module]
    source = context["source"]
    keep_spans = {
        (
            commands[cid]["stage2"]["declStart"]["offset"],
            commands[cid]["stage2"]["declEnd"]["offset"],
        )
        for cid in keep_commands
    }
    removal_ranges = [
        offset_range({"start": fact["declStart"], "end": fact["declEnd"]})
        for fact in context["decls"]
        if offset_range({"start": fact["declStart"], "end": fact["declEnd"]}) not in keep_spans
    ]
    edits = [
        {"start": start, "end": end, "replacement": b"", "reason": "skeleton subtraction"}
        for start, end in removal_ranges
    ]
    portability = portability_edits(source)
    edits.extend(
        edit for edit in portability
        if not inside_any(edit["start"], edit["end"], removal_ranges)
    )
    private_removed = 0
    docstrings_removed = 0
    reference_rewrites = 0
    binding_replacements = binding_replacements or {}
    force_theorem_commands = force_theorem_commands or set()
    prefix_replacements = prefix_replacements or {}
    strip_docstrings = strip_docstrings or set()
    binding_ranges: set[tuple[int, int]] = set()
    for cid in keep_commands:
        command = commands[cid]
        fact = command["stage2"]
        if cid in prefix_replacements:
            val_start = fact.get("valStart")
            if val_start is None:
                raise PlanError(f"replacement prefix lacks Stage 2 proof cut: {cid}")
            edits.append({
                "start": fact["declStart"]["offset"],
                "end": val_start["offset"],
                "replacement": prefix_replacements[cid],
                "reason": "exact root solution statement prefix",
            })
            reference_rewrites += 1
            continue
        if command["is_private"] and (flatten_private or command["deprivatize"]):
            private = fact.get("privateTok")
            if private is None:
                raise PlanError(f"private command lacks privateTok: {cid}")
            start, end = offset_range(private)
            edits.append({"start": start, "end": end, "replacement": b"", "reason": "privateTok"})
            private_removed += 1
        if cid in strip_docstrings and fact.get("docstring") is not None:
            start, end = offset_range(fact["docstring"])
            edits.append({"start": start, "end": end, "replacement": b"", "reason": "docstring"})
            docstrings_removed += 1
        if cid in binding_replacements:
            ref = binding_ref(command, context)
            start, end = offset_range(ref)
            if cid in force_theorem_commands:
                prefix = source[fact["declStart"]["offset"] : start]
                kind_edit = declaration_kind_edit(prefix, len(prefix))
                if kind_edit is not None:
                    edits.append({
                        **kind_edit,
                        "start": kind_edit["start"] + fact["declStart"]["offset"],
                        "end": kind_edit["end"] + fact["declStart"]["offset"],
                    })
            edits.append({
                "start": start,
                "end": end,
                "replacement": binding_replacements[cid].encode(),
                "reason": f"binding ref {ref['const']}",
            })
            binding_ranges.add((start, end))
            reference_rewrites += 1
        if proof_cut == cid:
            val_start = fact.get("valStart")
            if val_start is None:
                raise PlanError(f"node lacks Stage 2 proof cut: {cid}")
            edits.append({
                "start": val_start["offset"],
                "end": fact["declEnd"]["offset"],
                "replacement": b":= by sorry",
                "reason": "Stage 2 proof cut",
            })

    if flatten_private:
        declarations_by_name = {decl["name"]: decl for decl in plan["declarations"]}
        private_names = {
            declarations_by_name[name]["user_name"]
            for cid in keep_commands for name in commands[cid]["names"]
            if declarations_by_name[name]["is_private"]
        }
        for ref in context["refs"]:
            matching_private = sorted(
                user_name for user_name in private_names
                if ref["const"].endswith(f".{user_name}")
            )
            if len(matching_private) > 1:
                raise PlanError(f"ambiguous private reference: {ref['const']}")
            if not matching_private:
                continue
            start, end = offset_range(ref)
            if (start, end) in binding_ranges or inside_any(start, end, removal_ranges):
                continue
            edits.append({
                "start": start,
                "end": end,
                "replacement": matching_private[0].encode(),
                "reason": f"private ref {ref['const']}",
            })
            reference_rewrites += 1
    documentation_corrected = 0
    for edit in documentation_edits(source):
        overlaps = any(
            edit["start"] < existing["end"] and existing["start"] < edit["end"]
            for existing in edits
        )
        if overlaps:
            continue
        edits.append(edit)
        documentation_corrected += 1
    rendered = apply_edits(source, edits)
    return rendered, {
        "declaration_spans_removed": len(removal_ranges),
        "private_tokens_removed": private_removed,
        "docstrings_removed": docstrings_removed,
        "reference_ranges_rewritten": reference_rewrites,
        "documentation_comments_corrected": documentation_corrected,
        "portability_commands_removed": len(portability),
        "proof_cut_command": proof_cut,
    }


def imports_for_commands(
    command_ids: set[str],
    plan: dict[str, Any],
    *,
    dependency_kinds: tuple[str, ...],
    own_node: str | None = None,
) -> tuple[set[str], set[str]]:
    commands, command_for_name = command_maps(plan)
    definition_imports: set[str] = set()
    theorem_imports: set[str] = set()
    for cid in command_ids:
        for name in commands[cid]["names"]:
            declaration = next(item for item in plan["declarations"] if item["name"] == name)
            dependencies: list[str] = []
            if "type" in dependency_kinds:
                dependencies.extend(declaration["type_deps"])
            if "value" in dependency_kinds:
                dependencies.extend(declaration["value_deps"])
            for dependency in dependencies:
                dependency_cid = command_for_name.get(dependency)
                if dependency_cid is None or dependency_cid in command_ids:
                    continue
                dependency_command = commands[dependency_cid]
                classification = dependency_command["classification"]
                if classification in {"def-material", "def-embedded-theorem"}:
                    definition_imports.add(definition_module(dependency_command["module"]))
                elif classification == "node":
                    if dependency_cid == own_node:
                        raise PlanError(f"solution would import its own target: {own_node}")
                    theorem_imports.add(
                        theorem_module(platform_theorem_name(dependency_command, plan["target"]))
                    )
                else:
                    raise PlanError(
                        f"selected commands omit inline dependency {dependency_cid} of {cid}"
                    )
    return definition_imports, theorem_imports


def source_nonproject_imports(text: str) -> list[str]:
    _, modules, _ = import_lines(text)
    return nonproject_imports(modules)


def generated_file(
    path: Path, kind: str, content: str, sources: list[dict[str, str]],
    imports: Iterable[str], transformations: dict[str, Any],
) -> dict[str, Any]:
    data = content.encode("utf-8")
    return {
        "path": str(path),
        "kind": kind,
        "sha256": hashlib.sha256(data).hexdigest(),
        "bytes": len(data),
        "sources": sources,
        "imports": sorted(set(imports)),
        "transformations": transformations,
        "content": content,
    }


def primary_user_name(command: dict[str, Any]) -> str:
    name_text = command["stage2"].get("nameText")
    matches = [
        name for name in command["user_names"]
        if short_name_matches(name, name_text)
    ]
    if len(matches) != 1:
        raise PlanError(f"cannot identify primary declaration for {command['id']}")
    return matches[0]


def root_solution_prefix() -> bytes:
    return """/- Provenance: this route follows Dumitrescu's 2006 isosceles-count
method and uses cap-witness refinements attributed in the source to
Nivasch–Pach–Pinchasi–Zerbib (2013). The Lean proof is this project's own
formalization; these citations record provenance, not an imported or
machine-checked paper proof. -/
theorem solution
    (A : Finset Erdos9796Mission.Plane) (hne : A.Nonempty)
    (hconv : Erdos9796Mission.ConvexIndep (A : Set Erdos9796Mission.Plane))
    (hK4 : Erdos9796Mission.HasNEquidistantProperty 4 A) : 9 ≤ A.card """.encode()


def source_record(command: dict[str, Any], contexts: dict[str, Any]) -> dict[str, str]:
    context = contexts[command["module"]]
    return {
        "module": command["module"],
        "path": str(context["source_path"]),
        "sha256": context["source_sha256"],
    }


def build_generated_files(
    plan: dict[str, Any], args: argparse.Namespace
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    if not plan["generation_ready"]:
        raise PlanError("planning diagnostics block platform-tree generation")
    if not args.adapter.is_file():
        raise PlanError(f"missing compatibility adapter: {args.adapter}")
    if not args.root_stub.is_file():
        raise PlanError(f"missing existing root theorem stub: {args.root_stub}")

    contexts = source_context(plan)
    commands, command_for_name = command_maps(plan)
    files: list[dict[str, Any]] = []

    # Definitions are source-module skeletons.  Embedded theorem proofs remain
    # in these bundles, so no theorem stub can inject sorryAx into definitions.
    for bundle in plan["definitions_bundles"]:
        module = bundle["module"]
        selected = set(bundle["commands"])
        rendered, notes = skeleton_bytes(module, selected, plan, contexts)
        body = rendered.decode("utf-8")
        dependencies = {
            definition_module(dependency)
            for dependency in plan["definition_bundle_edges"].get(module, [])
        }
        direct_mathlib = source_nonproject_imports(contexts[module]["source"].decode("utf-8"))
        imports = {ADAPTER_MODULE, *dependencies, *direct_mathlib}
        provenance = (
            f"Generated by exact skeleton subtraction from {module}; "
            f"source SHA-256 {contexts[module]['source_sha256']}"
        )
        body, original_imports = rewrite_imports(body, imports, provenance)
        notes["original_imports_removed"] = original_imports
        notes["project_and_formalconjectures_imports_removed"] = sorted(
            item for item in original_imports if item.startswith(PROJECT_IMPORT_PREFIXES)
        )
        path = args.platform_root / f"{definition_module(module).replace('.', '/')}.lean"
        files.append(generated_file(
            path, "definition-bundle", body,
            [{
                "module": module,
                "path": str(contexts[module]["source_path"]),
                "sha256": contexts[module]["source_sha256"],
            }],
            imports, notes,
        ))

    node_commands = [commands[cid] for cid in plan["node_upload_order"]]
    node_names = {
        command["id"]: platform_theorem_name(command, plan["target"])
        for command in node_commands
    }

    # Every non-root theorem stub is cut at Stage 2's valStart and flattened
    # from source namespaces by making its binding fully dotted.
    for command in node_commands:
        cid = command["id"]
        theorem_name = node_names[cid]
        imports: set[str] = {ADAPTER_MODULE, FOUNDATION_MODULE}
        notes: dict[str, Any]
        if plan["target"] in command["names"]:
            root_bytes = args.root_stub.read_bytes()
            root_sha = hashlib.sha256(root_bytes).hexdigest()
            body, original_imports = rewrite_imports(
                root_bytes.decode("utf-8"), imports,
                f"Reuses the existing mission target stub; source SHA-256 {root_sha}",
            )
            notes = {
                "existing_target_stub_reused": True,
                "original_imports_removed": original_imports,
                "proof_cut_command": None,
            }
            sources = [{
                "module": "existing-mission-target",
                "path": str(args.root_stub),
                "sha256": root_sha,
            }]
        else:
            definition_imports, theorem_imports = imports_for_commands(
                {cid}, plan, dependency_kinds=("type",), own_node=cid
            )
            if theorem_imports:
                raise PlanError(f"theorem statement depends on theorem nodes: {cid}")
            imports.update(definition_imports)
            imports.update(source_nonproject_imports(contexts[command["module"]]["source"].decode()))
            rendered, notes = skeleton_bytes(
                command["module"], {cid}, plan, contexts,
                proof_cut=cid,
                binding_replacements={cid: theorem_name},
                strip_docstrings={cid},
            )
            body, flattened = flatten_scaffolding(rendered.decode("utf-8"))
            opens = namespace_opens({cid}, commands)
            open_text = f"open {' '.join(opens)}\n\n" if opens else ""
            provenance = (
                f"Generated theorem stub from {command['module']} by Stage 2 proof cut; "
                f"source SHA-256 {contexts[command['module']]['source_sha256']}"
            )
            body, original_imports = rewrite_imports(body, imports, provenance)
            if open_text:
                body = insert_after_imports(body, open_text)
            notes["namespace_section_commands_flattened"] = flattened
            notes["original_imports_removed"] = original_imports
            notes["binding_name"] = theorem_name
            sources = [source_record(command, contexts)]
        path = args.platform_root / f"{theorem_module(theorem_name).replace('.', '/')}.lean"
        files.append(generated_file(path, "theorem-stub", body, sources, imports, notes))

    declarations = {item["name"]: item for item in plan["declarations"]}
    # Solutions concatenate only their exact inline closure.  Cross-file
    # fragments follow a dependency-derived module order; the target fragment
    # is last and exposes the sole top-level `theorem solution`.
    for command in node_commands:
        cid = command["id"]
        selected = set(plan["node_inline_helpers"][cid]) | {cid}
        definition_imports, theorem_imports = imports_for_commands(
            selected, plan, dependency_kinds=("type", "value"), own_node=cid
        )
        imports = {
            ADAPTER_MODULE,
            FOUNDATION_MODULE,
            *definition_imports,
            *theorem_imports,
        }
        selected_modules = {commands[item]["module"] for item in selected}
        module_edges: dict[str, set[str]] = defaultdict(set)
        for selected_cid in selected:
            source_module = commands[selected_cid]["module"]
            for name in commands[selected_cid]["names"]:
                declaration = declarations[name]
                for dependency in declaration["type_deps"] + declaration["value_deps"]:
                    dependency_cid = command_for_name.get(dependency)
                    if dependency_cid not in selected:
                        continue
                    dependency_module = commands[dependency_cid]["module"]
                    if dependency_module != source_module:
                        module_edges[source_module].add(dependency_module)
        module_order, cyclic_modules = leaves_first_order(selected_modules, module_edges)
        if cyclic_modules:
            raise PlanError(f"inline-fragment module cycle for {cid}: {cyclic_modules}")
        node_module = command["module"]
        module_order = [module for module in module_order if module != node_module] + [node_module]

        for module in module_order:
            imports.update(source_nonproject_imports(contexts[module]["source"].decode()))
        global_header = (
            "/- Generated Prove2Me solution by exact Stage 2 source transformations.\n"
            f"   Target command: {cid}. -/\n"
            + "".join(f"import {item}\n" for item in sorted(imports))
            + "\n"
        )
        fragments: list[str] = []
        fragment_notes: list[dict[str, Any]] = []
        source_records: list[dict[str, str]] = []
        for module in module_order:
            module_commands = {
                selected_cid for selected_cid in selected
                if commands[selected_cid]["module"] == module
            }
            binding_replacements = {
                selected_cid: (
                    "solution" if selected_cid == cid
                    else primary_user_name(commands[selected_cid])
                )
                for selected_cid in module_commands
            }
            root_prefixes = (
                {cid: root_solution_prefix()}
                if plan["target"] in command["names"] and cid in module_commands
                else {}
            )
            rendered, notes = skeleton_bytes(
                module, module_commands, plan, contexts,
                binding_replacements=binding_replacements,
                force_theorem_commands={cid} if cid in module_commands else set(),
                prefix_replacements=root_prefixes,
                strip_docstrings={cid} if cid in module_commands else set(),
                flatten_private=True,
            )
            fragment, original_imports = rewrite_imports(
                rendered.decode("utf-8"), [],
                f"Fragment from {module}; source SHA-256 {contexts[module]['source_sha256']}",
            )
            fragment, flattened = flatten_scaffolding(fragment)
            opens = namespace_opens(module_commands, commands)
            open_text = f"open {' '.join(opens)}\n\n" if opens else ""
            section_name = f"Erdos9796CountingFragment_{module.replace('.', '_')}"
            fragment = (
                f"section {section_name}\n\n{open_text}{fragment.rstrip()}\n\n"
                f"end {section_name}\n"
            )
            notes["namespace_section_commands_flattened"] = flattened
            notes["original_imports_removed"] = original_imports
            notes["selected_commands"] = sorted(module_commands)
            fragment_notes.append({"module": module, **notes})
            source_records.append({
                "module": module,
                "path": str(contexts[module]["source_path"]),
                "sha256": contexts[module]["source_sha256"],
            })
            fragments.append(fragment)
        source_node_name = primary_user_name(command)
        solution = global_header + "\n".join(fragments)
        theorem_name = node_names[cid]
        path = args.platform_root / f"Solutions/Sol_{theorem_name.replace('.', '_')}.lean"
        files.append(generated_file(
            path, "solution", solution, source_records, imports,
            {
                "node_command": cid,
                "node_binding_rewritten_to": "solution",
                "source_proof_body_preserved": True,
                "source_target_name": source_node_name,
                "own_target_imported": False,
                "inline_fragment_order": module_order,
                "fragments": fragment_notes,
            },
        ))

    paths = [item["path"] for item in files]
    if len(paths) != len(set(paths)):
        raise PlanError("generated output path collision")
    for item in files:
        content = item["content"]
        _, actual_imports, _ = import_lines(content)
        if ADAPTER_MODULE not in actual_imports:
            raise PlanError(f"generated file omits adapter import: {item['path']}")
        if item["kind"] in {"theorem-stub", "solution"} and FOUNDATION_MODULE not in actual_imports:
            raise PlanError(f"generated proof file omits Foundation import: {item['path']}")
        forbidden = [
            module for module in actual_imports
            if module.startswith(PROJECT_IMPORT_PREFIXES)
        ]
        if forbidden:
            raise PlanError(f"generated file retains source-only imports: {item['path']}")
        if PORTABILITY_COMMAND.decode() in content:
            raise PlanError(f"generated file retains unsupported linter command: {item['path']}")
        retained_attribution_errors = [
            phrase for phrase in BAD_ATTRIBUTION_PHRASES if phrase in content
        ]
        if retained_attribution_errors:
            raise PlanError(
                f"generated file retains bad attribution phrases {retained_attribution_errors}: "
                f"{item['path']}"
            )
        content_lines = content.splitlines()
        for left, right in pairwise(content_lines):
            if CANONICAL_NPPZ in left and CANONICAL_NPPZ in right:
                raise PlanError(
                    f"generated file has adjacent duplicate Nivasch bibliography entries: "
                    f"{item['path']}"
                )
        if item["kind"] == "solution":
            theorem_solutions, lemma_solutions = solution_declaration_counts(content)
            if theorem_solutions != 1 or lemma_solutions != 0:
                raise PlanError(
                    f"solution declaration contract failed for {item['path']}: "
                    f"theorem={theorem_solutions}, lemma={lemma_solutions}"
                )
            source_target = item["transformations"]["source_target_name"]
            if f":= @{source_target}" in content:
                raise PlanError(f"solution aliases its original target: {item['path']}")
            if "by sorry" in content:
                raise PlanError(f"solution retains a sorry proof: {item['path']}")
        if item["kind"] == "theorem-stub" and content.count("by sorry") != 1:
            raise PlanError(f"theorem stub does not have one sorry cut: {item['path']}")
    expected = {
        "definition-bundle": plan["counts"]["definition_bundles"],
        "theorem-stub": plan["counts"]["node_commands"],
        "solution": plan["counts"]["node_commands"],
    }
    actual: dict[str, int] = defaultdict(int)
    for item in files:
        actual[item["kind"]] += 1
    if dict(actual) != expected:
        raise PlanError(f"generated file counts differ: expected {expected}, got {dict(actual)}")

    manifest_files = [{key: value for key, value in item.items() if key != "content"} for item in files]
    plan_bytes = (json.dumps(plan, sort_keys=True, ensure_ascii=False) + "\n").encode()
    manifest: dict[str, Any] = {
        "schema": "prove2me-platform-generation-manifest/v1",
        "target_source_name": plan["target"],
        "target_platform_name": ROOT_PLATFORM_NAME,
        "plan_sha256": hashlib.sha256(plan_bytes).hexdigest(),
        "adapter": {"path": str(args.adapter), "sha256": sha256(args.adapter)},
        "existing_root_stub": {"path": str(args.root_stub), "sha256": sha256(args.root_stub)},
        "output_root": str(args.platform_root),
        "counts": dict(sorted(actual.items())),
        "files": sorted(manifest_files, key=lambda item: item["path"]),
        "transformation_contract": [
            "Declaration selection and subtraction use Stage 2 declStart/declEnd byte offsets.",
            "Theorem stubs use Stage 2 valStart proof cuts and docstring ranges.",
            "Private removal and binding/reference rewrites use Stage 2 privateTok/ref ranges.",
            "Project and FormalConjectures imports are replaced by generated Def/Thm modules.",
            "The exact unsupported moduleDocstring linter command is removed under source hashes.",
            "Bibliographic corrections are source-digest-guarded edits confined to Lean comments.",
            "Every generated file imports Definitions.Def_Erdos9796Counting_Adapter.",
            "Every theorem stub and solution conservatively imports the Foundation bundle.",
            "Each solution is the source node's exact proof body under a Stage 2-derived theorem solution header.",
            "Solutions omit their own theorem module and order cross-file fragments by dependencies.",
        ],
        "will_write": sorted([*paths, str(args.generation_manifest)]),
        "canonical_payload_sha256": None,
    }
    canonical = json.dumps(manifest, sort_keys=True, separators=(",", ":"), ensure_ascii=False)
    manifest["canonical_payload_sha256"] = hashlib.sha256(canonical.encode()).hexdigest()
    return files, manifest


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--graph", type=Path, default=DEFAULT_GRAPH)
    parser.add_argument("--sketch-dir", type=Path, default=DEFAULT_SKETCH_DIR)
    parser.add_argument("--source-root", type=Path, default=DEFAULT_SOURCE_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--platform-root", type=Path, default=DEFAULT_PLATFORM_ROOT)
    parser.add_argument(
        "--generation-manifest", type=Path, default=DEFAULT_GENERATION_MANIFEST
    )
    parser.add_argument("--adapter", type=Path, default=DEFAULT_ADAPTER)
    parser.add_argument("--root-stub", type=Path, default=DEFAULT_ROOT_STUB)
    parser.add_argument("--target", default=TARGET)
    parser.add_argument(
        "--promote", action="append", default=[], metavar="DECLARATION",
        help="mark an 11-40 line theorem as named in the source paper",
    )
    action = parser.add_mutually_exclusive_group()
    action.add_argument(
        "--check", action="store_true",
        help="validate and summarize without writing the output file",
    )
    action.add_argument(
        "--dry-run-manifest", action="store_true",
        help="generate in memory and print the exact output manifest without writing",
    )
    action.add_argument(
        "--generate", action="store_true",
        help="write the planned platform tree and generation manifest",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        plan = build_plan(args)
    except PlanError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2
    if args.dry_run_manifest or args.generate:
        try:
            generated, manifest = build_generated_files(plan, args)
        except PlanError as error:
            print(f"error: {error}", file=sys.stderr)
            return 2
        manifest_text = json.dumps(manifest, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
        if args.dry_run_manifest:
            print(manifest_text, end="")
            return 0
        for item in generated:
            path = Path(item["path"])
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(item["content"], encoding="utf-8")
        args.generation_manifest.parent.mkdir(parents=True, exist_ok=True)
        args.generation_manifest.write_text(manifest_text, encoding="utf-8")
        print(
            f"wrote {len(generated)} platform files and {args.generation_manifest}"
        )
        return 0

    encoded = json.dumps(plan, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
    if not args.check:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded, encoding="utf-8")
    counts = plan["counts"]
    print(
        f"target={plan['target']} graph={counts['graph_rows']} "
        f"reachable={counts['reachable_rows_before_span_filter']} "
        f"source={counts['reachable_source_rows']} commands={counts['source_commands']}"
    )
    print(
        f"bundles={counts['definition_bundles']} nodes={counts['node_commands']} "
        f"inline={counts['inline_helper_commands']} "
        f"embedded={counts['def_embedded_theorem_commands']}"
    )
    for diagnostic in plan["diagnostics"]:
        print(
            f"{diagnostic['severity']}: {diagnostic['code']}: "
            f"{diagnostic.get('message', diagnostic.get('names', diagnostic.get('commands')))}",
            file=sys.stderr,
        )
    if not args.check:
        print(f"wrote {args.output} ({len(encoded.encode('utf-8'))} bytes)")
    return 0 if plan["generation_ready"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
