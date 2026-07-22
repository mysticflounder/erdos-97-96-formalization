#!/usr/bin/env python3
"""Bounded fail-closed CEGAR for the two source-faithful n=11 profiles.

Each SAT projection is independently replayed before it is used.  The driver
then checks the complete source-proved U5 signed-schema catalog and, only when
that has no new match, the exact rational selected-row Kalmanson LRA oracle.
Every LRA refutation is independently replayed and supplied with an exact
rational Farkas certificate before its order schema enters the bank.

This is a discovery and coverage driver.  Neither finite-projection UNSAT nor
selected-row LRA SAT is claimed to close the Lean residual.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import shutil
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ENCODER = HERE / "exact_four_outer.py"
VERIFIER = HERE / "verify_exact_four_outer.py"
PLANAR_BANK = ROOT / "scratch/atail-force/whole-carrier-planar-rank-cegar/planar_schema_bank.json"
KALMANSON_BANK = HERE / "kalmanson_schema_bank.json"
PROPOSED_KERNEL_BANK = ROOT / "scratch/atail-force/unique4-kalmanson-core-port/kalmanson_schema_bank.proposed.json"
U5_BANK = HERE / "u5_signed_schema_bank.json"
U5_CATALOG = ROOT / "scratch/atail-force/general-n-u5-schema-coverage/schema_catalog.json"
U5_MATCHER = ROOT / "scratch/atail-force/general-n-u5-schema-coverage/match_catalog.py"
LRA_CHECKER = ROOT / "scratch/atail-force/generic-biapex-kalmanson-cnf/full_lra_fixed_check.py"
FARKAS_CHECKER = ROOT / "scratch/atail-force/generic-biapex-kalmanson-cnf/verify_farkas_core.py"


def digest_path(path: Path) -> str:
    hasher = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            hasher.update(chunk)
    return hasher.hexdigest()


def digest_json(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise RuntimeError(f"expected an object in {path}")
    return value


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def repo_relative(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(ROOT.resolve()))
    except ValueError:
        return str(path)


def run_checked(command: list[str], *, stdout_path: Path | None = None) -> None:
    started = time.monotonic()
    completed = subprocess.run(command, capture_output=True, text=True, check=False)
    if stdout_path is not None:
        stdout_path.parent.mkdir(parents=True, exist_ok=True)
        stdout_path.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    if completed.returncode != 0:
        tail = (completed.stdout + completed.stderr)[-4000:]
        raise RuntimeError(
            f"command failed after {time.monotonic() - started:.1f}s "
            f"with exit {completed.returncode}: {command!r}\n{tail}"
        )


def normalize_schema(k: int, raw: object) -> tuple[tuple[int, int], ...]:
    if not isinstance(raw, list):
        raise RuntimeError("order schema is not a list")
    direct = tuple(sorted((int(pair[0]), int(pair[1])) for pair in raw))
    reflected = tuple(sorted((k - 1 - center, k - 1 - point) for center, point in direct))
    if len(set(direct)) != len(direct):
        raise RuntimeError("order schema has duplicate atoms")
    if any(center == point or not (0 <= center < k and 0 <= point < k)
           for center, point in direct):
        raise RuntimeError("malformed order schema atom")
    return min(direct, reflected)


def schema_subsumes(
    existing_k: int,
    existing: tuple[tuple[int, int], ...],
    candidate_k: int,
    candidate: tuple[tuple[int, int], ...],
) -> bool:
    """Whether an existing order-schema cut already forbids the candidate."""
    if existing_k > candidate_k:
        return False
    candidate_atoms = set(candidate)
    orientations = {
        existing,
        tuple(sorted((existing_k - 1 - center, existing_k - 1 - point)
                     for center, point in existing)),
    }
    for targets in itertools.combinations(range(candidate_k), existing_k):
        for oriented in orientations:
            transported = {(targets[center], targets[point]) for center, point in oriented}
            if transported <= candidate_atoms:
                return True
    return False


def canonical_record(record: dict[str, Any], status: str) -> dict[str, Any]:
    k = int(record["core_vertex_count"])
    normalized = normalize_schema(k, record["order_schema"])
    answer = dict(record)
    answer["order_schema"] = [list(atom) for atom in normalized]
    answer["verification_status"] = status
    answer["transport"] = "order_preserving_and_reflected_injections"
    return answer


def merge_kernel_bank() -> dict[str, int]:
    """Prefer the kernel port, retaining only genuinely new pending schemas."""
    current = load_json(KALMANSON_BANK)
    proposed = load_json(PROPOSED_KERNEL_BANK)
    if proposed.get("schema") != "p97-exact-four-kalmanson-order-schema-bank-v1":
        raise RuntimeError("unexpected proposed Kalmanson bank schema")

    kernel_records: list[dict[str, Any]] = []
    kernel_keys: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    for raw in proposed["schemas"]:
        record = canonical_record(raw, "KERNEL_CHECKED")
        key = (int(record["core_vertex_count"]), tuple(map(tuple, record["order_schema"])))
        if key not in kernel_keys:
            kernel_keys.add(key)
            kernel_records.append(record)

    pending_candidates: list[dict[str, Any]] = []
    for raw in current["schemas"]:
        if raw.get("verification_status") == "KERNEL_CHECKED":
            continue
        record = canonical_record(raw, "EXACT_FARKAS_VERIFIED_PENDING_PORT")
        k = int(record["core_vertex_count"])
        schema = tuple(map(tuple, record["order_schema"]))
        if any(schema_subsumes(kk, ss, k, schema) for kk, ss in kernel_keys):
            continue
        pending_candidates.append(record)

    pending_candidates.sort(
        key=lambda record: (int(record["core_vertex_count"]), len(record["order_schema"]),
                            tuple(map(tuple, record["order_schema"])))
    )
    pending_records: list[dict[str, Any]] = []
    pending_keys: list[tuple[int, tuple[tuple[int, int], ...]]] = []
    for record in pending_candidates:
        k = int(record["core_vertex_count"])
        schema = tuple(map(tuple, record["order_schema"]))
        if any(schema_subsumes(kk, ss, k, schema) for kk, ss in pending_keys):
            continue
        pending_keys.append((k, schema))
        pending_records.append(record)

    records = kernel_records + pending_records
    payload = {
        "schema": "p97-exact-four-kalmanson-order-schema-bank-v1",
        "epistemic_status": "MIXED_KERNEL_CHECKED_AND_EXACT_FARKAS_PENDING_PORT",
        "kernel_checked_schema_count": len(kernel_records),
        "exact_farkas_verified_pending_port_schema_count": len(pending_records),
        "schema_count": len(records),
        "schemas": records,
    }
    write_json(KALMANSON_BANK, payload)
    return {"kernel": len(kernel_records), "pending": len(pending_records)}


def install_kalmanson_schema(
    lra_path: Path, farkas_path: Path, round_number: int, profile: int
) -> str:
    bank = load_json(KALMANSON_BANK)
    lra = load_json(lra_path)
    farkas = load_json(farkas_path)
    if farkas.get("status") != "VERIFIED_EXACT_FARKAS_CORE":
        raise RuntimeError("attempted to bank an unverified Farkas core")
    if farkas.get("source") != str(lra_path):
        raise RuntimeError("Farkas verification does not name the LRA payload")
    refinement = lra["refinements"][0]
    k = len(refinement["complete_core_vertices"])
    schema = normalize_schema(k, refinement["order_schema"])

    existing: list[tuple[int, tuple[tuple[int, int], ...]]] = []
    for record in bank["schemas"]:
        rk = int(record["core_vertex_count"])
        existing.append((rk, normalize_schema(rk, record["order_schema"])))
    if any(schema_subsumes(rk, rs, k, schema) for rk, rs in existing):
        return "SUBSUMED"

    record = {
        "core_vertex_count": k,
        "order_schema": [list(atom) for atom in schema],
        "transport": "order_preserving_and_reflected_injections",
        "verification_status": "EXACT_FARKAS_VERIFIED_PENDING_PORT",
        "source_core": repo_relative(lra_path),
        "farkas_verification": repo_relative(farkas_path),
        "discovery_round": round_number,
        "source_profile_opp1_card": profile,
    }
    bank["schemas"].append(record)
    bank["schema_count"] = len(bank["schemas"])
    bank["kernel_checked_schema_count"] = sum(
        item.get("verification_status") == "KERNEL_CHECKED" for item in bank["schemas"]
    )
    bank["exact_farkas_verified_pending_port_schema_count"] = sum(
        item.get("verification_status") == "EXACT_FARKAS_VERIFIED_PENDING_PORT"
        for item in bank["schemas"]
    )
    bank["epistemic_status"] = "MIXED_KERNEL_CHECKED_AND_EXACT_FARKAS_PENDING_PORT"
    write_json(KALMANSON_BANK, bank)
    return "INSTALLED"


def install_u5_matches(match_paths: list[Path]) -> list[int]:
    bank = load_json(U5_BANK)
    catalog = load_json(U5_CATALOG)
    if catalog.get("catalog_digest") != bank.get("source_catalog_digest"):
        raise RuntimeError("U5 catalog digest drift")
    installed = {int(record["catalog_index"]) for record in bank["schemas"]}
    requested: set[int] = set()
    for path in match_paths:
        match = load_json(path)
        if match.get("catalog_digest") != catalog.get("catalog_digest"):
            raise RuntimeError("U5 matcher used the wrong catalog")
        requested.update(int(item["schema_index"]) for item in match["matches"])
    new = sorted(requested - installed)
    for index in new:
        source = catalog["schemas"][index]
        consumers = source["consumers"]
        bank["schemas"].append(
            {
                "catalog_index": index,
                "consumer": consumers[0]["fq_name"],
                "consumers": [item["fq_name"] for item in consumers],
                "role_count": int(source["role_count"]),
                "positive_memberships": source["positive_memberships"],
                "negative_memberships": source["negative_memberships"],
                "transport": "all_injective_role_maps",
                "provenance": {
                    "catalog": repo_relative(U5_CATALOG),
                    "catalog_digest": catalog["catalog_digest"],
                    "selected_row_adapters": (
                        "scratch/atail-force/general-n-u5-schema-coverage/"
                        "SelectedRowU5Adapters.lean"
                    ),
                    "source_consumers": consumers,
                },
            }
        )
    if new:
        bank["schemas"].sort(key=lambda record: int(record["catalog_index"]))
        bank["schema_count"] = len(bank["schemas"])
        write_json(U5_BANK, bank)
    return new


def encode_and_solve(
    profile: int,
    round_dir: Path,
    timeout: int,
    cadical: str,
    strict_cap_minimality_overlay: bool,
    pair_minimality_overlay: bool,
) -> dict[str, Any]:
    stem = round_dir / f"opp1_{profile}"
    cnf = stem.with_suffix(".cnf")
    result = stem.with_suffix(".result.json")
    solver_log = stem.with_suffix(".cadical.log")
    command = [
        sys.executable, str(ENCODER), "--n", "11", "--opp1-card", str(profile),
        "--planar-bank", str(PLANAR_BANK), "--kalmanson-bank", str(KALMANSON_BANK),
        "--u5-bank", str(U5_BANK), "--cnf", str(cnf), "--result", str(result),
        "--solver-log", str(solver_log), "--timeout-seconds", str(timeout),
        "--cadical", cadical,
    ]
    if strict_cap_minimality_overlay:
        command.append("--strict-cap-minimality-overlay")
    if pair_minimality_overlay:
        command.append("--pair-minimality-overlay")
    run_checked(command)
    return {"profile": profile, "cnf": cnf, "result": result, "solver_log": solver_log}


def replay_and_match(paths: dict[str, Any], round_dir: Path) -> dict[str, Any]:
    profile = int(paths["profile"])
    replay = round_dir / f"opp1_{profile}.replay.json"
    match = round_dir / f"opp1_{profile}.u5-match.json"
    run_checked([
        sys.executable, str(VERIFIER), str(paths["result"]), str(PLANAR_BANK),
        str(KALMANSON_BANK), str(U5_BANK), str(paths["cnf"]), "--output", str(replay),
    ])
    if load_json(replay).get("status") != "VERIFIED_SAT_PROJECTION":
        raise RuntimeError(f"profile {profile} failed semantic replay")
    run_checked([
        sys.executable, str(U5_MATCHER), str(paths["result"]), str(U5_CATALOG),
        "--output", str(match),
    ])
    return {**paths, "replay": replay, "match": match}


def run_lra(
    paths: dict[str, Any], round_dir: Path, timeout_ms: int, wall_seconds: float
) -> dict[str, Any]:
    profile = int(paths["profile"])
    adapted = round_dir / f"opp1_{profile}.lra-adapter.json"
    lra = round_dir / f"opp1_{profile}.full-lra.json"
    source = load_json(paths["result"])
    source["omitted_apices"] = [int(source["first_apex"]), int(source["second_apex"])]
    source["lra_adapter_note"] = (
        "Compatibility field for the generic selected-row metric checker; it does not "
        "assert global blocker-image omission in the exact-four source projection."
    )
    write_json(adapted, source)
    run_checked([
        sys.executable, str(LRA_CHECKER), str(adapted), "--timeout-ms", str(timeout_ms),
        "--wall-seconds", str(wall_seconds), "--random-seed", str(profile),
        "--output", str(lra),
    ])
    adapted.unlink()
    return {**paths, "lra": lra}


def verify_farkas(paths: dict[str, Any], round_dir: Path) -> dict[str, Any]:
    profile = int(paths["profile"])
    farkas = round_dir / f"opp1_{profile}.farkas.verify.json"
    run_checked([sys.executable, str(FARKAS_CHECKER), str(paths["lra"]), "--output", str(farkas)])
    if load_json(farkas).get("status") != "VERIFIED_EXACT_FARKAS_CORE":
        raise RuntimeError(f"profile {profile} Farkas replay did not verify")
    return {**paths, "farkas": farkas}


def archive_large(paths: dict[str, Any], *, retain_cnf: bool) -> dict[str, Any]:
    record = {
        "profile": int(paths["profile"]),
        "result": repo_relative(paths["result"]),
        "result_sha256": digest_path(paths["result"]),
        "cnf_sha256": digest_path(paths["cnf"]),
        "solver_log_sha256": digest_path(paths["solver_log"]),
        "cnf_retained": retain_cnf,
        "solver_log_retained": False,
    }
    if not retain_cnf:
        paths["cnf"].unlink(missing_ok=True)
    paths["solver_log"].unlink(missing_ok=True)
    return record


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--max-rounds", type=int, default=20)
    parser.add_argument("--sat-timeout-seconds", type=int, default=300)
    parser.add_argument("--lra-timeout-ms", type=int, default=60_000)
    parser.add_argument("--lra-wall-seconds", type=float, default=300.0)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--work-dir", type=Path, default=HERE / "cegar")
    parser.add_argument("--strict-cap-minimality-overlay", action="store_true")
    parser.add_argument("--pair-minimality-overlay", action="store_true")
    args = parser.parse_args()
    if args.max_rounds <= 0 or args.sat_timeout_seconds <= 0:
        parser.error("round and timeout limits must be positive")
    if shutil.which(args.cadical) is None:
        raise RuntimeError(f"CaDiCaL executable not found: {args.cadical}")

    args.work_dir.mkdir(parents=True, exist_ok=True)
    bank_counts = merge_kernel_bank()
    manifest: dict[str, Any] = {
        "schema": "p97-exact-four-two-profile-cegar-run-v1",
        "epistemic_status": "RUNNING_FAIL_CLOSED",
        "started_unix": time.time(),
        "max_new_rounds": args.max_rounds,
        "profiles": [4, 5],
        "strict_cap_minimality_overlay": args.strict_cap_minimality_overlay,
        "pair_minimality_overlay": args.pair_minimality_overlay,
        "initial_kalmanson_bank_counts": bank_counts,
        "rounds": [],
        "terminal_status": None,
        "claim_scope": (
            "This loop audits two fixed n=11 finite projections. It does not by itself "
            "prove the Lean unique-four residual or a Euclidean realization."
        ),
    }
    manifest_path = args.work_dir / "manifest.json"
    write_json(manifest_path, manifest)

    for round_number in range(1, args.max_rounds + 1):
        round_dir = args.work_dir / f"round_{round_number:03d}"
        round_dir.mkdir(parents=True, exist_ok=True)
        print(
            f"ROUND {round_number}: K={load_json(KALMANSON_BANK)['schema_count']} "
            f"U5={load_json(U5_BANK)['schema_count']}", flush=True
        )
        with ThreadPoolExecutor(max_workers=2) as pool:
            solved = list(pool.map(
                lambda profile: encode_and_solve(
                    profile, round_dir, args.sat_timeout_seconds, args.cadical,
                    args.strict_cap_minimality_overlay,
                    args.pair_minimality_overlay,
                ),
                (4, 5),
            ))
        statuses = {int(item["profile"]): load_json(item["result"])["solver_status"]
                    for item in solved}
        round_record: dict[str, Any] = {
            "round": round_number,
            "bank_digests_at_encoding": {
                "planar": digest_path(PLANAR_BANK),
                "kalmanson": digest_path(KALMANSON_BANK),
                "u5": digest_path(U5_BANK),
            },
            "solver_statuses": statuses,
            "profiles": [],
        }
        if any(status == "UNKNOWN" for status in statuses.values()):
            round_record["status"] = "FAIL_CLOSED_SOLVER_UNKNOWN"
            for item in solved:
                round_record["profiles"].append(archive_large(item, retain_cnf=True))
            manifest["rounds"].append(round_record)
            manifest["terminal_status"] = round_record["status"]
            break
        if any(status == "UNSAT" for status in statuses.values()):
            # The solver invocation did not request a proof.  Preserve the CNF and
            # stop rather than upgrading this to verified finite UNSAT.
            round_record["status"] = "FAIL_CLOSED_UNSAT_REQUIRES_PROOF_REPLAY"
            for item in solved:
                round_record["profiles"].append(archive_large(item, retain_cnf=True))
            manifest["rounds"].append(round_record)
            manifest["terminal_status"] = round_record["status"]
            break

        with ThreadPoolExecutor(max_workers=2) as pool:
            checked = list(pool.map(lambda item: replay_and_match(item, round_dir), solved))
        new_u5 = install_u5_matches([item["match"] for item in checked])
        if new_u5:
            round_record["status"] = "REFINED_BY_SOURCE_PROVED_U5_SCHEMA"
            round_record["new_u5_catalog_indices"] = new_u5
            for item in checked:
                round_record["profiles"].append(archive_large(item, retain_cnf=False))
            manifest["rounds"].append(round_record)
            write_json(manifest_path, manifest)
            print(f"ROUND {round_number}: installed U5 schemas {new_u5}", flush=True)
            continue

        with ThreadPoolExecutor(max_workers=2) as pool:
            lra_checked = list(pool.map(
                lambda item: run_lra(
                    item, round_dir, args.lra_timeout_ms, args.lra_wall_seconds
                ),
                checked,
            ))
        lra_statuses = {
            int(item["profile"]): load_json(item["lra"])["status"] for item in lra_checked
        }
        round_record["lra_statuses"] = lra_statuses
        if any(status == "UNKNOWN" for status in lra_statuses.values()):
            round_record["status"] = "FAIL_CLOSED_LRA_UNKNOWN"
            for item in lra_checked:
                round_record["profiles"].append(archive_large(item, retain_cnf=True))
            manifest["rounds"].append(round_record)
            manifest["terminal_status"] = round_record["status"]
            break

        unsat_items = [item for item in lra_checked
                       if lra_statuses[int(item["profile"])] == "UNSAT_FULL_LRA_FIXED_ROWS"]
        if unsat_items:
            with ThreadPoolExecutor(max_workers=len(unsat_items)) as pool:
                certified = list(pool.map(lambda item: verify_farkas(item, round_dir), unsat_items))
            installations = {
                int(item["profile"]): install_kalmanson_schema(
                    item["lra"], item["farkas"], round_number, int(item["profile"])
                )
                for item in certified
            }
            round_record["kalmanson_installations"] = installations
            if all(value == "SUBSUMED" for value in installations.values()):
                round_record["status"] = "FAIL_CLOSED_ORACLE_CORE_ALREADY_SUBSUMED"
                for item in lra_checked:
                    round_record["profiles"].append(archive_large(item, retain_cnf=True))
                manifest["rounds"].append(round_record)
                manifest["terminal_status"] = round_record["status"]
                break
            round_record["status"] = "REFINED_BY_EXACT_FARKAS_KALMANSON_SCHEMA"
            for item in lra_checked:
                round_record["profiles"].append(archive_large(item, retain_cnf=False))
            manifest["rounds"].append(round_record)
            write_json(manifest_path, manifest)
            print(f"ROUND {round_number}: Kalmanson {installations}", flush=True)
            continue

        expected_sat = "SAT_VERIFIED_FULL_KALMANSON_METRIC"
        if all(status == expected_sat for status in lra_statuses.values()):
            round_record["status"] = "TERMINAL_REPLAY_VALID_SELECTED_ROW_LRA_SAT"
            round_record["scope_note"] = (
                "Exact rational Kalmanson metric models verify the selected row equalities. "
                "They do not realize every explicit false equality atom or Euclidean/MEC data."
            )
            for item in lra_checked:
                round_record["profiles"].append(archive_large(item, retain_cnf=True))
            manifest["rounds"].append(round_record)
            manifest["terminal_status"] = round_record["status"]
            break

        round_record["status"] = "FAIL_CLOSED_UNRECOGNIZED_LRA_STATUS"
        for item in lra_checked:
            round_record["profiles"].append(archive_large(item, retain_cnf=True))
        manifest["rounds"].append(round_record)
        manifest["terminal_status"] = round_record["status"]
        break
    else:
        manifest["terminal_status"] = "ROUND_CAP_REACHED_UNRESOLVED"

    manifest["finished_unix"] = time.time()
    manifest["final_kalmanson_bank_sha256"] = digest_path(KALMANSON_BANK)
    manifest["final_u5_bank_sha256"] = digest_path(U5_BANK)
    manifest["final_kalmanson_bank_counts"] = {
        "total": load_json(KALMANSON_BANK)["schema_count"],
        "kernel": load_json(KALMANSON_BANK).get("kernel_checked_schema_count", 0),
        "pending": load_json(KALMANSON_BANK).get(
            "exact_farkas_verified_pending_port_schema_count", 0
        ),
    }
    write_json(manifest_path, manifest)
    print(json.dumps({
        "terminal_status": manifest["terminal_status"],
        "rounds": len(manifest["rounds"]),
        "manifest": repo_relative(manifest_path),
    }, sort_keys=True), flush=True)
    return 0 if manifest["terminal_status"] == "TERMINAL_REPLAY_VALID_SELECTED_ROW_LRA_SAT" else 2


if __name__ == "__main__":
    raise SystemExit(main())
