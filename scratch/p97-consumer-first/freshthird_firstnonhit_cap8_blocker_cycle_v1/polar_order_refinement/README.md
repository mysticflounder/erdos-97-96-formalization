# Polar-order refinement

This is a targeted CEGAR refinement of the completed cap-eight blocker-cycle
wave, not a new wave.  It replays exactly the 12 aliases that previously had
Z3 SAT results and adds exactly the 15 strict apex-relative area inequalities
from `FreshThirdCapEightPolarOrder.exists_oppIndex1_polar_order_packet`.

The refinement uses the final apex-at-origin pair-radius rational-direction
encoding from the parent wave.  No previously unresolved alias was expanded.
The known-SAT control and malformed-area control are independent planar
controls; both solvers pass them.
