#!/usr/bin/env python3
"""Find low-support replay orders for the exact 15-generator QQ certificate.

This deliberately avoids SymPy.  Certificate polynomials are parsed term by
term into sparse dictionaries with exact ``fractions.Fraction`` coefficients.
The output is only a replay-planning artifact; it does not replace the exact
identity checks recorded by the certificate producer.
"""

from __future__ import annotations

import hashlib
import json
import time
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Iterator


REPO = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
CERTIFICATE = (
    REPO
    / "scratch/atail-force/bank-clean-lean-certificate/"
    / "unit_certificate_groebner_jl_15.json"
)
OUTPUT = HERE / "unit_certificate_groebner_jl_15_merge_analysis.json"

Monomial = bytes
SparsePoly = dict[Monomial, Fraction]


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def signed_terms(text: str) -> Iterator[str]:
    """Split the producer's flat polynomial syntax without recursive parsing."""

    normalized = text.replace("**", "^").replace(" - ", " + -")
    for term in normalized.split(" + "):
        term = term.strip()
        if term:
            yield term


def parse_sparse_terms(
    text: str, variables: list[str], variable_index: dict[str, int]
) -> Iterator[tuple[Monomial, Fraction]]:
    """Stream terms from a flat ``coefficient*variable^power`` polynomial."""

    dimension = len(variables)
    for raw_term in signed_terms(text):
        sign = 1
        if raw_term.startswith("-"):
            sign = -1
            raw_term = raw_term[1:]
        elif raw_term.startswith("+"):
            raw_term = raw_term[1:]
        coefficient = Fraction(sign)
        exponents = bytearray(dimension)
        for factor in raw_term.split("*"):
            if not factor:
                continue
            if factor[0].isdigit():
                coefficient *= Fraction(factor)
                continue
            if "^" in factor:
                name, raw_power = factor.split("^", 1)
                power = int(raw_power)
            else:
                name = factor
                power = 1
            try:
                exponents[variable_index[name]] += power
            except KeyError as exc:
                raise ValueError(f"unknown factor {factor!r} in {raw_term!r}") from exc
        if coefficient:
            yield bytes(exponents), coefficient


def multiply_exponents(left: Monomial, right: Monomial) -> Monomial:
    return bytes(a + b for a, b in zip(left, right))


def build_product(
    multiplier: str,
    generator: str,
    variables: list[str],
    variable_index: dict[str, int],
) -> SparsePoly:
    """Expand one multiplier-generator product exactly and sparsely."""

    generator_terms = list(parse_sparse_terms(generator, variables, variable_index))
    product: SparsePoly = {}
    for multiplier_monomial, multiplier_coefficient in parse_sparse_terms(
        multiplier, variables, variable_index
    ):
        for generator_monomial, generator_coefficient in generator_terms:
            monomial = multiply_exponents(multiplier_monomial, generator_monomial)
            coefficient = multiplier_coefficient * generator_coefficient
            updated = product.get(monomial, Fraction(0)) + coefficient
            if updated:
                product[monomial] = updated
            else:
                product.pop(monomial, None)
    return product


def sum_support_size(left: SparsePoly, right: SparsePoly) -> int:
    """Compute support size of ``left + right`` without materializing it."""

    if len(left) > len(right):
        left, right = right, left
    overlap = 0
    cancellation = 0
    for monomial, coefficient in left.items():
        other = right.get(monomial)
        if other is not None:
            overlap += 1
            if coefficient + other == 0:
                cancellation += 1
    return len(left) + len(right) - overlap - cancellation


def add_sparse(left: SparsePoly, right: SparsePoly) -> SparsePoly:
    """Materialize ``left + right``, copying the larger input once."""

    if len(left) < len(right):
        left, right = right, left
    result = left.copy()
    zero = Fraction(0)
    for monomial, coefficient in right.items():
        updated = result.get(monomial, zero) + coefficient
        if updated:
            result[monomial] = updated
        else:
            result.pop(monomial, None)
    return result


def is_one(poly: SparsePoly, dimension: int) -> bool:
    return poly == {bytes(dimension): Fraction(1)}


def evaluate_order(order: list[int], products: list[SparsePoly]) -> tuple[list[int], int]:
    state: SparsePoly = {}
    sizes: list[int] = []
    for index in order:
        state = add_sparse(state, products[index])
        sizes.append(len(state))
    return sizes, max(sizes)


def greedy_sequential_orders(products: list[SparsePoly]) -> list[dict[str, object]]:
    """Run exact-support greedy extension from every possible first generator."""

    candidates: list[dict[str, object]] = []
    count = len(products)
    for start in range(count):
        order = [start]
        remaining = set(range(count)) - {start}
        state = products[start].copy()
        sizes = [len(state)]
        peak = sizes[0]
        while remaining:
            ranked = []
            for index in remaining:
                size = sum_support_size(state, products[index])
                ranked.append((max(peak, size), size, len(products[index]), index))
            _, size, _, chosen = min(ranked)
            state = add_sparse(state, products[chosen])
            if len(state) != size:
                raise AssertionError("support-size predictor disagrees with expansion")
            order.append(chosen)
            remaining.remove(chosen)
            sizes.append(size)
            peak = max(peak, size)
        if not is_one(state, len(next(iter(products[0])))):
            raise AssertionError(f"certificate sum is not one for start {start}")
        candidates.append(
            {
                "strategy": "greedy_min_peak_then_support",
                "start": start,
                "order": order,
                "partial_support_sizes": sizes,
                "peak_support": peak,
            }
        )
        print(
            f"sequential start={start + 1:02d} peak={peak} order="
            + ",".join(str(index + 1) for index in order),
            flush=True,
        )
    return candidates


