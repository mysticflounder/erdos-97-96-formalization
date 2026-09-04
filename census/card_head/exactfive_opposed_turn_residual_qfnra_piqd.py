"""Governed full source-ledger QF_NRA replay for the six residual cells.

This lane consumes only authenticated order-mine records.  It retains the
quotient classes, all row equalities, the radius replacement, source strict
comparison, and every signed area for the authenticated cyclic order.  It is
a formula-scope experiment; its claims never include source reachability or a
Lean theorem.
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
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import exactfive_hard_source_swap_order_piqd as frozen
from census.card_head import (
    exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd as geometry,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-opposed-turn-residual-qfnra-20260903"
RUN_ID = "run-0005"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-opposed-turn-residual-qfnra-v1.md"
TEST_PATH = REPOSITORY_ROOT / "census/card_head/tests/test_exactfive_opposed_turn_residual_qfnra_piqd.py"
QUARANTINE_ROOTS = tuple(
    REPOSITORY_ROOT
    / "scratch/runs/exactfive-opposed-turn-residual-qfnra-20260903/quarantine"
    / f"run-{index:04d}-initialized-20260903"
    for index in (1, 2, 3, 4)
)
QUARANTINE_MANIFEST_PATHS = tuple(root / "run_manifest.json" for root in QUARANTINE_ROOTS)
QUARANTINE_RECEIPT_PATHS = tuple(root / "quarantine-receipt.json" for root in QUARANTINE_ROOTS)
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_opposed_turn_residual_qfnra.py"
PARENT_ROOT = REPOSITORY_ROOT / "scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001"
MINE_ROOT = REPOSITORY_ROOT / "scratch/runs/exactfive-opposed-turn-profile-mine-20260903/run-0002"
PARENT_MANIFEST_SHA256 = "81e3b3c6bcddef75fbc8a2d22eda9787f6f6db5c394aca2de68b689a91d86299"
PARENT_LAUNCH_SHA256 = "142ce963789fca3efb419c4be21495cdbdb5195677a32cc9f736201a027b0494"
PARENT_TERMINAL_SHA256 = "6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2"
MINE_MANIFEST_SHA256 = "0c0980d5283970de8a1b008ad57345bc17f6a11cf05a2b7b46b2eab1e6680497"
MINE_LAUNCH_SHA256 = "9c6226dcf01c5ae8702197721a1d9b9f900a73f8c3b67800427baffaba4c5bfa"
MINE_TERMINAL_SHA256 = "9ddbd9e8eed66f3bce9ba3f8d66d74f2afbef9428c14f0c350b8ab837a37c2c7"
PROFILE_HASHES = {
    360: "0a9fc9a6735662b36b913afc263e4bf9f82fe72cdcf9ef5aefaa04c4499fb3d5",
    363: "cb54777844e4347a71c46eaa0d3c2c12fe4ae1d1bbd3377d7858f5eb0fcb383a",
    376: "5747f57595b4216e74c11f3dedac681a90963b1de89a6b97ac0681aed8d96c82",
    467: "013bb6902fc1da0fe0fddca071e50db8a70cf1dfea965344566b379f34a54c81",
    470: "10ca2e5bcc3217259e5178fe8b20d6cb470095677eb1c8f9f5e79fd0d4551fe8",
    483: "919f510ab2ac968a2cebe33541b83a5730889433f35b02207715b514fc9f4175",
}
MINE_RECORD_SHA256 = {
    360: "340075b1aaf9e4c1e17e3c67f620defec9d1099c3398f94c822756da3f1da6a2",
    363: "471927c42fdd8c729df12b2bc7e8d410b93c6720d2856dfe8468625d35df773f",
    376: "9e31b9d4e0ecd58545850f74b883d3c4f0b9368e810aa31191fc8acfe23ecd51",
    467: "6735d4e2a62ace24c444e1764a983af1683e78829ec020b062d962d74c816766",
    470: "718abe6cd05258e2d4b3bb0a01ef401c2d8430d61d4248ac04cd7b5544c8ac18",
    483: "53433e68c65a579721c3e7a43510fc3ccc2a1d028f8e5de8406e10efd0bf74e5",
}
ORDERS = {
    360: ("c000","c006","c004","c005","c003","c007","c001","c011","c002","c010","c009","c008"),
    467: ("c000","c006","c004","c005","c003","c007","c001","c011","c002","c010","c009","c008"),
    363: ("c000","c004","c007","c005","c003","c006","c010","c001","c012","c002","c011","c009","c008"),
    376: ("c000","c004","c007","c005","c003","c006","c010","c001","c012","c002","c011","c009","c008"),
    470: ("c000","c004","c007","c005","c003","c006","c010","c001","c012","c002","c011","c009","c008"),
    483: ("c000","c004","c007","c005","c003","c006","c010","c001","c012","c002","c011","c009","c008"),
}
PROFILE_INDICES = tuple(PROFILE_HASHES)
SYSTEM_SCHEMA = "p97-exactfive-opposed-turn-residual-qfnra-system/v1"
QUERY_SCHEMA = "p97-exactfive-opposed-turn-residual-qfnra/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = QUERY_SCHEMA + "-launch"
TERMINAL_SCHEMA = QUERY_SCHEMA + "-terminal"
FAILURE_SCHEMA = QUERY_SCHEMA + "-failure"
FALSE_CLAIMS = {"formula_scope_only": True, "source_realization": False, "theorem": False, "promotion": False, "live_closure": False}
ADAPTER_RESULT_KEYS = frozenset(
    {"schema", "source_manifest_sha256", "custody", "engines", "overall_status", "claims"}
)
ADAPTER_ENGINE_KEYS = frozenset(
    {
        "solver", "session_id", "solver_signature", "solver_sha256", "raw_status",
        "effective_status", "solve_index", "result_sha256", "response_lost",
        "reconciled_from_receipt", "reconciliation_attempts", "result_digest_advisory",
        "unsat_assumptions", "semantic_replay", "artifacts", "claims",
    }
)
ROWS = frozen.ROWS
MAX_WORKERS = 20
MAX_TIMEOUT_S = 3_600.0
_TOMBSTONE = re.compile(r"\.piqd-smt-tombstone-[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}\Z")
QUERY_KEYS = ("control-positive", "control-negative", *(f"profile-{index:04d}" for index in PROFILE_INDICES))

Poly = geometry.Poly
_p_const, _p_var, _p_add = geometry._p_const, geometry._p_var, geometry._p_add
_p_neg, _p_sub, _p_mul = geometry._p_neg, geometry._p_sub, geometry._p_mul
_poly_json, _poly_smt = geometry._poly_json, geometry._poly_smt
_area_poly, _sqdist_poly = geometry._area_poly, geometry._sqdist_poly


class ResidualQfnraError(RuntimeError):
    """The governed residual experiment failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":")).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({k: v for k, v in value.items() if k != field}))


