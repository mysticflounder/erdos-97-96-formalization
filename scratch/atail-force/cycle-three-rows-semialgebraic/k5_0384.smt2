(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun t__q0 () Real)
(declare-fun q0__x () Real)
(declare-fun q0__y () Real)
(declare-fun t__q1 () Real)
(declare-fun q1__x () Real)
(declare-fun q1__y () Real)
(declare-fun t__q2 () Real)
(declare-fun q2__x () Real)
(declare-fun q2__y () Real)
(declare-fun t__right () Real)
(declare-fun right__x () Real)
(declare-fun right__y () Real)
(declare-fun lambda__0 () Real)
(declare-fun c0__x () Real)
(declare-fun c0__y () Real)
(declare-fun lambda__1 () Real)
(declare-fun c1__x () Real)
(declare-fun c1__y () Real)
(declare-fun lambda__2 () Real)
(declare-fun c2__x () Real)
(declare-fun c2__y () Real)
(declare-fun t_x0_x1__y () Real)
(declare-fun t_x0_x1__x () Real)
(declare-fun t_y0__y () Real)
(declare-fun t_y0__x () Real)
(declare-fun t_y1__y () Real)
(declare-fun t_y1__x () Real)
(declare-fun t_x2__y () Real)
(declare-fun t_x2__x () Real)
(declare-fun t_y2__y () Real)
(declare-fun t_y2__x () Real)
(declare-fun mec__x () Real)
(declare-fun mec__y () Real)
(declare-fun mec__radius_sq () Real)
(assert
 (= (* (+ 1.0 (* t__q0 t__q0)) q0__x) (- 1.0 (* t__q0 t__q0))))
(assert
 (= (* (+ 1.0 (* t__q0 t__q0)) q0__y) (* 2.0 t__q0)))
(assert
 (= (* (+ 1.0 (* t__q1 t__q1)) q1__x) (- 1.0 (* t__q1 t__q1))))
(assert
 (= (* (+ 1.0 (* t__q1 t__q1)) q1__y) (* 2.0 t__q1)))
(assert
 (= (* (+ 1.0 (* t__q2 t__q2)) q2__x) (- 1.0 (* t__q2 t__q2))))
(assert
 (= (* (+ 1.0 (* t__q2 t__q2)) q2__y) (* 2.0 t__q2)))
(assert
 (= (* (+ 1.0 (* t__right t__right)) right__x) (- 1.0 (* t__right t__right))))
(assert
 (= (* (+ 1.0 (* t__right t__right)) right__y) (* 2.0 t__right)))
(assert
 (> t__q0 0.0))
(assert
 (> t__q1 t__q0))
(assert
 (> t__q2 t__q1))
(assert
 (> t__right t__q2))
(assert
 (<= t__right 1.0))
(assert
 (> right__y 0.0))
(assert
 (= c0__x (* lambda__0 (+ q0__x q1__x))))
(assert
 (= c0__y (* lambda__0 (+ q0__y q1__y))))
(assert
 (= c1__x (* lambda__1 (+ q1__x q2__x))))
(assert
 (= c1__y (* lambda__1 (+ q1__y q2__y))))
(assert
 (= c2__x (* lambda__2 (+ q2__x q0__x))))
(assert
 (= c2__y (* lambda__2 (+ q2__y q0__y))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x125 (+ (* (- c0__x t_x0_x1__x) (- c0__x t_x0_x1__x)) (* (- c0__y t_x0_x1__y) (- c0__y t_x0_x1__y)))))
 (= ?x125 ?x120))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x131 (+ (* (- c0__x t_y0__x) (- c0__x t_y0__x)) (* (- c0__y t_y0__y) (- c0__y t_y0__y)))))
 (= ?x131 ?x120))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x142 (+ (* (- c1__x t_x0_x1__x) (- c1__x t_x0_x1__x)) (* (- c1__y t_x0_x1__y) (- c1__y t_x0_x1__y)))))
 (= ?x142 ?x137))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x148 (+ (* (- c1__x t_y1__x) (- c1__x t_y1__x)) (* (- c1__y t_y1__y) (- c1__y t_y1__y)))))
 (= ?x148 ?x137))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x159 (+ (* (- c2__x t_x2__x) (- c2__x t_x2__x)) (* (- c2__y t_x2__y) (- c2__y t_x2__y)))))
 (= ?x159 ?x154))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x165 (+ (* (- c2__x t_y2__x) (- c2__x t_y2__x)) (* (- c2__y t_y2__y) (- c2__y t_y2__y)))))
 (= ?x165 ?x154))))
(assert
 (= (* 2.0 mec__x) 1.0))
(assert
 (let ((?x174 (- 1.0 right__x)))
 (= (* (* 2.0 right__y) mec__y) ?x174)))
(assert
 (= mec__radius_sq (+ (* mec__x mec__x) (* mec__y mec__y))))
(assert
 (let ((?x186 (- (* (- 1.0 0.0) (- q0__y 0.0)) (* (- 0.0 0.0) (- q0__x 0.0)))))
 (> ?x186 0.0)))
(assert
 (let ((?x192 (- (* (- 1.0 0.0) (- c0__y 0.0)) (* (- 0.0 0.0) (- c0__x 0.0)))))
 (> ?x192 0.0)))
(assert
 (let ((?x198 (- (* (- 1.0 0.0) (- c2__y 0.0)) (* (- 0.0 0.0) (- c2__x 0.0)))))
 (> ?x198 0.0)))
(assert
 (let ((?x204 (- (* (- 1.0 0.0) (- q1__y 0.0)) (* (- 0.0 0.0) (- q1__x 0.0)))))
 (> ?x204 0.0)))
(assert
 (let ((?x210 (- (* (- 1.0 0.0) (- c1__y 0.0)) (* (- 0.0 0.0) (- c1__x 0.0)))))
 (> ?x210 0.0)))
(assert
 (let ((?x216 (- (* (- 1.0 0.0) (- q2__y 0.0)) (* (- 0.0 0.0) (- q2__x 0.0)))))
 (> ?x216 0.0)))
(assert
 (let ((?x222 (- (* (- 1.0 0.0) (- right__y 0.0)) (* (- 0.0 0.0) (- right__x 0.0)))))
 (> ?x222 0.0)))
(assert
 (let ((?x228 (- (* (- 1.0 0.0) (- t_x0_x1__y 0.0)) (* (- 0.0 0.0) (- t_x0_x1__x 0.0)))))
 (> ?x228 0.0)))
(assert
 (let ((?x234 (- (* (- 1.0 0.0) (- t_y0__y 0.0)) (* (- 0.0 0.0) (- t_y0__x 0.0)))))
 (> ?x234 0.0)))
(assert
 (let ((?x240 (- (* (- 1.0 0.0) (- t_y1__y 0.0)) (* (- 0.0 0.0) (- t_y1__x 0.0)))))
 (> ?x240 0.0)))
(assert
 (let ((?x246 (- (* (- 1.0 0.0) (- t_x2__y 0.0)) (* (- 0.0 0.0) (- t_x2__x 0.0)))))
 (> ?x246 0.0)))
(assert
 (let ((?x252 (- (* (- 1.0 0.0) (- t_y2__y 0.0)) (* (- 0.0 0.0) (- t_y2__x 0.0)))))
 (> ?x252 0.0)))
(assert
 (let ((?x258 (- (* (- q0__x 1.0) (- 0.0 0.0)) (* (- q0__y 0.0) (- 0.0 1.0)))))
 (> ?x258 0.0)))
(assert
 (let ((?x263 (- (* (- q0__x 1.0) (- c0__y 0.0)) (* (- q0__y 0.0) (- c0__x 1.0)))))
 (> ?x263 0.0)))
(assert
 (let ((?x268 (- (* (- q0__x 1.0) (- c2__y 0.0)) (* (- q0__y 0.0) (- c2__x 1.0)))))
 (> ?x268 0.0)))
(assert
 (let ((?x273 (- (* (- q0__x 1.0) (- q1__y 0.0)) (* (- q0__y 0.0) (- q1__x 1.0)))))
 (> ?x273 0.0)))
(assert
 (let ((?x278 (- (* (- q0__x 1.0) (- c1__y 0.0)) (* (- q0__y 0.0) (- c1__x 1.0)))))
 (> ?x278 0.0)))
(assert
 (let ((?x283 (- (* (- q0__x 1.0) (- q2__y 0.0)) (* (- q0__y 0.0) (- q2__x 1.0)))))
 (> ?x283 0.0)))
(assert
 (let ((?x288 (- (* (- q0__x 1.0) (- right__y 0.0)) (* (- q0__y 0.0) (- right__x 1.0)))))
 (> ?x288 0.0)))
(assert
 (let ((?x293 (- (* (- q0__x 1.0) (- t_x0_x1__y 0.0)) (* (- q0__y 0.0) (- t_x0_x1__x 1.0)))))
 (> ?x293 0.0)))
(assert
 (let ((?x298 (- (* (- q0__x 1.0) (- t_y0__y 0.0)) (* (- q0__y 0.0) (- t_y0__x 1.0)))))
 (> ?x298 0.0)))
(assert
 (let ((?x303 (- (* (- q0__x 1.0) (- t_y1__y 0.0)) (* (- q0__y 0.0) (- t_y1__x 1.0)))))
 (> ?x303 0.0)))
(assert
 (let ((?x308 (- (* (- q0__x 1.0) (- t_x2__y 0.0)) (* (- q0__y 0.0) (- t_x2__x 1.0)))))
 (> ?x308 0.0)))
(assert
 (let ((?x313 (- (* (- q0__x 1.0) (- t_y2__y 0.0)) (* (- q0__y 0.0) (- t_y2__x 1.0)))))
 (> ?x313 0.0)))
(assert
 (let ((?x116 (- c0__x q0__x)))
 (let ((?x316 (* ?x116 (- 0.0 q0__y))))
 (> (- ?x316 (* (- c0__y q0__y) (- 0.0 q0__x))) 0.0))))
