"""Replay the repaired retained-matching witness through the proved metric bank."""

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)
from collections import deque


N = 12
ORDER = (0, 8, 3, 11, 10, 7, 9, 5, 2, 1, 6, 4)

# These are the complete exact radius classes represented by the repaired
# finite witness.  The first-apex class at center 4 has five members; its
# selected row in the Lean fixture deliberately exposes only four of them.
ROWS = (
    MetricRow(0, (1, 2, 3, 4), True),
    MetricRow(1, (0, 2, 8, 9), True),
    MetricRow(2, (1, 5, 9, 10), True),
    MetricRow(3, (2, 8, 10, 11), True),
    MetricRow(4, (0, 3, 5, 6, 7), True),
    MetricRow(5, (1, 6, 7, 8), True),
    MetricRow(6, (1, 4, 7, 10), True),
    MetricRow(7, (3, 6, 9, 10), True),
    MetricRow(8, (0, 1, 5, 11), True),
    MetricRow(9, (2, 5, 7, 11), True),
    MetricRow(10, (3, 7, 8, 11), True),
    MetricRow(11, (0, 4, 6, 10), True),
)


def main() -> None:
    print(_formalized_metric_core(ROWS, N, ORDER))
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], int]]] = {}
    for row in ROWS:
        edges = [tuple(sorted((row.center, point))) for point in row.support]
        for left in edges:
            for right in edges:
                if left != right:
                    graph.setdefault(left, []).append((right, row.center))

    def show_path(start: tuple[int, int], target: tuple[int, int]) -> None:
        queue = deque([start])
        previous: dict[
            tuple[int, int], tuple[tuple[int, int], int] | None
        ] = {start: None}
        while queue:
            here = queue.popleft()
            if here == target:
                break
            for there, center in graph.get(here, []):
                if there not in previous:
                    previous[there] = (here, center)
                    queue.append(there)
        path: list[tuple[tuple[int, int], int, tuple[int, int]]] = []
        here = target
        while previous[here] is not None:
            before, center = previous[here]
            path.append((before, center, here))
            here = before
        print(start, "=", target)
        for before, center, after in reversed(path):
            print("  ", before, f"-- row {center} --", after)

    for center in (2, 8):
        show_path(tuple(sorted((center, 0))), tuple(sorted((center, 1))))
        show_path(tuple(sorted((center, 0))), tuple(sorted((center, 3))))


if __name__ == "__main__":
    main()
