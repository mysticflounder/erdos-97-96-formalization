"""Generalization-mining over the banked infeasible row cores.

A banked core certifies its FULL row set (UNIT ideal, or Rabinowitsch
radical membership of the core's banked forced pair — (6,7) for twelve
fp-555 cores, (7,8) for fp-654 and fp-555-09). Any subset certificate
generalizes: if a shared row subset is itself UNIT (resp. forces the
pair), that single certificate covers every banked core containing the
subset — promoting instance-level certificates toward family
certificates.

Candidates: for every pair of cores in the same family bank, the shared
row subset, kept when it has at least --min-shared-unit rows (unit
banks, UNIT test) or --min-shared-fp rows (forced-pair banks,
Rabinowitsch test of the parents' common banked pair; parents with
differing banked pairs are skipped). Coverage is recomputed against the
whole family bank — for forced-pair candidates, restricted to cores
banked with the same forced pair.

--smoke re-runs three banked certificates (unit-core-555-65 UNIT,
forced-pair-core-654-47 Rabinowitsch (7,8), forced-pair-core-555-01
Rabinowitsch (6,7)) and must reproduce them before any mining run is
trusted.

Emits line-delimited JSON records on stdout (one per candidate, written
as each finishes).
"""

import argparse
import importlib.util
import json
import sys
from itertools import combinations

REPO = "/Users/adam/projects/math-projects/erdos-97-96-formalization"
BANK = (
    REPO
    + "/scratch/atail-force/unique-row-producer/"
    + "card_five_interior_shadow_search.py"
)
ORACLE = (
    REPO + "/scratch/atail-force/second_center_metric_oracle/oracle.py"
)
N = 12


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    spec.loader.exec_module(mod)
    return mod


def rowset(core):
    return frozenset(
        (center, tuple(sorted(support)))
        for center, support in core["rows"].items()
    )


def metric_rows(oracle, keys):
    return tuple(
        oracle.MetricRow(center, support, exact=False)
        for center, support in sorted(keys)
    )


def unit_test(oracle, keys, timeout):
    result = oracle.crosscheck_system(
        N, metric_rows(oracle, keys),
        budget=oracle.CaseBudget(seconds=timeout),
    )
    return {
        "test": "UNIT",
        "status": result["status"],
        "oracles": {
            k: v["verdict"] if isinstance(v, dict) and "verdict" in v else v
            for k, v in result.items()
        },
    }


def rabinowitsch_test(oracle, keys, timeout, pair):
    rows = metric_rows(oracle, keys)
    points = oracle.coordinate_symbols(N)
    sympy_variables = oracle.variable_symbols(N)
    variables = [str(v) for v in sympy_variables]
    polynomials = list(oracle.serialized_system(N, rows))
    pair_expr = oracle.squared_distance(points, *pair)
    t_symbol = oracle.sp.Symbol("t")
    rabinowitsch_poly = oracle.serialize_poly(
        oracle.sp.Poly(
            oracle.sp.expand(1 - t_symbol * pair_expr),
            *sympy_variables,
            t_symbol,
            domain=oracle.sp.QQ,
        )
    )
    extended_variables = variables + ["t"]
    extended = polynomials + [rabinowitsch_poly]
    singular = oracle.run_singular(
        extended_variables, extended, timeout_s=timeout
    )
    forward = oracle.run_msolve(
        extended_variables, extended, timeout_s=timeout
    )
    reverse = oracle.run_msolve(
        list(reversed(extended_variables)), extended, timeout_s=timeout
    )
    unit = (
        singular.verdict == "UNIT"
        and forward.verdict == "UNIT"
        and reverse.verdict == "UNIT"
    )
    return {
        "test": "RABINOWITSCH_PAIR_%d_%d" % pair,
        "pair": list(pair),
        "status": (
            "CROSSCHECKED_FORCED_ZERO_PAIR_SUBSET"
            if unit
            else "NOT_CROSSCHECKED"
        ),
        "oracles": {
            "rabinowitsch_singular": singular.verdict,
            "rabinowitsch_msolve_forward": forward.verdict,
            "rabinowitsch_msolve_reverse": reverse.verdict,
        },
    }