(assert
 (let ((?x116 (- c0__x q0__x)))
 (let ((?x316 (* ?x116 (- 0.0 q0__y))))
 (> (- ?x316 (* (- c0__y q0__y) (- 1.0 q0__x))) 0.0))))
(assert
 (let ((?x329 (- (* (- c0__x q0__x) (- c2__y q0__y)) (* (- c0__y q0__y) (- c2__x q0__x)))))
 (> ?x329 0.0)))
(assert
 (let ((?x335 (- (* (- c0__x q0__x) (- q1__y q0__y)) (* (- c0__y q0__y) (- q1__x q0__x)))))
 (> ?x335 0.0)))
(assert
 (let ((?x341 (- (* (- c0__x q0__x) (- c1__y q0__y)) (* (- c0__y q0__y) (- c1__x q0__x)))))
 (> ?x341 0.0)))
(assert
 (let ((?x347 (- (* (- c0__x q0__x) (- q2__y q0__y)) (* (- c0__y q0__y) (- q2__x q0__x)))))
 (> ?x347 0.0)))
(assert
 (let ((?x353 (- (* (- c0__x q0__x) (- right__y q0__y)) (* (- c0__y q0__y) (- right__x q0__x)))))
 (> ?x353 0.0)))
(assert
 (let ((?x359 (- (* (- c0__x q0__x) (- t_x0_x1__y q0__y)) (* (- c0__y q0__y) (- t_x0_x1__x q0__x)))))
 (> ?x359 0.0)))
(assert
 (let ((?x365 (- (* (- c0__x q0__x) (- t_y0__y q0__y)) (* (- c0__y q0__y) (- t_y0__x q0__x)))))
 (> ?x365 0.0)))
(assert
 (let ((?x371 (- (* (- c0__x q0__x) (- t_y1__y q0__y)) (* (- c0__y q0__y) (- t_y1__x q0__x)))))
 (> ?x371 0.0)))
(assert
 (let ((?x377 (- (* (- c0__x q0__x) (- t_x2__y q0__y)) (* (- c0__y q0__y) (- t_x2__x q0__x)))))
 (> ?x377 0.0)))
(assert
 (let ((?x383 (- (* (- c0__x q0__x) (- t_y2__y q0__y)) (* (- c0__y q0__y) (- t_y2__x q0__x)))))
 (> ?x383 0.0)))
(assert
 (let ((?x386 (- 0.0 c0__y)))
 (let ((?x385 (- c2__x c0__x)))
 (let ((?x387 (* ?x385 ?x386)))
 (> (- ?x387 (* (- c2__y c0__y) (- 0.0 c0__x))) 0.0)))))
(assert
 (let ((?x386 (- 0.0 c0__y)))
 (let ((?x385 (- c2__x c0__x)))
 (let ((?x387 (* ?x385 ?x386)))
 (> (- ?x387 (* (- c2__y c0__y) (- 1.0 c0__x))) 0.0)))))
(assert
 (let ((?x401 (- (* (- c2__x c0__x) (- q0__y c0__y)) (* (- c2__y c0__y) (- q0__x c0__x)))))
 (> ?x401 0.0)))
(assert
 (let ((?x407 (- (* (- c2__x c0__x) (- q1__y c0__y)) (* (- c2__y c0__y) (- q1__x c0__x)))))
 (> ?x407 0.0)))
(assert
 (let ((?x413 (- (* (- c2__x c0__x) (- c1__y c0__y)) (* (- c2__y c0__y) (- c1__x c0__x)))))
 (> ?x413 0.0)))
(assert
 (let ((?x419 (- (* (- c2__x c0__x) (- q2__y c0__y)) (* (- c2__y c0__y) (- q2__x c0__x)))))
 (> ?x419 0.0)))
(assert
 (let ((?x425 (- (* (- c2__x c0__x) (- right__y c0__y)) (* (- c2__y c0__y) (- right__x c0__x)))))
 (> ?x425 0.0)))
(assert
 (let ((?x431 (- (* (- c2__x c0__x) (- t_x0_x1__y c0__y)) (* (- c2__y c0__y) (- t_x0_x1__x c0__x)))))
 (> ?x431 0.0)))
(assert
 (let ((?x437 (- (* (- c2__x c0__x) (- t_y0__y c0__y)) (* (- c2__y c0__y) (- t_y0__x c0__x)))))
 (> ?x437 0.0)))
(assert
 (let ((?x443 (- (* (- c2__x c0__x) (- t_y1__y c0__y)) (* (- c2__y c0__y) (- t_y1__x c0__x)))))
 (> ?x443 0.0)))
(assert
 (let ((?x449 (- (* (- c2__x c0__x) (- t_x2__y c0__y)) (* (- c2__y c0__y) (- t_x2__x c0__x)))))
 (> ?x449 0.0)))
(assert
 (let ((?x455 (- (* (- c2__x c0__x) (- t_y2__y c0__y)) (* (- c2__y c0__y) (- t_y2__x c0__x)))))
 (> ?x455 0.0)))
(assert
 (let ((?x458 (- 0.0 c2__y)))
 (let ((?x457 (- q1__x c2__x)))
 (let ((?x459 (* ?x457 ?x458)))
 (> (- ?x459 (* (- q1__y c2__y) (- 0.0 c2__x))) 0.0)))))
(assert
 (let ((?x458 (- 0.0 c2__y)))
 (let ((?x457 (- q1__x c2__x)))
 (let ((?x459 (* ?x457 ?x458)))
 (> (- ?x459 (* (- q1__y c2__y) (- 1.0 c2__x))) 0.0)))))
(assert
 (let ((?x473 (- (* (- q1__x c2__x) (- q0__y c2__y)) (* (- q1__y c2__y) (- q0__x c2__x)))))
 (> ?x473 0.0)))
(assert
 (let ((?x479 (- (* (- q1__x c2__x) (- c0__y c2__y)) (* (- q1__y c2__y) (- c0__x c2__x)))))
 (> ?x479 0.0)))
(assert
 (let ((?x485 (- (* (- q1__x c2__x) (- c1__y c2__y)) (* (- q1__y c2__y) (- c1__x c2__x)))))
 (> ?x485 0.0)))
(assert
 (let ((?x491 (- (* (- q1__x c2__x) (- q2__y c2__y)) (* (- q1__y c2__y) (- q2__x c2__x)))))
 (> ?x491 0.0)))
(assert
 (let ((?x497 (- (* (- q1__x c2__x) (- right__y c2__y)) (* (- q1__y c2__y) (- right__x c2__x)))))
 (> ?x497 0.0)))
(assert
 (let ((?x503 (- (* (- q1__x c2__x) (- t_x0_x1__y c2__y)) (* (- q1__y c2__y) (- t_x0_x1__x c2__x)))))
 (> ?x503 0.0)))
(assert
 (let ((?x509 (- (* (- q1__x c2__x) (- t_y0__y c2__y)) (* (- q1__y c2__y) (- t_y0__x c2__x)))))
 (> ?x509 0.0)))
(assert
 (let ((?x515 (- (* (- q1__x c2__x) (- t_y1__y c2__y)) (* (- q1__y c2__y) (- t_y1__x c2__x)))))
 (> ?x515 0.0)))
(assert
 (let ((?x521 (- (* (- q1__x c2__x) (- t_x2__y c2__y)) (* (- q1__y c2__y) (- t_x2__x c2__x)))))
 (> ?x521 0.0)))
(assert
 (let ((?x527 (- (* (- q1__x c2__x) (- t_y2__y c2__y)) (* (- q1__y c2__y) (- t_y2__x c2__x)))))
 (> ?x527 0.0)))
(assert
 (let ((?x133 (- c1__x q1__x)))
 (let ((?x530 (* ?x133 (- 0.0 q1__y))))
 (> (- ?x530 (* (- c1__y q1__y) (- 0.0 q1__x))) 0.0))))
(assert
 (let ((?x133 (- c1__x q1__x)))
 (let ((?x530 (* ?x133 (- 0.0 q1__y))))
 (> (- ?x530 (* (- c1__y q1__y) (- 1.0 q1__x))) 0.0))))
(assert
 (let ((?x543 (- (* (- c1__x q1__x) (- q0__y q1__y)) (* (- c1__y q1__y) (- q0__x q1__x)))))
 (> ?x543 0.0)))
(assert
 (let ((?x549 (- (* (- c1__x q1__x) (- c0__y q1__y)) (* (- c1__y q1__y) (- c0__x q1__x)))))
 (> ?x549 0.0)))
(assert
 (let ((?x555 (- (* (- c1__x q1__x) (- c2__y q1__y)) (* (- c1__y q1__y) (- c2__x q1__x)))))
 (> ?x555 0.0)))
(assert
 (let ((?x561 (- (* (- c1__x q1__x) (- q2__y q1__y)) (* (- c1__y q1__y) (- q2__x q1__x)))))
 (> ?x561 0.0)))
(assert
 (let ((?x567 (- (* (- c1__x q1__x) (- right__y q1__y)) (* (- c1__y q1__y) (- right__x q1__x)))))
 (> ?x567 0.0)))
(assert
 (let ((?x573 (- (* (- c1__x q1__x) (- t_x0_x1__y q1__y)) (* (- c1__y q1__y) (- t_x0_x1__x q1__x)))))
 (> ?x573 0.0)))
(assert
 (let ((?x579 (- (* (- c1__x q1__x) (- t_y0__y q1__y)) (* (- c1__y q1__y) (- t_y0__x q1__x)))))
 (> ?x579 0.0)))
(assert
 (let ((?x585 (- (* (- c1__x q1__x) (- t_y1__y q1__y)) (* (- c1__y q1__y) (- t_y1__x q1__x)))))
 (> ?x585 0.0)))
