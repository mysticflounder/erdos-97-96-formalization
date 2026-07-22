#!/usr/bin/env python3
"""Ordinal-cycle CEGAR for the exact-five all-one B0 parent outer.

Each decoded structural model is independently checked.  All selected row
equalities (m, g0, g1, b1) and the complete exact-five shell are quotiented.
Every one-term cancellation of a strict Kalmanson inequality becomes a
directed strict-distance comparison.  A shortest directed cycle is replayed
to its exact row-membership reasons and that conjunction alone is blocked.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from collections import deque
from dataclasses import dataclass
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parents[3]
OUTER_DIR = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
OUTER_PATH = OUTER_DIR / "encode.py"
ATOM = tuple[int, int]


def load_outer_module():
    sys.path.insert(0, str(OUTER_DIR))
    spec = importlib.util.spec_from_file_location("exact5_b0_cegar", OUTER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load exact-five B0 outer")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def edge(left: int, right: int) -> ATOM:
    if left == right:
        raise ValueError("distance atom endpoints coincide")
    return tuple(sorted((left, right)))


@dataclass(frozen=True)
class EqualityReason:
    left: ATOM
    right: ATOM
    literals: tuple[tuple[str, int, int], ...]


@dataclass(frozen=True)
class StrictReason:
    source: ATOM
    target: ATOM
    quadruple: tuple[int, int, int, int]
    canceled_positive: ATOM
    canceled_negative: ATOM


class DisjointSet:
    def __init__(self, items):
        self.parent = {item: item for item in items}

    def find(self, item):
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left, right):
        left, right = self.find(left), self.find(right)
        if left != right:
            self.parent[right] = left


def normalized_rows(raw):
    return {int(center): set(support) for center, support in raw.items()}


def equality_reasons(module, decoded):
    answer = []
    families = [
        ("m", normalized_rows(decoded["rows"])),
        ("g0", normalized_rows(decoded["cover_rows"][0])),
        ("g1", normalized_rows(decoded["cover_rows"][1])),
    ]
    for name, rows in families:
        for center, support in rows.items():
            for left, right in itertools.combinations(sorted(support), 2):
                answer.append(EqualityReason(
                    edge(center, left), edge(center, right),
                    ((name, center, left), (name, center, right)),
                ))
    b1 = sorted(decoded["b1"])
    for left, right in itertools.combinations(b1, 2):
        answer.append(EqualityReason(
            edge(module.FIRST_APEX, left), edge(module.FIRST_APEX, right),
            (("b1", module.FIRST_APEX, left),
             ("b1", module.FIRST_APEX, right)),
        ))
    shell = sorted(decoded["shell"])
    for left, right in itertools.combinations(shell, 2):
        answer.append(EqualityReason(
            edge(module.SECOND_APEX, left), edge(module.SECOND_APEX, right),
            (("shell", module.SECOND_APEX, left),
             ("shell", module.SECOND_APEX, right)),
        ))
    return tuple(answer)


def equality_path(start, target, adjacency):
    if start == target:
        return ()
    parent = {start: None}
    queue = deque([start])
    while queue and target not in parent:
        current = queue.popleft()
        for neighbor, reason in adjacency.get(current, ()):
            if neighbor in parent:
                continue
            parent[neighbor] = (current, reason)
            queue.append(neighbor)
    if target not in parent:
        raise AssertionError(f"missing equality path {start} -> {target}")
    answer = []
    current = target
    while current != start:
        predecessor, reason = parent[current]
        answer.append(reason)
        current = predecessor
    answer.reverse()
    return tuple(answer)


def shortest_directed_cycle(strict, dsu):
    adjacency = {}
    for reason in strict:
        source, target = dsu.find(reason.source), dsu.find(reason.target)
        if source == target:
            return (reason,)
        adjacency.setdefault(source, []).append(reason)

    best = None
    for start in sorted(adjacency):
        queue = deque([start])
        parent = {start: None}
        terminal = None
        while queue and terminal is None:
            current = queue.popleft()
            for reason in adjacency.get(current, ()):
                target = dsu.find(reason.target)
                if target == start:
                    terminal = (current, reason)
                    break
                if target not in parent:
                    parent[target] = (current, reason)
                    queue.append(target)
        if terminal is None:
            continue
        current, closing = terminal
        path = [closing]
        while current != start:
            predecessor, reason = parent[current]
            path.append(reason)
            current = predecessor
        path.reverse()
        candidate = tuple(path)
        if best is None or len(candidate) < len(best):
            best = candidate
    return best


def ordinal_cycle(module, decoded):
    atoms = tuple(itertools.combinations(module.VERTICES, 2))
    dsu = DisjointSet(atoms)
    equalities = equality_reasons(module, decoded)
    adjacency = {}
    for reason in equalities:
        dsu.union(reason.left, reason.right)
        adjacency.setdefault(reason.left, []).append((reason.right, reason))
        adjacency.setdefault(reason.right, []).append((reason.left, reason))

    strict = []
    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for pi in range(2):
                for ni in range(2):
                    if dsu.find(positive[pi]) != dsu.find(negative[ni]):
                        continue
                    strict.append(StrictReason(
                        source=negative[1 - ni],
                        target=positive[1 - pi],
                        quadruple=(a, b, c, d),
                        canceled_positive=positive[pi],
                        canceled_negative=negative[ni],
                    ))
    cycle = shortest_directed_cycle(strict, dsu)
    if cycle is None:
        return None

    dependency_literals = set()
    canceled_paths = []
    connector_paths = []
    for index, reason in enumerate(cycle):
        canceled = equality_path(
            reason.canceled_positive, reason.canceled_negative, adjacency
        )
        following = cycle[(index + 1) % len(cycle)]
        connector = equality_path(reason.target, following.source, adjacency)
        canceled_paths.append(canceled)
        connector_paths.append(connector)
        for equality in (*canceled, *connector):
            dependency_literals.update(equality.literals)

    def serialize_equality(reason):
        return {
            "left": list(reason.left),
            "right": list(reason.right),
            "literals": [list(item) for item in reason.literals],
        }

    return {
        "cycle": cycle,
        "dependency_literals": tuple(sorted(dependency_literals)),
        "certificate": {
            "lean_consumer": (
                "Problem97.ATailOrdinalKalmansonCycle.false_of_transGen_cycle"
            ),
            "cycle_length": len(cycle),
            "strict_edges": [
                {
                    "left": list(reason.source),
                    "right": list(reason.target),
                    "quadruple": list(reason.quadruple),
                    "canceled_positive": list(reason.canceled_positive),
                    "canceled_negative": list(reason.canceled_negative),
                }
                for reason in cycle
            ],
            "canceled_equalities": [
                [serialize_equality(item) for item in path]
                for path in canceled_paths
            ],
            "equality_connectors": [
                [serialize_equality(item) for item in path]
                for path in connector_paths
            ],
            "dependency_literals": [list(item) for item in sorted(dependency_literals)],
        },
    }


def full_kalmanson_core(module, decoded, timeout_ms=10_000):
    """Return a replayed row-dependency core for full linear Kalmanson UNSAT."""
    variables = {
        atom: z3.Real(f"fk_d_{atom[0]}_{atom[1]}")
        for atom in itertools.combinations(module.VERTICES, 2)
    }

    def value(left, right):
        return variables[edge(left, right)]

    formulas = {}
    dependencies = {}
    serial = 0

    def add_equality(left, right, literals):
        nonlocal serial
        name = f"eq_{serial}"
        serial += 1
        formulas[name] = value(*left) == value(*right)
        dependencies[name] = tuple(literals)

    for family, rows in (
        ("m", normalized_rows(decoded["rows"])),
        ("g0", normalized_rows(decoded["cover_rows"][0])),
        ("g1", normalized_rows(decoded["cover_rows"][1])),
    ):
        for center, support in rows.items():
            points = sorted(support)
            anchor = points[0]
            for point in points[1:]:
                add_equality(
                    edge(center, anchor), edge(center, point),
                    ((family, center, anchor), (family, center, point)),
                )
    b1 = sorted(decoded["b1"])
    for point in b1[1:]:
        add_equality(
            edge(module.FIRST_APEX, b1[0]),
            edge(module.FIRST_APEX, point),
            (("b1", module.FIRST_APEX, b1[0]),
             ("b1", module.FIRST_APEX, point)),
        )
    shell = sorted(decoded["shell"])
    for point in shell[1:]:
        add_equality(
            edge(module.SECOND_APEX, shell[0]),
            edge(module.SECOND_APEX, point),
            (("shell", module.SECOND_APEX, shell[0]),
             ("shell", module.SECOND_APEX, point)),
        )

    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        diagonal = value(a, c) + value(b, d)
        formulas[f"kal_abcd_{a}_{b}_{c}_{d}"] = (
            diagonal >= value(a, b) + value(c, d) + 1
        )
        formulas[f"kal_adbc_{a}_{b}_{c}_{d}"] = (
            diagonal >= value(a, d) + value(b, c) + 1
        )

    equality_names = tuple(dependencies)
    kalmanson_names = tuple(name for name in formulas if name not in dependencies)
    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms, random_seed=0)
    solver.add(*(formulas[name] for name in kalmanson_names))
    for name in equality_names:
        solver.assert_and_track(formulas[name], z3.Bool(name))
    verdict = solver.check()
    if verdict == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    if verdict == z3.sat:
        return {"status": "SAT"}

    core_names = [str(item) for item in solver.unsat_core()]

    # Deletion-minimize only the contingent row equalities.  All strict
    # Kalmanson axioms stay present and untracked in every probe.
    index = 0
    while index < len(core_names):
        trial_names = core_names[:index] + core_names[index + 1:]
        probe = z3.SolverFor("QF_LRA")
        probe.set(timeout=timeout_ms, random_seed=0)
        probe.add(*(formulas[name] for name in kalmanson_names))
        probe.add(*(formulas[name] for name in trial_names))
        probe_verdict = probe.check()
        if probe_verdict == z3.unknown:
            return {
                "status": "UNKNOWN",
                "reason": "deletion minimization: " + probe.reason_unknown(),
            }
        if probe_verdict == z3.unsat:
            core_names = trial_names
        else:
            index += 1

    replay = z3.SolverFor("QF_LRA")
    replay.set(timeout=timeout_ms, random_seed=1)
    replay.add(*(formulas[name] for name in kalmanson_names))
    replay.add(*(formulas[name] for name in core_names))
    replay_verdict = replay.check()
    if replay_verdict != z3.unsat:
        raise AssertionError(f"full Kalmanson core replay was {replay_verdict}")
    literal_dependencies = sorted({
        literal
        for name in core_names for literal in dependencies[name]
    })
    if not literal_dependencies:
        raise AssertionError("full Kalmanson core has no row dependency")
    return {
        "status": "UNSAT_CORE_REPLAYED",
        "kalmanson_axiom_count": len(kalmanson_names),
        "core_row_equality_count": len(core_names),
        "dependency_literals": literal_dependencies,
        "core_names": core_names,
    }


def symbolic_literal(outer, literal):
    family, center, point = literal
    if family == "m":
        return outer.m[center, point]
    if family == "g0":
        return outer.cover[0][center, point]
    if family == "g1":
        return outer.cover[1][center, point]
    if family == "b1":
        if center != 4:
            raise AssertionError(literal)
        return outer.b1[point]
    if family == "shell":
        if center != 8:
            raise AssertionError(literal)
        return outer.shell[point]
    raise AssertionError(literal)


def row_instances_at(outer, center):
    """All source-valid selected four rows represented at one center."""
    answer = [outer.m, outer.cover[0], outer.cover[1]]
    if center == 4:
        # b1 is represented only at the fixed first apex.
        answer.append(None)
    return answer


def row_member(outer, instance, center, point):
    return outer.b1[point] if instance is None else instance[center, point]


def add_five_ccw_schema_cuts(module, outer):
    """Preload every cyclic embedding of the production 5-role/3-row sink."""
    count = 0
    pending = []
    for subset in itertools.combinations(module.VERTICES, 5):
        for rotation in range(5):
            cycle = subset[rotation:] + subset[:rotation]
            iO, iA, iY, iE, iC = cycle
            for ORow in row_instances_at(outer, iO):
                for ARow in row_instances_at(outer, iA):
                    for YRow in row_instances_at(outer, iY):
                        pending.append(z3.Not(z3.And(
                            row_member(outer, YRow, iY, iO),
                            row_member(outer, YRow, iY, iE),
                            row_member(outer, ORow, iO, iE),
                            row_member(outer, ORow, iO, iC),
                            row_member(outer, ARow, iA, iC),
                            row_member(outer, ARow, iA, iO),
                        )))
                        count += 1
                        if len(pending) == 2048:
                            outer.solver.add(*pending)
                            pending.clear()
    if pending:
        outer.solver.add(*pending)
    return count


def canonical_cyclic_pattern(literals):
    """Canonicalize a positive row-membership pattern modulo cyclic relabeling."""
    literals = tuple(sorted(map(tuple, literals)))
    roles = sorted({value for _, center, point in literals for value in (center, point)})
    candidates = []
    for rotation in range(len(roles)):
        cycle = roles[rotation:] + roles[:rotation]
        rename = {value: index for index, value in enumerate(cycle)}
        normalized = tuple(sorted(
            (family, rename[center], rename[point])
            for family, center, point in literals
        ))
        candidates.append(normalized)
    return min(candidates)


def add_cyclic_pattern_embeddings(module, outer, pattern):
    """Block all cyclic-order-preserving embeddings of one proved pattern."""
    role_count = 1 + max(
        value for _, center, point in pattern for value in (center, point)
    )
    pending = []
    count = 0
    for subset in itertools.combinations(module.VERTICES, role_count):
        for rotation in range(role_count):
            target = subset[rotation:] + subset[:rotation]
            mapped = []
            valid = True
            for family, center, point in pattern:
                mapped_center = target[center]
                mapped_point = target[point]
                if family == "b1" and mapped_center != module.FIRST_APEX:
                    valid = False
                    break
                if family == "shell" and mapped_center != module.SECOND_APEX:
                    valid = False
                    break
                mapped.append((family, mapped_center, mapped_point))
            if not valid:
                continue
            pending.append(z3.Not(z3.And(*(
                symbolic_literal(outer, literal) for literal in mapped
            ))))
            count += 1
            if len(pending) == 2048:
                outer.solver.add(*pending)
                pending.clear()
    if pending:
        outer.solver.add(*pending)
    return count


def pattern_has_ordinal_cycle(pattern):
    """Independently verify that a normalized membership schema is cyclic."""
    n = 1 + max(value for _, center, point in pattern
                for value in (center, point))
    atoms = tuple(itertools.combinations(range(n), 2))
    dsu = DisjointSet(atoms)
    supports = {}
    for family, center, point in pattern:
        supports.setdefault((family, center), set()).add(point)
    for (_family, center), support in supports.items():
        support = sorted(support)
        if len(support) < 2:
            continue
        reference = edge(center, support[0])
        for point in support[1:]:
            dsu.union(reference, edge(center, point))
    strict = []
    for a, b, c, d in itertools.combinations(range(n), 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for pi in range(2):
                for ni in range(2):
                    if dsu.find(positive[pi]) == dsu.find(negative[ni]):
                        strict.append(StrictReason(
                            source=negative[1 - ni],
                            target=positive[1 - pi],
                            quadruple=(a, b, c, d),
                            canceled_positive=positive[pi],
                            canceled_negative=negative[ni],
                        ))
    return shortest_directed_cycle(strict, dsu) is not None


def deletion_minimize_ordinal_literals(literals):
    """Greedily minimize a sufficient membership-level ordinal cycle core."""
    retained = list(sorted(set(map(tuple, literals))))
    index = 0
    while index < len(retained):
        trial = retained[:index] + retained[index + 1:]
        if trial and pattern_has_ordinal_cycle(tuple(trial)):
            retained = trial
        else:
            index += 1
    pattern = canonical_cyclic_pattern(tuple(retained))
    if not pattern_has_ordinal_cycle(pattern):
        raise AssertionError("minimized ordinal pattern failed replay")
    return tuple(retained), pattern


def core_membership_literals(core):
    """Translate the equality part of a mined core to sufficient row facts."""
    literals = set()
    for item in core["constraints"]:
        if item["kind"] == "rowEquality":
            family = str(item["family"])
            center = int(item["center"])
            literals.add((family, center, int(item["left"])))
            literals.add((family, center, int(item["right"])))
        elif item["kind"] == "frontierFirstEquality":
            # In B0 both named points occur in m at the first apex; membership
            # is a stronger, source-valid antecedent for this metric equality.
            literals.add(("m", 4, int(item["q"])))
            literals.add(("m", 4, int(item["w"])))
        elif item["kind"] == "frontierSecondSeparation":
            # Quotient-cycle classification does not use this disequality.
            continue
        else:
            raise AssertionError(item["kind"])
    return tuple(sorted(literals))


def add_mined_ordinal_core_bank(
    module, outer, classification_path, checkpoint_paths,
    embedding_budget=500_000,
):
    """Preload all concrete cores and high-yield cyclic m-only schemas."""
    if classification_path is None or not classification_path.exists() or not all(
        path.exists() for path in checkpoint_paths.values()
    ):
        return {
            "available": False,
            "concrete_cuts": 0,
            "generalized_schemas": 0,
            "generalized_embedding_cuts": 0,
            "banked_core_coverage": 0,
        }
    classification = json.loads(classification_path.read_text())
    checkpoints = {
        orbit: json.loads(path.read_text())
        for orbit, path in checkpoint_paths.items()
    }
    concrete = []
    frequencies = {}
    verified = set()
    for record in classification["records"]:
        if record["force"] != "quotientOrdinalCycle":
            continue
        core = checkpoints[record["orbit"]]["concrete_core_blocks"][
            record["core_index"]
        ]
        literals = core_membership_literals(core)
        pattern = canonical_cyclic_pattern(literals)
        if pattern not in verified:
            if not pattern_has_ordinal_cycle(pattern):
                raise AssertionError("banked quotient-cycle pattern failed replay")
            verified.add(pattern)
        concrete.append(literals)
        if record["scope"] == "mOnly":
            frequencies[pattern] = frequencies.get(pattern, 0) + 1

    pending = []
    for literals in concrete:
        pending.append(z3.Not(z3.And(*(
            symbolic_literal(outer, literal) for literal in literals
        ))))
        if len(pending) == 2048:
            outer.solver.add(*pending)
            pending.clear()
    if pending:
        outer.solver.add(*pending)

    def embedding_cost(pattern):
        k = 1 + max(value for _, center, point in pattern
                    for value in (center, point))
        # m-only schemas have no fixed-center filtering.
        import math
        return math.comb(module.N, k) * k

    schemas = sorted(
        frequencies,
        key=lambda pattern: (
            -(frequencies[pattern] / embedding_cost(pattern)),
            -frequencies[pattern], pattern,
        ),
    )
    spent = 0
    selected = []
    coverage = 0
    for pattern in schemas:
        cost = embedding_cost(pattern)
        if spent + cost > embedding_budget:
            continue
        spent += cost
        coverage += frequencies[pattern]
        selected.append(pattern)
        added = add_cyclic_pattern_embeddings(module, outer, pattern)
        if added != cost:
            raise AssertionError("m-only embedding count mismatch")
    return {
        "available": True,
        "concrete_cuts": len(concrete),
        "unique_verified_schemas": len(verified),
        "generalized_schemas": len(selected),
        "generalized_embedding_cuts": spent,
        "banked_core_coverage": coverage,
        "banked_m_only_core_count": sum(frequencies.values()),
        "embedding_budget": embedding_budget,
    }


def add_shell_shared_pair_parity_cuts(module, outer):
    """Add the missing two-center parity sink for the complete shell row."""
    count = 0
    pending = []
    shell_center = module.SECOND_APEX
    for other_center in module.VERTICES:
        if other_center == shell_center:
            continue
        left, right = sorted((shell_center, other_center))
        targets = [p for p in module.VERTICES if p not in {left, right}]
        for a, b in itertools.combinations(targets, 2):
            if (left < a < right) != (left < b < right):
                continue
            for instance in row_instances_at(outer, other_center):
                pending.append(z3.Not(z3.And(
                    outer.shell[a], outer.shell[b],
                    row_member(outer, instance, other_center, a),
                    row_member(outer, instance, other_center, b),
                )))
                count += 1
                if len(pending) == 2048:
                    outer.solver.add(*pending)
                    pending.clear()
    if pending:
        outer.solver.add(*pending)
    return count


def analyze_fixed(module, path):
    payload = json.loads(path.read_text())
    decoded = payload["decoded"]
    errors = module.verify_decoded(decoded)
    if errors:
        raise AssertionError("fixed B0 verification failed: " + "; ".join(errors))
    found = ordinal_cycle(module, decoded)
    return {
        "status": "FIXED_MODEL_CYCLIC" if found else "FIXED_MODEL_ACYCLIC",
        "input": str(path),
        "orbit": decoded["orbit"],
        "certificate": found["certificate"] if found else None,
    }


def solve(args):
    module = load_outer_module()
    if args.fixed_input:
        return analyze_fixed(module, args.fixed_input)

    started = time.monotonic()
    deadline = started + args.seconds
    outer = module.Outer(args.orbit, max(1, int(args.seconds * 1000)), args.seed)
    shell_parity_cut_count = add_shell_shared_pair_parity_cuts(module, outer)
    schema_cut_count = (
        add_five_ccw_schema_cuts(module, outer)
        if args.preload_five_schema else 0
    )
    checkpoint_paths = {}
    if args.bank_checkpoint:
        for path in args.bank_checkpoint:
            payload = json.loads(path.read_text())
            checkpoint_paths[str(payload["orbit"])] = path
    mined_bank = add_mined_ordinal_core_bank(
        module, outer, args.classification, checkpoint_paths,
        args.mined_embedding_budget,
    )
    connectivity_cuts = {"m": 0, "g0": 0, "g1": 0}
    ordinal_cuts = 0
    full_kalmanson_cuts = 0
    cycle_histogram = {}
    shortest_certificate = None
    generalized_patterns = set()
    generalized_embedding_cuts = 0
    iterations = 0
    while iterations < args.max_iterations:
        iterations += 1
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            status, reason = "UNKNOWN", "wall budget"
            break
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=args.seed)
        verdict = outer.solver.check()
        if verdict == z3.unsat:
            status, reason = "UNSAT_EXTERNAL_CEGAR_NO_CERTIFICATE", None
            break
        if verdict == z3.unknown:
            status, reason = "UNKNOWN", outer.solver.reason_unknown()
            break

        decoded = outer.decode(outer.solver.model())
        families = [
            normalized_rows(decoded["rows"]),
            *[normalized_rows(raw) for raw in decoded["cover_rows"]],
        ]
        added_connectivity = False
        for name, symbolic, rows in zip(
            ("m", "g0", "g1"), (outer.m, *outer.cover), families, strict=True
        ):
            for component in module.sink_sccs(rows):
                if len(component) < module.N:
                    outer.add_connectivity_cut(symbolic, component)
                    connectivity_cuts[name] += 1
                    added_connectivity = True
        if added_connectivity:
            continue

        errors = module.verify_decoded(decoded)
        if errors:
            raise AssertionError("decoded B0 verification failed: " + "; ".join(errors))
        found = ordinal_cycle(module, decoded)
        if found is None:
            full = full_kalmanson_core(
                module, decoded,
                timeout_ms=max(1, min(10_000, remaining_ms)),
            )
            if full["status"] == "UNKNOWN":
                status, reason = "UNKNOWN", "full Kalmanson: " + full["reason"]
                break
            if full["status"] == "SAT":
                status, reason = "SAT_VERIFIED_FULL_KALMANSON_SURVIVOR", None
                survivor = decoded
                break
            literals = tuple(map(tuple, full["dependency_literals"]))
            full_kalmanson_cuts += 1
            cut_kind = "full_kalmanson"
            cut_metadata = {
                "kalmanson_axiom_count": full["kalmanson_axiom_count"],
                "core_row_equality_count": full["core_row_equality_count"],
            }
        else:
            literals, pattern = deletion_minimize_ordinal_literals(
                found["dependency_literals"]
            )
            ordinal_cuts += 1
            length = found["certificate"]["cycle_length"]
            cycle_histogram[str(length)] = cycle_histogram.get(str(length), 0) + 1
            if (shortest_certificate is None
                    or length < shortest_certificate["cycle_length"]):
                shortest_certificate = found["certificate"]
            cut_kind = "ordinal"
            cut_metadata = {
                "cycle_length": length,
                "minimized_dependency_literal_count": len(literals),
            }
        if not literals:
            raise AssertionError("geometric contradiction has no row dependencies")
        if cut_kind != "ordinal":
            pattern = canonical_cyclic_pattern(literals)
        if pattern not in generalized_patterns:
            generalized_patterns.add(pattern)
            generalized_embedding_cuts += add_cyclic_pattern_embeddings(
                module, outer, pattern
            )
        total_geometric_cuts = ordinal_cuts + full_kalmanson_cuts
        if args.log and (total_geometric_cuts <= 20
                         or total_geometric_cuts % 100 == 0):
            with args.log.open("a") as handle:
                handle.write(json.dumps({
                    "phase": cut_kind + "_cut",
                    "iteration": iterations,
                    "ordinal_cuts": ordinal_cuts,
                    "full_kalmanson_cuts": full_kalmanson_cuts,
                    "dependency_literal_count": len(literals),
                    "elapsed_seconds": time.monotonic() - started,
                    **cut_metadata,
                }, sort_keys=True) + "\n")
    else:
        status, reason = "UNKNOWN", "iteration budget"

    result = {
        "schema": "p97-exact5-allone-ordinal-cycle-cegar-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_BOUNDED_IF_UNSAT_OR_UNKNOWN",
        "status": status,
        "reason": reason,
        "orbit": args.orbit,
        "seed": args.seed,
        "elapsed_seconds": time.monotonic() - started,
        "iterations": iterations,
        "connectivity_cuts": connectivity_cuts,
        "ordinal_cycle_cuts": ordinal_cuts,
        "full_kalmanson_cuts": full_kalmanson_cuts,
        "generalized_pattern_count": len(generalized_patterns),
        "generalized_embedding_cuts": generalized_embedding_cuts,
        "preloaded_five_ccw_schema_cuts": schema_cut_count,
        "preloaded_shell_shared_pair_parity_cuts": shell_parity_cut_count,
        "preloaded_mined_ordinal_bank": mined_bank,
        "full_kalmanson_scope": (
            "all strict common-order Kalmanson axioms plus decoded m/g0/g1/b1 "
            "row equalities and complete second-apex shell equalities; no other "
            "parent metric fields, triangle inequalities, positivity, MEC, or "
            "Euclidean realizability"
        ),
        "cycle_length_histogram": cycle_histogram,
        "shortest_cycle_certificate": shortest_certificate,
    }
    if status == "SAT_VERIFIED_FULL_KALMANSON_SURVIVOR":
        result["decoded"] = survivor
    return result


def main():
    module = load_outer_module()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=tuple(module.ORBIT_ROLES))
    parser.add_argument("--fixed-input", type=Path)
    parser.add_argument("--seconds", type=float, default=180.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--max-iterations", type=int, default=100000)
    parser.add_argument("--mined-embedding-budget", type=int, default=0)
    parser.add_argument("--preload-five-schema", action="store_true")
    parser.add_argument("--classification", type=Path)
    parser.add_argument("--bank-checkpoint", type=Path, action="append")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--log", type=Path)
    args = parser.parse_args()
    if (args.orbit is None) == (args.fixed_input is None):
        parser.error("exactly one of --orbit and --fixed-input is required")
    if (args.classification is None) != (args.bank_checkpoint is None):
        parser.error(
            "--classification and repeated --bank-checkpoint must be supplied together"
        )
    result = solve(args)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
