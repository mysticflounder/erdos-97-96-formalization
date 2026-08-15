#!/usr/bin/env python3
"""Quotient exact two-Kalmanson cores by their induced cyclic order."""

from __future__ import annotations

import json
from collections import Counter
from itertools import chain
from pathlib import Path

from census.atail_force import producer_bank

ROOT = Path("scratch/rigid221-blockerv-exact17-20260806")
ROUNDS = {
    "v10": ROOT / "source-faithful-cap9-direct-cnf-v10-proposal-all24-analysis48",
    "v11": ROOT / "source-faithful-cap9-direct-cnf-v11-exact-all-cores",
    "v12t": ROOT / "source-faithful-cap9-direct-cnf-v12t-exact-all-cores-44",
    "v13h": ROOT / "source-faithful-cap9-direct-cnf-v13-schema-h-canary",
    "v14b": ROOT / "source-faithful-cap9-direct-cnf-v14b-all72-exact-cores",
    "v15i": ROOT / "source-faithful-cap9-direct-cnf-v15-schema-i-all72",
}


def exact_records(payload: dict[str, object]) -> list[dict[str, object]]:
    rows = tuple(
        producer_bank.MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            exact=bool(row["exact"]),
        )
        for row in payload["rows"]
    )
    order = tuple(int(point) for point in payload["order"])
    return producer_bank.enumerate_two_kalmanson_cancellations(rows, 17, order)


def primitive_atoms(record: dict[str, object]) -> tuple[tuple[int, int], ...]:
    core = record["core"]
    boundary = core["boundary_labels"]
    atoms = set()
    for path in core["paths"]:
        for step in path["steps"]:
            if step["kind"] == "row":
                center = int(boundary[int(step["center"])])
                atoms.add((center, int(boundary[int(step["first"])])))
                atoms.add((center, int(boundary[int(step["second"])])))
    return tuple(sorted(atoms))


def cyclic_normal_form(
    atoms: tuple[tuple[int, int], ...], order: tuple[int, ...]
) -> tuple[tuple[tuple[int, int], ...], dict[int, int]]:
    used = {point for atom in atoms for point in atom}
    induced = [point for point in order if point in used]
    candidates = []
    for oriented in (induced, list(reversed(induced))):
        for shift in range(len(oriented)):
            shifted = oriented[shift:] + oriented[:shift]
            relabel = {point: index for index, point in enumerate(shifted)}
            motif = tuple(sorted((relabel[center], relabel[point]) for center, point in atoms))
            candidates.append((motif, relabel))
    return min(candidates, key=lambda item: item[0])


def greedy_model_cover(
    candidates: set[tuple[tuple[int, int], ...]],
    targets: list[tuple[str, int, set[tuple[tuple[int, int], ...]]]],
    counts: Counter[tuple[tuple[int, int], ...]],
    representatives: dict[tuple[tuple[int, int], ...], dict[str, object]],
) -> dict[str, object]:
    """Greedily cover complete models, never individual motif occurrences."""
    uncovered = {(round_name, index) for round_name, index, _ in targets}
    target_by_label = {
        (round_name, index): motifs for round_name, index, motifs in targets
    }
    chosen = []
    remaining = set(candidates)
    while uncovered:
        scored = []
        for motif in remaining:
            newly_covered = {
                label for label in uncovered if motif in target_by_label[label]
            }
            if newly_covered:
                scored.append((len(newly_covered), counts[motif], motif, newly_covered))
        if not scored:
            break
        _, occurrence_count, motif, newly_covered = max(
            scored, key=lambda item: (item[0], item[1], item[2])
        )
        chosen.append(
            {
                "new_models_covered": len(newly_covered),
                "new_coverage_by_round": dict(
                    Counter(round_name for round_name, _ in newly_covered)
                ),
                "occurrence_count": occurrence_count,
                "vertex_count": 1 + max(point for atom in motif for point in atom),
                "width": len(motif),
                "motif": [list(atom) for atom in motif],
                "representative": representatives[motif],
            }
        )
        uncovered -= newly_covered
        remaining.remove(motif)
    return {
        "candidate_count": len(candidates),
        "target_model_count": len(targets),
        "chosen_count": len(chosen),
        "uncovered_models": [list(label) for label in sorted(uncovered)],
        "chosen": chosen,
    }