(assert
 (let ((?x591 (- (* (- c1__x q1__x) (- t_x2__y q1__y)) (* (- c1__y q1__y) (- t_x2__x q1__x)))))
 (> ?x591 0.0)))
(assert
 (let ((?x597 (- (* (- c1__x q1__x) (- t_y2__y q1__y)) (* (- c1__y q1__y) (- t_y2__x q1__x)))))
 (> ?x597 0.0)))
(assert
 (let ((?x600 (- 0.0 c1__y)))
 (let ((?x599 (- q2__x c1__x)))
 (let ((?x601 (* ?x599 ?x600)))
 (> (- ?x601 (* (- q2__y c1__y) (- 0.0 c1__x))) 0.0)))))
(assert
 (let ((?x600 (- 0.0 c1__y)))
 (let ((?x599 (- q2__x c1__x)))
 (let ((?x601 (* ?x599 ?x600)))
 (> (- ?x601 (* (- q2__y c1__y) (- 1.0 c1__x))) 0.0)))))
(assert
 (let ((?x615 (- (* (- q2__x c1__x) (- q0__y c1__y)) (* (- q2__y c1__y) (- q0__x c1__x)))))
 (> ?x615 0.0)))
(assert
 (let ((?x621 (- (* (- q2__x c1__x) (- c0__y c1__y)) (* (- q2__y c1__y) (- c0__x c1__x)))))
 (> ?x621 0.0)))
(assert
 (let ((?x627 (- (* (- q2__x c1__x) (- c2__y c1__y)) (* (- q2__y c1__y) (- c2__x c1__x)))))
 (> ?x627 0.0)))
(assert
 (let ((?x633 (- (* (- q2__x c1__x) (- q1__y c1__y)) (* (- q2__y c1__y) (- q1__x c1__x)))))
 (> ?x633 0.0)))
(assert
 (let ((?x639 (- (* (- q2__x c1__x) (- right__y c1__y)) (* (- q2__y c1__y) (- right__x c1__x)))))
 (> ?x639 0.0)))
(assert
 (let ((?x645 (- (* (- q2__x c1__x) (- t_x0_x1__y c1__y)) (* (- q2__y c1__y) (- t_x0_x1__x c1__x)))))
 (> ?x645 0.0)))
(assert
 (let ((?x651 (- (* (- q2__x c1__x) (- t_y0__y c1__y)) (* (- q2__y c1__y) (- t_y0__x c1__x)))))
 (> ?x651 0.0)))
(assert
 (let ((?x657 (- (* (- q2__x c1__x) (- t_y1__y c1__y)) (* (- q2__y c1__y) (- t_y1__x c1__x)))))
 (> ?x657 0.0)))
(assert
 (let ((?x663 (- (* (- q2__x c1__x) (- t_x2__y c1__y)) (* (- q2__y c1__y) (- t_x2__x c1__x)))))
 (> ?x663 0.0)))
(assert
 (let ((?x669 (- (* (- q2__x c1__x) (- t_y2__y c1__y)) (* (- q2__y c1__y) (- t_y2__x c1__x)))))
 (> ?x669 0.0)))
(assert
 (let ((?x671 (- right__x q2__x)))
 (let ((?x673 (* ?x671 (- 0.0 q2__y))))
 (> (- ?x673 (* (- right__y q2__y) (- 0.0 q2__x))) 0.0))))
(assert
 (let ((?x671 (- right__x q2__x)))
 (let ((?x673 (* ?x671 (- 0.0 q2__y))))
 (> (- ?x673 (* (- right__y q2__y) (- 1.0 q2__x))) 0.0))))
(assert
 (let ((?x687 (- (* (- right__x q2__x) (- q0__y q2__y)) (* (- right__y q2__y) (- q0__x q2__x)))))
 (> ?x687 0.0)))
(assert
 (let ((?x693 (- (* (- right__x q2__x) (- c0__y q2__y)) (* (- right__y q2__y) (- c0__x q2__x)))))
 (> ?x693 0.0)))
(assert
 (let ((?x697 (- (* (- right__x q2__x) (- c2__y q2__y)) (* (- right__y q2__y) (- c2__x q2__x)))))
 (> ?x697 0.0)))
(assert
 (let ((?x703 (- (* (- right__x q2__x) (- q1__y q2__y)) (* (- right__y q2__y) (- q1__x q2__x)))))
 (> ?x703 0.0)))
(assert
 (let ((?x709 (- (* (- right__x q2__x) (- c1__y q2__y)) (* (- right__y q2__y) (- c1__x q2__x)))))
 (> ?x709 0.0)))
(assert
 (let ((?x715 (- (* (- right__x q2__x) (- t_x0_x1__y q2__y)) (* (- right__y q2__y) (- t_x0_x1__x q2__x)))))
 (> ?x715 0.0)))
(assert
 (let ((?x721 (- (* (- right__x q2__x) (- t_y0__y q2__y)) (* (- right__y q2__y) (- t_y0__x q2__x)))))
 (> ?x721 0.0)))
(assert
 (let ((?x727 (- (* (- right__x q2__x) (- t_y1__y q2__y)) (* (- right__y q2__y) (- t_y1__x q2__x)))))
 (> ?x727 0.0)))
(assert
 (let ((?x733 (- (* (- right__x q2__x) (- t_x2__y q2__y)) (* (- right__y q2__y) (- t_x2__x q2__x)))))
 (> ?x733 0.0)))
(assert
 (let ((?x739 (- (* (- right__x q2__x) (- t_y2__y q2__y)) (* (- right__y q2__y) (- t_y2__x q2__x)))))
 (> ?x739 0.0)))
(assert
 (let ((?x741 (- t_x0_x1__x right__x)))
 (let ((?x743 (* ?x741 (- 0.0 right__y))))
 (> (- ?x743 (* (- t_x0_x1__y right__y) (- 0.0 right__x))) 0.0))))
(assert
 (let ((?x741 (- t_x0_x1__x right__x)))
 (let ((?x743 (* ?x741 (- 0.0 right__y))))
 (> (- ?x743 (* (- t_x0_x1__y right__y) (- 1.0 right__x))) 0.0))))
(assert
 (let ((?x756 (- (* (- t_x0_x1__x right__x) (- q0__y right__y)) (* (- t_x0_x1__y right__y) (- q0__x right__x)))))
 (> ?x756 0.0)))
(assert
 (let ((?x762 (- (* (- t_x0_x1__x right__x) (- c0__y right__y)) (* (- t_x0_x1__y right__y) (- c0__x right__x)))))
 (> ?x762 0.0)))
(assert
 (let ((?x768 (- (* (- t_x0_x1__x right__x) (- c2__y right__y)) (* (- t_x0_x1__y right__y) (- c2__x right__x)))))
 (> ?x768 0.0)))
(assert
 (let ((?x774 (- (* (- t_x0_x1__x right__x) (- q1__y right__y)) (* (- t_x0_x1__y right__y) (- q1__x right__x)))))
 (> ?x774 0.0)))
(assert
 (let ((?x780 (- (* (- t_x0_x1__x right__x) (- c1__y right__y)) (* (- t_x0_x1__y right__y) (- c1__x right__x)))))
 (> ?x780 0.0)))
(assert
 (let ((?x786 (- (* (- t_x0_x1__x right__x) (- q2__y right__y)) (* (- t_x0_x1__y right__y) (- q2__x right__x)))))
 (> ?x786 0.0)))
(assert
 (let ((?x792 (- (* (- t_x0_x1__x right__x) (- t_y0__y right__y)) (* (- t_x0_x1__y right__y) (- t_y0__x right__x)))))
 (> ?x792 0.0)))
(assert
 (let ((?x798 (- (* (- t_x0_x1__x right__x) (- t_y1__y right__y)) (* (- t_x0_x1__y right__y) (- t_y1__x right__x)))))
 (> ?x798 0.0)))
(assert
 (let ((?x804 (- (* (- t_x0_x1__x right__x) (- t_x2__y right__y)) (* (- t_x0_x1__y right__y) (- t_x2__x right__x)))))
 (> ?x804 0.0)))
(assert
 (let ((?x810 (- (* (- t_x0_x1__x right__x) (- t_y2__y right__y)) (* (- t_x0_x1__y right__y) (- t_y2__x right__x)))))
 (> ?x810 0.0)))
(assert
 (let ((?x813 (- 0.0 t_x0_x1__y)))
 (let ((?x812 (- t_y0__x t_x0_x1__x)))
 (let ((?x814 (* ?x812 ?x813)))
 (> (- ?x814 (* (- t_y0__y t_x0_x1__y) (- 0.0 t_x0_x1__x))) 0.0)))))
(assert
 (let ((?x813 (- 0.0 t_x0_x1__y)))
 (let ((?x812 (- t_y0__x t_x0_x1__x)))
 (let ((?x814 (* ?x812 ?x813)))
 (> (- ?x814 (* (- t_y0__y t_x0_x1__y) (- 1.0 t_x0_x1__x))) 0.0)))))
(assert
 (let ((?x828 (- (* (- t_y0__x t_x0_x1__x) (- q0__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- q0__x t_x0_x1__x)))))
 (> ?x828 0.0)))
(assert
 (let ((?x832 (- (* (- t_y0__x t_x0_x1__x) (- c0__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- c0__x t_x0_x1__x)))))
 (> ?x832 0.0)))
(assert
 (let ((?x838 (- (* (- t_y0__x t_x0_x1__x) (- c2__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- c2__x t_x0_x1__x)))))
 (> ?x838 0.0)))
(assert
 (let ((?x844 (- (* (- t_y0__x t_x0_x1__x) (- q1__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- q1__x t_x0_x1__x)))))
 (> ?x844 0.0)))
(assert
 (let ((?x848 (- (* (- t_y0__x t_x0_x1__x) (- c1__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- c1__x t_x0_x1__x)))))
 (> ?x848 0.0)))
