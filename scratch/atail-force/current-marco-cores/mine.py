#!/usr/bin/env python3
"""Mine several exact-CAS UNIT equality cores from each current shard.

This is a bounded, deterministic, multi-order MUS experiment.  It starts from
the row core already cross-checked in the current 23-shard oracle checkpoint,
then greedily deletes individual equalities in several orders.  A deletion is
accepted only after msolve proposes UNIT and Singular independently confirms
UNIT over QQ.  Every saved core is checked again with Singular and msolve in
both variable orders; deletion minimality is claimed only when every one-atom
deletion is NONUNIT in all three computations.

The output is theorem-discovery data for a fixed, target-unfaithful equality
shadow.  It is neither a Nullstellensatz certificate nor a Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY = HERE.parent / "second_center_query"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
for path in (ROOT, QUERY, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import oracle  # noqa: E402
import formalized_core_equality_minimizer as equality_minimizer  # noqa: E402
from census.global_confinement.equality_ideal_probe import (  # noqa: E402
    row_equalities as reference_row_equalities,
)
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-current-multi-order-equality-mus-v1"
DEFAULT_OUTPUT = HERE / "checkpoint.json"
SOURCE_SHARDS = (
    "formalized_core_shards_after_current_bank_checkpoint.json",
    "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
)
SOURCE_ORACLE = (
    "formalized_core_shards_after_seven_point_six_circle_oracle_checkpoint.json",
    "2bdfa1a62fea79fa2c18d379dad4b7f609fc0465cae2e35dfb539a436d8de211",
)
EQUALITY_INPUTS = (
    (
        "formalized_core_shards_after_seven_point_six_circle_equality_checkpoint.json",
        "d9377d858e745e0bada518f56de7fdcbcdf5ff87ae11b4efd1222aeeb194a8b6",
    ),
    (
        "formalized_core_shards_after_seven_point_six_circle_equality_rows7_checkpoint.json",
        "35dbe15fc74a5c6665b064932f36fd69601d82725f5c2f20d39ab44f90908550",
    ),
    (
        "formalized_core_shards_after_seven_point_six_circle_equality_rows8_checkpoint.json",
        "4aca518fd0479f5ba8f02880000a72fb5bf4c8b4617e779ff52930ea24a8e23e",
    ),
)
SEED = 20260714
MATCHER = ROOT / "census/global_confinement/metric_realizability_probe.py"
MATCHER_SHA256 = "f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373"


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def canonical_sha256(value: object) -> str:
    return sha256_bytes(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    )


def read_pinned(name_and_digest: tuple[str, str]) -> dict[str, Any]:
    name, expected = name_and_digest
    path = QUERY / name
    raw = path.read_bytes()
    actual = sha256_bytes(raw)
    if actual != expected:
        raise RuntimeError(
            f"stale pinned input {path}: expected {expected}, found {actual}"
        )
    return json.loads(raw)


def public_equality(record: Mapping[str, object]) -> dict[str, int]:
    return {
        "center": int(record["center"]),
        "left": int(record["left"]),
        "right": int(record["right"]),
    }


def equality_key(record: Mapping[str, object]) -> tuple[int, int, int]:
    public = public_equality(record)
    return public["center"], public["left"], public["right"]


def crosscheck_summary(report: Mapping[str, object]) -> dict[str, str]:
    return {
        "status": str(report["status"]),
        "singular_qq": str(report["singular_qq"]["verdict"]),
        "msolve_qq_forward_variables": str(
            report["msolve_qq_forward_variables"]["verdict"]
        ),
        "msolve_qq_reverse_variables": str(
            report["msolve_qq_reverse_variables"]["verdict"]
        ),
    }


def deterministic_orders(
    keys: Sequence[tuple[int, int, int]], shard: int, count: int
) -> tuple[tuple[tuple[int, int, int], ...], ...]:
    canonical = tuple(sorted(keys))
    candidates: list[tuple[tuple[int, int, int], ...]] = [
        canonical,
        tuple(reversed(canonical)),
    ]
    salt = 0
    while len(candidates) < count:
        order = tuple(
            sorted(
                canonical,
                key=lambda key: hashlib.sha256(
                    f"{SEED}:{shard}:{salt}:{key}".encode()
                ).digest(),
            )
        )
        if order not in candidates:
            candidates.append(order)
        salt += 1
    return tuple(candidates[:count])


class ExactOracle:
    def __init__(
        self,
        records: Mapping[tuple[int, int, int], Mapping[str, object]],
        *,
        call_timeout: float,
    ) -> None:
        self.records = records
        self.variables = tuple(str(value) for value in oracle.variable_symbols(12))
        self.call_timeout = call_timeout
        self.full_cache: dict[frozenset[tuple[int, int, int]], dict[str, Any]] = {}
        self.proposal_cache: dict[
            frozenset[tuple[int, int, int]], dict[str, str]
        ] = {}
        self.engine_calls = {"singular": 0, "msolve": 0}

    def polynomials(
        self, subset: frozenset[tuple[int, int, int]]
    ) -> tuple[str, ...]:
        return tuple(
            str(self.records[key]["polynomial"])
            for key in sorted(subset)
        )

    def proposal(self, subset: frozenset[tuple[int, int, int]]) -> dict[str, str]:
        """Return enough information to accept only independently UNIT removals."""

        if subset in self.proposal_cache:
            return self.proposal_cache[subset]
        polynomials = self.polynomials(subset)
        forward = oracle.run_msolve(
            self.variables, polynomials, timeout_s=self.call_timeout
        )
        self.engine_calls["msolve"] += 1
        msolve_verdict = forward.verdict
        if msolve_verdict != "UNIT":
            reverse = oracle.run_msolve(
                tuple(reversed(self.variables)),
                polynomials,
                timeout_s=self.call_timeout,
            )
            self.engine_calls["msolve"] += 1
            if reverse.verdict == "UNIT":
                msolve_verdict = "UNIT"
        singular_verdict = "NOT_RUN"
        if msolve_verdict == "UNIT":
            singular = oracle.run_singular(
                self.variables, polynomials, timeout_s=self.call_timeout
            )
            self.engine_calls["singular"] += 1
            singular_verdict = singular.verdict
        result = {
            "msolve_unit_proposal": msolve_verdict,
            "singular_confirmation": singular_verdict,
            "verdict": (
                "UNIT"
                if msolve_verdict == "UNIT" and singular_verdict == "UNIT"
                else "KEEP_FAIL_CLOSED"
            ),
        }
        self.proposal_cache[subset] = result
        return result

    def full(self, subset: frozenset[tuple[int, int, int]]) -> dict[str, Any]:
        if subset not in self.full_cache:
            records = tuple(self.records[key] for key in sorted(subset))
            report = equality_minimizer.crosscheck(
                self.variables, records, timeout_s=self.call_timeout
            )
            self.engine_calls["singular"] += 1
            self.engine_calls["msolve"] += 2
            self.full_cache[subset] = report
        return self.full_cache[subset]


def shrink_one_order(
    exact: ExactOracle,
    universe: frozenset[tuple[int, int, int]],
    order: Sequence[tuple[int, int, int]],
    *,
    wall_budget: float,
) -> dict[str, Any]:
    started = time.monotonic()
    active = set(universe)
    attempts = 0
    accepted = 0
    budget_exhausted = False
    for key in order:
        if time.monotonic() - started >= wall_budget:
            budget_exhausted = True
            break
        candidate = frozenset(active - {key})
        proposal = exact.proposal(candidate)
        attempts += 1
        if proposal["verdict"] == "UNIT":
            active.remove(key)
            accepted += 1

    # A false negative proposal can leave a redundant equality.  Remove such
    # atoms under the full three-engine oracle before testing irredundancy.
    repaired = 0
    while not budget_exhausted:
        removed = False
        for key in tuple(sorted(active)):
            if time.monotonic() - started >= wall_budget:
                budget_exhausted = True
                break
            candidate = frozenset(active - {key})
            checked = exact.full(candidate)
            if checked["status"] == "CROSSCHECKED_UNIT":
                active.remove(key)
                repaired += 1
                removed = True
                break
        if not removed:
            break

    core = frozenset(active)
    final = exact.full(core)
    deletion_checks: list[dict[str, Any]] = []
    for key in sorted(core):
        deleted = {"center": key[0], "left": key[1], "right": key[2]}
        if time.monotonic() - started >= wall_budget:
            budget_exhausted = True
            deletion_checks.append(
                {
                    "deleted": deleted,
                    "crosscheck": {
                        "status": "NOT_RUN_WALL_BUDGET",
                        "singular_qq": "NOT_RUN",
                        "msolve_qq_forward_variables": "NOT_RUN",
                        "msolve_qq_reverse_variables": "NOT_RUN",
                    },
                }
            )
            continue
        checked = exact.full(core - {key})
        deletion_checks.append(
            {"deleted": deleted, "crosscheck": crosscheck_summary(checked)}
        )
    certified = (
        final["status"] == "CROSSCHECKED_UNIT"
        and not budget_exhausted
        and all(
            item["crosscheck"]["status"] == "CROSSCHECKED_NONUNIT"
            for item in deletion_checks
        )
    )
    return {
        "core": core,
        "attempt_count": attempts,
        "accepted_proposal_deletions": accepted,
        "full_oracle_repair_deletions": repaired,
        "wall_budget_exhausted": budget_exhausted,
        "final_crosscheck": crosscheck_summary(final),
        "deletion_checks": deletion_checks,
        "certified_deletion_minimal": certified,
    }


def load_cases() -> tuple[dict[str, Any], ...]:
    if sha256_bytes(MATCHER.read_bytes()) != MATCHER_SHA256:
        raise RuntimeError("current formalized metric-core matcher drift")
    shards = read_pinned(SOURCE_SHARDS)
    oracle_checkpoint = read_pinned(SOURCE_ORACLE)
    exact_shards = {
        int(case["shard_index"])
        for case in oracle_checkpoint["cases"]
        if case.get("metric_oracle", {}).get("reported_status")
        == "NO_NORMALIZED_COMPLEX_OR_REAL_EQUALITY_REALIZATION"
    }
    source_by_shard = {
        int(case["partition"]["shard_index"]): case for case in shards["cases"]
    }
    cases: list[dict[str, Any]] = []
    for pinned in EQUALITY_INPUTS:
        document = read_pinned(pinned)
        for case in document["cases"]:
            shard = int(case["shard_index"])
            if shard not in exact_shards:
                raise RuntimeError(f"shard {shard} is not exact-oracle rejected")
            source_case = source_by_shard[shard]
            if (
                str(case["source_witness_sha256"])
                != str(source_case["survivor"]["witness_sha256"])
            ):
                # This shard was replaced by the current-bank refresh and has
                # not yet received a fresh equality-oracle/minimization pass.
                continue
            survivor = source_case["survivor"]
            current_rows = tuple(
                MetricRow(
                    int(row["center"]),
                    tuple(int(point) for point in row["support"]),
                    bool(row["exact"]),
                )
                for row in survivor["distinct_metric_rows"]
            )
            current_hit = _formalized_metric_core(
                current_rows,
                int(survivor["frame"]["n"]),
                tuple(int(point) for point in survivor["frame"]["cyclic_order"]),
            )
            if current_hit is not None:
                continue
            cases.append(dict(case))
    cases.sort(key=lambda case: int(case["shard_index"]))
    if len(cases) != 16 or len({int(case["shard_index"]) for case in cases}) != 16:
        raise RuntimeError("expected exactly 16 current-bank-clean exact rejects")
    return tuple(cases)


def smoke_gates() -> dict[str, Any]:
    engine_smokes = oracle.smoke_gates()
    if any(
        item[engine]["verdict"] != item["expected"]
        for item in engine_smokes.values()
        for engine in ("singular", "msolve")
    ):
        raise RuntimeError("exact CAS UNIT/NONUNIT smoke gate failed")

    cases = load_cases()
    row = oracle.row_from_dict(cases[0]["input_rows"][0])
    generated = oracle.row_polynomials(12, row)
    variables = oracle.variable_symbols(12)
    namespace = {str(variable): variable for variable in variables}
    import sympy as sp

    reference = tuple(
        sp.Poly(
            sp.expand(sp.sympify(value.replace("^", "**"), locals=namespace)),
            *variables,
            domain=sp.QQ,
        )
        for value in reference_row_equalities(row)
    )
    if generated != reference:
        raise RuntimeError("independent row serializer comparison failed")

    toy_variables = ("z",)
    toy_core = ("z", "z-1")
    toy_full = {
        "singular": oracle.run_singular(
            toy_variables, toy_core, timeout_s=5.0
        ).verdict,
        "msolve": oracle.run_msolve(
            toy_variables, toy_core, timeout_s=5.0
        ).verdict,
    }
    toy_deletions = []
    for index in range(2):
        subset = toy_core[:index] + toy_core[index + 1 :]
        toy_deletions.append(
            {
                "singular": oracle.run_singular(
                    toy_variables, subset, timeout_s=5.0
                ).verdict,
                "msolve": oracle.run_msolve(
                    toy_variables, subset, timeout_s=5.0
                ).verdict,
            }
        )
    if set(toy_full.values()) != {"UNIT"} or any(
        set(item.values()) != {"NONUNIT"} for item in toy_deletions
    ):
        raise RuntimeError("toy deletion-minimal UNIT core smoke gate failed")
    return {
        "known_unit_and_nonunit": engine_smokes,
        "independent_row_serializer_match": True,
        "toy_deletion_minimal_unit_core": {
            "full": toy_full,
            "one_atom_deletions": toy_deletions,
        },
    }


def run_case(
    case: Mapping[str, object],
    *,
    order_count: int,
    call_timeout: float,
    wall_budget: float,
) -> dict[str, Any]:
    shard = int(case["shard_index"])
    rows = tuple(oracle.row_from_dict(row) for row in case["input_rows"])
    equality_records = equality_minimizer.equality_records(12, rows)
    records = {equality_key(record): record for record in equality_records}
    if len(records) != len(equality_records):
        raise RuntimeError(f"shard {shard} has duplicate equality atoms")
    universe = frozenset(records)
    exact = ExactOracle(records, call_timeout=call_timeout)
    results = []
    for order_index, order in enumerate(
        deterministic_orders(tuple(records), shard, order_count)
    ):
        result = shrink_one_order(
            exact, universe, order, wall_budget=wall_budget
        )
        result["order_index"] = order_index
        results.append(result)

    distinct: dict[
        tuple[tuple[int, int, int], ...], dict[str, Any]
    ] = {}
    for result in results:
        core_key = tuple(sorted(result.pop("core")))
        if core_key not in distinct:
            distinct[core_key] = {
                "equalities": [
                    {"center": key[0], "left": key[1], "right": key[2]}
                    for key in core_key
                ],
                "equality_count": len(core_key),
                "order_indices": [],
                "certified_deletion_minimal": result[
                    "certified_deletion_minimal"
                ],
                "final_crosscheck": result["final_crosscheck"],
                "deletion_checks": result["deletion_checks"],
            }
        distinct[core_key]["order_indices"].append(result["order_index"])

    cores = sorted(
        distinct.values(),
        key=lambda core: (
            core["equality_count"],
            tuple(
                (item["center"], item["left"], item["right"])
                for item in core["equalities"]
            ),
        ),
    )
    return {
        "shard_index": shard,
        "profile": list(case.get("profile", [])),
        "source_witness_sha256": case["source_witness_sha256"],
        "input_rows": case["input_rows"],
        "input_rows_sha256": case["input_rows_sha256"],
        "equality_universe_count": len(universe),
        "equality_universe_sha256": canonical_sha256(
            [public_equality(records[key]) for key in sorted(records)]
        ),
        "orders": [
            {
                key: value
                for key, value in result.items()
                if key not in {"deletion_checks", "final_crosscheck"}
            }
            for result in results
        ],
        "distinct_core_count": len(cores),
        "all_cores_certified_deletion_minimal": all(
            core["certified_deletion_minimal"] for core in cores
        ),
        "cores": cores,
        "engine_calls": exact.engine_calls,
    }


def discover(args: argparse.Namespace) -> dict[str, Any]:
    smokes = smoke_gates()
    cases = load_cases()
    if args.shards:
        selected = {
            int(value) for value in args.shards.split(",") if value.strip()
        }
        cases = tuple(
            case for case in cases if int(case["shard_index"]) in selected
        )
        if {int(case["shard_index"]) for case in cases} != selected:
            raise RuntimeError("--shards contains an unavailable shard")
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=min(args.workers, len(cases))) as pool:
        futures = {
            pool.submit(
                run_case,
                case,
                order_count=args.orders,
                call_timeout=args.call_timeout_seconds,
                wall_budget=args.wall_budget_seconds,
            ): int(case["shard_index"])
            for case in cases
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                f"shard {result['shard_index']}: "
                f"{result['distinct_core_count']} distinct cores; "
                f"minimal={result['all_cores_certified_deletion_minimal']}",
                file=sys.stderr,
                flush=True,
            )
    results.sort(key=lambda result: int(result["shard_index"]))
    core_count = sum(int(result["distinct_core_count"]) for result in results)
    return {
        "schema": SCHEMA,
        "scope": {
            "fixed_placement_only": True,
            "target_faithful": False,
            "current_exact_rejected_shards_only": True,
            "current_formalized_metric_core_bank_clean": True,
            "only_unchanged_shards_with_pinned_exact_oracle_inputs": True,
            "fresh_replacement_shards_not_yet_oracle_probed": True,
            "input_universe_is_saved_row_core_not_full_12_rows": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "producer_proved": False,
            "lean_consumer_proved": False,
        },
        "pinned_inputs": [
            {"path": str(QUERY / name), "sha256": digest}
            for name, digest in (SOURCE_SHARDS, SOURCE_ORACLE, *EQUALITY_INPUTS)
        ] + [{"path": str(MATCHER), "sha256": MATCHER_SHA256}],
        "configuration": {
            "orders_per_shard": args.orders,
            "workers": min(args.workers, len(cases)),
            "per_engine_call_timeout_seconds": args.call_timeout_seconds,
            "wall_budget_seconds_per_order": args.wall_budget_seconds,
            "deterministic_seed": SEED,
        },
        "smoke_gates": smokes,
        "case_count": len(results),
        "distinct_core_count": core_count,
        "shards_with_multiple_cores": sum(
            result["distinct_core_count"] > 1 for result in results
        ),
        "all_cores_certified_deletion_minimal": all(
            result["all_cores_certified_deletion_minimal"] for result in results
        ),
        "cases": results,
    }


def replay(path: Path, call_timeout: float) -> None:
    saved = json.loads(path.read_text(encoding="utf-8"))
    if saved.get("schema") != SCHEMA:
        raise RuntimeError("checkpoint schema mismatch")
    smoke_gates()
    cases = {int(case["shard_index"]): case for case in load_cases()}
    replayed = 0
    for saved_case in saved["cases"]:
        shard = int(saved_case["shard_index"])
        source_case = cases[shard]
        rows = tuple(
            oracle.row_from_dict(row) for row in source_case["input_rows"]
        )
        records_seq = equality_minimizer.equality_records(12, rows)
        records = {equality_key(record): record for record in records_seq}
        exact = ExactOracle(records, call_timeout=call_timeout)
        for core in saved_case["cores"]:
            keys = frozenset(
                (int(item["center"]), int(item["left"]), int(item["right"]))
                for item in core["equalities"]
            )
            if crosscheck_summary(exact.full(keys)) != core["final_crosscheck"]:
                raise RuntimeError(f"shard {shard} core verdict drift")
            checks = []
            for key in sorted(keys):
                checks.append(
                    {
                        "deleted": {
                            "center": key[0],
                            "left": key[1],
                            "right": key[2],
                        },
                        "crosscheck": crosscheck_summary(exact.full(keys - {key})),
                    }
                )
            if checks != core["deletion_checks"]:
                raise RuntimeError(f"shard {shard} deletion verdict drift")
            replayed += 1
        print(f"replayed shard {shard}", file=sys.stderr, flush=True)
    print(f"PASS: replayed {replayed} exact cores from {path}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--discover", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--orders", type=int, default=4)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument(
        "--shards",
        help="comma-separated shard indices for a bounded discovery test",
    )
    parser.add_argument("--call-timeout-seconds", type=float, default=15.0)
    parser.add_argument("--wall-budget-seconds", type=float, default=240.0)
    args = parser.parse_args()
    if args.orders < 1 or args.workers < 1:
        parser.error("orders and workers must be positive")
    if args.call_timeout_seconds <= 0 or args.wall_budget_seconds <= 0:
        parser.error("timeouts must be positive")
    if args.check:
        replay(args.output, args.call_timeout_seconds)
        return 0
    document = discover(args)
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
