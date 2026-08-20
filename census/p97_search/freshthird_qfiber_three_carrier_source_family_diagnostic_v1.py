"""Partition the FreshThird pinned-source replay failure by source family.

This diagnostic consumes a complete CNF model signature, rebuilds the source
query in a fresh Z3 solver, and tracks source-derived families inside the one
historically monolithic ``pinned_source_theory`` group.  The formulas are
extracted from that group; they are not recreated here.  Results are
theorem-mining evidence only and cannot admit a CEGAR cut.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import subprocess
from collections.abc import Iterable, Mapping
from dataclasses import dataclass
from pathlib import Path

import z3

from census.p97_search.freshthird_qfiber_three_carrier_batched_alternation_probe_v1 import (
    FRONTIER_ROLE_SCOPE,
    _parse_model,
    no_alternating_cap_clauses,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CONSTRAINT_GROUPS,
    OLD_ROLES,
    SEED,
    CarrierQuery,
    add_model_signature_constraints,
    build_query,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-source-family-diagnostic/v1"
PINNED_GROUP = "pinned_source_theory"
FAMILY_NAMES = (
    "seed_identity",
    "seed_multiplicity",
    "canonical_packet",
    "fan_local_0",
    "fan_local_1",
    "fan_local_2",
    "fan_local_3",
    "pinned_deletion_profile",
    "normalized_fan_outcome",
)
CANONICAL_PACKET_ATOMS = (
    "source_center_in_first_cap",
    "canonical_source_in_first_cap",
    "canonical_second_source_in_first_cap",
    "source_fresh_overlap_two",
    "fresh_cap_distinct",
    "fresh_center_in_fresh_cap",
    "fresh_source_one_outside_first_cap",
    "fresh_source_two_outside_first_cap",
    "fresh_row_ordered",
    "some_fan_source_outside_seed",
    "endpoint_branch_split",
)


@dataclass(frozen=True)
class FamilyReplay:
    boundary_index: int
    monolithic_status: str
    split_status: str
    split_core: tuple[str, ...]
    minimized_core: tuple[str, ...]
    drop_status: dict[str, str]
    canonical_atom_core: tuple[str, ...]
    canonical_atom_minimized: tuple[str, ...]


def _status_name(status: z3.CheckSatResult) -> str:
    if status == z3.sat:
        return "SAT"
    if status == z3.unsat:
        return "UNSAT"
    return "UNKNOWN"


def _tracked_payloads(query: CarrierQuery) -> dict[str, z3.BoolRef]:
    """Read tracked source payloads from the query without duplicating them."""

    payloads: dict[str, z3.BoolRef] = {}
    for assertion in query.solver.assertions():
        if not z3.is_implies(assertion) or assertion.num_args() != 2:
            raise ValueError("unexpected untracked source assertion")
        label, payload = assertion.arg(0), assertion.arg(1)
        if label.num_args() != 0:
            raise ValueError("unexpected source tracking label")
        label_name = label.decl().name()
        if not label_name.startswith("source__"):
            raise ValueError("unexpected source tracking namespace")
        group = label_name.removeprefix("source__")
        if group in payloads:
            raise ValueError(f"duplicate source payload: {group}")
        payloads[group] = payload
    if tuple(payloads) != CONSTRAINT_GROUPS:
        raise ValueError("source payload group order drift")
    return payloads


def _and_terms(payload: z3.BoolRef) -> tuple[z3.BoolRef, ...]:
    if not z3.is_and(payload):
        raise ValueError("source group no longer has conjunction payload")
    return tuple(payload.children())


def pinned_source_families(query: CarrierQuery) -> dict[str, tuple[z3.BoolRef, ...]]:
    """Return the fixed source-order partition of the pinned source payload."""

    payload = _tracked_payloads(query).get(PINNED_GROUP)
    if payload is None:
        raise ValueError("missing pinned source payload")
    terms = _and_terms(payload)
    seed_identity_size = len(tuple(itertools.combinations(SEED, 2))) + 3
    seed_multiplicity_size = len(tuple(itertools.permutations(SEED, 4)))
    canonical_packet_size = 11
    fan_local_size = 8 + len(OLD_ROLES)
    family_sizes = (
        seed_identity_size,
        seed_multiplicity_size,
        canonical_packet_size,
        *(fan_local_size for _ in range(4)),
        len(OLD_ROLES),
        1,
    )
    if len(family_sizes) != len(FAMILY_NAMES) or sum(family_sizes) != len(terms):
        raise ValueError("pinned source family size drift")
    families: dict[str, tuple[z3.BoolRef, ...]] = {}
    offset = 0
    for name, size in zip(FAMILY_NAMES, family_sizes, strict=True):
        families[name] = terms[offset : offset + size]
        offset += size
    if offset != len(terms):
        raise ValueError("pinned source family partition incomplete")
    if not z3.eq(z3.And(*(term for family in families.values() for term in family)), payload):
        raise ValueError("pinned source family partition changed source payload")
    return families


def _split_query(
    boundary_index: int,
    signature: Mapping[str, object],
    active_families: Iterable[str],
    *,
    timeout_ms: int,
    track_families: bool,
    include_nonpinned_groups: bool,
) -> CarrierQuery:
    original = build_query(boundary_index, timeout_ms=timeout_ms)
    payloads = _tracked_payloads(original)
    families = pinned_source_families(original)
    active = tuple(active_families)
    if len(set(active)) != len(active) or any(name not in families for name in active):
        raise ValueError("invalid active pinned family set")

    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    if include_nonpinned_groups:
        for group in CONSTRAINT_GROUPS:
            if group == PINNED_GROUP:
                continue
            if track_families:
                solver.assert_and_track(payloads[group], z3.Bool(f"source__{group}"))
            else:
                solver.add(payloads[group])
    for name in active:
        payload = z3.And(*families[name])
        if track_families:
            solver.assert_and_track(payload, z3.Bool(f"source__pinned__{name}"))
        else:
            solver.add(payload)
    query = CarrierQuery(
        boundary_index,
        solver,
        original.variables,
        tuple(group for group in CONSTRAINT_GROUPS if group != PINNED_GROUP)
        + tuple(f"pinned__{name}" for name in active),
    )
    add_model_signature_constraints(query, signature)
    return query


def _canonical_atom_query(
    boundary_index: int,
    signature: Mapping[str, object],
    active_atoms: Iterable[str],
    *,
    timeout_ms: int,
    track_atoms: bool,
) -> CarrierQuery:
    source = build_query(boundary_index, timeout_ms=timeout_ms)
    atoms = pinned_source_families(source)["canonical_packet"]
    if len(atoms) != len(CANONICAL_PACKET_ATOMS):
        raise ValueError("canonical packet atom count drift")
    atom_by_name = dict(zip(CANONICAL_PACKET_ATOMS, atoms, strict=True))
    active = tuple(active_atoms)
    if len(set(active)) != len(active) or any(name not in atom_by_name for name in active):
        raise ValueError("invalid active canonical atom set")
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    for name in active:
        if track_atoms:
            solver.assert_and_track(
                atom_by_name[name], z3.Bool(f"source__canonical_packet__{name}")
            )
        else:
            solver.add(atom_by_name[name])
    query = CarrierQuery(boundary_index, solver, source.variables, tuple(active))
    add_model_signature_constraints(query, signature)
    return query


def _monolithic_status(
    boundary_index: int, signature: Mapping[str, object], *, timeout_ms: int
) -> str:
    query = build_query(boundary_index, timeout_ms=timeout_ms)
    add_model_signature_constraints(query, signature)
    return _status_name(query.solver.check())


def diagnose_signature(
    boundary_index: int, signature: Mapping[str, object], *, timeout_ms: int
) -> FamilyReplay:
    """Rebuild and shrink one complete source-replay failure by family."""

    monolithic_status = _monolithic_status(boundary_index, signature, timeout_ms=timeout_ms)
    split = _split_query(
        boundary_index,
        signature,
        FAMILY_NAMES,
        timeout_ms=timeout_ms,
        track_families=True,
        include_nonpinned_groups=True,
    )
    split_checked = split.solver.check()
    split_status = _status_name(split_checked)
    if monolithic_status != split_status:
        raise ValueError("monolithic and split source replay disagree")
    if split_checked != z3.unsat:
        return FamilyReplay(boundary_index, monolithic_status, split_status, (), (), {}, (), ())

    prefix = "source__pinned__"
    split_core = tuple(
        label.removeprefix(prefix)
        for label in sorted(str(atom) for atom in split.solver.unsat_core())
        if label.startswith(prefix)
    )
    if not split_core:
        raise ValueError("split source replay core omits pinned family labels")

    minimized = list(split_core)
    for family in tuple(split_core):
        candidate = tuple(name for name in minimized if name != family)
        trial = _split_query(
            boundary_index,
            signature,
            candidate,
            timeout_ms=timeout_ms,
            track_families=False,
            include_nonpinned_groups=False,
        )
        if trial.solver.check() == z3.unsat:
            minimized.remove(family)

    validated = _split_query(
        boundary_index,
        signature,
        minimized,
        timeout_ms=timeout_ms,
        track_families=False,
        include_nonpinned_groups=False,
    )
    if validated.solver.check() != z3.unsat:
        raise ValueError("split source core failed isolated replay")

    drop_status: dict[str, str] = {}
    for family in minimized:
        active = tuple(name for name in minimized if name != family)
        trial = _split_query(
            boundary_index,
            signature,
            active,
            timeout_ms=timeout_ms,
            track_families=False,
            include_nonpinned_groups=False,
        )
        drop_status[family] = _status_name(trial.solver.check())

    canonical_core: tuple[str, ...] = ()
    canonical_minimized: tuple[str, ...] = ()
    if "canonical_packet" in minimized:
        atom_query = _canonical_atom_query(
            boundary_index,
            signature,
            CANONICAL_PACKET_ATOMS,
            timeout_ms=timeout_ms,
            track_atoms=True,
        )
        if atom_query.solver.check() != z3.unsat:
            raise ValueError("canonical packet atom replay failed")
        atom_prefix = "source__canonical_packet__"
        canonical_core = tuple(
            label.removeprefix(atom_prefix)
            for label in sorted(str(atom) for atom in atom_query.solver.unsat_core())
            if label.startswith(atom_prefix)
        )
        if not canonical_core:
            raise ValueError("canonical packet atom core is empty")
        atom_minimized = list(canonical_core)
        for atom in tuple(canonical_core):
            candidate = tuple(name for name in atom_minimized if name != atom)
            trial = _canonical_atom_query(
                boundary_index,
                signature,
                candidate,
                timeout_ms=timeout_ms,
                track_atoms=False,
            )
            if trial.solver.check() == z3.unsat:
                atom_minimized.remove(atom)
        canonical_minimized = tuple(atom_minimized)
        final_atoms = _canonical_atom_query(
            boundary_index,
            signature,
            canonical_minimized,
            timeout_ms=timeout_ms,
            track_atoms=False,
        )
        if final_atoms.solver.check() != z3.unsat:
            raise ValueError("canonical packet atom core failed isolated replay")

    return FamilyReplay(
        boundary_index,
        monolithic_status,
        split_status,
        split_core,
        tuple(minimized),
        drop_status,
        canonical_core,
        canonical_minimized,
    )


def _run_cell(
    boundary_index: int,
    out_dir: Path,
    cadical: str,
    timeout_seconds: int,
) -> dict[str, object]:
    encoding = FreshThirdCarrierCnfEncoding(boundary_index)
    extra_clauses = no_alternating_cap_clauses(encoding)
    cnf = encoding.cnf_bytes(extra_clauses)
    out_dir.mkdir(parents=True, exist_ok=True)
    cnf_path = out_dir / "query.cnf"
    cnf_path.write_bytes(cnf)
    completed = subprocess.run(
        [cadical, "-q", "-t", str(timeout_seconds), str(cnf_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=timeout_seconds + 5,
        check=False,
    )
    result: dict[str, object] = {
        "boundary_index": boundary_index,
        "extra_clause_count": len(extra_clauses),
        "role_scope": list(FRONTIER_ROLE_SCOPE),
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
        "cadical_returncode": completed.returncode,
    }
    if completed.returncode != 10:
        result["status"] = "UNSAT" if completed.returncode == 20 else "UNKNOWN"
        return result
    assignment = _parse_model(completed.stdout, encoding.num_vars)
    encoding.validate(assignment)
    signature = encoding.model_signature(assignment)
    replay = diagnose_signature(
        boundary_index,
        signature,
        timeout_ms=timeout_seconds * 1_000,
    )
    result.update(
        {
            "status": "SAT_ABSTRACTION",
            "model_signature_sha256": hashlib.sha256(_canonical_json(signature)).hexdigest(),
            "source_replay": {
                "monolithic_status": replay.monolithic_status,
                "split_status": replay.split_status,
                "split_core": list(replay.split_core),
                "minimized_core": list(replay.minimized_core),
                "drop_status": replay.drop_status,
                "canonical_atom_core": list(replay.canonical_atom_core),
                "canonical_atom_minimized": list(replay.canonical_atom_minimized),
            },
        }
    )
    return result


def run(out_dir: Path, cadical: str = "cadical", timeout_seconds: int = 30) -> dict[str, object]:
    if timeout_seconds <= 0:
        raise ValueError("timeout_seconds must be positive")
    results = [
        _run_cell(i, out_dir / f"cell-{i}", cadical, timeout_seconds)
        for i in range(4)
    ]
    report = {
        "schema": SCHEMA,
        "purpose": "source-family replay diagnostic; no cut admission",
        "results": results,
    }
    (out_dir / "summary.json").write_bytes(_canonical_json(report))
    return report


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--timeout-seconds", type=int, default=30)
    args = parser.parse_args()
    run(args.out_dir, args.cadical, args.timeout_seconds)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