(assert
 (let ((?x854 (- (* (- t_y0__x t_x0_x1__x) (- q2__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- q2__x t_x0_x1__x)))))
 (> ?x854 0.0)))
(assert
 (let ((?x860 (- (* (- t_y0__x t_x0_x1__x) (- right__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- right__x t_x0_x1__x)))))
 (> ?x860 0.0)))
(assert
 (let ((?x866 (- (* (- t_y0__x t_x0_x1__x) (- t_y1__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- t_y1__x t_x0_x1__x)))))
 (> ?x866 0.0)))
(assert
 (let ((?x872 (- (* (- t_y0__x t_x0_x1__x) (- t_x2__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- t_x2__x t_x0_x1__x)))))
 (> ?x872 0.0)))
(assert
 (let ((?x878 (- (* (- t_y0__x t_x0_x1__x) (- t_y2__y t_x0_x1__y)) (* (- t_y0__y t_x0_x1__y) (- t_y2__x t_x0_x1__x)))))
 (> ?x878 0.0)))
(assert
 (let ((?x881 (- 0.0 t_y0__y)))
 (let ((?x880 (- t_y1__x t_y0__x)))
 (let ((?x882 (* ?x880 ?x881)))
 (> (- ?x882 (* (- t_y1__y t_y0__y) (- 0.0 t_y0__x))) 0.0)))))
(assert
 (let ((?x881 (- 0.0 t_y0__y)))
 (let ((?x880 (- t_y1__x t_y0__x)))
 (let ((?x882 (* ?x880 ?x881)))
 (> (- ?x882 (* (- t_y1__y t_y0__y) (- 1.0 t_y0__x))) 0.0)))))
(assert
 (let ((?x896 (- (* (- t_y1__x t_y0__x) (- q0__y t_y0__y)) (* (- t_y1__y t_y0__y) (- q0__x t_y0__x)))))
 (> ?x896 0.0)))
(assert
 (let ((?x900 (- (* (- t_y1__x t_y0__x) (- c0__y t_y0__y)) (* (- t_y1__y t_y0__y) (- c0__x t_y0__x)))))
 (> ?x900 0.0)))
(assert
 (let ((?x906 (- (* (- t_y1__x t_y0__x) (- c2__y t_y0__y)) (* (- t_y1__y t_y0__y) (- c2__x t_y0__x)))))
 (> ?x906 0.0)))
(assert
 (let ((?x912 (- (* (- t_y1__x t_y0__x) (- q1__y t_y0__y)) (* (- t_y1__y t_y0__y) (- q1__x t_y0__x)))))
 (> ?x912 0.0)))
(assert
 (let ((?x918 (- (* (- t_y1__x t_y0__x) (- c1__y t_y0__y)) (* (- t_y1__y t_y0__y) (- c1__x t_y0__x)))))
 (> ?x918 0.0)))
(assert
 (let ((?x924 (- (* (- t_y1__x t_y0__x) (- q2__y t_y0__y)) (* (- t_y1__y t_y0__y) (- q2__x t_y0__x)))))
 (> ?x924 0.0)))
(assert
 (let ((?x930 (- (* (- t_y1__x t_y0__x) (- right__y t_y0__y)) (* (- t_y1__y t_y0__y) (- right__x t_y0__x)))))
 (> ?x930 0.0)))
(assert
 (let ((?x936 (- (* (- t_y1__x t_y0__x) (- t_x0_x1__y t_y0__y)) (* (- t_y1__y t_y0__y) (- t_x0_x1__x t_y0__x)))))
 (> ?x936 0.0)))
(assert
 (let ((?x942 (- (* (- t_y1__x t_y0__x) (- t_x2__y t_y0__y)) (* (- t_y1__y t_y0__y) (- t_x2__x t_y0__x)))))
 (> ?x942 0.0)))
(assert
 (let ((?x948 (- (* (- t_y1__x t_y0__x) (- t_y2__y t_y0__y)) (* (- t_y1__y t_y0__y) (- t_y2__x t_y0__x)))))
 (> ?x948 0.0)))
(assert
 (let ((?x951 (- 0.0 t_y1__y)))
 (let ((?x950 (- t_x2__x t_y1__x)))
 (let ((?x952 (* ?x950 ?x951)))
 (> (- ?x952 (* (- t_x2__y t_y1__y) (- 0.0 t_y1__x))) 0.0)))))
(assert
 (let ((?x951 (- 0.0 t_y1__y)))
 (let ((?x950 (- t_x2__x t_y1__x)))
 (let ((?x952 (* ?x950 ?x951)))
 (> (- ?x952 (* (- t_x2__y t_y1__y) (- 1.0 t_y1__x))) 0.0)))))
(assert
 (let ((?x966 (- (* (- t_x2__x t_y1__x) (- q0__y t_y1__y)) (* (- t_x2__y t_y1__y) (- q0__x t_y1__x)))))
 (> ?x966 0.0)))
(assert
 (let ((?x972 (- (* (- t_x2__x t_y1__x) (- c0__y t_y1__y)) (* (- t_x2__y t_y1__y) (- c0__x t_y1__x)))))
 (> ?x972 0.0)))
(assert
 (let ((?x978 (- (* (- t_x2__x t_y1__x) (- c2__y t_y1__y)) (* (- t_x2__y t_y1__y) (- c2__x t_y1__x)))))
 (> ?x978 0.0)))
(assert
 (let ((?x984 (- (* (- t_x2__x t_y1__x) (- q1__y t_y1__y)) (* (- t_x2__y t_y1__y) (- q1__x t_y1__x)))))
 (> ?x984 0.0)))
(assert
 (let ((?x988 (- (* (- t_x2__x t_y1__x) (- c1__y t_y1__y)) (* (- t_x2__y t_y1__y) (- c1__x t_y1__x)))))
 (> ?x988 0.0)))
(assert
 (let ((?x994 (- (* (- t_x2__x t_y1__x) (- q2__y t_y1__y)) (* (- t_x2__y t_y1__y) (- q2__x t_y1__x)))))
 (> ?x994 0.0)))
(assert
 (let ((?x1000 (- (* (- t_x2__x t_y1__x) (- right__y t_y1__y)) (* (- t_x2__y t_y1__y) (- right__x t_y1__x)))))
 (> ?x1000 0.0)))
(assert
 (let ((?x1006 (- (* (- t_x2__x t_y1__x) (- t_x0_x1__y t_y1__y)) (* (- t_x2__y t_y1__y) (- t_x0_x1__x t_y1__x)))))
 (> ?x1006 0.0)))
(assert
 (let ((?x1012 (- (* (- t_x2__x t_y1__x) (- t_y0__y t_y1__y)) (* (- t_x2__y t_y1__y) (- t_y0__x t_y1__x)))))
 (> ?x1012 0.0)))
(assert
 (let ((?x1018 (- (* (- t_x2__x t_y1__x) (- t_y2__y t_y1__y)) (* (- t_x2__y t_y1__y) (- t_y2__x t_y1__x)))))
 (> ?x1018 0.0)))
(assert
 (let ((?x1021 (- 0.0 t_x2__y)))
 (let ((?x1020 (- t_y2__x t_x2__x)))
 (let ((?x1022 (* ?x1020 ?x1021)))
 (> (- ?x1022 (* (- t_y2__y t_x2__y) (- 0.0 t_x2__x))) 0.0)))))
(assert
 (let ((?x1021 (- 0.0 t_x2__y)))
 (let ((?x1020 (- t_y2__x t_x2__x)))
 (let ((?x1022 (* ?x1020 ?x1021)))
 (> (- ?x1022 (* (- t_y2__y t_x2__y) (- 1.0 t_x2__x))) 0.0)))))
(assert
 (let ((?x1036 (- (* (- t_y2__x t_x2__x) (- q0__y t_x2__y)) (* (- t_y2__y t_x2__y) (- q0__x t_x2__x)))))
 (> ?x1036 0.0)))
(assert
 (let ((?x1042 (- (* (- t_y2__x t_x2__x) (- c0__y t_x2__y)) (* (- t_y2__y t_x2__y) (- c0__x t_x2__x)))))
 (> ?x1042 0.0)))
(assert
 (let ((?x1046 (- (* (- t_y2__x t_x2__x) (- c2__y t_x2__y)) (* (- t_y2__y t_x2__y) (- c2__x t_x2__x)))))
 (> ?x1046 0.0)))
(assert
 (let ((?x1052 (- (* (- t_y2__x t_x2__x) (- q1__y t_x2__y)) (* (- t_y2__y t_x2__y) (- q1__x t_x2__x)))))
 (> ?x1052 0.0)))
(assert
 (let ((?x1058 (- (* (- t_y2__x t_x2__x) (- c1__y t_x2__y)) (* (- t_y2__y t_x2__y) (- c1__x t_x2__x)))))
 (> ?x1058 0.0)))
(assert
 (let ((?x1064 (- (* (- t_y2__x t_x2__x) (- q2__y t_x2__y)) (* (- t_y2__y t_x2__y) (- q2__x t_x2__x)))))
 (> ?x1064 0.0)))
(assert
 (let ((?x1070 (- (* (- t_y2__x t_x2__x) (- right__y t_x2__y)) (* (- t_y2__y t_x2__y) (- right__x t_x2__x)))))
 (> ?x1070 0.0)))
(assert
 (let ((?x1076 (- (* (- t_y2__x t_x2__x) (- t_x0_x1__y t_x2__y)) (* (- t_y2__y t_x2__y) (- t_x0_x1__x t_x2__x)))))
 (> ?x1076 0.0)))
(assert
 (let ((?x1082 (- (* (- t_y2__x t_x2__x) (- t_y0__y t_x2__y)) (* (- t_y2__y t_x2__y) (- t_y0__x t_x2__x)))))
 (> ?x1082 0.0)))