@dataclass
class MergeNode:
    node_id: int
    leaves: tuple[int, ...]
    polynomial: SparsePoly
    height: int
    peak: int
    tree: dict[str, object]


def greedy_balanced_merge(products: list[SparsePoly]) -> dict[str, object]:
    """Greedily merge low-support pairs while preferring height balance.

    Candidate ranking first minimizes the resulting subtree peak, then the new
    support, then height imbalance.  This is an exact-support heuristic, not a
    claim of global tree optimality.
    """

    next_id = len(products)
    nodes = [
        MergeNode(
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
        ranked: list[tuple[tuple[int, int, int, int, int], int, int, int]] = []
        for left_position in range(len(nodes)):
            left = nodes[left_position]
            for right_position in range(left_position + 1, len(nodes)):
                right = nodes[right_position]
                support = sum_support_size(left.polynomial, right.polynomial)
                subtree_peak = max(left.peak, right.peak, support)
                rank = (
                    subtree_peak,
                    support,
                    abs(left.height - right.height),
                    abs(len(left.leaves) - len(right.leaves)),
                    len(left.leaves) + len(right.leaves),
                )
                ranked.append((rank, left_position, right_position, support))
        _, left_position, right_position, predicted_support = min(ranked)
        left = nodes[left_position]
        right = nodes[right_position]
        polynomial = add_sparse(left.polynomial, right.polynomial)
        if len(polynomial) != predicted_support:
            raise AssertionError("merge support predictor disagrees with expansion")
        node = MergeNode(
            node_id=next_id,
            leaves=tuple(sorted(left.leaves + right.leaves)),
            polynomial=polynomial,
            height=max(left.height, right.height) + 1,
            peak=max(left.peak, right.peak, len(polynomial)),
            tree={
                "kind": "merge",
                "node_id": next_id,
                "left_node_id": left.node_id,
                "right_node_id": right.node_id,
                "left_leaves": list(left.leaves),
                "right_leaves": list(right.leaves),
                "support_size": len(polynomial),
                "subtree_peak_support": max(
                    left.peak, right.peak, len(polynomial)
                ),
                "height": max(left.height, right.height) + 1,
                "left": left.tree,
                "right": right.tree,
            },
        )
        merge_record = {
            "node_id": next_id,
            "left_node_id": left.node_id,
            "right_node_id": right.node_id,
            "left_leaves": list(left.leaves),
            "right_leaves": list(right.leaves),
            "support_size": len(polynomial),
            "subtree_peak_support": node.peak,
            "height": node.height,
        }
        merges.append(merge_record)
        print(
            f"merge node={next_id} left={left.node_id} right={right.node_id} "
            f"support={len(polynomial)} peak={node.peak} height={node.height}",
            flush=True,
        )
        for position in sorted((left_position, right_position), reverse=True):
            nodes.pop(position)
        nodes.append(node)
        next_id += 1
    root = nodes[0]
    if not is_one(root.polynomial, len(next(iter(products[0])))):
        raise AssertionError("merge root is not the constant polynomial one")
    return {
        "strategy": "greedy_min_subtree_peak_then_support_with_balance_tiebreaks",
        "peak_support_including_leaves": root.peak,
        "height": root.height,
        "merges": merges,
        "tree": root.tree,
    }


def main() -> None:
    started = time.monotonic()
    with CERTIFICATE.open() as stream:
        certificate = json.load(stream)
    variables = list(certificate["variables"])
    variable_index = {variable: index for index, variable in enumerate(variables)}
    names = list(certificate["generator_names"])
    generators = list(certificate["generators"])
    multipliers = list(certificate["multipliers"])
    if not (len(names) == len(generators) == len(multipliers) == 15):
        raise AssertionError("expected exactly 15 aligned generators and multipliers")

    products: list[SparsePoly] = []
    product_seconds: list[float] = []
    for index, (name, generator, multiplier) in enumerate(
        zip(names, generators, multipliers)
    ):
        product_started = time.monotonic()
        product = build_product(multiplier, generator, variables, variable_index)
        elapsed = time.monotonic() - product_started
        products.append(product)
        product_seconds.append(elapsed)
        print(
            f"product {index + 1:02d} {name} support={len(product)} "
            f"seconds={elapsed:.3f}",
            flush=True,
        )

    sequential = greedy_sequential_orders(products)
    best = min(
        sequential,
        key=lambda candidate: (
            int(candidate["peak_support"]),
            sum(candidate["partial_support_sizes"]),
        ),
    )
    balanced = greedy_balanced_merge(products)

    report = {
        "schema": "p97-bank-clean-15-certificate-merge-analysis-v1",
        "certificate": str(CERTIFICATE.relative_to(REPO)),
        "certificate_sha256": file_sha256(CERTIFICATE),
        "method": {
            "parser": "streamed flat terms into sparse Fraction dictionaries; no SymPy",
            "sequential_search": "greedy exact-support extension from all 15 starts",
            "tree_search": "greedy exact-support pair merging with balance tiebreaks",
            "global_optimality_claimed": False,
        },
        "variables": variables,
        "generator_names": names,
        "product_support_sizes": [len(product) for product in products],
        "product_expansion_seconds": product_seconds,
        "best_sequential": best,
        "all_sequential_candidates": sequential,
        "balanced_merge": balanced,
        "exact_final_identity_replayed": True,
        "elapsed_seconds": time.monotonic() - started,
    }
    OUTPUT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(OUTPUT.relative_to(REPO)),
                "best_peak": best["peak_support"],
                "balanced_peak": balanced["peak_support_including_leaves"],
                "elapsed_seconds": report["elapsed_seconds"],
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
