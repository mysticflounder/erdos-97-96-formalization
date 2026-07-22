#!/usr/bin/env python3
"""Independent verifier for the general-n U5 schema catalog and n=11 run.

This verifier does not import the catalog builder, matcher, CEGAR driver, or
outer encoder.  It checks the registry/source declaration correspondence,
reconstructs every signed antecedent from the theorem statement, independently
canonicalizes it, replays the corrected structural outer conditions, and uses
Z3 only as a finite injective-embedding checker for the signed row schemas.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections import deque
from pathlib import Path
from typing import Any

import z3


Atom = tuple[int, int]


def stable_digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def collapse_ws(value: str) -> str:
    return " ".join(value.split())


def source_declaration(source: Path, one_based_line: int) -> str:
    lines = source.read_text(encoding="utf-8").splitlines()
    start = one_based_line - 1
    if not 0 <= start < len(lines):
        raise AssertionError(f"bad declaration line {source}:{one_based_line}")
    collected: list[str] = []
    for line in lines[start:]:
        collected.append(line)
        joined = "\n".join(collected)
        if ":=" in joined:
            return collapse_ws(joined.split(":=", 1)[0])
    raise AssertionError(f"declaration has no body marker: {source}:{one_based_line}")


def point_roles(statement: str) -> list[str]:
    roles: list[str] = []
    for names in re.findall(r"\{([^{}:]+) : ℝ²\}", statement):
        roles.extend(names.split())
    return roles


def derive_signed_atoms(statement: str) -> tuple[set[tuple[str, str]], set[tuple[str, str]]]:
    """Reconstruct the selected-row interpretation from one exact statement."""
    triple_match = re.search(
        r"\([^():]+ : U5DangerousTriple D (\S+) (\S+) (\S+)\)", statement
    )
    triple = triple_match.groups() if triple_match else None
    classes: dict[str, tuple[str, str, str]] = {}
    for kind, q, center, support in re.findall(
        r"\([^():]+ : (U5QCriticalTripleClass|U5QDeletedK4Class) D "
        r"(\S+) (\S+) (\S+)\)",
        statement,
    ):
        classes[support] = (kind, q, center)

    positive: set[tuple[str, str]] = set()
    negative: set[tuple[str, str]] = set()
    if triple is not None:
        q, p, _support = triple
        positive.add((p, q))
    for kind, q, center in classes.values():
        (positive if kind == "U5QCriticalTripleClass" else negative).add((center, q))
    for _q, p, _support, candidate in re.findall(
        r"\([^():]+ : U5SelectedCandidateSkeleton D (\S+) (\S+) (\S+) (\S+)\)",
        statement,
    ):
        negative.add((p, candidate))

    # Membership binders are intentionally recognized only when their support
    # is the dangerous triple or one of the declared U5 class packets.
    for point, support in re.findall(r"\([^():]+ : (\S+) ∈ (\S+)\)", statement):
        if triple is not None and support == triple[2]:
            positive.add((triple[1], point))
        elif support in classes:
            positive.add((classes[support][2], point))
    for point, support in re.findall(r"\([^():]+ : (\S+) ∉ (\S+)\)", statement):
        if triple is not None and support == triple[2]:
            negative.add((triple[1], point))
    if positive & negative:
        raise AssertionError("statement derives contradictory signed atoms")
    return positive, negative


def canonical_signed(
    positive_names: set[tuple[str, str]], negative_names: set[tuple[str, str]]
) -> tuple[int, tuple[Atom, ...], tuple[Atom, ...]]:
    active = sorted({x for atom in positive_names | negative_names for x in atom})
    index = {name: i for i, name in enumerate(active)}
    positive = tuple(sorted((index[c], index[p]) for c, p in positive_names))
    negative = tuple(sorted((index[c], index[p]) for c, p in negative_names))
    candidates = []
    for permutation in itertools.permutations(range(len(active))):
        candidates.append(
            (
                tuple(sorted((permutation[c], permutation[p]) for c, p in positive)),
                tuple(sorted((permutation[c], permutation[p]) for c, p in negative)),
            )
        )
    canon_positive, canon_negative = min(candidates)
    return len(active), canon_positive, canon_negative


def verify_catalog(
    registry: dict[str, Any], catalog: dict[str, Any], source_root: Path
) -> dict[str, Any]:
    if catalog.get("schema") != "p97-general-n-u5-signed-row-schema-catalog-v1":
        raise AssertionError("unexpected catalog schema")
    without_digest = dict(catalog)
    claimed_digest = without_digest.pop("catalog_digest")
    if stable_digest(without_digest) != claimed_digest:
        raise AssertionError("catalog digest mismatch")
    if stable_digest(registry) != catalog.get("registry_digest"):
        raise AssertionError("registry digest mismatch")

    selected = {
        item["fq_name"]: item
        for item in registry["candidate_declarations"]
        if item.get("family") == "U5GlobalIncidence"
        and item.get("category") == "ambient-data-uniform"
        and item.get("proof_status") == "source-proved"
        and item.get("local_shape_match") is False
        and str(item.get("statement", "")).endswith(": False")
    }
    if len(selected) != 96:
        raise AssertionError(f"registry class-consumer count drift: {len(selected)}")
    seen: set[str] = set()
    checked_sources = 0
    for schema in catalog["schemas"]:
        expected = (
            int(schema["role_count"]),
            tuple(tuple(map(int, atom)) for atom in schema["positive_memberships"]),
            tuple(tuple(map(int, atom)) for atom in schema["negative_memberships"]),
        )
        for consumer in schema["consumers"]:
            fq_name = consumer["fq_name"]
            if fq_name in seen or fq_name not in selected:
                raise AssertionError(f"duplicate or unknown consumer: {fq_name}")
            seen.add(fq_name)
            record = selected[fq_name]
            for catalog_key, registry_key in (
                ("module", "module"),
                ("source_path", "path"),
                ("source_line", "line"),
                ("source_shape", "shape"),
                ("source_reachable", "source_reachable"),
                ("proof_status", "proof_status"),
            ):
                if consumer[catalog_key] != record[registry_key]:
                    raise AssertionError(f"registry field drift for {fq_name}: {catalog_key}")
            if record["source_reachable"] is not True or record["proof_status"] != "source-proved":
                raise AssertionError(f"consumer is not source-proved/reachable: {fq_name}")
            source = source_root / record["path"]
            actual = source_declaration(source, int(record["line"]))
            if actual != collapse_ws(record["statement"]):
                raise AssertionError(f"source statement drift: {fq_name}")
            roles = point_roles(record["statement"])
            if roles != consumer["point_roles"] or len(roles) != len(set(roles)):
                raise AssertionError(f"point-role drift: {fq_name}")
            positive, negative = derive_signed_atoms(record["statement"])
            if sorted(map(list, positive)) != consumer["raw_positive_memberships"]:
                raise AssertionError(f"positive antecedent mistranslated: {fq_name}")
            if sorted(map(list, negative)) != consumer["raw_negative_memberships"]:
                raise AssertionError(f"negative antecedent mistranslated: {fq_name}")
            if canonical_signed(positive, negative) != expected:
                raise AssertionError(f"normalized schema mismatch: {fq_name}")
            checked_sources += 1
    if seen != set(selected):
        raise AssertionError(f"catalog omits registry consumers: {sorted(set(selected) - seen)}")
    if checked_sources != catalog.get("class_consumer_count") or checked_sources != 96:
        raise AssertionError("catalog consumer total mismatch")
    if len(catalog["schemas"]) != catalog.get("normalized_schema_count"):
        raise AssertionError("catalog normalized-schema count mismatch")
    return {
        "checked_registry_consumers": checked_sources,
        "checked_source_declarations": checked_sources,
        "normalized_schema_count": len(catalog["schemas"]),
        "registry_source_reachability_checked": True,
        "signed_antecedents_reconstructed": True,
    }


def strongly_connected(rows: dict[int, tuple[int, ...]], n: int) -> bool:
    for start in range(n):
        seen = {start}
        todo = deque([start])
        while todo:
            center = todo.popleft()
            for point in rows[center]:
                if point not in seen:
                    seen.add(point)
                    todo.append(point)
        if len(seen) != n:
            return False
    return True


def verify_outer_sat(result: dict[str, Any], bank: dict[str, Any]) -> dict[int, tuple[int, ...]]:
    if result.get("solver_status") != "SAT" or result.get("cnf_model_checked") is not True:
        raise AssertionError("iteration is not a substitution-checked SAT result")
    n = int(result["n"])
    rows = {int(c): tuple(map(int, support)) for c, support in result["rows"].items()}
    blockers = {int(s): int(c) for s, c in result["blockers"].items()}
    if set(rows) != set(range(n)) or set(blockers) != set(range(n)):
        raise AssertionError("row or blocker map is not total")
    for center, support in rows.items():
        if len(support) != 4 or len(set(support)) != 4 or center in support:
            raise AssertionError(f"invalid selected row: {center}->{support}")
    for left, right in itertools.combinations(range(n), 2):
        if len(set(rows[left]) & set(rows[right])) > 2:
            raise AssertionError("two-circle row-intersection bound failed")
    for first, second in itertools.combinations(range(n), 2):
        centers = [c for c in range(n) if first in rows[c] and second in rows[c]]
        if len(centers) > 2:
            raise AssertionError("pair-center bound failed")
    for left, right in itertools.combinations(range(n), 2):
        common = set(rows[left]) & set(rows[right]) - {left, right}
        for a, b in itertools.combinations(common, 2):
            if (left < a < right) == (left < b < right):
                raise AssertionError("cyclic alternation failed")
    if not strongly_connected(rows, n):
        raise AssertionError("selected-member digraph is not strongly connected")
    omitted = set(map(int, result["omitted_apices"]))
    for source, center in blockers.items():
        if source == center or center in omitted or source not in rows[center]:
            raise AssertionError("critical blocker relation failed")

    # Re-expand the corrected active-role/rank Kalmanson bank independently.
    seen_bank: set[tuple[int, tuple[Atom, ...]]] = set()
    for record in bank["schemas"]:
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(map(int, atom)) for atom in record["order_schema"]))
        reflected = tuple(sorted((k - 1 - c, k - 1 - p) for c, p in schema))
        key = (k, min(schema, reflected))
        if key in seen_bank or schema != key[1]:
            raise AssertionError("noncanonical or duplicate base-bank schema")
        seen_bank.add(key)
        if k > n:
            continue
        for targets in itertools.combinations(range(n), k):
            for oriented in {schema, reflected}:
                if all(targets[p] in rows[targets[c]] for c, p in oriented):
                    raise AssertionError("corrected base-bank schema violated")
    return rows


def signed_embedding_z3(rows: dict[int, tuple[int, ...]], schema: dict[str, Any]) -> list[int] | None:
    n = len(rows)
    k = int(schema["role_count"])
    role = [z3.Int(f"role_{i}") for i in range(k)]
    solver = z3.Solver()
    solver.add(*(z3.And(0 <= item, item < n) for item in role))
    solver.add(z3.Distinct(*role))
    members = {(c, p) for c, support in rows.items() for p in support}

    def allowed(atom: list[int], want_member: bool) -> z3.BoolRef:
        c, p = map(int, atom)
        pairs = members if want_member else {
            (left, right)
            for left in range(n)
            for right in range(n)
            if (left, right) not in members
        }
        return z3.Or(*(z3.And(role[c] == left, role[p] == right) for left, right in pairs))

    solver.add(*(allowed(atom, True) for atom in schema["positive_memberships"]))
    solver.add(*(allowed(atom, False) for atom in schema["negative_memberships"]))
    if solver.check() == z3.unsat:
        return None
    model = solver.model()
    return [model.eval(item).as_long() for item in role]


def embedding_satisfies(
    rows: dict[int, tuple[int, ...]], schema: dict[str, Any], embedding: list[int]
) -> bool:
    if len(embedding) != int(schema["role_count"]) or len(set(embedding)) != len(embedding):
        return False
    return all(
        embedding[p] in rows[embedding[c]] for c, p in schema["positive_memberships"]
    ) and all(
        embedding[p] not in rows[embedding[c]] for c, p in schema["negative_memberships"]
    )


def verify_manifest(
    manifest: dict[str, Any], catalog: dict[str, Any], bank: dict[str, Any]
) -> dict[str, Any]:
    if manifest.get("schema") != "p97-general-n-u5-n11-schema-cegar-v1":
        raise AssertionError("unexpected CEGAR manifest schema")
    if int(manifest["n"]) != 11:
        raise AssertionError("this verifier accepts only the scoped n=11 run")
    checked_iterations = 0
    checked_installed = 0
    terminal_rows: dict[int, tuple[int, ...]] | None = None
    for record in manifest["iterations"]:
        result = json.loads(Path(record["result"]).read_text(encoding="utf-8"))
        if result["solver_status"] == "SAT":
            rows = verify_outer_sat(result, bank)
            for index in record["selected_schema_indices"]:
                if signed_embedding_z3(rows, catalog["schemas"][int(index)]) is not None:
                    raise AssertionError(f"installed signed cut violated: {index}")
                checked_installed += 1
            if "next_schema_index" in record:
                index = int(record["next_schema_index"])
                witness = signed_embedding_z3(rows, catalog["schemas"][index])
                if witness is None or not embedding_satisfies(rows, catalog["schemas"][index], witness):
                    raise AssertionError(f"next cut has no independently replayed embedding: {index}")
            terminal_rows = rows
        elif result["solver_status"] != "UNSAT":
            if manifest["terminal_status"] != "OUTER_UNKNOWN":
                raise AssertionError("nonterminal UNKNOWN iteration")
        checked_iterations += 1
    if manifest["terminal_status"] == "SAT_BANK_CLEAN":
        if terminal_rows is None:
            raise AssertionError("bank-clean terminal has no SAT table")
        for index, schema in enumerate(catalog["schemas"]):
            if signed_embedding_z3(terminal_rows, schema) is not None:
                raise AssertionError(f"bank-clean table still embeds schema {index}")
    return {
        "checked_iterations": checked_iterations,
        "checked_installed_schema_absences": checked_installed,
        "terminal_status": manifest["terminal_status"],
        "terminal_full_catalog_absence_checked": manifest["terminal_status"] == "SAT_BANK_CLEAN",
    }


def verify_row_match(
    result: dict[str, Any], match: dict[str, Any], catalog: dict[str, Any], bank: dict[str, Any]
) -> dict[str, Any]:
    rows = verify_outer_sat(result, bank)
    independently_matched = {
        index
        for index, schema in enumerate(catalog["schemas"])
        if signed_embedding_z3(rows, schema) is not None
    }
    recorded = {int(item["schema_index"]) for item in match["matches"]}
    if independently_matched != recorded:
        raise AssertionError(
            f"recorded schema-match set drift: recorded={sorted(recorded)}, "
            f"independent={sorted(independently_matched)}"
        )
    for item in match["matches"]:
        schema = catalog["schemas"][int(item["schema_index"])]
        for embedding in item["embeddings"]:
            if not embedding_satisfies(rows, schema, list(map(int, embedding))):
                raise AssertionError("recorded embedding fails direct signed-atom replay")
    return {
        "status": "VERIFIED_ROW_MATCH",
        "matched_schema_indices": sorted(independently_matched),
        "matched_schema_count": len(independently_matched),
        "recorded_embeddings_checked": sum(
            len(item["embeddings"]) for item in match["matches"]
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("registry", type=Path)
    parser.add_argument("catalog", type=Path)
    parser.add_argument("--source-root", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--row-result", type=Path)
    parser.add_argument("--row-match", type=Path)
    parser.add_argument("--base-bank", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    registry = json.loads(args.registry.read_text(encoding="utf-8"))
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    result: dict[str, Any] = {
        "schema": "p97-general-n-u5-schema-coverage-independent-verification-v1",
        "status": "VERIFIED",
        "claim_scope": "Source catalog and finite n=11 outer only; no arbitrary-card/live coverage.",
        "catalog": verify_catalog(registry, catalog, args.source_root),
    }
    if args.manifest is not None:
        if args.base_bank is None:
            parser.error("--base-bank is required with --manifest")
        manifest = json.loads(args.manifest.read_text(encoding="utf-8"))
        bank = json.loads(args.base_bank.read_text(encoding="utf-8"))
        result["run"] = verify_manifest(manifest, catalog, bank)
    if args.row_result is not None or args.row_match is not None:
        if args.row_result is None or args.row_match is None or args.base_bank is None:
            parser.error("--row-result, --row-match, and --base-bank must be supplied together")
        row_result = json.loads(args.row_result.read_text(encoding="utf-8"))
        row_match = json.loads(args.row_match.read_text(encoding="utf-8"))
        bank = json.loads(args.base_bank.read_text(encoding="utf-8"))
        result["row_match"] = verify_row_match(row_result, row_match, catalog, bank)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