(assert
 (let ((?x1088 (- (* (- t_y2__x t_x2__x) (- t_y1__y t_x2__y)) (* (- t_y2__y t_x2__y) (- t_y1__x t_x2__x)))))
 (> ?x1088 0.0)))
(assert
 (let ((?x1095 (- (* (- 0.0 t_y2__x) (- 0.0 t_y2__y)) (* (- 0.0 t_y2__y) (- 1.0 t_y2__x)))))
 (> ?x1095 0.0)))
(assert
 (let ((?x1101 (- (* (- 0.0 t_y2__x) (- q0__y t_y2__y)) (* (- 0.0 t_y2__y) (- q0__x t_y2__x)))))
 (> ?x1101 0.0)))
(assert
 (let ((?x1107 (- (* (- 0.0 t_y2__x) (- c0__y t_y2__y)) (* (- 0.0 t_y2__y) (- c0__x t_y2__x)))))
 (> ?x1107 0.0)))
(assert
 (let ((?x1111 (- (* (- 0.0 t_y2__x) (- c2__y t_y2__y)) (* (- 0.0 t_y2__y) (- c2__x t_y2__x)))))
 (> ?x1111 0.0)))
(assert
 (let ((?x1117 (- (* (- 0.0 t_y2__x) (- q1__y t_y2__y)) (* (- 0.0 t_y2__y) (- q1__x t_y2__x)))))
 (> ?x1117 0.0)))
(assert
 (let ((?x1123 (- (* (- 0.0 t_y2__x) (- c1__y t_y2__y)) (* (- 0.0 t_y2__y) (- c1__x t_y2__x)))))
 (> ?x1123 0.0)))
(assert
 (let ((?x1129 (- (* (- 0.0 t_y2__x) (- q2__y t_y2__y)) (* (- 0.0 t_y2__y) (- q2__x t_y2__x)))))
 (> ?x1129 0.0)))
(assert
 (let ((?x1135 (- (* (- 0.0 t_y2__x) (- right__y t_y2__y)) (* (- 0.0 t_y2__y) (- right__x t_y2__x)))))
 (> ?x1135 0.0)))
(assert
 (let ((?x1141 (- (* (- 0.0 t_y2__x) (- t_x0_x1__y t_y2__y)) (* (- 0.0 t_y2__y) (- t_x0_x1__x t_y2__x)))))
 (> ?x1141 0.0)))
(assert
 (let ((?x1147 (- (* (- 0.0 t_y2__x) (- t_y0__y t_y2__y)) (* (- 0.0 t_y2__y) (- t_y0__x t_y2__x)))))
 (> ?x1147 0.0)))
(assert
 (let ((?x1153 (- (* (- 0.0 t_y2__x) (- t_y1__y t_y2__y)) (* (- 0.0 t_y2__y) (- t_y1__x t_y2__x)))))
 (> ?x1153 0.0)))
(assert
 (let ((?x1159 (- (* (- 0.0 t_y2__x) (- t_x2__y t_y2__y)) (* (- 0.0 t_y2__y) (- t_x2__x t_y2__x)))))
 (> ?x1159 0.0)))
(assert
 (let ((?x1163 (- (* (- right__x 1.0) (- 0.0 0.0)) (* (- right__y 0.0) (- 0.0 1.0)))))
 (> ?x1163 0.0)))
(assert
 (let ((?x1167 (- (* (- right__x 1.0) (- t_x0_x1__y 0.0)) (* (- right__y 0.0) (- t_x0_x1__x 1.0)))))
 (> ?x1167 0.0)))
(assert
 (let ((?x1171 (- (* (- right__x 1.0) (- t_y0__y 0.0)) (* (- right__y 0.0) (- t_y0__x 1.0)))))
 (> ?x1171 0.0)))
(assert
 (let ((?x1175 (- (* (- right__x 1.0) (- t_y1__y 0.0)) (* (- right__y 0.0) (- t_y1__x 1.0)))))
 (> ?x1175 0.0)))
(assert
 (let ((?x1179 (- (* (- right__x 1.0) (- t_x2__y 0.0)) (* (- right__y 0.0) (- t_x2__x 1.0)))))
 (> ?x1179 0.0)))
(assert
 (let ((?x1183 (- (* (- right__x 1.0) (- t_y2__y 0.0)) (* (- right__y 0.0) (- t_y2__x 1.0)))))
 (> ?x1183 0.0)))
(assert
 (let ((?x1187 (- (* (- right__x 1.0) (- q0__y 0.0)) (* (- right__y 0.0) (- q0__x 1.0)))))
 (< ?x1187 0.0)))
(assert
 (let ((?x1191 (- (* (- right__x 1.0) (- c0__y 0.0)) (* (- right__y 0.0) (- c0__x 1.0)))))
 (< ?x1191 0.0)))
(assert
 (let ((?x1195 (- (* (- right__x 1.0) (- c2__y 0.0)) (* (- right__y 0.0) (- c2__x 1.0)))))
 (< ?x1195 0.0)))
(assert
 (let ((?x1199 (- (* (- right__x 1.0) (- q1__y 0.0)) (* (- right__y 0.0) (- q1__x 1.0)))))
 (< ?x1199 0.0)))
(assert
 (let ((?x1203 (- (* (- right__x 1.0) (- c1__y 0.0)) (* (- right__y 0.0) (- c1__x 1.0)))))
 (< ?x1203 0.0)))
(assert
 (let ((?x1207 (- (* (- right__x 1.0) (- q2__y 0.0)) (* (- right__y 0.0) (- q2__x 1.0)))))
 (< ?x1207 0.0)))
(assert
 (let ((?x1213 (+ (* (- mec__x q0__x) (- mec__x q0__x)) (* (- mec__y q0__y) (- mec__y q0__y)))))
 (<= ?x1213 mec__radius_sq)))
(assert
 (let ((?x1219 (+ (* (- mec__x q1__x) (- mec__x q1__x)) (* (- mec__y q1__y) (- mec__y q1__y)))))
 (<= ?x1219 mec__radius_sq)))
(assert
 (let ((?x1225 (+ (* (- mec__x q2__x) (- mec__x q2__x)) (* (- mec__y q2__y) (- mec__y q2__y)))))
 (<= ?x1225 mec__radius_sq)))
(assert
 (let ((?x1231 (+ (* (- mec__x c0__x) (- mec__x c0__x)) (* (- mec__y c0__y) (- mec__y c0__y)))))
 (<= ?x1231 mec__radius_sq)))
(assert
 (let ((?x1237 (+ (* (- mec__x c1__x) (- mec__x c1__x)) (* (- mec__y c1__y) (- mec__y c1__y)))))
 (<= ?x1237 mec__radius_sq)))
(assert
 (let ((?x1243 (+ (* (- mec__x c2__x) (- mec__x c2__x)) (* (- mec__y c2__y) (- mec__y c2__y)))))
 (<= ?x1243 mec__radius_sq)))
(assert
 (let ((?x1249 (+ (* (- mec__x t_x0_x1__x) (- mec__x t_x0_x1__x)) (* (- mec__y t_x0_x1__y) (- mec__y t_x0_x1__y)))))
 (<= ?x1249 mec__radius_sq)))
(assert
 (let ((?x1255 (+ (* (- mec__x t_y0__x) (- mec__x t_y0__x)) (* (- mec__y t_y0__y) (- mec__y t_y0__y)))))
 (<= ?x1255 mec__radius_sq)))
(assert
 (let ((?x1261 (+ (* (- mec__x t_y1__x) (- mec__x t_y1__x)) (* (- mec__y t_y1__y) (- mec__y t_y1__y)))))
 (<= ?x1261 mec__radius_sq)))
(assert
 (let ((?x1267 (+ (* (- mec__x t_x2__x) (- mec__x t_x2__x)) (* (- mec__y t_x2__y) (- mec__y t_x2__y)))))
 (<= ?x1267 mec__radius_sq)))
(assert
 (let ((?x1273 (+ (* (- mec__x t_y2__x) (- mec__x t_y2__x)) (* (- mec__y t_y2__y) (- mec__y t_y2__y)))))
 (<= ?x1273 mec__radius_sq)))
(assert
 (let ((?x1277 (+ (* (- 1.0 0.0) (- 1.0 0.0)) (* (- 0.0 0.0) (- 0.0 0.0)))))
 (> ?x1277 0.0)))
(assert
 (let ((?x181 (- q0__y 0.0)))
 (let ((?x1280 (* ?x181 ?x181)))
 (> (+ (* (- q0__x 0.0) (- q0__x 0.0)) ?x1280) 0.0))))
(assert
 (let ((?x181 (- q0__y 0.0)))
 (let ((?x1280 (* ?x181 ?x181)))
 (> (+ (* (- q0__x 1.0) (- q0__x 1.0)) ?x1280) 0.0))))
(assert
 (let ((?x200 (- q1__y 0.0)))
 (let ((?x1287 (* ?x200 ?x200)))
 (> (+ (* (- q1__x 0.0) (- q1__x 0.0)) ?x1287) 0.0))))
(assert
 (let ((?x200 (- q1__y 0.0)))
 (let ((?x1287 (* ?x200 ?x200)))
 (> (+ (* (- q1__x 1.0) (- q1__x 1.0)) ?x1287) 0.0))))
(assert
 (let ((?x1295 (+ (* (- q1__x q0__x) (- q1__x q0__x)) (* (- q1__y q0__y) (- q1__y q0__y)))))
 (> ?x1295 0.0)))
(assert
 (let ((?x212 (- q2__y 0.0)))
 (let ((?x1298 (* ?x212 ?x212)))
 (> (+ (* (- q2__x 0.0) (- q2__x 0.0)) ?x1298) 0.0))))
(assert
 (let ((?x212 (- q2__y 0.0)))
 (let ((?x1298 (* ?x212 ?x212)))
 (> (+ (* (- q2__x 1.0) (- q2__x 1.0)) ?x1298) 0.0))))
