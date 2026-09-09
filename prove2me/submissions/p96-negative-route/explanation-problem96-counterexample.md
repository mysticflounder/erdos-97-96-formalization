The target is the exact negation of Problem 96:

$$
U_c(n) \ne O(n).
$$

The reduction assumes the superlinear-family child. Suppose instead that the
Big-O bound holds with an eventual constant (c). Set (C=\max(c,0)). Beyond
the bound's cutoff, the child supplies an (n) with

$$
U_c(n)>Cn,
$$

while the Big-O hypothesis gives

$$
U_c(n)\le cn\le Cn.
$$

These inequalities contradict each other. The eventual quantifier in the
child is essential: finitely many exceptional convex configurations cannot
refute an asymptotic bound.