def main() -> None:
    round_models: dict[str, list[set[tuple[tuple[int, int], ...]]]] = {}
    round_counts: dict[str, Counter[tuple[tuple[int, int], ...]]] = {}
    representatives: dict[tuple[tuple[int, int], ...], dict[str, object]] = {}

    for round_name, round_root in ROUNDS.items():
        models = []
        counts: Counter[tuple[tuple[int, int], ...]] = Counter()
        for analysis in sorted(round_root.glob("**/seed-*.analysis.json")):
            payload = json.loads(analysis.read_text())
            order = tuple(int(point) for point in payload["order"])
            model_motifs = set()
            for record in exact_records(payload):
                atoms = primitive_atoms(record)
                motif, relabel = cyclic_normal_form(atoms, order)
                counts[motif] += 1
                model_motifs.add(motif)
                representatives.setdefault(
                    motif,
                    {
                        "round": round_name,
                        "analysis": str(analysis),
                        "order": list(order),
                        "atoms": [list(atom) for atom in atoms],
                        "canonical_relabel": {str(key): value for key, value in relabel.items()},
                        "record": record,
                    },
                )
            models.append(model_motifs)
        round_models[round_name] = models
        round_counts[round_name] = counts

    all_counts = sum(round_counts.values(), Counter())
    recurring_rounds = {
        motif: [name for name, counts in round_counts.items() if motif in counts]
        for motif in all_counts
    }
    top = []
    for motif, count in all_counts.most_common(40):
        top.append(
            {
                "count": count,
                "vertex_count": 1 + max(point for atom in motif for point in atom),
                "width": len(motif),
                "motif": [list(atom) for atom in motif],
                "round_counts": {
                    name: counts[motif] for name, counts in round_counts.items()
                },
                "model_coverage": {
                    name: sum(motif in model for model in models)
                    for name, models in round_models.items()
                },
                "rounds": recurring_rounds[motif],
                "representative": representatives[motif],
            }
        )

    training_coverage = {}
    training_pairs = [
        (("v10",), "v11"),
        (("v10",), "v12t"),
        (("v11",), "v12t"),
        (("v10", "v11"), "v12t"),
        (("v10",), "v13h"),
        (("v10", "v11"), "v13h"),
        (("v10", "v11", "v12t"), "v13h"),
        (("v10",), "v14b"),
        (("v10", "v11"), "v14b"),
        (("v10", "v11", "v12t"), "v14b"),
        (("v10", "v11", "v12t", "v13h"), "v14b"),
        (("v10", "v11", "v12t", "v13h", "v14b"), "v15i"),
    ]
    for source_names, target_name in training_pairs:
        bank = set().union(*(set(round_counts[name]) for name in source_names))
        target_models = round_models[target_name]
        key = "+".join(source_names) + "->" + target_name
        training_coverage[key] = {
            "models_hit": sum(bool(bank & model) for model in target_models),
            "model_count": len(target_models),
            "hit_counts": [len(bank & model) for model in target_models],
        }

    targets_by_round = {
        name: [(name, index, motifs) for index, motifs in enumerate(models)]
        for name, models in round_models.items()
    }
    greedy_covers = {
        "v10->v11+v12t": greedy_model_cover(
            set(round_counts["v10"]),
            targets_by_round["v11"] + targets_by_round["v12t"],
            all_counts,
            representatives,
        ),
        "v10+v11->v12t": greedy_model_cover(
            set(round_counts["v10"]) | set(round_counts["v11"]),
            targets_by_round["v12t"],
            all_counts,
            representatives,
        ),
        "v10+v11+v12t->v13h": greedy_model_cover(
            set(round_counts["v10"])
            | set(round_counts["v11"])
            | set(round_counts["v12t"]),
            targets_by_round["v13h"],
            all_counts,
            representatives,
        ),
        "v10+v11+v12t+v13h->v14b": greedy_model_cover(
            set(round_counts["v10"])
            | set(round_counts["v11"])
            | set(round_counts["v12t"])
            | set(round_counts["v13h"]),
            targets_by_round["v14b"],
            all_counts,
            representatives,
        ),
        "v10+v11+v12t+v13h+v14b->v15i": greedy_model_cover(
            set(round_counts["v10"])
            | set(round_counts["v11"])
            | set(round_counts["v12t"])
            | set(round_counts["v13h"])
            | set(round_counts["v14b"]),
            targets_by_round["v15i"],
            all_counts,
            representatives,
        ),
        "recurring->all": greedy_model_cover(
            {motif for motif, names in recurring_rounds.items() if len(names) >= 2},
            list(chain.from_iterable(targets_by_round.values())),
            all_counts,
            representatives,
        ),
    }

    output = {
        "schema": "rigid221-exact17-cyclic-two-kalmanson-motif-audit-v1",
        "rounds": {
            name: {
                "model_count": len(round_models[name]),
                "occurrence_count": sum(counts.values()),
                "motif_count": len(counts),
            }
            for name, counts in round_counts.items()
        },
        "union_motif_count": len(all_counts),
        "multi_round_motif_count": sum(len(names) >= 2 for names in recurring_rounds.values()),
        "all_round_motif_count": sum(
            len(names) == len(ROUNDS) for names in recurring_rounds.values()
        ),
        "training_coverage": training_coverage,
        "greedy_model_covers": greedy_covers,
        "top_motifs": top,
    }
    output_path = ROOT / "cyclic-two-kalmanson-motif-audit.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(output_path)
    print(json.dumps({key: value for key, value in output.items() if key != "top_motifs"}))
    print(json.dumps(top[:5]))


if __name__ == "__main__":
    main()