(assert
 (let ((?x1306 (+ (* (- q2__x q0__x) (- q2__x q0__x)) (* (- q2__y q0__y) (- q2__y q0__y)))))
 (> ?x1306 0.0)))
(assert
 (let ((?x1310 (+ (* (- q2__x q1__x) (- q2__x q1__x)) (* (- q2__y q1__y) (- q2__y q1__y)))))
 (> ?x1310 0.0)))
(assert
 (let ((?x218 (- right__y 0.0)))
 (let ((?x1313 (* ?x218 ?x218)))
 (> (+ (* (- right__x 0.0) (- right__x 0.0)) ?x1313) 0.0))))
(assert
 (let ((?x218 (- right__y 0.0)))
 (let ((?x1313 (* ?x218 ?x218)))
 (> (+ (* (- right__x 1.0) (- right__x 1.0)) ?x1313) 0.0))))
(assert
 (let ((?x1321 (+ (* (- right__x q0__x) (- right__x q0__x)) (* (- right__y q0__y) (- right__y q0__y)))))
 (> ?x1321 0.0)))
(assert
 (let ((?x1325 (+ (* (- right__x q1__x) (- right__x q1__x)) (* (- right__y q1__y) (- right__y q1__y)))))
 (> ?x1325 0.0)))
(assert
 (let ((?x1329 (+ (* (- right__x q2__x) (- right__x q2__x)) (* (- right__y q2__y) (- right__y q2__y)))))
 (> ?x1329 0.0)))
(assert
 (let ((?x188 (- c0__y 0.0)))
 (let ((?x1332 (* ?x188 ?x188)))
 (let ((?x1333 (+ (* (- c0__x 0.0) (- c0__x 0.0)) ?x1332)))
 (> ?x1333 0.0)))))
(assert
 (let ((?x188 (- c0__y 0.0)))
 (let ((?x1332 (* ?x188 ?x188)))
 (let ((?x1336 (+ (* (- c0__x 1.0) (- c0__x 1.0)) ?x1332)))
 (> ?x1336 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (> ?x120 0.0)))
(assert
 (let ((?x1341 (+ (* (- c0__x q1__x) (- c0__x q1__x)) (* (- c0__y q1__y) (- c0__y q1__y)))))
 (> ?x1341 0.0)))
(assert
 (let ((?x1345 (+ (* (- c0__x q2__x) (- c0__x q2__x)) (* (- c0__y q2__y) (- c0__y q2__y)))))
 (> ?x1345 0.0)))
(assert
 (let ((?x1349 (+ (* (- c0__x right__x) (- c0__x right__x)) (* (- c0__y right__y) (- c0__y right__y)))))
 (> ?x1349 0.0)))
(assert
 (let ((?x206 (- c1__y 0.0)))
 (let ((?x1352 (* ?x206 ?x206)))
 (let ((?x1353 (+ (* (- c1__x 0.0) (- c1__x 0.0)) ?x1352)))
 (> ?x1353 0.0)))))
(assert
 (let ((?x206 (- c1__y 0.0)))
 (let ((?x1352 (* ?x206 ?x206)))
 (let ((?x1356 (+ (* (- c1__x 1.0) (- c1__x 1.0)) ?x1352)))
 (> ?x1356 0.0)))))
(assert
 (let ((?x1360 (+ (* (- c1__x q0__x) (- c1__x q0__x)) (* (- c1__y q0__y) (- c1__y q0__y)))))
 (> ?x1360 0.0)))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (> ?x137 0.0)))
(assert
 (let ((?x1365 (+ (* (- c1__x q2__x) (- c1__x q2__x)) (* (- c1__y q2__y) (- c1__y q2__y)))))
 (> ?x1365 0.0)))
(assert
 (let ((?x1369 (+ (* (- c1__x right__x) (- c1__x right__x)) (* (- c1__y right__y) (- c1__y right__y)))))
 (> ?x1369 0.0)))
(assert
 (let ((?x1373 (+ (* (- c1__x c0__x) (- c1__x c0__x)) (* (- c1__y c0__y) (- c1__y c0__y)))))
 (> ?x1373 0.0)))
(assert
 (let ((?x194 (- c2__y 0.0)))
 (let ((?x1376 (* ?x194 ?x194)))
 (let ((?x1377 (+ (* (- c2__x 0.0) (- c2__x 0.0)) ?x1376)))
 (> ?x1377 0.0)))))
(assert
 (let ((?x194 (- c2__y 0.0)))
 (let ((?x1376 (* ?x194 ?x194)))
 (let ((?x1380 (+ (* (- c2__x 1.0) (- c2__x 1.0)) ?x1376)))
 (> ?x1380 0.0)))))
(assert
 (let ((?x1384 (+ (* (- c2__x q0__x) (- c2__x q0__x)) (* (- c2__y q0__y) (- c2__y q0__y)))))
 (> ?x1384 0.0)))
(assert
 (let ((?x1388 (+ (* (- c2__x q1__x) (- c2__x q1__x)) (* (- c2__y q1__y) (- c2__y q1__y)))))
 (> ?x1388 0.0)))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (> ?x154 0.0)))
(assert
 (let ((?x1393 (+ (* (- c2__x right__x) (- c2__x right__x)) (* (- c2__y right__y) (- c2__y right__y)))))
 (> ?x1393 0.0)))
(assert
 (let ((?x1397 (+ (* (- c2__x c0__x) (- c2__x c0__x)) (* (- c2__y c0__y) (- c2__y c0__y)))))
 (> ?x1397 0.0)))
(assert
 (let ((?x1401 (+ (* (- c2__x c1__x) (- c2__x c1__x)) (* (- c2__y c1__y) (- c2__y c1__y)))))
 (> ?x1401 0.0)))
(assert
 (let ((?x224 (- t_x0_x1__y 0.0)))
 (let ((?x1404 (* ?x224 ?x224)))
 (> (+ (* (- t_x0_x1__x 0.0) (- t_x0_x1__x 0.0)) ?x1404) 0.0))))
(assert
 (let ((?x224 (- t_x0_x1__y 0.0)))
 (let ((?x1404 (* ?x224 ?x224)))
 (> (+ (* (- t_x0_x1__x 1.0) (- t_x0_x1__x 1.0)) ?x1404) 0.0))))
(assert
 (let ((?x1412 (+ (* (- t_x0_x1__x q0__x) (- t_x0_x1__x q0__x)) (* (- t_x0_x1__y q0__y) (- t_x0_x1__y q0__y)))))
 (> ?x1412 0.0)))
(assert
 (let ((?x1416 (+ (* (- t_x0_x1__x q1__x) (- t_x0_x1__x q1__x)) (* (- t_x0_x1__y q1__y) (- t_x0_x1__y q1__y)))))
 (> ?x1416 0.0)))
(assert
 (let ((?x1420 (+ (* (- t_x0_x1__x q2__x) (- t_x0_x1__x q2__x)) (* (- t_x0_x1__y q2__y) (- t_x0_x1__y q2__y)))))
 (> ?x1420 0.0)))
(assert
 (let ((?x1424 (+ (* (- t_x0_x1__x right__x) (- t_x0_x1__x right__x)) (* (- t_x0_x1__y right__y) (- t_x0_x1__y right__y)))))
 (> ?x1424 0.0)))
(assert
 (let ((?x1428 (+ (* (- t_x0_x1__x c0__x) (- t_x0_x1__x c0__x)) (* (- t_x0_x1__y c0__y) (- t_x0_x1__y c0__y)))))
 (> ?x1428 0.0)))
(assert
 (let ((?x1432 (+ (* (- t_x0_x1__x c1__x) (- t_x0_x1__x c1__x)) (* (- t_x0_x1__y c1__y) (- t_x0_x1__y c1__y)))))
 (> ?x1432 0.0)))
(assert
 (let ((?x1436 (+ (* (- t_x0_x1__x c2__x) (- t_x0_x1__x c2__x)) (* (- t_x0_x1__y c2__y) (- t_x0_x1__y c2__y)))))
 (> ?x1436 0.0)))
(assert
 (let ((?x230 (- t_y0__y 0.0)))
 (let ((?x1439 (* ?x230 ?x230)))
 (> (+ (* (- t_y0__x 0.0) (- t_y0__x 0.0)) ?x1439) 0.0))))
(assert
 (let ((?x230 (- t_y0__y 0.0)))
 (let ((?x1439 (* ?x230 ?x230)))
 (> (+ (* (- t_y0__x 1.0) (- t_y0__x 1.0)) ?x1439) 0.0))))
(assert
 (let ((?x1447 (+ (* (- t_y0__x q0__x) (- t_y0__x q0__x)) (* (- t_y0__y q0__y) (- t_y0__y q0__y)))))
 (> ?x1447 0.0)))
(assert
 (let ((?x1451 (+ (* (- t_y0__x q1__x) (- t_y0__x q1__x)) (* (- t_y0__y q1__y) (- t_y0__y q1__y)))))
 (> ?x1451 0.0)))
(assert
 (let ((?x1455 (+ (* (- t_y0__x q2__x) (- t_y0__x q2__x)) (* (- t_y0__y q2__y) (- t_y0__y q2__y)))))
 (> ?x1455 0.0)))
(assert
 (let ((?x1459 (+ (* (- t_y0__x right__x) (- t_y0__x right__x)) (* (- t_y0__y right__y) (- t_y0__y right__y)))))
 (> ?x1459 0.0)))
(assert
 (let ((?x1463 (+ (* (- t_y0__x c0__x) (- t_y0__x c0__x)) (* (- t_y0__y c0__y) (- t_y0__y c0__y)))))
 (> ?x1463 0.0)))
(assert
 (let ((?x1467 (+ (* (- t_y0__x c1__x) (- t_y0__x c1__x)) (* (- t_y0__y c1__y) (- t_y0__y c1__y)))))
 (> ?x1467 0.0)))
