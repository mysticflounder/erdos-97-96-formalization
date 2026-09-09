# Counterexample route

The target asks for an explicit finite set of points (A\subset\mathbb R^2)
such that

$$
A\ne\varnothing,\qquad A\text{ is in strictly convex position},\qquad
\forall p\in A\;\exists r_p>0:\
\left|\{q\in A:\lVert p-q\rVert=r_p\}\right|\ge4.
$$

The radius may depend on (p). This is the existential closure of
`Problem97.IsCounterexample` in the source formalization. A witness would
refute Problem 97, and hence refute the mission's affirmative conjunction of
Problems 97 and 96. It should then be submitted directly as a `disprove`
solution against the combined theorem; this milestone makes that parallel
resolution route visible while the nonexistence proof remains open.

A useful submission should give exact coordinates or exact algebraic data.
Numerical coordinates, a SAT model of an incidence abstraction, or a partial
shell system do not establish this target: Lean must verify both strict convex
position and the four-equidistant property for the same finite point set.
