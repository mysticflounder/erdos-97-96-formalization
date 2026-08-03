#!/usr/bin/env python3
"""v28 compact rich-support CEGAR for the frozen DDD exact-n15 leaf.

The master is exactly the raw v19 ``exact_rich_profiles`` and
``cyclic_alternation_cut`` source groups, together with the two v27-minimal
positive rich literals.  The oracle is the full raw strict-Kalmanson family
plus the distance equalities induced by pairs of true members of each rich
class.  Only deletion-minimal cores that replay UNSAT in a fresh Z3 context
are admitted as generalized rich-membership cuts.

This remains external exact-rational Z3 evidence.  It is not a Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
import time
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v16 as v16
import round5_guard_support_core_v23 as v23
import round5_pb_lowering_core_v26 as v26
import round5_source_assertion_min_v27 as v27

HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
TEST_PATH = HERE / "test_round5_rich_kalmanson_cegar_v28.py"
V27_PATH = HERE / "v27-source-assertion-minimization.json"
DEFAULT_JSON = HERE / "v28-rich-kalmanson-cegar.json"
DEFAULT_REPORT = HERE / "v28-rich-kalmanson-cegar.md"
DEFAULT_MANIFEST = HERE / "v28-rich-kalmanson-cegar-manifest.json"
FIXED = (
    {"bool": "rich_2_1_12", "value": True},
    {"bool": "rich_2_1_4", "value": True},
)
MASTER_GROUPS = ("track_exact_rich_profiles", "track_cyclic_alternation_cut")
RICH_RE = re.compile(r"^rich_(\d+)_(\d+)_(\d+)$")

# Equality triples are (center, endpoint, endpoint), in increasing template
# roles.  Matching below is explicitly dihedral/cyclic, not a claim that an
# order adapter to the production theorem has been constructed.
KALMANSON_THREE_EQUALITY_SCHEMAS = {
    "false_of_six_ccw_three_shell_equalities_013_412_523": (
        (0, 1, 3), (4, 1, 2), (5, 2, 3),
    ),
    "false_of_six_ccw_three_shell_equalities_012_325_415": (
        (0, 1, 2), (3, 2, 5), (4, 1, 5),
    ),
    "false_of_five_ccw_three_shell_equalities_012_124_314": (
        (0, 1, 2), (1, 2, 4), (3, 1, 4),
    ),
    "false_of_six_ccw_three_shell_equalities_013_235_415": (
        (0, 1, 3), (2, 3, 5), (4, 1, 5),
    ),
}


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def formulas_sha256(items: Iterable[z3.ExprRef]) -> str:
    return hashlib.sha256(
        "\n".join(item.sexpr() for item in items).encode()
    ).hexdigest()


def body(assertion: z3.BoolRef, tracker: str) -> z3.BoolRef:
    if not z3.is_implies(assertion) or str(assertion.arg(0)) != tracker:
        raise RuntimeError(f"malformed raw source group {tracker}")
    return assertion.arg(1)


def distance(ctx: z3.Context, left: int, right: int) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0, ctx=ctx)
    a, b = sorted((left, right))
    return z3.Real(f"d_{a}_{b}", ctx=ctx)


def rich_bool_names(expression: z3.ExprRef) -> tuple[str, ...]:
    return tuple(sorted(name for name in v26.bool_constants((expression,)) if RICH_RE.match(name)))


def support_from_model(
    model: z3.ModelRef, names: Sequence[str], ctx: z3.Context
) -> tuple[dict[str, object], ...]:
    grouped: dict[tuple[int, int], list[int]] = {}
    for name in names:
        match = RICH_RE.fullmatch(name)
        if match is None:
            raise RuntimeError(f"bad rich Bool name: {name}")
        apex_index, cls, point = map(int, match.groups())
        if z3.is_true(model.eval(z3.Bool(name, ctx=ctx), model_completion=True)):
            grouped.setdefault((apex_index, cls), []).append(point)
    expected = {(i, cls) for i in range(3) for cls in range(2)}
    if set(grouped) != expected or any(len(points) != 4 for points in grouped.values()):
        raise RuntimeError(f"master returned malformed DDD rich support: {grouped}")
    return tuple(
        {"apex_index": i, "apex": v8.APICES[i], "class": cls, "points": sorted(grouped[i, cls])}
        for i, cls in sorted(grouped)
    )


def equality_records(
    support: Sequence[Mapping[str, object]], ctx: z3.Context
) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    for row in support:
        i, apex, cls = int(row["apex_index"]), int(row["apex"]), int(row["class"])
        points = [int(x) for x in row["points"]]  # type: ignore[index]
        for left, right in itertools.combinations(points, 2):
            members = (f"rich_{i}_{cls}_{left}", f"rich_{i}_{cls}_{right}")
            expr = distance(ctx, apex, left) == distance(ctx, apex, right)
            records.append({
                "id": f"eq:rich_{i}_{cls}:{left}:{right}",
                "kind": "equality",
                "center": apex,
                "endpoints": [left, right],
                "membership_pair": list(members),
                "sexpr": expr.sexpr(),
                "expr": expr,
            })
    return records


def kalmanson_records(assertion: z3.BoolRef) -> list[dict[str, object]]:
    clauses = v27.group_clauses(assertion, "track_strict_kalmanson")
    return [
        {"id": f"kalmanson:{index:04d}", "kind": "kalmanson", "sexpr": expr.sexpr(), "expr": expr}
        for index, expr in enumerate(clauses)
    ]


def checked_model(model: z3.ModelRef, formulas: Sequence[z3.BoolRef]) -> bool:
    return all(z3.is_true(model.eval(item, model_completion=True)) for item in formulas)


def guarded_core(
    records: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int
) -> dict[str, object]:
    if not records:
        return {"status": "fail_closed", "reason": "empty_oracle"}
    ctx = records[0]["expr"].ctx  # type: ignore[index,union-attr]
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
    selectors: dict[str, z3.BoolRef] = {}
    for index, record in enumerate(records):
        selector = z3.Bool(f"v28_core_{index:04d}", ctx=ctx)
        selectors[str(record["id"])] = selector
        solver.add(z3.Implies(selector, record["expr"]))  # type: ignore[arg-type]
    assumptions = tuple(selectors[str(record["id"])] for record in records)
    outcome = solver.check(*assumptions)
    if outcome == z3.sat:
        formulas = [record["expr"] for record in records]  # type: ignore[misc]
        return {
            "status": "sat" if checked_model(solver.model(), formulas) else "fail_closed",
            "model_replay_verified": checked_model(solver.model(), formulas),
        }
    if outcome == z3.unknown:
        return {"status": "unknown_fail_closed", "reason_unknown": solver.reason_unknown()}
    selected_names = {str(atom) for atom in solver.unsat_core()}
    current = [record for record in records if str(selectors[str(record["id"])]) in selected_names]
    if not current:
        return {"status": "fail_closed", "reason": "empty_unsat_core"}
    trials: list[dict[str, object]] = []
    for record in tuple(current):
        candidate = [item for item in current if item["id"] != record["id"]]
        result = solver.check(*(selectors[str(item["id"])] for item in candidate))
        trials.append({"deleted": record["id"], "status": str(result)})
        if result == z3.unknown:
            return {
                "status": "unknown_fail_closed", "reason_unknown": solver.reason_unknown(),
                "initial_core_size": len(selected_names), "trials": trials,
            }
        if result == z3.unsat:
            current = candidate
    return {
        "status": "unsat", "initial_core_size": len(selected_names),
        "core": current, "trials": trials, "deletion_minimal": True,
    }


class PersistentKalmansonOracle:
    """One exploratory AST/solver build, reused for every rich support."""

    def __init__(self, records: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int):
        if not records:
            raise ValueError("empty Kalmanson oracle")
        self.records = list(records)
        self.ctx = records[0]["expr"].ctx  # type: ignore[index,union-attr]
        self.solver = z3.Solver(ctx=self.ctx)
        self.solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
        self.selectors: dict[str, z3.BoolRef] = {}
        for index, record in enumerate(records):
            selector = z3.Bool(f"v28_k_{index:04d}", ctx=self.ctx)
            self.selectors[str(record["id"])] = selector
            self.solver.add(z3.Implies(selector, record["expr"]))  # type: ignore[arg-type]
        self.calls = 0

    def classify(
        self, equalities: Sequence[Mapping[str, object]], *, iteration: int
    ) -> dict[str, object]:
        self.calls += 1
        self.solver.push()
        eq_selectors: dict[str, z3.BoolRef] = {}
        try:
            for index, record in enumerate(equalities):
                selector = z3.Bool(f"v28_eq_{iteration:06d}_{index:02d}", ctx=self.ctx)
                eq_selectors[str(record["id"])] = selector
                self.solver.add(z3.Implies(selector, record["expr"]))  # type: ignore[arg-type]
            all_records = list(equalities) + self.records
            selectors = {**eq_selectors, **self.selectors}
            assumptions = tuple(selectors[str(record["id"])] for record in all_records)
            outcome = self.solver.check(*assumptions)
            if outcome == z3.sat:
                formulas = [record["expr"] for record in all_records]  # type: ignore[misc]
                verified = checked_model(self.solver.model(), formulas)
                return {"status": "sat" if verified else "fail_closed", "model_replay_verified": verified}
            if outcome == z3.unknown:
                return {"status": "unknown_fail_closed", "reason_unknown": self.solver.reason_unknown()}
            selected_names = {str(atom) for atom in self.solver.unsat_core()}
            current = [
                record for record in all_records
                if str(selectors[str(record["id"])]) in selected_names
            ]
            if not current:
                return {"status": "fail_closed", "reason": "empty_unsat_core"}
            trials: list[dict[str, object]] = []
            for record in tuple(current):
                candidate = [item for item in current if item["id"] != record["id"]]
                verdict = self.solver.check(*(selectors[str(item["id"])] for item in candidate))
                trials.append({"deleted": record["id"], "status": str(verdict)})
                if verdict == z3.unknown:
                    return {
                        "status": "unknown_fail_closed", "reason_unknown": self.solver.reason_unknown(),
                        "initial_core_size": len(selected_names), "trials": trials,
                    }
                if verdict == z3.unsat:
                    current = candidate
            return {
                "status": "unsat", "initial_core_size": len(selected_names),
                "core": current, "trials": trials, "deletion_minimal": True,
            }
        finally:
            self.solver.pop()


def real_symbols(sexprs: Sequence[str]) -> tuple[str, ...]:
    reserved = {"and", "or", "not", "true", "false", "ite", "let", "to_real"}
    return tuple(sorted({
        token for sexpr in sexprs for token in re.findall(r"[A-Za-z_][A-Za-z0-9_]*", sexpr)
        if token not in reserved
    }))


def parse_exact_formula(
    sexpr: str, ctx: z3.Context, declarations: Mapping[str, z3.ExprRef]
) -> z3.BoolRef:
    parsed = tuple(z3.parse_smt2_string(f"(assert {sexpr})", decls=dict(declarations), ctx=ctx))
    if len(parsed) != 1:
        raise RuntimeError("fresh exact formula parse did not yield one assertion")
    return parsed[0]


def independent_replay(
    core: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int
) -> dict[str, object]:
    ctx = z3.Context()
    sexprs = tuple(str(item["sexpr"]) for item in core)
    declarations = {name: z3.Real(name, ctx=ctx) for name in real_symbols(sexprs)}
    formulas = tuple(parse_exact_formula(sexpr, ctx, declarations) for sexpr in sexprs)
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*formulas)
    outcome = solver.check()
    result: dict[str, object] = {
        "status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "formula_sha256": formulas_sha256(formulas), "core_ids_sha256": canonical_sha256([item["id"] for item in core]),
        "exact_rational": True, "declared_real_symbols": sorted(declarations),
    }
    if outcome != z3.unsat:
        result["model_replay_verified"] = checked_model(solver.model(), formulas) if outcome == z3.sat else None
        return result
    deletion_checks = []
    for index, item in enumerate(core):
        reduced = formulas[:index] + formulas[index + 1 :]
        probe = z3.Solver(ctx=ctx)
        probe.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
        probe.add(*reduced)
        verdict = probe.check()
        verified = checked_model(probe.model(), reduced) if verdict == z3.sat else None
        deletion_checks.append({"deleted": item["id"], "status": str(verdict), "model_replay_verified": verified})
        if verdict != z3.sat or verified is not True:
            result.update({"status": "fail_closed", "deletion_checks": deletion_checks})
            return result
    result["deletion_checks"] = deletion_checks
    result["deletion_minimal_replayed"] = True
    return result


def paired_independent_replay(
    core: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int
) -> dict[str, object]:
    first = independent_replay(core, timeout_ms=timeout_ms, seed=seed)
    second = independent_replay(core, timeout_ms=timeout_ms, seed=seed + 1)
    admitted = (
        first.get("status") == second.get("status") == "unsat"
        and first.get("deletion_minimal_replayed") is True
        and second.get("deletion_minimal_replayed") is True
        and first.get("formula_sha256") == second.get("formula_sha256")
        and first.get("core_ids_sha256") == second.get("core_ids_sha256")
    )
    return {
        "status": "paired_authenticated_unsat" if admitted else "paired_replay_fail_closed",
        "admitted": admitted, "primary": first, "independent": second,
    }


def fresh_raw_core_replay(
    core: Sequence[Mapping[str, object]], raw_path: Path, raw_formula_hash: str,
    *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    """Reconstruct a proposed core from a fresh authenticated raw-v19 parse."""
    try:
        assertions = v23._parse_raw(raw_path, raw_formula_hash)
        groups, _ = v27.source_assertions(assertions)
        fresh_k = kalmanson_records(groups["track_strict_kalmanson"])
        ctx = assertions[0].ctx
        rebuilt: list[dict[str, object]] = []
        for item in core:
            kind = str(item["kind"])
            if kind == "kalmanson":
                match = re.fullmatch(r"kalmanson:(\d+)", str(item["id"]))
                if match is None:
                    raise RuntimeError(f"malformed Kalmanson id: {item['id']}")
                index = int(match.group(1))
                if not 0 <= index < len(fresh_k):
                    raise RuntimeError(f"out-of-range Kalmanson id: {item['id']}")
                expr = fresh_k[index]["expr"]
            elif kind == "equality":
                endpoints = [int(x) for x in item["endpoints"]]  # type: ignore[index]
                if len(endpoints) != 2:
                    raise RuntimeError(f"malformed equality endpoints: {item['id']}")
                expr = distance(ctx, int(item["center"]), endpoints[0]) == distance(
                    ctx, int(item["center"]), endpoints[1]
                )
            else:
                raise RuntimeError(f"unsupported core atom kind: {kind}")
            if expr.sexpr() != str(item["sexpr"]):  # type: ignore[union-attr]
                raise RuntimeError(f"fresh raw reconstruction disagrees for {item['id']}")
            rebuilt.append({**item, "expr": expr, "sexpr": expr.sexpr()})
        result = independent_replay(rebuilt, timeout_ms=timeout_ms, seed=seed)
        result.update({
            "raw_source_reparse_count": 1,
            "raw_blob_sha256": file_sha256(raw_path),
            "raw_formula_sha256": raw_formula_hash,
            "raw_assertions_sha256": formulas_sha256(assertions),
            "raw_core_reconstruction_sha256": formulas_sha256(
                item["expr"] for item in rebuilt  # type: ignore[misc]
            ),
        })
        return result
    except Exception as exc:
        return {
            "status": "fail_closed", "reason": f"fresh_raw_reconstruction: {exc}",
            "raw_source_reparse_count": 1,
        }


def paired_fresh_raw_core_replay(
    core: Sequence[Mapping[str, object]], raw_path: Path, raw_formula_hash: str,
    *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    first = fresh_raw_core_replay(
        core, raw_path, raw_formula_hash, timeout_ms=timeout_ms, seed=seed
    )
    second = fresh_raw_core_replay(
        core, raw_path, raw_formula_hash, timeout_ms=timeout_ms, seed=seed + 1
    )
    authenticated_keys = (
        "formula_sha256", "core_ids_sha256", "raw_blob_sha256",
        "raw_formula_sha256", "raw_assertions_sha256", "raw_core_reconstruction_sha256",
    )
    admitted = (
        first.get("status") == second.get("status") == "unsat"
        and first.get("deletion_minimal_replayed") is True
        and second.get("deletion_minimal_replayed") is True
        and all(first.get(key) == second.get(key) for key in authenticated_keys)
    )
    return {
        "status": "paired_authenticated_unsat" if admitted else "paired_replay_fail_closed",
        "admitted": admitted, "fresh_raw_parse_count": 2,
        "primary": first, "independent": second,
    }


def normalized_equality(triple: Sequence[int]) -> tuple[int, int, int]:
    center, left, right = map(int, triple)
    a, b = sorted((left, right))
    return center, a, b


def schema_matches(core: Sequence[Mapping[str, object]]) -> list[dict[str, object]]:
    equalities = [
        normalized_equality((int(item["center"]), *[int(x) for x in item["endpoints"]]))  # type: ignore[index]
        for item in core if item["kind"] == "equality"
    ]
    if len(equalities) != 3:
        return []
    actual_points = sorted({x for triple in equalities for x in triple}, key=v8.CYCLIC_POSITION.__getitem__)
    actual = set(equalities)
    matches: list[dict[str, object]] = []
    for name, template in KALMANSON_THREE_EQUALITY_SCHEMAS.items():
        role_count = 1 + max(x for triple in template for x in triple)
        if len(actual_points) != role_count:
            continue
        orientations = (actual_points, list(reversed(actual_points)))
        for orientation_name, base in zip(("ccw", "reflected"), orientations, strict=True):
            for rotation in range(role_count):
                sequence = base[rotation:] + base[:rotation]
                mapped = {
                    normalized_equality((sequence[c], sequence[x], sequence[y]))
                    for c, x, y in template
                }
                if mapped == actual:
                    matches.append({"theorem": name, "orientation": orientation_name, "rotation": rotation})
    return matches


def generalized_clause(core: Sequence[Mapping[str, object]], ctx: z3.Context) -> tuple[z3.BoolRef, list[str]]:
    names = sorted({
        str(name) for item in core if item["kind"] == "equality"
        for name in item["membership_pair"]  # type: ignore[union-attr]
    })
    if not names:
        raise RuntimeError("UNSAT core has no rich-membership equality support")
    return z3.Or(*(z3.Not(z3.Bool(name, ctx=ctx)) for name in names)), names


def load_authoritative_input() -> tuple[dict[str, object], Path, tuple[z3.BoolRef, ...], dict[str, z3.BoolRef]]:
    payload = json.loads(V27_PATH.read_text())
    if payload.get("schema_version") != 27 or payload.get("terminal_status") != "authenticated_unsat":
        raise RuntimeError("v27 authoritative artifact is not authenticated UNSAT")
    fixes = tuple(payload.get("fix_minimization", {}).get("fixes", ()))
    if tuple(sorted(fixes, key=lambda item: str(item["bool"]))) != FIXED:
        raise RuntimeError(f"v27 fixed rich literals changed: {fixes}")
    raw_path = Path(str(payload["input"]["raw_blob_path"]))
    if file_sha256(raw_path) != payload["input"]["raw_blob_sha256"]:
        raise RuntimeError("v27 raw blob hash mismatch")
    assertions = v23._parse_raw(raw_path, str(payload["input"]["raw_formula_sha256"]))
    groups, _ = v27.source_assertions(assertions)
    return payload, raw_path, assertions, groups


def fresh_master_replay(
    raw_path: Path, raw_formula_hash: str, learned: Sequence[Mapping[str, object]],
    *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    assertions = v23._parse_raw(raw_path, raw_formula_hash)
    groups, _ = v27.source_assertions(assertions)
    ctx = assertions[0].ctx
    constraints = [body(groups[name], name) for name in MASTER_GROUPS]
    constraints.extend(
        z3.Bool(str(item["bool"]), ctx=ctx) if item["value"] else z3.Not(z3.Bool(str(item["bool"]), ctx=ctx))
        for item in FIXED
    )
    for item in learned:
        constraints.append(z3.Or(*(z3.Not(z3.Bool(name, ctx=ctx)) for name in item["membership_atoms"])))
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*constraints)
    outcome = solver.check()
    return {
        "status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "model_replay_verified": checked_model(solver.model(), constraints) if outcome == z3.sat else None,
        "formula_sha256": formulas_sha256(constraints), "constraint_count": len(constraints),
    }


def paired_fresh_master_replay(
    raw_path: Path, raw_formula_hash: str, learned: Sequence[Mapping[str, object]],
    *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    first = fresh_master_replay(raw_path, raw_formula_hash, learned, timeout_ms=timeout_ms, seed=seed)
    second = fresh_master_replay(raw_path, raw_formula_hash, learned, timeout_ms=timeout_ms, seed=seed + 1)
    admitted = (
        first["status"] == second["status"] == "unsat"
        and first["formula_sha256"] == second["formula_sha256"]
        and first["constraint_count"] == second["constraint_count"]
    )
    return {
        "status": "paired_authenticated_unsat" if admitted else "paired_replay_fail_closed",
        "admitted": admitted, "primary": first, "independent": second,
    }


def run(*, timeout_ms: int, seed: int, max_iterations: int) -> dict[str, object]:
    started = time.monotonic()
    parse_started = time.monotonic()
    v27_payload, raw_path, assertions, groups = load_authoritative_input()
    raw_parse_seconds = time.monotonic() - parse_started
    ctx = assertions[0].ctx
    build_started = time.monotonic()
    exact_body = body(groups["track_exact_rich_profiles"], "track_exact_rich_profiles")
    master_base = [exact_body, body(groups["track_cyclic_alternation_cut"], "track_cyclic_alternation_cut")]
    master_base.extend(z3.Bool(str(item["bool"]), ctx=ctx) for item in FIXED)
    rich_names = rich_bool_names(exact_body)
    if len(rich_names) != 90:
        raise RuntimeError(f"expected 90 DDD rich membership Bools, got {len(rich_names)}")
    k_records = kalmanson_records(groups["track_strict_kalmanson"])
    if len(k_records) != 2730:
        raise RuntimeError(f"expected all 2730 strict Kalmanson inequalities, got {len(k_records)}")
    master = z3.Solver(ctx=ctx)
    master.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    master.add(*master_base)
    oracle = PersistentKalmansonOracle(k_records, timeout_ms=timeout_ms, seed=seed + 50_000)
    exploratory_build_seconds = time.monotonic() - build_started
    timing = {"raw_parse_seconds": raw_parse_seconds, "exploratory_build_seconds": exploratory_build_seconds,
              "master_check_seconds": 0.0, "oracle_seconds": 0.0, "paired_core_replay_seconds": 0.0,
              "paired_terminal_replay_seconds": 0.0}
    raw_formula_hash = str(v27_payload["input"]["raw_formula_sha256"])
    learned: list[dict[str, object]] = []
    iterations: list[dict[str, object]] = []
    terminal = "max_iterations_fail_closed"
    for iteration in range(max_iterations):
        checked_at = time.monotonic()
        outcome = master.check()
        master_seconds = time.monotonic() - checked_at
        timing["master_check_seconds"] += master_seconds
        if outcome == z3.unknown:
            terminal = "master_unknown_fail_closed"
            iterations.append({"iteration": iteration, "master_status": "unknown", "reason_unknown": master.reason_unknown()})
            break
        if outcome == z3.unsat:
            terminal = "discovery_master_unsat"
            iterations.append({"iteration": iteration, "master_status": "unsat", "master_seconds": master_seconds})
            break
        if not checked_model(master.model(), tuple(master.assertions())):
            terminal = "master_model_replay_fail_closed"
            break
        support = support_from_model(master.model(), rich_names, ctx)
        eq_records = equality_records(support, ctx)
        oracle_started = time.monotonic()
        core_result = oracle.classify(eq_records, iteration=iteration)
        oracle_seconds = time.monotonic() - oracle_started
        timing["oracle_seconds"] += oracle_seconds
        entry: dict[str, object] = {
            "iteration": iteration, "master_status": "sat", "master_seconds": master_seconds,
            "support": support, "support_sha256": canonical_sha256(support),
            "oracle_status": core_result["status"], "oracle_seconds": oracle_seconds,
        }
        if core_result["status"] == "sat":
            terminal = "alive_oracle_sat"
            entry["oracle"] = core_result
            iterations.append(entry)
            break
        if core_result["status"] != "unsat":
            terminal = str(core_result["status"])
            entry["oracle"] = core_result
            iterations.append(entry)
            break
        core = core_result["core"]  # type: ignore[assignment]
        replay_started = time.monotonic()
        replay = paired_fresh_raw_core_replay(
            core, raw_path, raw_formula_hash,
            timeout_ms=timeout_ms, seed=seed + 100_000 + 2 * iteration,
        )
        timing["paired_core_replay_seconds"] += time.monotonic() - replay_started
        if replay.get("admitted") is not True:
            terminal = "core_replay_fail_closed"
            entry.update({"oracle": {k: v for k, v in core_result.items() if k != "core"}, "replay": replay})
            iterations.append(entry)
            break
        clause, membership_atoms = generalized_clause(core, ctx)
        master.add(clause)
        core_public = [{k: v for k, v in item.items() if k != "expr"} for item in core]
        matches = schema_matches(core)
        learned_record = {
            "iteration": iteration, "core": core_public,
            "core_size": len(core), "equality_count": sum(item["kind"] == "equality" for item in core),
            "kalmanson_count": sum(item["kind"] == "kalmanson" for item in core),
            "membership_atoms": membership_atoms, "clause_sexpr": clause.sexpr(),
            "clause_sha256": hashlib.sha256(clause.sexpr().encode()).hexdigest(),
            "independent_replay": replay, "schema_matches": matches,
            "matches_existing_KalmansonThreeEqualitySchemas": bool(matches),
            "cut_admission": {
                "lean_theorem": [match["theorem"] for match in matches] or None,
                "classification": "external-Z3 relaxation; no Lean order adapter or kernel ingress",
                "antecedent": membership_atoms, "schema_arm": "DDD exact-n15 v27 leaf",
            },
        }
        learned.append(learned_record)
        entry.update({
            "oracle": {k: v for k, v in core_result.items() if k not in {"core", "trials"}},
            "core_ids": [item["id"] for item in core], "learned_clause_sha256": learned_record["clause_sha256"],
        })
        iterations.append(entry)

    terminal_replay_started = time.monotonic()
    terminal_replay = paired_fresh_master_replay(
        raw_path, raw_formula_hash, learned, timeout_ms=timeout_ms, seed=seed + 200_000
    )
    timing["paired_terminal_replay_seconds"] += time.monotonic() - terminal_replay_started
    if terminal == "discovery_master_unsat":
        terminal = "authenticated_master_unsat" if terminal_replay["admitted"] is True else "terminal_replay_fail_closed"
    result: dict[str, object] = {
        "schema_version": 28, "kind": "v28-rich-kalmanson-compact-cegar", "terminal_status": terminal,
        "input": {
            "v27_path": str(V27_PATH), "v27_sha256": file_sha256(V27_PATH),
            "raw_blob_path": str(raw_path), "raw_blob_sha256": file_sha256(raw_path),
            "raw_formula_sha256": raw_formula_hash, "script_sha256": file_sha256(SCRIPT_PATH),
            "test_sha256": file_sha256(TEST_PATH), "z3_version": z3.get_version_string(),
            "master_groups": list(MASTER_GROUPS), "master_group_bodies_sha256": formulas_sha256(master_base[:2]),
            "fixed": list(FIXED), "fixed_sha256": canonical_sha256(FIXED),
            "strict_kalmanson_count": len(k_records), "strict_kalmanson_sha256": formulas_sha256(item["expr"] for item in k_records),
        },
        "configuration": {"timeout_ms": timeout_ms, "seed": seed, "max_iterations": max_iterations},
        "iterations": iterations, "learned_cores": learned,
        "terminal_replay": terminal_replay, "timing": timing,
        "exploratory_reuse": {
            "raw_parse_count": 1, "master_build_count": 1, "oracle_build_count": 1,
            "oracle_reuse_calls": oracle.calls,
            "accepted_core_fresh_raw_parse_count": 2 * len(learned),
            "terminal_fresh_raw_parse_count": 2,
            "admission_invariant": "No exploratory AST/solver verdict admits a cut or terminal: every cut is reconstructed by two independent fresh raw-v19 parses and exact deletion-minimal replays; terminal UNSAT requires two further fresh raw-gzip parses with identical hashes/verdicts.",
        },
        "elapsed_seconds": time.monotonic() - started,
        "generalization_checkpoint": {
            "reviewed_core_count": len(learned),
            "existing_schema_match_count": sum(bool(item["schema_matches"]) for item in learned),
            "note": "Classified every three-equality core against the four existing KalmansonThreeEqualitySchemas up to cyclic dihedral relabeling.",
        },
        "trust_boundary": "external Z3 4.x exact-rational QF_LRA/PB discovery and paired fresh-raw replay only; no proof certificate and no Lean/kernel ingress",
    }
    result["result_payload_sha256"] = canonical_sha256(result)
    return result


def render_report(result: Mapping[str, object]) -> str:
    learned = result["learned_cores"]  # type: ignore[assignment]
    matched = sum(bool(item["schema_matches"]) for item in learned)  # type: ignore[index]
    lines = [
        "# v28 rich-support Kalmanson CEGAR", "",
        f"- Terminal status: `{result['terminal_status']}`",
        f"- Learned deletion-minimal cores: {len(learned)}",  # type: ignore[arg-type]
        f"- Cores matching existing `KalmansonThreeEqualitySchemas`: {matched}/{len(learned)}",  # type: ignore[arg-type]
        f"- Terminal paired fresh master replay: `{result['terminal_replay']['status']}`",  # type: ignore[index]
        "- Master: raw `exact_rich_profiles` + raw `cyclic_alternation_cut` + `rich_2_1_4=true` + `rich_2_1_12=true`.",
        "- Oracle: all 2,730 raw strict Kalmanson inequalities plus pairwise same-rich-class distance equalities.",
        "- Trust boundary: external exact-rational Z3 only; no proof certificate and no Lean/kernel ingress.", "",
        "The exploratory raw AST, master, and Kalmanson oracle are built once and reused. Each admitted clause was reconstructed from two independent fresh parses of the hashed raw v19 formula, replayed UNSAT in fresh Z3 contexts, and had every single-atom deletion replayed SAT in both. Final aggregate UNSAT requires two further fresh raw-gzip parses. Schema matches are combinatorial cyclic-dihedral matches only; they do not supply the missing Lean order/antecedent adapter.", "",
    ]
    return "\n".join(lines)


def write_outputs(result: Mapping[str, object], json_path: Path, report_path: Path, manifest_path: Path) -> None:
    for path in (json_path, report_path, manifest_path):
        if path.exists():
            raise FileExistsError(f"refusing to overwrite immutable v28 artifact: {path}")
    json_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    report_path.write_text(render_report(result))
    manifest = {
        "schema_version": 28, "kind": "v28-output-hash-manifest",
        "inputs": {
            "v27": {"path": str(V27_PATH), "sha256": file_sha256(V27_PATH)},
            "raw_blob": {"path": result["input"]["raw_blob_path"], "sha256": result["input"]["raw_blob_sha256"]},  # type: ignore[index]
            "script": {"path": str(SCRIPT_PATH), "sha256": file_sha256(SCRIPT_PATH)},
            "test": {"path": str(TEST_PATH), "sha256": file_sha256(TEST_PATH)},
        },
        "outputs": {
            "result": {"path": str(json_path), "sha256": file_sha256(json_path)},
            "report": {"path": str(report_path), "sha256": file_sha256(report_path)},
        },
    }
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=DEFAULT_JSON)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--seed", type=int, default=2801)
    parser.add_argument("--max-iterations", type=int, default=10_000)
    args = parser.parse_args()
    if args.timeout_ms <= 0 or args.max_iterations <= 0:
        raise ValueError("timeouts and iteration budgets must be positive")
    result = run(timeout_ms=args.timeout_ms, seed=args.seed, max_iterations=args.max_iterations)
    write_outputs(result, args.output, args.report, args.manifest)
    print(json.dumps({
        "output": str(args.output), "status": result["terminal_status"],
        "iterations": len(result["iterations"]), "cores": len(result["learned_cores"]),
    }, sort_keys=True))
    return 0 if result["terminal_status"] == "authenticated_master_unsat" else 2


if __name__ == "__main__":
    raise SystemExit(main())