(assert
 (let ((?x1471 (+ (* (- t_y0__x c2__x) (- t_y0__x c2__x)) (* (- t_y0__y c2__y) (- t_y0__y c2__y)))))
 (> ?x1471 0.0)))
(assert
 (let ((?x1475 (+ (* (- t_y0__x t_x0_x1__x) (- t_y0__x t_x0_x1__x)) (* (- t_y0__y t_x0_x1__y) (- t_y0__y t_x0_x1__y)))))
 (> ?x1475 0.0)))
(assert
 (let ((?x236 (- t_y1__y 0.0)))
 (let ((?x1478 (* ?x236 ?x236)))
 (> (+ (* (- t_y1__x 0.0) (- t_y1__x 0.0)) ?x1478) 0.0))))
(assert
 (let ((?x236 (- t_y1__y 0.0)))
 (let ((?x1478 (* ?x236 ?x236)))
 (> (+ (* (- t_y1__x 1.0) (- t_y1__x 1.0)) ?x1478) 0.0))))
(assert
 (let ((?x1486 (+ (* (- t_y1__x q0__x) (- t_y1__x q0__x)) (* (- t_y1__y q0__y) (- t_y1__y q0__y)))))
 (> ?x1486 0.0)))
(assert
 (let ((?x1490 (+ (* (- t_y1__x q1__x) (- t_y1__x q1__x)) (* (- t_y1__y q1__y) (- t_y1__y q1__y)))))
 (> ?x1490 0.0)))
(assert
 (let ((?x1494 (+ (* (- t_y1__x q2__x) (- t_y1__x q2__x)) (* (- t_y1__y q2__y) (- t_y1__y q2__y)))))
 (> ?x1494 0.0)))
(assert
 (let ((?x1498 (+ (* (- t_y1__x right__x) (- t_y1__x right__x)) (* (- t_y1__y right__y) (- t_y1__y right__y)))))
 (> ?x1498 0.0)))
(assert
 (let ((?x1502 (+ (* (- t_y1__x c0__x) (- t_y1__x c0__x)) (* (- t_y1__y c0__y) (- t_y1__y c0__y)))))
 (> ?x1502 0.0)))
(assert
 (let ((?x1506 (+ (* (- t_y1__x c1__x) (- t_y1__x c1__x)) (* (- t_y1__y c1__y) (- t_y1__y c1__y)))))
 (> ?x1506 0.0)))
(assert
 (let ((?x1510 (+ (* (- t_y1__x c2__x) (- t_y1__x c2__x)) (* (- t_y1__y c2__y) (- t_y1__y c2__y)))))
 (> ?x1510 0.0)))
(assert
 (let ((?x1514 (+ (* (- t_y1__x t_x0_x1__x) (- t_y1__x t_x0_x1__x)) (* (- t_y1__y t_x0_x1__y) (- t_y1__y t_x0_x1__y)))))
 (> ?x1514 0.0)))
(assert
 (let ((?x1518 (+ (* (- t_y1__x t_y0__x) (- t_y1__x t_y0__x)) (* (- t_y1__y t_y0__y) (- t_y1__y t_y0__y)))))
 (> ?x1518 0.0)))
(assert
 (let ((?x242 (- t_x2__y 0.0)))
 (let ((?x1521 (* ?x242 ?x242)))
 (> (+ (* (- t_x2__x 0.0) (- t_x2__x 0.0)) ?x1521) 0.0))))
(assert
 (let ((?x242 (- t_x2__y 0.0)))
 (let ((?x1521 (* ?x242 ?x242)))
 (> (+ (* (- t_x2__x 1.0) (- t_x2__x 1.0)) ?x1521) 0.0))))
(assert
 (let ((?x1529 (+ (* (- t_x2__x q0__x) (- t_x2__x q0__x)) (* (- t_x2__y q0__y) (- t_x2__y q0__y)))))
 (> ?x1529 0.0)))
(assert
 (let ((?x1533 (+ (* (- t_x2__x q1__x) (- t_x2__x q1__x)) (* (- t_x2__y q1__y) (- t_x2__y q1__y)))))
 (> ?x1533 0.0)))
(assert
 (let ((?x1537 (+ (* (- t_x2__x q2__x) (- t_x2__x q2__x)) (* (- t_x2__y q2__y) (- t_x2__y q2__y)))))
 (> ?x1537 0.0)))
(assert
 (let ((?x1541 (+ (* (- t_x2__x right__x) (- t_x2__x right__x)) (* (- t_x2__y right__y) (- t_x2__y right__y)))))
 (> ?x1541 0.0)))
(assert
 (let ((?x1545 (+ (* (- t_x2__x c0__x) (- t_x2__x c0__x)) (* (- t_x2__y c0__y) (- t_x2__y c0__y)))))
 (> ?x1545 0.0)))
(assert
 (let ((?x1549 (+ (* (- t_x2__x c1__x) (- t_x2__x c1__x)) (* (- t_x2__y c1__y) (- t_x2__y c1__y)))))
 (> ?x1549 0.0)))
(assert
 (let ((?x1553 (+ (* (- t_x2__x c2__x) (- t_x2__x c2__x)) (* (- t_x2__y c2__y) (- t_x2__y c2__y)))))
 (> ?x1553 0.0)))
(assert
 (let ((?x1557 (+ (* (- t_x2__x t_x0_x1__x) (- t_x2__x t_x0_x1__x)) (* (- t_x2__y t_x0_x1__y) (- t_x2__y t_x0_x1__y)))))
 (> ?x1557 0.0)))
(assert
 (let ((?x1561 (+ (* (- t_x2__x t_y0__x) (- t_x2__x t_y0__x)) (* (- t_x2__y t_y0__y) (- t_x2__y t_y0__y)))))
 (> ?x1561 0.0)))
(assert
 (let ((?x1565 (+ (* (- t_x2__x t_y1__x) (- t_x2__x t_y1__x)) (* (- t_x2__y t_y1__y) (- t_x2__y t_y1__y)))))
 (> ?x1565 0.0)))
(assert
 (let ((?x248 (- t_y2__y 0.0)))
 (let ((?x1568 (* ?x248 ?x248)))
 (> (+ (* (- t_y2__x 0.0) (- t_y2__x 0.0)) ?x1568) 0.0))))
(assert
 (let ((?x248 (- t_y2__y 0.0)))
 (let ((?x1568 (* ?x248 ?x248)))
 (> (+ (* (- t_y2__x 1.0) (- t_y2__x 1.0)) ?x1568) 0.0))))
(assert
 (let ((?x1576 (+ (* (- t_y2__x q0__x) (- t_y2__x q0__x)) (* (- t_y2__y q0__y) (- t_y2__y q0__y)))))
 (> ?x1576 0.0)))
(assert
 (let ((?x1580 (+ (* (- t_y2__x q1__x) (- t_y2__x q1__x)) (* (- t_y2__y q1__y) (- t_y2__y q1__y)))))
 (> ?x1580 0.0)))
(assert
 (let ((?x1584 (+ (* (- t_y2__x q2__x) (- t_y2__x q2__x)) (* (- t_y2__y q2__y) (- t_y2__y q2__y)))))
 (> ?x1584 0.0)))
(assert
 (let ((?x1588 (+ (* (- t_y2__x right__x) (- t_y2__x right__x)) (* (- t_y2__y right__y) (- t_y2__y right__y)))))
 (> ?x1588 0.0)))
(assert
 (let ((?x1592 (+ (* (- t_y2__x c0__x) (- t_y2__x c0__x)) (* (- t_y2__y c0__y) (- t_y2__y c0__y)))))
 (> ?x1592 0.0)))
(assert
 (let ((?x1596 (+ (* (- t_y2__x c1__x) (- t_y2__x c1__x)) (* (- t_y2__y c1__y) (- t_y2__y c1__y)))))
 (> ?x1596 0.0)))
(assert
 (let ((?x1600 (+ (* (- t_y2__x c2__x) (- t_y2__x c2__x)) (* (- t_y2__y c2__y) (- t_y2__y c2__y)))))
 (> ?x1600 0.0)))
(assert
 (let ((?x1604 (+ (* (- t_y2__x t_x0_x1__x) (- t_y2__x t_x0_x1__x)) (* (- t_y2__y t_x0_x1__y) (- t_y2__y t_x0_x1__y)))))
 (> ?x1604 0.0)))
(assert
 (let ((?x1608 (+ (* (- t_y2__x t_y0__x) (- t_y2__x t_y0__x)) (* (- t_y2__y t_y0__y) (- t_y2__y t_y0__y)))))
 (> ?x1608 0.0)))
(assert
 (let ((?x1612 (+ (* (- t_y2__x t_y1__x) (- t_y2__x t_y1__x)) (* (- t_y2__y t_y1__y) (- t_y2__y t_y1__y)))))
 (> ?x1612 0.0)))
(assert
 (let ((?x1616 (+ (* (- t_y2__x t_x2__x) (- t_y2__x t_x2__x)) (* (- t_y2__y t_x2__y) (- t_y2__y t_x2__y)))))
 (> ?x1616 0.0)))
(assert
 (let ((?x1620 (+ (* (- 0.0 c0__x) (- 0.0 c0__x)) (* (- 0.0 c0__y) (- 0.0 c0__y)))))
 (let ((?x1621 (- ?x1620 1.0)))
 (> (* ?x1621 ?x1621) 0.0))))
(assert
 (let ((?x1626 (+ (* (- 0.0 c1__x) (- 0.0 c1__x)) (* (- 0.0 c1__y) (- 0.0 c1__y)))))
 (let ((?x1627 (- ?x1626 1.0)))
 (> (* ?x1627 ?x1627) 0.0))))
(assert
 (let ((?x1632 (+ (* (- 0.0 c2__x) (- 0.0 c2__x)) (* (- 0.0 c2__y) (- 0.0 c2__y)))))
 (let ((?x1633 (- ?x1632 1.0)))
 (> (* ?x1633 ?x1633) 0.0))))
