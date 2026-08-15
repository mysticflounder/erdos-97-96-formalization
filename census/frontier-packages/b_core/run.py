"""Run the B-family named-local production matrix."""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from pathlib import Path
from typing import Any

import encoding as enc

from census.card_head.frontier_lane_piqd import (
    LEGACY_LOCAL_BACKEND,
    FrontierSolver,
    add_solver_arguments,
    proof_manifest_fields,
)
from census.card_head.piqd_frontier_bc import (
    B_RUN_SOURCES,
    AllocationPhase,
    BcCallerPackageProfile,
    solver_from_args,
)

OUT_DIR = Path(__file__).resolve().parent / "out"
REPO_ROOT = Path(__file__).resolve().parents[3]
NORMAL_FORM_SOURCE = REPO_ROOT / "lean/scratch/b-family-bank/B2Arm3.lean"
PRODUCER_CONTRACT = Path(__file__).resolve().parent / "producer_contract.json"


def load_producer_contract() -> dict[str, Any]:
    """Load the B1 landing contract and fail closed on promotion drift."""

    contract = json.loads(PRODUCER_CONTRACT.read_text())
    required = {
        "schema",
        "status",
        "evidence_classification",
        "promotion_eligible",
        "live_leaf",
        "ingress_theorem",
        "consumer_theorem",
        "producer_theorem",
        "lift_theorem",
        "required_producer_outputs",
        "required_lift",
        "missing_fields",
    }
    missing = sorted(required - contract.keys())
    if missing:
        raise enc.EncodingError(
            f"B1 producer contract is missing required fields: {missing}"
        )
    if contract["schema"] != "p97-b1-global-gap-contract-v1":
        raise enc.EncodingError("unsupported B1 producer-contract schema")
    if contract["promotion_eligible"]:
        if contract["status"] != "PROMOTABLE":
            raise enc.EncodingError("promotable B1 contract must have status PROMOTABLE")
        if contract["missing_fields"]:
            raise enc.EncodingError("promotable B1 contract still has missing fields")
        if not contract.get("producer_theorem") or not contract["required_lift"].get(
            "theorem"
        ):
            raise enc.EncodingError(
                "promotable B1 contract needs producer and lift theorem names"
            )
    else:
        if contract["status"] != "PARKED-SPEC":
            raise enc.EncodingError("non-promotable B1 contract must remain PARKED-SPEC")
        if not contract["missing_fields"]:
            raise enc.EncodingError("parked B1 contract must name its missing fields")
    expected_missing = sorted(
        name
        for name in ("producer_theorem", "lift_theorem")
        if not contract[name]
    )
    if sorted(contract["missing_fields"]) != expected_missing:
        raise enc.EncodingError(
            "B1 contract missing_fields disagrees with theorem fields"
        )
    if contract["required_lift"].get("theorem") != contract["lift_theorem"]:
        raise enc.EncodingError("B1 lift theorem fields disagree")
    return contract


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def verify_sat_assignment(
    encoder: enc.BEncoder,
    clauses: list[tuple[int, ...]],
    assignment: dict[str, bool],
) -> None:
    """Fail closed unless the decoded assignment satisfies the persisted CNF."""

    by_variable = {variable: assignment[name] for name, variable in encoder.names.items()}
    for index, clause in enumerate(clauses):
        if not any(by_variable[abs(lit)] == (lit > 0) for lit in clause):
            raise enc.EncodingError(f"decoded SAT assignment falsifies clause {index}")


def check_b1_live_normal_form_layer(encoder: enc.BEncoder) -> None:
    """Guard the exact clause projection promised by the B1 layer."""

    clauses = set(encoder.layers["B1-direct-shadow"])

    def require(clause: tuple[int, ...]) -> None:
        if clause not in clauses:
            raise enc.EncodingError(f"missing B1 normal-form clause {clause}")

    for point in enc.LABELS:
        left = encoder.atom(f"row(z1,{point})")
        right = encoder.atom(f"row(z2,{point})")
        require((-left, right))
        require((left, -right))
    for atom_name in ("row(z1,z2)", "row(z2,z1)"):
        require((encoder.atom(atom_name),))
    for source in ("z1", "z2"):
        for point in ("u", "v"):
            require((-encoder.atom(f"row({source},{point})"),))
    if len(encoder.layers["B1-direct-shadow"]) != 52:
        raise enc.EncodingError("unexpected B1 normal-form layer clause count")