def _read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    info = path.lstat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise ResidualQfnraError(f"unsafe or missing regular file: {path}")
    data = path.read_bytes()
    if len(data) != info.st_size:
        raise ResidualQfnraError(f"file changed while reading: {path}")
    return data


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    value = adapter._strict_json(payload, where)
    if type(value) is not dict:
        raise ResidualQfnraError(f"{where} is not an object")
    return value


def _profile(index: int) -> tuple[Any, dict[str, Any]]:
    rows = frozen.indexed_profiles()
    actual, profile = rows[index]
    if actual != index or profile.profile_id != PROFILE_HASHES[index]:
        raise ResidualQfnraError(f"profile {index} identity drifted")
    source = frozen.build_profile_system(index, profile)
    return profile, source


def authenticate_inputs() -> dict[str, Any]:
    """Check both completed predecessor manifests and all six mine cells."""
    parent_m = _strict(_read(PARENT_ROOT / "run_manifest.json"), "parent manifest")
    parent_l = _strict(_read(PARENT_ROOT / "events/launch.json"), "parent launch")
    parent_t = _strict(_read(PARENT_ROOT / "events/terminal.json"), "parent terminal")
    mine_m = _strict(_read(MINE_ROOT / "run_manifest.json"), "mine manifest")
    mine_l = _strict(_read(MINE_ROOT / "events/launch.json"), "mine launch")
    mine_t = _strict(_read(MINE_ROOT / "events/terminal.json"), "mine terminal")
    if (parent_m.get("manifest_sha256") != PARENT_MANIFEST_SHA256 or _self_hash(parent_m, "manifest_sha256") != PARENT_MANIFEST_SHA256
        or parent_l.get("launch_sha256") != PARENT_LAUNCH_SHA256 or parent_t.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or _self_hash(parent_l, "launch_sha256") != PARENT_LAUNCH_SHA256
        or _self_hash(parent_t, "terminal_sha256") != PARENT_TERMINAL_SHA256
        or mine_m.get("manifest_sha256") != MINE_MANIFEST_SHA256 or _self_hash(mine_m, "manifest_sha256") != MINE_MANIFEST_SHA256 or mine_l.get("launch_sha256") != MINE_LAUNCH_SHA256
        or _self_hash(mine_l, "launch_sha256") != MINE_LAUNCH_SHA256 or mine_t.get("terminal_sha256") != MINE_TERMINAL_SHA256
        or _self_hash(mine_t, "terminal_sha256") != MINE_TERMINAL_SHA256):
        raise ResidualQfnraError("predecessor custody digest drifted")
    profile_records = parent_t.get("profiles")
    if type(profile_records) is not list or len(profile_records) != 2798:
        raise ResidualQfnraError("parent is not the authenticated 2798-profile run")
    mine_records = mine_t.get("profile_records")
    if type(mine_records) is not list or len(mine_records) != 2798:
        raise ResidualQfnraError("deterministic mine profile inventory drifted")
    cells: dict[str, Any] = {}
    for index in PROFILE_INDICES:
        profile, source = _profile(index)
        key = f"profile-{index:04d}-{profile.profile_id[:20]}"
        parent_row = next((row for row in profile_records if row.get("key") == key), None)
        if not isinstance(parent_row, dict):
            raise ResidualQfnraError(f"parent profile missing: {key}")
        mine_row = next((row for row in mine_records if row.get("profile_index") == index or row.get("key") == key), None)
        if not isinstance(mine_row, dict):
            raise ResidualQfnraError(f"mine profile missing: {key}")
        mine_path = next(MINE_ROOT.glob(f"artifacts/profiles/profile-{index:04d}-*.json"), None)
        if mine_path is None or _sha(_read(mine_path)) != MINE_RECORD_SHA256[index]: raise ResidualQfnraError(f"mine record custody drifted: {key}")
        mine_payload = _strict(_read(mine_path), "mine profile record")
        if (mine_payload.get("profile_key") != key or mine_payload.get("profile_sha256") != profile.profile_id
            or mine_payload.get("record_sha256") != _self_hash(mine_payload, "record_sha256")
            or mine_payload.get("residual") is not True): raise ResidualQfnraError(f"mine residual record is not authenticated: {key}")
        mine_z3 = next((cell for cell in mine_payload.get("engine_cells", []) if cell.get("solver") == "z3"), None)
        if not isinstance(mine_z3, dict) or mine_z3.get("raw_status") != "SAT" or mine_z3.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED" or mine_z3.get("opposed_turn", {}).get("matched") is not False: raise ResidualQfnraError(f"mine Z3 cell is not the selected nonmatching residual: {key}")
        parent_profile_root = PARENT_ROOT / "artifacts/profiles" / key
        parent_prepared = frozen.prepare_profile_query(index, timeout_ms=60_000)
        try: frozen.verify_terminal_directory(parent_profile_root, parent_prepared)
        except Exception as exc: raise ResidualQfnraError(f"parent profile replay failed: {key}") from exc
        parent_result = _strict(_read(parent_profile_root / "result.json"), "parent profile result")
        if _sha(_read(parent_profile_root / "result.json")) != parent_row.get("result_sha256") or parent_result.get("source_manifest_sha256") != _sha(_read(parent_profile_root / "source-manifest.json")):
            raise ResidualQfnraError(f"parent profile custody link drifted: {key}")
        z3 = next((engine for engine in parent_result.get("engines", []) if engine.get("solver") == "z3"), None)
        replay = z3.get("semantic_replay", {}).get("evidence", {}) if isinstance(z3, dict) else {}
        exact_order = tuple(sorted(replay.get("ranks", {}), key=replay.get("ranks", {}).get)) if isinstance(replay.get("ranks"), dict) else ()
        if exact_order != ORDERS[index] or z3.get("raw_status") != "SAT" or z3.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED": raise ResidualQfnraError(f"parent Z3 residual order drifted: {key}")
        cells[str(index)] = {"key": key, "profile_sha256": profile.profile_id, "order": list(ORDERS[index]),
            "parent_result_sha256": parent_row.get("result_sha256"), "parent_source_manifest_sha256": parent_result.get("source_manifest_sha256"), "mine_record_sha256": MINE_RECORD_SHA256[index], "mine_record": mine_payload,
            "classes": source["classes"], "role_class": source["role_class"]}
    return {"schema": "p97-exactfive-opposed-turn-residual-inputs/v1", "parent_manifest_sha256": PARENT_MANIFEST_SHA256,
            "parent_launch_sha256": PARENT_LAUNCH_SHA256, "parent_terminal_sha256": PARENT_TERMINAL_SHA256,
            "mine_manifest_sha256": MINE_MANIFEST_SHA256, "mine_launch_sha256": MINE_LAUNCH_SHA256,
            "mine_terminal_sha256": MINE_TERMINAL_SHA256, "profiles": cells}