(assert
 (let ((?x1638 (+ (* (- 0.0 t_x0_x1__x) (- 0.0 t_x0_x1__x)) (* (- 0.0 t_x0_x1__y) (- 0.0 t_x0_x1__y)))))
 (let ((?x1639 (- ?x1638 1.0)))
 (> (* ?x1639 ?x1639) 0.0))))
(assert
 (let ((?x1644 (+ (* (- 0.0 t_y0__x) (- 0.0 t_y0__x)) (* (- 0.0 t_y0__y) (- 0.0 t_y0__y)))))
 (let ((?x1645 (- ?x1644 1.0)))
 (> (* ?x1645 ?x1645) 0.0))))
(assert
 (let ((?x1650 (+ (* (- 0.0 t_y1__x) (- 0.0 t_y1__x)) (* (- 0.0 t_y1__y) (- 0.0 t_y1__y)))))
 (let ((?x1651 (- ?x1650 1.0)))
 (> (* ?x1651 ?x1651) 0.0))))
(assert
 (let ((?x1656 (+ (* (- 0.0 t_x2__x) (- 0.0 t_x2__x)) (* (- 0.0 t_x2__y) (- 0.0 t_x2__y)))))
 (let ((?x1657 (- ?x1656 1.0)))
 (> (* ?x1657 ?x1657) 0.0))))
(assert
 (let ((?x1662 (+ (* (- 0.0 t_y2__x) (- 0.0 t_y2__x)) (* (- 0.0 t_y2__y) (- 0.0 t_y2__y)))))
 (let ((?x1663 (- ?x1662 1.0)))
 (> (* ?x1663 ?x1663) 0.0))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x188 (- c0__y 0.0)))
 (let ((?x1332 (* ?x188 ?x188)))
 (let ((?x1333 (+ (* (- c0__x 0.0) (- c0__x 0.0)) ?x1332)))
 (let ((?x1666 (- ?x1333 ?x120)))
 (> (* ?x1666 ?x1666) 0.0)))))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x188 (- c0__y 0.0)))
 (let ((?x1332 (* ?x188 ?x188)))
 (let ((?x1336 (+ (* (- c0__x 1.0) (- c0__x 1.0)) ?x1332)))
 (let ((?x1669 (- ?x1336 ?x120)))
 (> (* ?x1669 ?x1669) 0.0)))))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1345 (+ (* (- c0__x q2__x) (- c0__x q2__x)) (* (- c0__y q2__y) (- c0__y q2__y)))))
 (let ((?x1672 (- ?x1345 ?x120)))
 (> (* ?x1672 ?x1672) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1349 (+ (* (- c0__x right__x) (- c0__x right__x)) (* (- c0__y right__y) (- c0__y right__y)))))
 (let ((?x1675 (- ?x1349 ?x120)))
 (> (* ?x1675 ?x1675) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1680 (+ (* (- c0__x c1__x) (- c0__x c1__x)) (* (- c0__y c1__y) (- c0__y c1__y)))))
 (let ((?x1681 (- ?x1680 ?x120)))
 (> (* ?x1681 ?x1681) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1686 (+ (* (- c0__x c2__x) (- c0__x c2__x)) (* (- c0__y c2__y) (- c0__y c2__y)))))
 (let ((?x1687 (- ?x1686 ?x120)))
 (> (* ?x1687 ?x1687) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1692 (+ (* (- c0__x t_y1__x) (- c0__x t_y1__x)) (* (- c0__y t_y1__y) (- c0__y t_y1__y)))))
 (let ((?x1693 (- ?x1692 ?x120)))
 (> (* ?x1693 ?x1693) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1698 (+ (* (- c0__x t_x2__x) (- c0__x t_x2__x)) (* (- c0__y t_x2__y) (- c0__y t_x2__y)))))
 (let ((?x1699 (- ?x1698 ?x120)))
 (> (* ?x1699 ?x1699) 0.0)))))
(assert
 (let ((?x120 (+ (* (- c0__x q0__x) (- c0__x q0__x)) (* (- c0__y q0__y) (- c0__y q0__y)))))
 (let ((?x1704 (+ (* (- c0__x t_y2__x) (- c0__x t_y2__x)) (* (- c0__y t_y2__y) (- c0__y t_y2__y)))))
 (let ((?x1705 (- ?x1704 ?x120)))
 (> (* ?x1705 ?x1705) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x206 (- c1__y 0.0)))
 (let ((?x1352 (* ?x206 ?x206)))
 (let ((?x1353 (+ (* (- c1__x 0.0) (- c1__x 0.0)) ?x1352)))
 (let ((?x1708 (- ?x1353 ?x137)))
 (> (* ?x1708 ?x1708) 0.0)))))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x206 (- c1__y 0.0)))
 (let ((?x1352 (* ?x206 ?x206)))
 (let ((?x1356 (+ (* (- c1__x 1.0) (- c1__x 1.0)) ?x1352)))
 (let ((?x1711 (- ?x1356 ?x137)))
 (> (* ?x1711 ?x1711) 0.0)))))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1360 (+ (* (- c1__x q0__x) (- c1__x q0__x)) (* (- c1__y q0__y) (- c1__y q0__y)))))
 (let ((?x1714 (- ?x1360 ?x137)))
 (> (* ?x1714 ?x1714) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1369 (+ (* (- c1__x right__x) (- c1__x right__x)) (* (- c1__y right__y) (- c1__y right__y)))))
 (let ((?x1717 (- ?x1369 ?x137)))
 (> (* ?x1717 ?x1717) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1373 (+ (* (- c1__x c0__x) (- c1__x c0__x)) (* (- c1__y c0__y) (- c1__y c0__y)))))
 (let ((?x1720 (- ?x1373 ?x137)))
 (> (* ?x1720 ?x1720) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1725 (+ (* (- c1__x c2__x) (- c1__x c2__x)) (* (- c1__y c2__y) (- c1__y c2__y)))))
 (let ((?x1726 (- ?x1725 ?x137)))
 (> (* ?x1726 ?x1726) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1731 (+ (* (- c1__x t_y0__x) (- c1__x t_y0__x)) (* (- c1__y t_y0__y) (- c1__y t_y0__y)))))
 (let ((?x1732 (- ?x1731 ?x137)))
 (> (* ?x1732 ?x1732) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1737 (+ (* (- c1__x t_x2__x) (- c1__x t_x2__x)) (* (- c1__y t_x2__y) (- c1__y t_x2__y)))))
 (let ((?x1738 (- ?x1737 ?x137)))
 (> (* ?x1738 ?x1738) 0.0)))))
(assert
 (let ((?x137 (+ (* (- c1__x q1__x) (- c1__x q1__x)) (* (- c1__y q1__y) (- c1__y q1__y)))))
 (let ((?x1743 (+ (* (- c1__x t_y2__x) (- c1__x t_y2__x)) (* (- c1__y t_y2__y) (- c1__y t_y2__y)))))
 (let ((?x1744 (- ?x1743 ?x137)))
 (> (* ?x1744 ?x1744) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x194 (- c2__y 0.0)))
 (let ((?x1376 (* ?x194 ?x194)))
 (let ((?x1377 (+ (* (- c2__x 0.0) (- c2__x 0.0)) ?x1376)))
 (let ((?x1747 (- ?x1377 ?x154)))
 (> (* ?x1747 ?x1747) 0.0)))))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x194 (- c2__y 0.0)))
 (let ((?x1376 (* ?x194 ?x194)))
 (let ((?x1380 (+ (* (- c2__x 1.0) (- c2__x 1.0)) ?x1376)))
 (let ((?x1750 (- ?x1380 ?x154)))
 (> (* ?x1750 ?x1750) 0.0)))))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1388 (+ (* (- c2__x q1__x) (- c2__x q1__x)) (* (- c2__y q1__y) (- c2__y q1__y)))))
 (let ((?x1753 (- ?x1388 ?x154)))
 (> (* ?x1753 ?x1753) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1393 (+ (* (- c2__x right__x) (- c2__x right__x)) (* (- c2__y right__y) (- c2__y right__y)))))
 (let ((?x1756 (- ?x1393 ?x154)))
 (> (* ?x1756 ?x1756) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1397 (+ (* (- c2__x c0__x) (- c2__x c0__x)) (* (- c2__y c0__y) (- c2__y c0__y)))))
 (let ((?x1759 (- ?x1397 ?x154)))
 (> (* ?x1759 ?x1759) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1401 (+ (* (- c2__x c1__x) (- c2__x c1__x)) (* (- c2__y c1__y) (- c2__y c1__y)))))
 (let ((?x1762 (- ?x1401 ?x154)))
 (> (* ?x1762 ?x1762) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1767 (+ (* (- c2__x t_x0_x1__x) (- c2__x t_x0_x1__x)) (* (- c2__y t_x0_x1__y) (- c2__y t_x0_x1__y)))))
 (let ((?x1768 (- ?x1767 ?x154)))
 (> (* ?x1768 ?x1768) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
 (let ((?x1773 (+ (* (- c2__x t_y0__x) (- c2__x t_y0__x)) (* (- c2__y t_y0__y) (- c2__y t_y0__y)))))
 (let ((?x1774 (- ?x1773 ?x154)))
 (> (* ?x1774 ?x1774) 0.0)))))
(assert
 (let ((?x154 (+ (* (- c2__x q2__x) (- c2__x q2__x)) (* (- c2__y q2__y) (- c2__y q2__y)))))
(let ((?x1779 (+ (* (- c2__x t_y1__x) (- c2__x t_y1__x)) (* (- c2__y t_y1__y) (- c2__y t_y1__y)))))
(let ((?x1780 (- ?x1779 ?x154)))
(> (* ?x1780 ?x1780) 0.0)))))
(check-sat)
