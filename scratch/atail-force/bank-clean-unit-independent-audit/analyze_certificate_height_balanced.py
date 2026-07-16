#!/usr/bin/env python3
"""Add a strict height-balanced sparse merge plan to the certificate analysis."""

from __future__ import annotations

import json
import time

import analyze_certificate_merge as analysis


def height_balanced_merge(
    products: list[analysis.SparsePoly], dimension: int
) -> dict[str, object]:
    """Huffman-style merge: always consume the minimum-height layer first."""

    next_id = len(products)
    nodes = [
        analysis.MergeNode(
            node_id=index,
            leaves=(index,),
            polynomial=product,
            height=0,
            peak=len(product),
            tree={
                "kind": "leaf",
                "generator_index": index,
                "support_size": len(product),
            },
        )
        for index, product in enumerate(products)
    ]
    merges: list[dict[str, object]] = []
    while len(nodes) > 1:
        minimum_height = min(node.height for node in nodes)
        low_positions = [
            position
            for position, node in enumerate(nodes)
            if node.height == minimum_height
        ]
        if len(low_positions) >= 2:
            pairs = [
                (low_positions[left], low_positions[right])
                for left in range(len(low_positions))
                for right in range(left + 1, len(low_positions))
            ]
        else:
            left_position = low_positions[0]
            next_height = min(
                node.height
                for position, node in enumerate(nodes)
                if position != left_position
            )
            pairs = [
                (left_position, position)
                for position, node in enumerate(nodes)
                if position != left_position and node.height == next_height
            ]

        ranked: list[tuple[tuple[int, int, int, int], int, int, int]] = []
        for left_position, right_position in pairs:
            left = nodes[left_position]
            right = nodes[right_position]
            support = analysis.sum_support_size(left.polynomial, right.polynomial)
            peak = max(left.peak, right.peak, support)
            rank = (
                peak,
                support,
                abs(len(left.leaves) - len(right.leaves)),
                left.node_id + right.node_id,
            )
            ranked.append((rank, left_position, right_position, support))
        _, left_position, right_position, predicted_support = min(ranked)
        left = nodes[left_position]
        right = nodes[right_position]
        polynomial = analysis.add_sparse(left.polynomial, right.polynomial)
        if len(polynomial) != predicted_support:
            raise AssertionError("support predictor disagrees with merge")
        height = max(left.height, right.height) + 1
        peak = max(left.peak, right.peak, len(polynomial))
        record = {
            "node_id": next_id,
            "left_node_id": left.node_id,
            "right_node_id": right.node_id,
            "left_leaves": list(left.leaves),
            "right_leaves": list(right.leaves),
            "support_size": len(polynomial),
            "subtree_peak_support": peak,
            "height": height,
        }
        tree = {
            "kind": "merge",
            **record,
            "left": left.tree,
            "right": right.tree,
        }
        node = analysis.MergeNode(
            node_id=next_id,
            leaves=tuple(sorted(left.leaves + right.leaves)),
            polynomial=polynomial,
            height=height,
            peak=peak,
            tree=tree,
        )
        merges.append(record)
        print(
            f"balanced node={next_id} left={left.node_id} right={right.node_id} "
            f"support={len(polynomial)} peak={peak} height={height}",
            flush=True,
        )
        for position in sorted((left_position, right_position), reverse=True):
            nodes.pop(position)
        nodes.append(node)
        next_id += 1

    root = nodes[0]
    if not analysis.is_one(root.polynomial, dimension):
        raise AssertionError("balanced root is not one")
    return {
        "strategy": "minimum-height-layer-first_then_min_subtree_peak_support",
        "global_optimality_claimed": False,
        "peak_support_including_leaves": root.peak,
        "height": root.height,
        "merges": merges,
        "tree": root.tree,
    }


def main() -> None:
    started = time.monotonic()
    with analysis.CERTIFICATE.open() as stream:
        certificate = json.load(stream)
    variables = list(certificate["variables"])
    variable_index = {variable: index for index, variable in enumerate(variables)}
    products = []
    for index, (name, generator, multiplier) in enumerate(
        zip(
            certificate["generator_names"],
            certificate["generators"],
            certificate["multipliers"],
        )
    ):
        product = analysis.build_product(
            multiplier, generator, variables, variable_index
        )
        products.append(product)
        print(
            f"product {index + 1:02d} {name} support={len(product)}",
            flush=True,
        )
    balanced = height_balanced_merge(products, len(variables))
    report = json.loads(analysis.OUTPUT.read_text())
    report["height_balanced_merge"] = balanced
    report["height_balanced_elapsed_seconds"] = time.monotonic() - started
    analysis.OUTPUT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(analysis.OUTPUT.relative_to(analysis.REPO)),
                "height": balanced["height"],
                "peak": balanced["peak_support_including_leaves"],
                "seconds": report["height_balanced_elapsed_seconds"],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