def run_one(
    encoder: enc.BEncoder,
    name: str,
    layers: tuple[str, ...],
    extra: list[tuple[int, ...]],
    timeout_seconds: int,
    classification: str,
    *,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    clauses = encoder.clauses(*layers)
    instance = enc.RunInstance(encoder, clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    start = time.monotonic()
    result = solver(
        instance,
        cnf_path,
        extra_clauses=extra,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    elapsed = time.monotonic() - start
    record: dict[str, Any] = {
        "run": name,
        "classification": classification,
        "layers": list(layers),
        "verdict": result.verdict,
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses) + len(extra),
        "extra_clause_tags": [f"RUN-pin:{name}"] * len(extra),
        "wall_seconds": round(elapsed, 3),
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "proof_verified": result.proof_verified,
    }
    record.update(
        proof_manifest_fields(
            backend=backend,
            requested_proof_path=proof_path,
            result=result,
            relative_to=OUT_DIR.parent,
        )
    )
    if result.verdict == "SAT" and result.cube is not None:
        verify_sat_assignment(encoder, clauses + extra, result.cube)
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(json.dumps(result.cube, sort_keys=True, indent=2) + "\n")
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["model_verified"] = True
        record["true_atoms"] = sorted(k for k, value in result.cube.items() if value)
        record["model_sha256"] = sha256_file(model_path)
    record["cnf_sha256"] = sha256_file(cnf_path)
    if (
        backend == LEGACY_LOCAL_BACKEND
        and result.verdict == "UNSAT"
        and proof_path.is_file()
    ):
        record["proof_sha256"] = sha256_file(proof_path)
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    producer_contract = load_producer_contract()
    encoder = enc.BEncoder()
    check_b1_live_normal_form_layer(encoder)
    solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=BcCallerPackageProfile(
            lane="B",
            source_paths=B_RUN_SOURCES,
            allocation_phases=(
                AllocationPhase(
                    "B named atom allocation",
                    encoder.cnf.n_variables,
                    "deterministic B-core named propositional variables",
                ),
            ),
            live_leaf=producer_contract["live_leaf"],
            finite_schema=producer_contract["finite_schema"],
            cardinality_scope=producer_contract["cardinality_scope"],
            source_theorem=producer_contract["ingress_theorem"],
        ),
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )

    matrix: list[tuple[str, tuple[str, ...], list[tuple[int, ...]], str]] = [
        ("base", ("base",), [], "diagnostic baseline"),
        (
            "B1-direct-shadow",
            ("base", "B1-direct-shadow"),
            [],
            "proved live-normal-form named-local projection; not universal closure",
        ),
        (
            "B1-check-support-equality",
            ("base", "B1-direct-shadow"),
            [
                (encoder.atom("row(z1,a2)"),),
                (-encoder.atom("row(z2,a2)"),),
            ],
            "B1 normal-form encoding self-test",
        ),
        (
            "B1-check-cross-membership",
            ("base", "B1-direct-shadow"),
            [(-encoder.atom("row(z1,z2)"),)],
            "B1 normal-form encoding self-test",
        ),
        (
            "B1-check-physical-exclusion",
            ("base", "B1-direct-shadow"),
            [(encoder.atom("row(z1,u)"),)],
            "B1 normal-form encoding self-test",
        ),
        ("B2", ("base", "B2"), [], "B2 named-local package verdict"),
        (
            "B2-collision-u",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.u"),
            "B2 arm isolation",
        ),
        (
            "B2-collision-v",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.v"),
            "B2 arm isolation",
        ),
        (
            "B2-collision-b2",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.b2"),
            "B2 arm isolation",
        ),
        ("B3", ("base", "B3"), [], "B3 named-local package verdict"),
    ]
    for arm in ("a2", "bu", "bv", "b2"):
        matrix.append(
            (
                f"B3-square-{arm}",
                ("base", "B3"),
                encoder.unit_clause(f"B3.square.{arm}"),
                "B3 arm isolation",
            )
        )

    records = [
        run_one(
            encoder,
            name,
            layers,
            extra,
            args.timeout_seconds,
            classification,
            solver=solver,
            backend=args.solver_backend,
        )
        for name, layers, extra, classification in matrix
    ]
    manifest = {
        "schema": "p97-b-core-named-local.v2",
        "b1_status": "LIVE_NORMAL_FORM_INGRESS_PROVED__NAMED_LOCAL_RESULT_ONLY",
        "scope": (
            "EMPIRICALLY VERIFIED only for the named-local CNF projection; "
            "SAT is not a geometric model and does not close the universal B1 leaf"
        ),
        "b1_normal_form_source": {
            "declaration": "Problem97.B2Arm3.b1_live_normalForm",
            "file": str(NORMAL_FORM_SOURCE.relative_to(REPO_ROOT)),
            "sha256": sha256_file(NORMAL_FORM_SOURCE),
        },
        "producer_contract": {
            "file": str(PRODUCER_CONTRACT.relative_to(REPO_ROOT)),
            "sha256": sha256_file(PRODUCER_CONTRACT),
            "schema": producer_contract["schema"],
            "status": producer_contract["status"],
            "evidence_classification": producer_contract["evidence_classification"],
            "promotion_eligible": producer_contract["promotion_eligible"],
            "live_leaf": producer_contract["live_leaf"],
            "partial_producer_theorem": producer_contract.get(
                "partial_producer_theorem"
            ),
            "partial_producer_status": producer_contract.get(
                "partial_producer_status"
            ),
            "partial_consumer_theorem": producer_contract.get(
                "partial_consumer_theorem"
            ),
            "conditional_terminal_theorem": producer_contract.get(
                "conditional_terminal_theorem"
            ),
            "partial_consumer_status": producer_contract.get(
                "partial_consumer_status"
            ),
            "missing_fields": producer_contract["missing_fields"],
        },
        "encoding_self_check": {
            "b1_live_normal_form": "PASS",
            "b1_layer_clauses": len(encoder.layers["B1-direct-shadow"]),
        },
        "tag_counts": encoder.tag_counts(),
        "layer_clause_tags": encoder.layer_tags,
        "runs": records,
    }
    manifest_path = OUT_DIR / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True, indent=2) + "\n")
    for record in records:
        print(
            f"{record['run']:22s} {record['verdict']:7s} "
            f"vars={record['n_variables']:3d} clauses={record['n_clauses']:3d} "
            f"wall={record['wall_seconds']:.3f}s"
        )
    print("B1 status: live normal-form ingress proved; named-local result only")
    print(f"manifest -> {manifest_path}")
    expected_unsat = {
        "B1-check-support-equality",
        "B1-check-cross-membership",
        "B1-check-physical-exclusion",
    }
    run_ok = all(
        (
            record["verdict"] == "UNSAT"
            and record["proof_verified"] is True
        )
        if record["run"] in expected_unsat
        else record["verdict"] in {"SAT", "UNSAT"}
        for record in records
    )
    return 0 if run_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