def _coords(system: Mapping[str, Any]) -> dict[str, tuple[Poly, Poly]]:
    role = system["role_class"]
    fixed = {role["c1"]: (_p_const(0), _p_const(0)), role["O"]: (_p_const(1), _p_const(0)),
             role["a"]: (_p_const(Fraction(1, 2)), _p_neg(_p_var("r"))),
             role["c2"]: (_p_const(Fraction(3, 2)), _p_neg(_p_var("r")))}
    ids = tuple(item["id"] for item in system["classes"])
    if len(fixed) != 4 or len(set(ids)) != len(ids):
        raise ResidualQfnraError("source roles are not distinct")
    return {**fixed, **{cid: (_p_var(f"x_{cid}"), _p_var(f"y_{cid}")) for cid in ids if cid not in fixed}}


def _ledger(system: Mapping[str, Any], order: Sequence[str]) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    coords = _coords(system)
    role = system["role_class"]
    rows: list[dict[str, Any]] = []
    for row in ROWS:
        center, first = role[row["center"]], role[row["support"][0]]
        for support in row["support"][1:]:
            other = role[support]
            poly = _p_sub(_sqdist_poly(coords, center, first), _sqdist_poly(coords, center, other))
            rows.append({"id": f"row-{row['id']}-{support}", "row_id": row["id"], "polynomial": _poly_json(poly), "smt": _poly_smt(poly)})
    areas = []
    for triple in itertools.combinations(order, 3):
        poly = _area_poly(coords, *triple)
        areas.append({"id": "area-" + "-".join(triple), "triple": list(triple), "polynomial": _poly_json(poly), "smt": _poly_smt(poly)})
    if len(rows) != 13 or len(areas) != math.comb(len(order), 3):
        raise ResidualQfnraError("formula ledger count drifted")
    return rows, areas


def build_system(index: int) -> dict[str, Any]:
    _, source = _profile(index)
    order = ORDERS[index]
    role = source["role_class"]
    class_ids = {entry["id"] for entry in source["classes"]}
    if set(order) != class_ids or len(order) != len(class_ids): raise ResidualQfnraError("authenticated order is not a class permutation")
    if not (order.index(role["c2"]) < order.index(role["O"]) < order.index(role["c1"])): raise ResidualQfnraError("B=c1 gauge orientation drifted")
    if len({role[name] for name in ("c1", "O", "a", "c2")}) != 4: raise ResidualQfnraError("gauge roles are not distinct")
    rows, areas = _ledger(source, order)
    coords = _coords(source)
    variables = ["r"] + [axis + "_" + cid for cid in sorted(coords) for axis in ("x", "y") if cid not in {source["role_class"][x] for x in ("c1", "O", "a", "c2")}]
    radius = _p_sub(_sqdist_poly(coords, source["role_class"]["c2"], source["role_class"]["O"]), _sqdist_poly(coords, source["role_class"]["c2"], source["role_class"]["d"]))
    strict = _p_sub(_sqdist_poly(coords, source["role_class"]["e"], source["role_class"]["d"]), _sqdist_poly(coords, source["role_class"]["e"], source["role_class"]["a"]))
    return {"schema": SYSTEM_SCHEMA, "kind": "target", "profile_index": index, "profile_sha256": source["profile_sha256"],
        "classes": source["classes"], "role_class": source["role_class"], "rows": [{"id": row["id"], "center": row["center"], "support": list(row["support"])} for row in ROWS], "order": list(order), "variables": variables,
        "gauge": {"B": source["role_class"]["c1"], "B_xy": ["0", "0"], "O": source["role_class"]["O"], "O_xy": ["1", "0"], "sigma": -1},
        "normalization": {"equation": "4*r^2=3", "positive": True}, "row_equality_ledger": rows, "area_ledger": areas,
        "radius_disequality": {"center": source["role_class"]["c2"], "old": source["role_class"]["O"], "replacement": source["role_class"]["d"], "polynomial": _poly_json(radius), "smt": _poly_smt(radius)},
        "source_strict": {"positive": [source["role_class"]["e"], source["role_class"]["a"]], "negative": [source["role_class"]["e"], source["role_class"]["d"]], "polynomial": _poly_json(strict), "smt": _poly_smt(strict)},
        "claims": dict(FALSE_CLAIMS)}


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if system.get("kind") == "control":
        out = ["(set-logic QF_NRA)"] + [f"(declare-fun {v} () Real)" for v in system["variables"]]
        out += [f"(assert (= {v} {system['pins'][v]}))" for v in system["variables"]]
        out += [f"(assert (> {a['smt']} 0))" for a in system["area_ledger"]]
        return tuple(out)
    if system.get("kind") != "target": raise ResidualQfnraError("unknown QF_NRA system kind")
    out = ["(set-logic QF_NRA)"] + [f"(declare-fun {v} () Real)" for v in system["variables"]]
    out += ["(assert (= (+ (* 4 r r) (- 3)) 0))", "(assert (> r 0))"]
    out += [f"(assert (> {a['smt']} 0))" for a in system["area_ledger"]]
    out += [f"(assert (= {a['smt']} 0))" for a in system["row_equality_ledger"]]
    out += [f"(assert (not (= {system['radius_disequality']['smt']} 0)))", f"(assert (< {system['source_strict']['smt']} 0))"]
    return tuple(out)


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    if system["kind"] == "control":
        return {"classes": 4, "variables": 8, "strict_signed_area_assertions": 4, "row_equality_assertions": 0, "control_assertions": 8}
    return {"classes": len(system["classes"]), "variables": len(system["variables"]), "strict_signed_area_assertions": len(system["area_ledger"]),
            "row_equality_assertions": len(system["row_equality_ledger"]), "normalization_assertions": 2, "radius_disequality_assertions": 1, "source_strict_assertions": 1,
            "total_named_atoms": 0}


def _source_paths() -> list[Path]:
    return [
        CHECKPOINT_PATH,
        Path(__file__),
        TEST_PATH,
        SPEC_PATH,
        RUNNER_PATH,
        Path(frozen.__file__),
        Path(geometry.__file__),
        Path(adapter.__file__),
        *QUARANTINE_MANIFEST_PATHS,
        *QUARANTINE_RECEIPT_PATHS,
    ]