def family_of(core_id):
    for prefix in (
        "unit-core-555", "unit-core-654",
        "forced-pair-core-555", "forced-pair-core-654",
    ):
        if core_id.startswith(prefix):
            return prefix
    raise ValueError(core_id)


def candidates(cores, min_shared_unit, min_shared_fp):
    by_family = {}
    for core in cores:
        by_family.setdefault(family_of(core["id"]), []).append(core)
    seen = {}
    for family, members in sorted(by_family.items()):
        is_fp = family.startswith("forced-pair")
        floor = min_shared_fp if is_fp else min_shared_unit
        sets = {c["id"]: rowset(c) for c in members}
        pairs = {
            c["id"]: tuple(c["forced_zero_squared_distance_pair"])
            for c in members
        } if is_fp else {}
        for (id_a, rs_a), (id_b, rs_b) in combinations(
            sorted(sets.items()), 2
        ):
            shared = rs_a & rs_b
            if len(shared) < floor:
                continue
            if is_fp and pairs[id_a] != pairs[id_b]:
                continue
            key = (family, shared)
            if key in seen:
                continue
            coverage = sorted(
                cid for cid, rs in sets.items()
                if shared <= rs
                and (not is_fp or pairs[cid] == pairs[id_a])
            )
            record = {
                "family": family,
                "test": (
                    "RABINOWITSCH_PAIR_%d_%d" % pairs[id_a]
                    if is_fp else "UNIT"
                ),
                "rows": sorted(
                    [center, list(support)] for center, support in shared
                ),
                "row_count": len(shared),
                "generating_pair": [id_a, id_b],
                "coverage": coverage,
            }
            if is_fp:
                record["pair"] = list(pairs[id_a])
            seen[key] = record
    return sorted(
        seen.values(),
        key=lambda c: (-len(c["coverage"]), -c["row_count"]),
    )


def emit(record):
    print(json.dumps(record, sort_keys=True), flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--list-only", action="store_true")
    parser.add_argument("--min-shared-unit", type=int, default=5)
    parser.add_argument("--min-shared-fp", type=int, default=6)
    parser.add_argument("--timeout", type=float, default=120.0)
    args = parser.parse_args()

    bank = load_module("bank", BANK)
    oracle = load_module("card_five_interior_metric_oracle", ORACLE)
    cores = {c["id"]: c for c in bank.REAL_INFEASIBLE_ROW_CORES}

    if args.smoke:
        unit_core = rowset(cores["unit-core-555-65"])
        result = unit_test(oracle, unit_core, args.timeout)
        emit({"smoke": "unit-core-555-65", **result})
        ok_unit = result["status"] == "CROSSCHECKED_UNIT"
        oks = [ok_unit]
        for fp_id in (
            "forced-pair-core-654-47", "forced-pair-core-555-01",
        ):
            core = cores[fp_id]
            result = rabinowitsch_test(
                oracle, rowset(core), args.timeout,
                tuple(core["forced_zero_squared_distance_pair"]),
            )
            emit({"smoke": fp_id, **result})
            oks.append(
                result["status"] == "CROSSCHECKED_FORCED_ZERO_PAIR_SUBSET"
            )
        emit({"smoke_gate": "PASS" if all(oks) else "FAIL"})
        if not all(oks):
            sys.exit(1)
        return

    cands = candidates(
        list(cores.values()), args.min_shared_unit, args.min_shared_fp
    )
    emit({"candidate_count": len(cands)})
    if args.list_only:
        for cand in cands:
            emit(cand)
        return
    if not args.run:
        parser.error("pass --smoke, --list-only, or --run")
    for cand in cands:
        keys = frozenset(
            (center, tuple(support)) for center, support in cand["rows"]
        )
        if cand["test"] == "UNIT":
            result = unit_test(oracle, keys, args.timeout)
        else:
            result = rabinowitsch_test(
                oracle, keys, args.timeout, tuple(cand["pair"])
            )
        emit({**cand, **result})


if __name__ == "__main__":
    main()
