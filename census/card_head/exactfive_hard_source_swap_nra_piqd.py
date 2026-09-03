"""Fixed-order QF_NRA canary for the exact-five hard source-swap survivor.

This is a two-order metric diagnostic only.  It tests the authenticated
survivor 1697 with real coordinates, rather than abstract distances or a
separate Kalmanson layer.  Solver calls are made only by the PIQD adapter;
this module never invokes a local solver.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import math
import os
import re
import stat
import urllib.parse
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import exactfive_hard_source_swap_order_piqd as order_piqd
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-nra-canary-r2-20260902"
RUN_ID = "run-0001"
RUN_ROOT = Path(__file__).resolve().parents[2] / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = Path(__file__).resolve().parents[2] / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
PROFILE_INDEX = 1697
PROFILE_SHA256 = "59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e"
MAX_WORKERS = 20
CONTROL_IDS = ("positive", "negative")
ORDER_IDS = ("z3-survivor", "cvc5-survivor")
ORDERS: dict[str, tuple[str, ...]] = {
    "z3-survivor": ("c000", "c003", "c004", "c002", "c006", "c001", "c010", "c009", "c005", "c008", "c007"),
    "cvc5-survivor": ("c000", "c003", "c004", "c002", "c006", "c001", "c007", "c009", "c010", "c008", "c005"),
}
SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-nra-canary-system/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-nra-canary/v1"
FALSE_CLAIMS = {"source_realization": False, "alias_exhaustiveness": False, "all_order_elimination": False, "live_closure": False, "promotion": False, "theorem": False}
_INT = re.compile(r"^-?(?:0|[1-9][0-9]*)$")
_DECIMAL = re.compile(r"^-?(?:0|[1-9][0-9]*)\.[0-9]+$")


class NraCanaryError(RuntimeError):
    """The fixed-order canary failed closed."""


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    info = path.lstat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise NraCanaryError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise NraCanaryError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise NraCanaryError(f"{where} is not strict JSON") from exc
    if not isinstance(value, dict):
        raise NraCanaryError(f"{where} is not an object")
    return value


def _manifest_self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _term(prefix: str, cid: str) -> str:
    return f"{prefix}_{cid}"


def _dist(a: str, b: str) -> str:
    a, b = sorted((a, b))
    return f"d_{a}_{b}"


def _sqexpr(left: str, right: str, axis: str) -> str:
    delta = f"(- {_term(axis, left)} {_term(axis, right)})"
    return f"(* {delta} {delta})"


def _squared_distance_expr(center: str, point: str) -> str:
    return f"(+ {_sqexpr(center, point, 'x')} {_sqexpr(center, point, 'y')})"


def _profile() -> tuple[int, order_piqd.alias_grid.SourceAliasProfile]:
    index, profile = order_piqd.indexed_profiles()[PROFILE_INDEX]
    if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:
        raise NraCanaryError("authenticated survivor 1697 changed")
    return index, profile


def _validate_system_current(system: object) -> dict[str, Any]:
    if not isinstance(system, dict):
        raise NraCanaryError("semantic system is not an object")
    kind = system.get("kind")
    if kind == "profile":
        if system.get("order_id") not in ORDER_IDS:
            raise NraCanaryError("semantic order id is invalid")
        expected = build_system(system["order_id"])
    elif kind == "control":
        if system.get("control") not in CONTROL_IDS:
            raise NraCanaryError("semantic control id is invalid")
        expected = build_control_system(system["control"])
    else:
        raise NraCanaryError("semantic system kind is invalid")
    if system != expected:
        raise NraCanaryError("semantic system disagrees with current producer")
    return expected


def _role_class() -> tuple[dict[str, str], tuple[str, ...]]:
    _, profile = _profile()
    classes = tuple(tuple(row) for row in profile.classes)
    role_class = order_piqd._role_to_class(classes)
    ids = tuple(f"c{i:03d}" for i in range(len(classes)))
    return role_class, ids


def _source_record() -> dict[str, Any]:
    index, profile = _profile()
    return {"schema": SYSTEM_SCHEMA, "producer_version": PRODUCER_VERSION, "profile_index": index, "profile_sha256": profile.profile_id, "claims": dict(FALSE_CLAIMS)}


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    result = {}
    root = Path(__file__).resolve().parents[2]
    for path in paths:
        try: name = path.resolve().relative_to(root).as_posix()
        except ValueError as exc: raise NraCanaryError("governed source escaped repository") from exc
        result[name] = _sha(_read_regular(path))
    return dict(sorted(result.items()))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if checkpoint.get("schema") != "worktree-lane-checkpoint/v1" or checkpoint.get("lane_id") != LANE_ID or f"scratch/runs/{LANE_ID}/{RUN_ID}" not in checkpoint.get("generated_roots", []):
        raise NraCanaryError("lane checkpoint does not govern this run")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    root = Path(__file__).resolve().parents[2]
    sources = _source_digest_map((Path(__file__), root / "scripts" / "run_exactfive_hard_source_swap_nra_piqd.py", root / "census" / "card_head" / "exactfive_hard_source_swap_order_piqd.py", root / "census" / "card_head" / "exactfive_hard_source_swap_grid.py", root / "census" / "p97_search" / "phase3_piqd_smt_source_adapter.py"))
    inputs = _source_digest_map((CHECKPOINT_PATH, root / "docs" / "specs" / "p97-exactfive-hard-source-swap-nra-canary-v1.md"))
    manifest = {"schema": "worktree-run-manifest/v1", "lane_id": LANE_ID, "run_id": RUN_ID, "root": f"scratch/runs/{LANE_ID}/{RUN_ID}", "owner": checkpoint["owner"], "base_head": checkpoint["base_head"], "output_classes": ["artifacts", "events", "tmp"], "source_digests": sources, "input_digests": inputs, "created_utc": created_utc}
    manifest["manifest_sha256"] = _manifest_self_hash(manifest, "manifest_sha256")
    return manifest


def build_system(order_id: str) -> dict[str, Any]:
    """Build one of the two authenticated fixed rank-order systems."""
    if order_id not in ORDERS:
        raise NraCanaryError(f"unknown fixed order: {order_id}")
    role_class, ids = _role_class()
    if set(ORDERS[order_id]) != set(ids):
        raise NraCanaryError("fixed order does not cover the quotient classes")
    ranks = {cid: rank for rank, cid in enumerate(ORDERS[order_id])}
    _, profile = _profile()
    return {
        "schema": SYSTEM_SCHEMA, "kind": "profile", "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256, "classes": [{"id": cid, "roles": list(profile.classes[i])} for i, cid in enumerate(ids)],
        "role_class": role_class, "order_id": order_id, "order": list(ORDERS[order_id]), "ranks": ranks,
        "gauge": {"rank_zero": [0, 0], "rank_one": [1, 0]},
        "rows": [
            {"id": row["id"], "center": row["center"], "support": list(row["support"])}
            for row in order_piqd.ROWS
        ],
        "radius_disequality": {"center": "c2", "old_support": "O", "replacement_support": "d"},
        "source_strict": {"left": ["e", "d"], "right": ["e", "a"], "relation": "<"},
        "claims": dict(FALSE_CLAIMS),
    }


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    """Inline coordinate controls: one strict convex order and one violation."""
    if control not in CONTROL_IDS:
        raise NraCanaryError("unknown control")
    coords = [[0, 0], [1, 0], [2, 1], [1, 2 if control == "positive" else -2]]
    ids = tuple(f"c{i:03d}" for i in range(4))
    return {"schema": SYSTEM_SCHEMA, "kind": "control", "control": control, "order": list(ids), "ranks": {cid: i for i, cid in enumerate(ids)}, "gauge": {"rank_zero": [0, 0], "rank_one": [1, 0]}, "coordinate_pins": {cid: coords[i] for i, cid in enumerate(ids)}, "claims": dict(FALSE_CLAIMS)}


def _area(x: Mapping[str, Fraction], y: Mapping[str, Fraction], a: str, b: str, c: str) -> Fraction:
    return (x[b] - x[a]) * (y[c] - y[a]) - (y[b] - y[a]) * (x[c] - x[a])


def _sqdist(x: Mapping[str, Fraction], y: Mapping[str, Fraction], a: str, b: str) -> Fraction:
    return (x[a] - x[b]) ** 2 + (y[a] - y[b]) ** 2


def check_coordinates(system: Mapping[str, Any], coords: Mapping[str, Sequence[Fraction]]) -> dict[str, Any]:
    ids = tuple(system["order"])
    if set(coords) != set(ids) or any(len(coords[cid]) != 2 for cid in ids):
        raise NraCanaryError("coordinate readback does not cover exactly the classes")
    x = {cid: Fraction(coords[cid][0]) for cid in ids}; y = {cid: Fraction(coords[cid][1]) for cid in ids}
    if (x[ids[0]], y[ids[0]]) != (0, 0) or (x[ids[1]], y[ids[1]]) != (1, 0):
        return {"accepted": False, "reason": "gauge"}
    areas = [_area(x, y, *triple) for triple in itertools.combinations(ids, 3)]
    if any(value <= 0 for value in areas):
        return {"accepted": False, "reason": "strict_convex_order", "triple_count": len(areas), "min_area": str(min(areas))}
    if system["kind"] == "control":
        expected = system["coordinate_pins"]
        if any((x[cid], y[cid]) != tuple(map(Fraction, expected[cid])) for cid in ids):
            return {"accepted": False, "reason": "control_coordinates"}
        return {"accepted": True, "triple_count": len(areas), "min_area": str(min(areas))}
    role = system["role_class"]
    for row in system["rows"]:
        center = role[row["center"]]; values = [_sqdist(x, y, center, role[item]) for item in row["support"]]
        if len(set(values)) != 1:
            return {"accepted": False, "reason": f"row_{row['id']}", "values": [str(v) for v in values]}
    c2, old, new = role["c2"], role["O"], role["d"]
    if _sqdist(x, y, c2, old) == _sqdist(x, y, c2, new):
        return {"accepted": False, "reason": "radius_disequality"}
    left = _sqdist(x, y, role["e"], role["d"]); right = _sqdist(x, y, role["e"], role["a"])
    if not left < right:
        return {"accepted": False, "reason": "source_strict", "left": str(left), "right": str(right)}
    return {"accepted": True, "triple_count": len(areas), "min_area": str(min(areas))}


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    n = len(system["order"])
    rows = 0 if system["kind"] == "control" else sum(len(row["support"]) - 1 for row in system["rows"])
    return {"coordinate_declarations": 2 * n, "gauge_assertions": 4, "fixed_coordinate_assertions": 2 * n if system["kind"] == "control" else 0, "strict_signed_area_assertions": math_comb(n, 3), "row_equality_assertions": rows, "radius_disequality_assertions": 0 if system["kind"] == "control" else 1, "source_strict_assertions": 0 if system["kind"] == "control" else 1}


def math_comb(n: int, k: int) -> int:
    return len(tuple(itertools.combinations(range(n), k)))


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    ids = tuple(system["order"]); out = ["(set-logic QF_NRA)"]
    for cid in ids: out += [f"(declare-fun {_term('x', cid)} () Real)", f"(declare-fun {_term('y', cid)} () Real)"]
    out += [f"(assert (= {_term('x', ids[0])} 0))", f"(assert (= {_term('y', ids[0])} 0))", f"(assert (= {_term('x', ids[1])} 1))", f"(assert (= {_term('y', ids[1])} 0))"]
    for cid, xy in sorted(system.get("coordinate_pins", {}).items()): out += [f"(assert (= {_term('x', cid)} {xy[0]}))", f"(assert (= {_term('y', cid)} {xy[1]}))"]
    for a, b, c in itertools.combinations(ids, 3):
        expr = f"(- (* (- {_term('x', b)} {_term('x', a)}) (- {_term('y', c)} {_term('y', a)})) (* (- {_term('y', b)} {_term('y', a)}) (- {_term('x', c)} {_term('x', a)})))"
        out.append(f"(assert (> {expr} 0))")
    if system["kind"] == "profile":
        role = system["role_class"]
        for row in system["rows"]:
            center = role[row["center"]]; first = role[row["support"][0]]
            for item in row["support"][1:]:
                out.append(f"(assert (= {_squared_distance_expr(center, first)} {_squared_distance_expr(center, role[item])}))")
        c2, old, new = role["c2"], role["O"], role["d"]
        out.append(f"(assert (not (= {_squared_distance_expr(c2, old)} {_squared_distance_expr(c2, new)})))")
        e, d, a = role["e"], role["d"], role["a"]
        out.append(f"(assert (< {_squared_distance_expr(e, d)} {_squared_distance_expr(e, a)}))")
    return tuple(out)


def smt_journal(system: Mapping[str, Any]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in build_smt_commands(system))


def _sexpr(raw: str) -> object:
    tokens = re.findall(r"\(|\)|[^\s()]+", raw); stack: list[list[object]] = []; roots: list[object] = []
    for token in tokens:
        if token == "(": stack.append([])
        elif token == ")":
            if not stack: raise NraCanaryError("unbalanced get-value text")
            item = stack.pop(); (stack[-1] if stack else roots).append(item)
        else: (stack[-1] if stack else roots).append(token)
    if stack or len(roots) != 1: raise NraCanaryError("malformed get-value text")
    return roots[0]


def _number(value: object) -> Fraction:
    if isinstance(value, str) and _INT.fullmatch(value): return Fraction(int(value))
    if isinstance(value, str) and _DECIMAL.fullmatch(value): return Fraction(value)
    if isinstance(value, list) and len(value) == 3 and value[0] == "/":
        denominator = _number(value[2])
        if denominator == 0: raise NraCanaryError("zero denominator in get-value numeral")
        return _number(value[1]) / denominator
    if isinstance(value, list) and len(value) == 2 and value[0] == "-": return -_number(value[1])
    raise NraCanaryError(f"unsupported exact numeral: {value!r}")


def parse_coordinates(values: str, terms: Sequence[str]) -> dict[str, tuple[Fraction, Fraction]]:
    root = _sexpr(values)
    if not isinstance(root, list): raise NraCanaryError("get-value root is not a list")
    found: dict[str, Fraction] = {}
    for item in root:
        if not isinstance(item, list) or len(item) != 2 or not isinstance(item[0], str): raise NraCanaryError("get-value entry malformed")
        if item[0] in found: raise NraCanaryError("get-value contains duplicate terms")
        found[item[0]] = _number(item[1])
    if set(found) != set(terms): raise NraCanaryError("get-value variable set drifted")
    return {cid: (found[_term("x", cid)], found[_term("y", cid)]) for cid in {term[2:] for term in terms if term.startswith("x_")}}


@dataclass(frozen=True)
class PreparedQuery:
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def prepare_query(system: dict[str, Any], timeout_ms: int = 60_000) -> PreparedQuery:
    commands = build_smt_commands(system); journal = b"".join(c.encode("ascii") + b"\n" for c in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal: raise NraCanaryError("journal normalization drift")
    semantic = {"schema": SYSTEM_SCHEMA, "producer_version": PRODUCER_VERSION, "system": system, "system_sha256": _sha(_canonical(system)), "formula_inventory": formula_inventory(system), "journal_sha256": _sha(journal), "claims": dict(FALSE_CLAIMS)}
    sources = tuple(sorted((adapter.SourceSnapshot("0000-source-record.json", _json(_source_record())), adapter.SourceSnapshot("implementation-alias-producer.py", Path(order_piqd.alias_grid.__file__).read_bytes()), adapter.SourceSnapshot("implementation-nra-canary.py", Path(__file__).read_bytes()), adapter.SourceSnapshot("implementation-order-producer.py", Path(order_piqd.__file__).read_bytes()), adapter.SourceSnapshot("implementation-adapter.py", Path(adapter.__file__).read_bytes())), key=lambda item: item.path))
    variables = sorted(([{"id": f"x-{cid}", "term": _term("x", cid), "sort": "Real"} for cid in system["order"]] + [{"id": f"y-{cid}", "term": _term("y", cid), "sort": "Real"} for cid in system["order"]]), key=lambda item: item["id"])
    descriptor = {"schema": adapter.QUERY_SCHEMA, "producer": {"id": "p97-exactfive-hard-source-swap-nra-canary", "version": "v1"}, "semantic_verifier": {"id": "exact-coordinate-complete-replay", "version": "v1"}, "stage_id": "fixed-order-qfnra", "query_id": f"{system['kind']}-{system.get('order_id', system.get('control'))}", "sources": [{"path": s.path, "bytes": len(s.payload), "sha256": _sha(s.payload)} for s in sources], "semantic_input": semantic, "semantic_sha256": _sha(_canonical(semantic)), "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)}, "variables": variables, "named_atoms": [], "solve": {"assumption_ids": [], "readback_variable_ids": [v["id"] for v in variables], "include_model": True}, "solver_profile": {"schema": adapter.SOLVER_PROFILE_SCHEMA, "solvers": ["z3", "cvc5"], "timeout_ms": timeout_ms}}
    return PreparedQuery(system, adapter.SourceSemanticQuery(descriptor, _json(descriptor), journal, commands, journal, sources))


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or not isinstance(values, str): raise NraCanaryError("invalid solver readback")
    semantic = query.descriptor.get("semantic_input")
    if not isinstance(semantic, dict): raise NraCanaryError("missing semantic input")
    system = _validate_system_current(semantic.get("system"))
    if semantic.get("system_sha256") != _sha(_canonical(system)) or semantic.get("formula_inventory") != formula_inventory(system):
        raise NraCanaryError("semantic system digest or inventory drifted")
    solver_profile = query.descriptor.get("solver_profile")
    timeout_ms = solver_profile.get("timeout_ms") if isinstance(solver_profile, dict) else None
    if type(timeout_ms) is not int or not 0 < timeout_ms <= 3_600_000:
        raise NraCanaryError("descriptor solver timeout is invalid")
    expected = prepare_query(system, timeout_ms).query
    if query.descriptor_bytes != _json(query.descriptor) or query.descriptor != expected.descriptor or query.original_smt2 != expected.original_smt2 or query.journal_smt2 != expected.journal_smt2 or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic)):
        raise NraCanaryError("descriptor or journal drifted from current producer")
    coords = parse_coordinates(values, query.get_values)
    replay = check_coordinates(system, coords)
    replay.update({"solver": solver, "model_sha256": _sha(model.encode()), "values_sha256": _sha(values.encode()), "system_sha256": _sha(_canonical(system))})
    return adapter.SemanticVerification(bool(replay.get("accepted")), replay)


def run_query(prepared: PreparedQuery, output_directory: Path, transport: adapter.PiqdTransport) -> dict[str, Any]:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    return adapter.run_source_semantic_query(prepared.query, output_directory, transport, verify_sat_model)


def ensure_run_root() -> Path:
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    for name in ("artifacts", "events", "tmp"): (RUN_ROOT / name).mkdir(exist_ok=True)
    path = RUN_ROOT / "run_manifest.json"
    if path.exists():
        observed = _strict_json(_read_regular(path), "run manifest")
        created = observed.get("created_utc")
        if not isinstance(created, str) or observed != _expected_run_manifest(created):
            raise NraCanaryError("run manifest or source digest drifted")
    else:
        raise NraCanaryError("governed run manifest is missing")
    return RUN_ROOT


def _read_terminal(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="ascii"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise NraCanaryError("terminal record is not strict JSON") from exc
    if not isinstance(value, dict) or value.get("schema") != "p97-exactfive-hard-source-swap-nra-canary-result/v1" or value.get("claims") != FALSE_CLAIMS:
        raise NraCanaryError("terminal record is malformed")
    expected = {"control-positive", "control-negative", *ORDER_IDS}
    if set(value.get("results", {})) != expected or not isinstance(value.get("run_manifest_sha256"), str) or not isinstance(value.get("launch_sha256"), str):
        raise NraCanaryError("terminal record has the wrong query set")
    if value.get("terminal_sha256") != _manifest_self_hash(value, "terminal_sha256"):
        raise NraCanaryError("terminal self-hash mismatch")
    return value


def _create_once(path: Path, payload: bytes) -> None:
    try:
        descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o400)
        try:
            view = memoryview(payload)
            while view:
                written = os.write(descriptor, view)
                if written <= 0: raise NraCanaryError("short immutable record write")
                view = view[written:]
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
    except FileExistsError:
        if _read_regular(path) != payload: raise NraCanaryError(f"immutable record drifted: {path.name}")


def _launch_record(root: Path, server: str, timeout_ms: int, workers: int) -> dict[str, Any]:
    manifest_sha = _sha(_read_regular(root / "run_manifest.json"))
    record: dict[str, Any] = {"schema": "p97-exactfive-hard-source-swap-nra-canary-launch/v1", "lane_id": LANE_ID, "run_id": RUN_ID, "run_manifest_sha256": manifest_sha, "profile_index": PROFILE_INDEX, "profile_sha256": PROFILE_SHA256, "queries": ["control-positive", "control-negative", *ORDER_IDS], "server": server, "timeout_ms": timeout_ms, "workers": workers, "claims": dict(FALSE_CLAIMS)}
    record["launch_sha256"] = _manifest_self_hash(record, "launch_sha256")
    return record


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if not isinstance(record, dict) or set(record) != {"path", "bytes", "sha256"}:
        raise NraCanaryError("adapter artifact record is malformed")
    name = record["path"]
    if not isinstance(name, str) or not name or "/" in name or "\\" in name or name in seen:
        raise NraCanaryError("adapter artifact path is unsafe or duplicated")
    if not isinstance(record["bytes"], int) or record["bytes"] < 0 or not isinstance(record["sha256"], str):
        raise NraCanaryError("adapter artifact digest record is malformed")
    payload = _read_regular(root / name)
    if len(payload) != record["bytes"] or _sha(payload) != record["sha256"]:
        raise NraCanaryError(f"adapter artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def verify_adapter_tree(prepared: PreparedQuery, output_directory: Path) -> dict[str, Any]:
    """Revalidate every adapter artifact before allowing exact resume."""
    result_path = output_directory / "result.json"
    result = _strict_json(_read_regular(result_path), "adapter result")
    if result.get("schema") != adapter.RESULT_SCHEMA or result.get("claims") != adapter.FALSE_CLAIMS:
        raise NraCanaryError("adapter result schema or claims drifted")
    seen: set[str] = {"result.json"}
    custody = result.get("custody")
    if not isinstance(custody, dict): raise NraCanaryError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody.get("descriptor"), seen)
    original = _verify_artifact(output_directory, custody.get("original_smt2"), seen)
    journal = _verify_artifact(output_directory, custody.get("journal_smt2"), seen)
    manifest = _verify_artifact(output_directory, custody.get("manifest"), seen)
    if descriptor != prepared.query.descriptor_bytes or original != prepared.query.original_smt2 or journal != prepared.query.journal_smt2:
        raise NraCanaryError("adapter query custody differs from current producer")
    if result.get("source_manifest_sha256") != _sha(manifest): raise NraCanaryError("adapter source manifest is not cross-bound")
    source_manifest = _strict_json(manifest, "adapter source manifest")
    if source_manifest.get("schema") != adapter.MANIFEST_SCHEMA or source_manifest.get("query_id") != prepared.query.descriptor["query_id"] or source_manifest != adapter._manifest(prepared.query):
        raise NraCanaryError("adapter source manifest identity drifted")
    sources = custody.get("sources")
    if not isinstance(sources, list): raise NraCanaryError("adapter source custody is malformed")
    for record in sources: _verify_artifact(output_directory, record, seen)
    engines = result.get("engines")
    if not isinstance(engines, list) or [e.get("solver") for e in engines if isinstance(e, dict)] != list(adapter.SOLVERS):
        raise NraCanaryError("adapter engine list is malformed")
    for engine in engines:
        if not isinstance(engine, dict) or engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise NraCanaryError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if not isinstance(artifacts, dict): raise NraCanaryError("adapter engine artifacts are malformed")
        payloads = {label: _verify_artifact(output_directory, record, seen) for label, record in artifacts.items()}
        solve_label = "solve" if "solve" in payloads else "reconciled_solve"
        if solve_label not in payloads: raise NraCanaryError("adapter solve artifact is missing")
        solve = _strict_json(payloads[solve_label], f"{engine['solver']} solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if solve.get("status") != engine["raw_status"] or engine.get("result_sha256") != digest or not isinstance(advisory, dict) or advisory.get("locally_recomputed") != digest or advisory.get("matches_daemon") is not True:
            raise NraCanaryError("adapter solve digest is inconsistent")
        if solve["status"] == "SAT":
            replay = solve.get("model_replay")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED" or engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED":
                raise NraCanaryError("SAT lacks daemon SATISFIED model replay")
            verification = verify_sat_model(prepared.query, engine["solver"], solve.get("model"), solve.get("values"))
            semantic = engine.get("semantic_replay")
            if not verification.accepted or not isinstance(semantic, dict) or semantic.get("accepted") is not True or semantic.get("evidence") != verification.evidence:
                raise NraCanaryError("SAT semantic replay does not revalidate")
    effective = [engine.get("effective_status") for engine in engines]
    raw = [engine.get("raw_status") for engine in engines]
    expected_overall = "INCONCLUSIVE" if any(isinstance(status, str) and status.startswith("INCONCLUSIVE") for status in effective) else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT" if len(set(raw)) != 1 else "FINITE_DIAGNOSTIC_COMPLETE"
    if result.get("overall_status") != expected_overall:
        raise NraCanaryError("adapter overall status is inconsistent")
    if {path.name for path in output_directory.iterdir()} != seen:
        raise NraCanaryError("adapter output has unbound artifacts")
    return result


def _require_control_result(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT" if key == "control-negative" else None
    if expected is None: return
    statuses = [engine.get("raw_status") for engine in result.get("engines", []) if isinstance(engine, dict)]
    if statuses != [expected, expected]:
        raise NraCanaryError(f"control {key} did not produce {expected}/{expected}")


def run_census(*, server: str = "http://127.0.0.1:7272", timeout_s: float = 60.0, workers: int = 2) -> dict[str, Any]:
    if type(workers) is not int or not 1 <= workers <= MAX_WORKERS: raise NraCanaryError("workers must lie in 1..20")
    if type(timeout_s) not in {int, float} or not math.isfinite(timeout_s) or not 0 < timeout_s <= 3600 or not float(timeout_s * 1000).is_integer(): raise NraCanaryError("timeout must be an exact millisecond value in (0,3600]")
    timeout_ms = int(timeout_s * 1000)
    parsed = urllib.parse.urlsplit(server)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc or parsed.username is not None or parsed.password is not None or parsed.query or parsed.fragment: raise NraCanaryError("invalid PIQD server URL")
    root = ensure_run_root()
    launch = _launch_record(root, server, timeout_ms, workers)
    launch_path = root / "events" / "launch.json"
    if launch_path.exists() and _strict_json(_read_regular(launch_path), "launch record") != launch:
        raise NraCanaryError("launch record differs on resume")
    if not launch_path.exists(): _create_once(launch_path, _json(launch))
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists():
        terminal = _read_terminal(terminal_path)
        if terminal.get("run_manifest_sha256") != launch["run_manifest_sha256"] or terminal.get("launch_sha256") != launch["launch_sha256"]:
            raise NraCanaryError("terminal custody links drifted")
        for key in ("control-positive", "control-negative", *ORDER_IDS):
            system = build_control_system(key.removeprefix("control-")) if key.startswith("control-") else build_system(key)
            verified = verify_adapter_tree(prepare_query(system, timeout_ms), root / "artifacts" / key)
            _require_control_result(key, verified)
            if terminal["results"][key]["result_sha256"] != _sha(_read_regular(root / "artifacts" / key / "result.json")) or terminal["results"][key]["overall_status"] != verified.get("overall_status"):
                raise NraCanaryError("terminal result hash or status drifted")
        return terminal
    transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_ms / 1000 + 40)
    results = {}
    for control in CONTROL_IDS:
        results[f"control-{control}"] = run_query(prepare_query(build_control_system(control), timeout_ms), root / "artifacts" / f"control-{control}", transport)
    expected_control = {"control-positive": "SAT", "control-negative": "UNSAT"}
    for key in expected_control: _require_control_result(key, results[key])
    def execute(order_id: str) -> tuple[str, dict[str, Any]]:
        return order_id, run_query(prepare_query(build_system(order_id), timeout_ms), root / "artifacts" / order_id, transport)
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(workers, len(ORDER_IDS))) as pool:
        for key, value in pool.map(execute, ORDER_IDS): results[key] = value
    summary = {"schema": "p97-exactfive-hard-source-swap-nra-canary-result/v1", "run_manifest_sha256": _sha(_read_regular(root / "run_manifest.json")), "launch_sha256": launch["launch_sha256"], "results": {key: {"overall_status": value.get("overall_status"), "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json"))} for key, value in results.items()}, "claims": dict(FALSE_CLAIMS)}
    summary["terminal_sha256"] = _manifest_self_hash(summary, "terminal_sha256")
    path = root / "events" / "terminal.json"
    payload = _json(summary)
    _create_once(path, payload)
    return summary


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False); parser.add_argument("--server", default="http://127.0.0.1:7272"); parser.add_argument("--timeout", type=float, default=60.0); parser.add_argument("--workers", type=int, default=2); parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try: result = run_census(server=args.server, timeout_s=args.timeout, workers=args.workers)
    except (NraCanaryError, adapter.SmtSourceAdapterError) as exc: print(f"error: {exc}", file=os.sys.stderr); return 1
    if args.verbose: print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = ["CONTROL_IDS", "MAX_WORKERS", "ORDERS", "ORDER_IDS", "PROFILE_INDEX", "PROFILE_SHA256", "NraCanaryError", "PreparedQuery", "build_control_system", "build_smt_commands", "build_system", "check_coordinates", "formula_inventory", "parse_coordinates", "prepare_query", "run_census", "run_query", "smt_journal", "verify_sat_model"]