def _input_paths() -> list[Path]:
    paths = [
        PARENT_ROOT / "run_manifest.json",
        PARENT_ROOT / "events/launch.json",
        PARENT_ROOT / "events/terminal.json",
        MINE_ROOT / "run_manifest.json",
        MINE_ROOT / "events/launch.json",
        MINE_ROOT / "events/terminal.json",
    ]
    paths += [MINE_ROOT / f"artifacts/profiles/profile-{index:04d}-{PROFILE_HASHES[index][:20]}.json" for index in PROFILE_INDICES]
    paths += [PARENT_ROOT / f"artifacts/profiles/profile-{index:04d}-{PROFILE_HASHES[index][:20]}" / name for index in PROFILE_INDICES for name in ("result.json", "source-manifest.json")]
    return paths


def _snapshots(inputs: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    paths = [*_source_paths(), *_input_paths()]
    if (RUN_ROOT / "run_manifest.json").exists():
        paths.append(RUN_ROOT / "run_manifest.json")
    record = adapter.SourceSnapshot("authenticated-inputs.json", _json(inputs))
    return tuple(sorted((record,) + tuple(adapter.SourceSnapshot(str(p.relative_to(REPOSITORY_ROOT)), _read(p)) for p in paths), key=lambda x: x.path))


def build_control_system(control: str) -> dict[str, Any]:
    if control not in {"positive", "negative"}: raise ResidualQfnraError("unknown control")
    points = {"c000": (0, 0), "c001": (1, 0), "c002": (1, 1 if control == "positive" else -1), "c003": (0, 1 if control == "positive" else -1)}
    coords = {cid: (_p_var(f"x_{cid}"), _p_var(f"y_{cid}")) for cid in points}
    areas = [{"id": "control-area-" + "-".join(triple), "triple": list(triple), "polynomial": _poly_json(_area_poly(coords, *triple)), "smt": _poly_smt(_area_poly(coords, *triple))} for triple in itertools.combinations(points, 3)]
    variables = [axis + "_" + cid for cid in sorted(points) for axis in ("x", "y")]
    return {"schema": SYSTEM_SCHEMA, "kind": "control", "control": control, "variables": variables, "pins": {f"{axis}_{cid}": str(value) for cid, (x, y) in points.items() for axis, value in (("x", x), ("y", y))}, "area_ledger": areas, "claims": dict(FALSE_CLAIMS)}


def _prepare_system(key: str, system: dict[str, Any], timeout_ms: int = 60_000) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= int(MAX_TIMEOUT_S * 1000)
    ):
        raise ResidualQfnraError("query timeout is invalid")
    inputs = authenticate_inputs()
    commands = build_smt_commands(system)
    journal = b"".join(c.encode("ascii") + b"\n" for c in commands)
    if adapter.normalize_state_journal(journal) != (commands, journal):
        raise ResidualQfnraError("journal normalization drifted")
    variables = [{"id": v.replace("_", "-"), "term": v, "sort": "Real"} for v in system["variables"]]
    variables.sort(key=lambda x: x["id"])
    # State-only PIQD journals do not expose assertions as solver assumptions.
    # The complete assertion ledger remains in semantic_input.
    atoms: list[dict[str, str]] = []
    semantic = {"schema": SYSTEM_SCHEMA, "inputs": inputs, "system": system, "formula_inventory": formula_inventory(system), "system_sha256": _sha(_canonical(system)), "claims": dict(FALSE_CLAIMS)}
    sources = _snapshots(inputs)
    descriptor = {"schema": adapter.QUERY_SCHEMA, "producer": {"id": "p97-exactfive-opposed-turn-residual-qfnra", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-source-ledger-coordinate-replay", "version": "v1"}, "stage_id": LANE_ID, "query_id": key,
        "sources": [{"path": s.path, "bytes": len(s.payload), "sha256": _sha(s.payload)} for s in sources], "semantic_input": semantic, "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)}, "variables": variables, "named_atoms": atoms,
        "solve": {"assumption_ids": [], "readback_variable_ids": [v["id"] for v in variables], "include_model": True},
        "solver_profile": {"schema": adapter.SOLVER_PROFILE_SCHEMA, "solvers": list(adapter.SOLVERS), "timeout_ms": timeout_ms}}
    return PreparedQuery(key, system, adapter.SourceSemanticQuery(descriptor, _json(descriptor), journal, commands, journal, sources))


def prepare_query(index: int, timeout_ms: int = 60_000) -> PreparedQuery:
    return _prepare_system(f"profile-{index:04d}", build_system(index), timeout_ms)


def prepare_control_query(control: str, timeout_ms: int = 60_000) -> PreparedQuery:
    return _prepare_system(f"control-{control}", build_control_system(control), timeout_ms)


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver not in adapter.SOLVERS or type(model) is not str or type(values) is not str:
        raise ResidualQfnraError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise ResidualQfnraError("semantic input is malformed")
    system = semantic.get("system")
    if type(system) is not dict:
        raise ResidualQfnraError("semantic system is malformed")
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected_system = (
        build_control_system(system.get("control"))
        if system.get("kind") == "control"
        else build_system(system.get("profile_index"))
    )
    expected = _prepare_system(query.descriptor.get("query_id"), expected_system, timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or query.source_files != expected.source_files
        or semantic.get("system_sha256") != _sha(_canonical(expected_system))
        or semantic.get("formula_inventory") != formula_inventory(expected_system)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise ResidualQfnraError("descriptor, source ledger, or journal drifted")
    try:
        parsed = geometry.parse_exact_values(values, query.get_values)
        if system["kind"] == "control":
            accepted = all(parsed[v] == Fraction(value) for v, value in system["pins"].items()) and all(_eval_poly(a["polynomial"], parsed) > 0 for a in system["area_ledger"])
            return adapter.SemanticVerification(bool(accepted), {"accepted": bool(accepted), "control": system["control"], "exact_rational_readback": True})
        if system != expected_system:
            raise ResidualQfnraError("semantic system drifted from source ledger")
        if query.descriptor["semantic_input"].get("system_sha256") != _sha(_canonical(system)):
            raise ResidualQfnraError("semantic system digest drifted")
        r = parsed["r"]
        coords = _expand(system, parsed)
        scalar_values = dict(parsed)
        for cid, (x, y) in coords.items(): scalar_values[f"x_{cid}"], scalar_values[f"y_{cid}"] = x, y
        accepted = r > 0 and 4*r*r == 3 and all(_signed_area(coords, *a["triple"]) > 0 for a in system["area_ledger"])
        for row in system["row_equality_ledger"]:
            accepted = accepted and _eval_poly(row["polynomial"], scalar_values) == 0
        accepted = accepted and _eval_poly(system["radius_disequality"]["polynomial"], scalar_values) != 0 and _eval_poly(system["source_strict"]["polynomial"], scalar_values) < 0
    except (ResidualQfnraError, geometry.Profile282BoQfnraError, ValueError, KeyError, IndexError, TypeError) as exc:
        return adapter.SemanticVerification(False, {"accepted": False, "reason": "exact replay failed", "error": type(exc).__name__})
    return adapter.SemanticVerification(bool(accepted), {"accepted": bool(accepted), "solver": solver, "exact_rational_readback": True, "profile_index": system["profile_index"], "formula_inventory": formula_inventory(system), "values_sha256": _sha(values.encode())})


def _expand(system: Mapping[str, Any], values: Mapping[str, Fraction]) -> dict[str, tuple[Fraction, Fraction]]:
    role = system["role_class"]
    result = {role["c1"]: (Fraction(0), Fraction(0)), role["O"]: (Fraction(1), Fraction(0)), role["a"]: (Fraction(1,2), -values["r"]), role["c2"]: (Fraction(3,2), -values["r"])}
    for cid in (x["id"] for x in system["classes"]):
        if cid not in result: result[cid] = (values[f"x_{cid}"], values[f"y_{cid}"])
    return result


def _eval_poly(encoded: object, values: Mapping[str, Fraction]) -> Fraction:
    if not isinstance(encoded, list): raise ResidualQfnraError("polynomial ledger is malformed")
    total = Fraction(0)
    for term in encoded:
        if not isinstance(term, dict) or not isinstance(term.get("monomial"), list): raise ResidualQfnraError("polynomial term is malformed")
        coeff = Fraction(*term["coefficient"])
        value = coeff
        for name in term["monomial"]: value *= values[name]
        total += value
    return total


def _signed_area(coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str, c: str) -> Fraction:
    ax, ay = coords[a]; bx, by = coords[b]; cx, cy = coords[c]
    return (bx-ax)*(cy-ay) - (by-ay)*(cx-ax)


def _repo_path(path: Path) -> str:
    return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()


def _source_map(paths: Sequence[Path]) -> dict[str, str]: return {_repo_path(p): _sha(_read(p)) for p in sorted(paths)}


def _checkpoint() -> dict[str, Any]:
    value = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    expected_owned = [".codex/worktree-checkpoints/exactfive-opposed-turn-residual-qfnra-20260903.json", "census/card_head/exactfive_opposed_turn_residual_qfnra_piqd.py", "census/card_head/tests/test_exactfive_opposed_turn_residual_qfnra_piqd.py", "docs/specs/p97-exactfive-opposed-turn-residual-qfnra-v1.md", "scripts/run_exactfive_opposed_turn_residual_qfnra.py"]
    expected_durable = sorted(
        str(path.relative_to(REPOSITORY_ROOT))
        for path in (*QUARANTINE_MANIFEST_PATHS, *QUARANTINE_RECEIPT_PATHS)
    )
    if (
        value.get("schema") != "worktree-lane-checkpoint/v1"
        or value.get("lane_id") != LANE_ID
        or value.get("owned_paths") != expected_owned
        or value.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or value.get("durable_paths") != expected_durable
        or value.get("manifest_sha256") != _self_hash(value, "manifest_sha256")
    ):
        raise ResidualQfnraError("lane checkpoint drifted")
    return value


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _checkpoint()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_map(_source_paths()),
        "input_digests": _source_map(_input_paths()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _checkpoint()
    cursor = RUN_ROOT
    ancestors: list[Path] = []
    while cursor != REPOSITORY_ROOT:
        ancestors.append(cursor)
        if cursor.parent == cursor or not cursor.is_relative_to(REPOSITORY_ROOT): raise ResidualQfnraError("run root escaped repository")
        cursor = cursor.parent
    for ancestor in reversed(ancestors):
        if ancestor.exists() and (ancestor.is_symlink() or not ancestor.is_dir()): raise ResidualQfnraError("run-root ancestor is unsafe")
    if RUN_ROOT.is_symlink(): raise ResidualQfnraError("run root is a symlink")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name; child.mkdir(exist_ok=True)
        if child.is_symlink() or not child.is_dir(): raise ResidualQfnraError("unsafe run-root child")
    allowed = {"run_manifest.json", "artifacts", "events", "tmp"}
    if {entry.name for entry in RUN_ROOT.iterdir()} - allowed:
        raise ResidualQfnraError("unexpected run-root entry")
    path = RUN_ROOT / "run_manifest.json"
    if path.exists():
        manifest = _strict(_read(path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_run_manifest(created):
            raise ResidualQfnraError("run manifest source or input digest drifted")
    else:
        created = datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        manifest = _expected_run_manifest(created)
        _publish_once(path, _json(manifest))
    return RUN_ROOT, manifest


def _publish_once(path: Path, payload: bytes) -> None:
    if path.name in {"", ".", ".."}:
        raise ResidualQfnraError("unsafe publication path")
    parent_flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    parent_fd = os.open(path.parent, parent_flags)
    fd: int | None = None
    created_identity: tuple[int, int] | None = None

    def remove_created_inode() -> None:
        nonlocal created_identity
        if created_identity is None and fd is not None:
            try:
                held = os.fstat(fd)
            except OSError:
                return
            created_identity = (held.st_dev, held.st_ino)
        if created_identity is None:
            return
        matches: list[str] = []
        for name in os.listdir(parent_fd):
            try:
                current = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
            except FileNotFoundError:
                continue
            if (current.st_dev, current.st_ino) == created_identity:
                if not stat.S_ISREG(current.st_mode) or current.st_nlink != 1:
                    return
                matches.append(name)
        if len(matches) != 1:
            return
        current = os.stat(matches[0], dir_fd=parent_fd, follow_symlinks=False)
        if (
            (current.st_dev, current.st_ino) != created_identity
            or not stat.S_ISREG(current.st_mode)
            or current.st_nlink != 1
        ):
            return
        os.unlink(matches[0], dir_fd=parent_fd)
        os.fsync(parent_fd)

    try:
        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
        fd = os.open(path.name, flags, 0o600, dir_fd=parent_fd)
        initial = os.fstat(fd)
        created_identity = (initial.st_dev, initial.st_ino)
        if (
            not stat.S_ISREG(initial.st_mode)
            or initial.st_nlink != 1
            or stat.S_IMODE(initial.st_mode) != 0o600
        ):
            raise ResidualQfnraError(f"initial publication identity failed: {path}")
        view = memoryview(payload)
        while view:
            written = os.write(fd, view)
            if written <= 0:
                raise ResidualQfnraError(f"partial publication stalled: {path}")
            view = view[written:]
        os.fsync(fd)
        info = os.fstat(fd)
        if (
            not stat.S_ISREG(info.st_mode)
            or (info.st_dev, info.st_ino) != created_identity
            or info.st_nlink != 1
            or info.st_size != len(payload)
            or stat.S_IMODE(info.st_mode) != 0o600
        ):
            raise ResidualQfnraError(f"open publication identity failed: {path}")
        rebound = os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        if (
            not stat.S_ISREG(rebound.st_mode)
            or (rebound.st_dev, rebound.st_ino) != created_identity
            or rebound.st_nlink != 1
            or rebound.st_size != len(payload)
            or stat.S_IMODE(rebound.st_mode) != 0o600
        ):
            raise ResidualQfnraError(f"publication path identity failed: {path}")
        os.fsync(parent_fd)
        if _read(path) != payload:
            raise ResidualQfnraError(f"publication reread failed: {path}")
    except BaseException as exc:
        try:
            remove_created_inode()
        except OSError as cleanup_exc:
            exc.add_note(f"identity-bound publication cleanup failed: {cleanup_exc}")
        raise
    finally:
        if fd is not None:
            os.close(fd)
        os.close(parent_fd)


def _flat_directory_snapshot(path: Path, *, allow_empty: bool = False) -> list[dict[str, Any]]:
    if path.is_symlink() or not path.is_dir():
        raise ResidualQfnraError(f"unsafe runtime directory: {path}")
    records: list[dict[str, Any]] = []
    for entry in sorted(path.iterdir(), key=lambda item: item.name):
        info = entry.lstat()
        if entry.is_symlink() or not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise ResidualQfnraError(f"nested or unsafe runtime entry: {entry}")
        payload = _read(entry)
        records.append({"path": entry.name, "bytes": len(payload), "sha256": _sha(payload)})
    if not records and not allow_empty:
        raise ResidualQfnraError(f"runtime directory is unexpectedly empty: {path}")
    return records


def _runtime_snapshot(root: Path) -> dict[str, Any]:
    artifacts = root / "artifacts"
    tmp = root / "tmp"
    for branch in (artifacts, tmp):
        if branch.is_symlink() or not branch.is_dir():
            raise ResidualQfnraError(f"unsafe runtime branch: {branch}")
    if tuple(tmp.iterdir()):
        raise ResidualQfnraError("runtime tmp directory is not empty")
    records: dict[str, Any] = {}
    for entry in sorted(artifacts.iterdir(), key=lambda item: item.name):
        if entry.is_symlink() or not entry.is_dir():
            raise ResidualQfnraError(f"unsafe artifact entry: {entry}")
        if entry.name in QUERY_KEYS:
            files = _flat_directory_snapshot(entry)
            if "result.json" not in {record["path"] for record in files}:
                raise ResidualQfnraError(f"partial query output is not resumable: {entry.name}")
            records[entry.name] = {"kind": "query", "files": files}
        elif _TOMBSTONE.fullmatch(entry.name):
            files = _flat_directory_snapshot(entry, allow_empty=True)
            if files:
                raise ResidualQfnraError(f"adapter tombstone is not empty: {entry.name}")
            records[entry.name] = {"kind": "adapter-tombstone", "files": []}
        else:
            raise ResidualQfnraError(f"undeclared query artifact entry: {entry.name}")
    launch_path = root / "events" / "launch.json"
    return {
        "launch_sha256": _sha(_read(launch_path)) if launch_path.exists() else None,
        "artifacts": records,
        "tmp_entries": [],
    }


def _inventory(root: Path, prepared: Mapping[str, PreparedQuery] | None = None) -> str:
    if root.is_symlink() or not root.is_dir():
        raise ResidualQfnraError("runtime root is unsafe")
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise ResidualQfnraError("runtime root inventory drifted")
    _read(root / "run_manifest.json")
    events = root / "events"
    if events.is_symlink() or not events.is_dir():
        raise ResidualQfnraError("events directory is unsafe")
    event_names = {entry.name for entry in events.iterdir()}
    if event_names - {"launch.json", "terminal.json", "failure.json"}:
        raise ResidualQfnraError("undeclared event entry")
    for entry in events.iterdir():
        _read(entry)
    if "failure.json" in event_names and "terminal.json" in event_names:
        raise ResidualQfnraError("failure and terminal records coexist")
    snapshot = _runtime_snapshot(root)
    artifact_names = set(snapshot["artifacts"])
    tombstones = {name for name in artifact_names if name not in QUERY_KEYS}
    if prepared is not None:
        for key in sorted(artifact_names & set(QUERY_KEYS)):
            if key not in prepared:
                raise ResidualQfnraError(f"no prepared query for artifact: {key}")
            verify_adapter_tree(prepared[key], root / "artifacts" / key)
    if "terminal.json" in event_names:
        if event_names != {"launch.json", "terminal.json"} or artifact_names != set(QUERY_KEYS):
            raise ResidualQfnraError("terminal phase inventory drifted")
        return "TERMINAL"
    if "failure.json" in event_names:
        if event_names not in ({"failure.json"}, {"launch.json", "failure.json"}):
            raise ResidualQfnraError("failure phase inventory drifted")
        return "FAILURE"
    if tombstones:
        raise ResidualQfnraError("adapter tombstone lacks failure custody")
    if "launch.json" in event_names:
        if event_names != {"launch.json"}:
            raise ResidualQfnraError("launch phase inventory drifted")
        return "LAUNCHED"
    if event_names or artifact_names:
        raise ResidualQfnraError("initialized phase inventory drifted")
    return "INITIALIZED"


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}: raise ResidualQfnraError("result artifact record malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen: raise ResidualQfnraError("result artifact path unsafe")
    payload = _read(root / name)
    if type(record["bytes"]) is not int or record["bytes"] != len(payload) or type(record["sha256"]) is not str or record["sha256"] != _sha(payload): raise ResidualQfnraError(f"result artifact digest drifted: {name}")
    seen.add(name); return payload


def verify_adapter_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    """Revalidate the complete immutable adapter tree and exact SAT replay."""

    if output.is_symlink() or not output.is_dir():
        raise ResidualQfnraError("adapter output directory is unsafe")
    result = _strict(_read(output / "result.json"), "adapter result")
    if (
        set(result) != ADAPTER_RESULT_KEYS
        or result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise ResidualQfnraError("adapter result schema or claims drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {"descriptor", "original_smt2", "journal_smt2", "manifest", "sources"}:
        raise ResidualQfnraError("adapter custody is malformed")
    descriptor = _verify_artifact(output, custody["descriptor"], seen)
    original = _verify_artifact(output, custody["original_smt2"], seen)
    journal = _verify_artifact(output, custody["journal_smt2"], seen)
    manifest_payload = _verify_artifact(output, custody["manifest"], seen)
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
        or _strict(manifest_payload, "source manifest") != adapter._manifest(prepared.query)
    ):
        raise ResidualQfnraError("adapter query or manifest custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise ResidualQfnraError("adapter source custody count drifted")
    for record, expected in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output, record, seen) != expected.payload:
            raise ResidualQfnraError("adapter source snapshot differs")
    engines = result.get("engines")
    if type(engines) is not list or [row.get("solver") for row in engines if type(row) is dict] != list(adapter.SOLVERS):
        raise ResidualQfnraError("adapter engine inventory is malformed")
    session_ids: list[str] = []
    for engine in engines:
        if (
            type(engine) is not dict
            or set(engine) != ADAPTER_ENGINE_KEYS
            or engine.get("raw_status") not in {"SAT", "UNSAT", "UNKNOWN"}
        ):
            raise ResidualQfnraError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise ResidualQfnraError("adapter engine artifacts are malformed")
        try:
            frozen._validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise ResidualQfnraError("adapter artifact labels drifted") from exc
        payloads = {label: _verify_artifact(output, record, seen) for label, record in artifacts.items()}
        bridge = geometry.sibling.adaptive.PreparedQuery(prepared.key, "planar", prepared.system, None, prepared.query)
        try:
            custody_solve = geometry.sibling.adaptive._validate_engine_custody(bridge, engine, payloads)
        except Exception as exc:
            raise ResidualQfnraError("adapter engine custody failed") from exc
        solve_label = "reconciled_solve" if engine.get("response_lost") else "solve"
        solve = _strict(payloads[solve_label], f"{engine['solver']} solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            solve != custody_solve
            or solve.get("status") != engine["raw_status"]
            or solve.get("result_sha256") != digest
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise ResidualQfnraError("adapter solve digest is inconsistent")
        if type(engine.get("session_id")) is not str or type(engine.get("solver_sha256")) is not str or type(engine.get("solver_signature")) is not str:
            raise ResidualQfnraError("adapter solver identity is malformed")
        session_ids.append(engine["session_id"])
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if effective != "UNSAT_DISCOVERY_ONLY" or engine.get("semantic_replay") is not None:
                raise ResidualQfnraError("UNSAT custody classification drifted")
        elif raw == "UNKNOWN":
            if effective != "INCONCLUSIVE_UNKNOWN" or engine.get("semantic_replay") is not None:
                raise ResidualQfnraError("UNKNOWN custody classification drifted")
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if semantic_payload is None or _strict(semantic_payload, f"{engine['solver']} semantic") != semantic:
                raise ResidualQfnraError("SAT semantic artifact drifted")
            try:
                verification = verify_sat_model(prepared.query, engine["solver"], solve.get("model"), solve.get("values"))
            except Exception as exc:
                expected_semantic = {"accepted": False, "failure": type(exc).__name__, "verifier": prepared.query.descriptor["semantic_verifier"]}
                if effective != "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE" or semantic != expected_semantic:
                    raise ResidualQfnraError("SAT verifier-failure drifted") from exc
            else:
                expected_semantic = {
                    "accepted": verification.accepted,
                    "evidence": verification.evidence,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                    "model_sha256": _sha(solve["model"].encode("utf-8")),
                    "values_sha256": _sha(solve["values"].encode("utf-8")),
                }
                expected_effective = "SAT_SEMANTICALLY_REPLAYED" if verification.accepted else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
                if semantic != expected_semantic or effective != expected_effective:
                    raise ResidualQfnraError("SAT semantic replay drifted")
    if len(session_ids) != len(set(session_ids)):
        raise ResidualQfnraError("adapter reused a session identity")
    effective_statuses = [engine.get("effective_status") for engine in engines]
    raw_statuses = [engine.get("raw_status") for engine in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(type(status) is str and status.startswith("INCONCLUSIVE") for status in effective_statuses)
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise ResidualQfnraError("adapter overall status is inconsistent")
    entries = tuple(output.iterdir())
    if any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in entries) or {entry.name for entry in entries} != seen:
        raise ResidualQfnraError("adapter output contains unbound artifacts")
    return dict(result)


def run_query(prepared: PreparedQuery, output: Path, transport: adapter.PiqdTransport) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        return verify_adapter_tree(prepared, output)
    adapter.run_source_semantic_query(prepared.query, output, transport, verify_sat_model)
    return verify_adapter_tree(prepared, output)


def _read_failure(
    root: Path,
    manifest: Mapping[str, Any],
    prepared: Mapping[str, PreparedQuery] | None = None,
) -> dict[str, Any]:
    failure = _strict(_read(root / "events/failure.json"), "failure")
    if (
        set(failure) != {"schema", "lane_id", "run_id", "run_manifest_sha256", "error_type", "error", "retained", "claims", "failure_sha256"}
        or failure.get("schema") != FAILURE_SCHEMA
        or failure.get("lane_id") != LANE_ID
        or failure.get("run_id") != RUN_ID
        or failure.get("run_manifest_sha256") != manifest.get("manifest_sha256")
        or type(failure.get("error_type")) is not str
        or type(failure.get("error")) is not str
        or failure.get("claims") != FALSE_CLAIMS
        or failure.get("failure_sha256") != _self_hash(failure, "failure_sha256")
        or failure.get("retained") != _runtime_snapshot(root)
    ):
        raise ResidualQfnraError("existing failure custody drifted")
    if _inventory(root, prepared) != "FAILURE":
        raise ResidualQfnraError("failure phase drifted")
    return failure


def _write_failure(root: Path, manifest: Mapping[str, Any], error: BaseException | str) -> dict[str, Any]:
    terminal_path = root / "events/terminal.json"
    if os.path.lexists(terminal_path):
        raise ResidualQfnraError("terminal state cannot acquire a failure record")
    path = root / "events/failure.json"
    if path.exists() or path.is_symlink():
        return _read_failure(root, manifest)
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if event_names not in (set(), {"launch.json"}):
        raise ResidualQfnraError("failure publication found undeclared event state")
    message = error if type(error) is str else str(error)
    error_type = "str" if type(error) is str else type(error).__name__
    payload = {
        "schema": FAILURE_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest.get("manifest_sha256"),
        "error_type": error_type,
        "error": message,
        "retained": _runtime_snapshot(root),
        "claims": dict(FALSE_CLAIMS),
    }
    payload["failure_sha256"] = _self_hash(payload, "failure_sha256")
    _publish_once(path, _json(payload))
    return _read_failure(root, manifest)


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise ResidualQfnraError("invalid PIQD server URL")
    return server.rstrip("/")


def _launch_record(manifest: Mapping[str, Any], server: str, timeout_ms: int, workers: int) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
        "queries": list(QUERY_KEYS),
        "transport": "PIQD HTTP adapter only",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _result_record(root: Path, key: str, result: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "overall_status": result.get("overall_status"),
        "raw_statuses": [engine.get("raw_status") for engine in result.get("engines", [])],
        "effective_statuses": [engine.get("effective_status") for engine in result.get("engines", [])],
        "result_sha256": _sha(_read(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    raw = [engine.get("raw_status") for engine in result.get("engines", [])]
    if raw != [expected, expected]:
        raise ResidualQfnraError(f"{key} did not produce {expected}/{expected}")
    if expected == "SAT" and any(engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED" for engine in result["engines"]):
        raise ResidualQfnraError("positive control failed exact replay")


def _terminal_status(targets: Sequence[Mapping[str, Any]]) -> str:
    engines = [engine for target in targets for engine in target["engines"]]
    if any(engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED" for engine in engines):
        return "TARGET_SAT_REPLAYED"
    if engines and all(engine.get("raw_status") == "UNSAT" for engine in engines):
        return "TARGETS_UNSAT_DISCOVERY_ONLY"
    return "TARGET_INCONCLUSIVE"


def _terminal_record(root: Path, launch: Mapping[str, Any], results: Mapping[str, Mapping[str, Any]]) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS):
        raise ResidualQfnraError("terminal result inventory is incomplete")
    session_ids = [engine.get("session_id") for key in QUERY_KEYS for engine in results[key]["engines"]]
    if any(type(session_id) is not str for session_id in session_ids) or len(session_ids) != len(set(session_ids)):
        raise ResidualQfnraError("terminal results reuse a PIQD session")
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": _terminal_status([results[key] for key in QUERY_KEYS[2:]]),
        "results": {key: _result_record(root, key, results[key]) for key in QUERY_KEYS},
        "claim_boundary": "six authenticated residual fixed-order formulas only",
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict(_read(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("lane_id") != LANE_ID
        or terminal.get("run_id") != RUN_ID
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("status") not in {"TARGET_SAT_REPLAYED", "TARGETS_UNSAT_DISCOVERY_ONLY", "TARGET_INCONCLUSIVE"}
        or set(terminal.get("results", {})) != set(QUERY_KEYS)
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise ResidualQfnraError("terminal record is malformed")
    return terminal


def run_campaign(*, server: str = "http://127.0.0.1:7272", timeout_s: float = 60.0, workers: int = 2, init_only: bool = False) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= MAX_WORKERS:
        raise ResidualQfnraError("workers must lie in 1..20")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= MAX_TIMEOUT_S
        or not float(timeout_s * 1000).is_integer()
    ):
        raise ResidualQfnraError("timeout must be exact milliseconds in (0,3600]")
    root, manifest = ensure_run_root()
    authenticate_inputs()
    timeout_ms = int(timeout_s * 1000)
    prepared = {f"control-{control}": prepare_control_query(control, timeout_ms) for control in ("positive", "negative")}
    prepared.update({f"profile-{index:04d}": prepare_query(index, timeout_ms) for index in PROFILE_INDICES})
    phase = _inventory(root, prepared)
    if init_only:
        if phase != "INITIALIZED":
            raise ResidualQfnraError("init-only requires a pristine initialized root")
        return {"status": "INITIALIZED", "lane_id": LANE_ID, "run_manifest_sha256": manifest["manifest_sha256"], "profiles": list(PROFILE_INDICES)}
    server = _validate_server(server)
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events/launch.json"
    terminal_path = root / "events/terminal.json"
    failure_path = root / "events/failure.json"
    if terminal_path.exists() or terminal_path.is_symlink():
        if _strict(_read(launch_path), "launch") != launch:
            raise ResidualQfnraError("launch record differs on terminal replay")
        stored = _read_terminal(terminal_path)
        results = {key: verify_adapter_tree(prepared[key], root / "artifacts" / key) for key in QUERY_KEYS}
        for key in QUERY_KEYS[:2]:
            _require_control(key, results[key])
        expected = _terminal_record(root, launch, results)
        if stored != expected:
            raise ResidualQfnraError("terminal differs from artifact replay")
        if _inventory(root, prepared) != "TERMINAL":
            raise ResidualQfnraError("terminal inventory drifted")
        return stored
    if failure_path.exists() or failure_path.is_symlink():
        _read_failure(root, manifest, prepared)
        raise ResidualQfnraError("existing failure record blocks resume")
    try:
        if launch_path.exists() or launch_path.is_symlink():
            if _strict(_read(launch_path), "launch") != launch:
                raise ResidualQfnraError("launch record differs on resume")
        else:
            _publish_once(launch_path, _json(launch))
        if _inventory(root, prepared) != "LAUNCHED":
            raise ResidualQfnraError("launch inventory drifted")
        transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
        results: dict[str, dict[str, Any]] = {}
        for key in QUERY_KEYS[:2]:
            results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
            _require_control(key, results[key])

        def execute(key: str) -> tuple[str, dict[str, Any]]:
            return key, run_query(prepared[key], root / "artifacts" / key, transport)

        with concurrent.futures.ThreadPoolExecutor(max_workers=min(workers, len(QUERY_KEYS) - 2)) as pool:
            for key, result in pool.map(execute, QUERY_KEYS[2:]):
                results[key] = result
        terminal = _terminal_record(root, launch, results)
        _publish_once(terminal_path, _json(terminal))
        if _inventory(root, prepared) != "TERMINAL":
            raise ResidualQfnraError("terminal inventory drifted after publication")
        return terminal
    except Exception as exc:
        if not os.path.lexists(terminal_path):
            _write_failure(root, manifest, exc)
        raise


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False); parser.add_argument("--server", default="http://127.0.0.1:7272"); parser.add_argument("--timeout", type=float, default=60.0); parser.add_argument("--workers", type=int, default=2); parser.add_argument("--init-only", action="store_true"); parser.add_argument("--verbose", action="store_true"); args = parser.parse_args(argv)
    try: result = run_campaign(server=args.server, timeout_s=args.timeout, workers=args.workers, init_only=args.init_only)
    except Exception as exc:  # noqa: BLE001 -- ordinary failures get durable custody; BaseException remains interruptible
        try:
            manifest_path = RUN_ROOT / "run_manifest.json"
            terminal_path = RUN_ROOT / "events/terminal.json"
            if manifest_path.is_file() and not os.path.lexists(terminal_path):
                _write_failure(RUN_ROOT, _strict(_read(manifest_path), "run manifest"), exc)
        except (ResidualQfnraError, OSError, ValueError):
            pass
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose: print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = ["LANE_ID", "ORDERS", "PROFILE_HASHES", "PROFILE_INDICES", "RUN_ID", "build_smt_commands", "build_system", "ensure_run_root", "formula_inventory", "main", "prepare_query", "run_campaign", "run_query", "verify_adapter_tree"]
