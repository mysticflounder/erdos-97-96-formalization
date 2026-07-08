(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun y2y () Real)
(declare-fun y2x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x340 (* (- 1.0) R2)))
 (let ((?x375 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x340)))
 (= (+ (+ ?x375 ?x283) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x351 (* (- 1.0) rho2)))
 (let ((?x186 (* xy xy)))
 (let ((?x190 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x186) ?x351)))
 (= (+ (+ ?x190 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x351 (* (- 1.0) rho2)))
 (let ((?x438 (* y1y y1y)))
 (let ((?x221 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x438) ?x351)))
 (= (+ (+ ?x221 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x351 (* (- 1.0) rho2)))
 (let ((?x128 (* y2y y2y)))
 (let ((?x136 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y2x y2x)) ?x128) ?x351)))
 (= (+ (+ ?x136 (* (* (- 2.0) xx) y2x)) (* (* (- 2.0) xy) y2y)) 0.0)))))
(assert
 (let ((?x351 (* (- 1.0) rho2)))
 (let ((?x186 (* xy xy)))
 (let ((?x149 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x186) ?x351)))
 (= (+ (+ ?x149 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x256 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x256 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x236 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x236 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x814 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y2x y2x)))))
 (>= (+ (+ ?x814 (* (- 1.0) (* y2y y2y))) (* (* 2.0 oy) y2y)) 0.0)))
(assert
 (let ((?x412 (* oy oy)))
 (let ((?x458 (* (- 1.0) ?x412)))
 (let ((?x204 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x204 ?x458) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rho2 0.0))
(assert
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x166 (* ?x171 xy)))
 (> ?x166 0.0))))
(assert
 (let ((?x352 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x352 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x275 (* ?x171 y1y)))
 (> ?x275 0.0))))
(assert
 (let ((?x358 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x358 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x620 (* ?x171 y2y)))
 (> ?x620 0.0))))
(assert
 (let ((?x474 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y2y)) (* (* (- 1.0) y2x) (* v1y v1y)))))
 (> (+ ?x474 (* (* v1x v1y) y2y)) 0.0)))
(assert
 (> (+ (* y2x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y2y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x464 (* b1y v1x)))
 (let ((?x248 (* ?x464 v1y)))
 (let ((?x402 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x402 ?x248) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* y1x y2y) (* (* (- 1.0) y1y) y2x)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x401 (* (- 1.0) y1y)))
 (> ?x401 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* xy y2x) (* (* (- 1.0) xx) y2y)) 0.0))
(assert
 (let ((?x185 (* (- 1.0) y2y)))
 (> ?x185 0.0)))
(assert
 (> (+ (* v1y y2x) (* (* (- 1.0) v1x) y2y)) 0.0))
(assert
 (> (+ (* b1y y2x) (* (* (- 1.0) b1x) y2y)) 0.0))
(assert
 (let ((?x181 (* (- 1.0) xy)))
 (> ?x181 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x401 (* (- 1.0) y1y)))
 (let ((?x369 (* ?x401 y2x)))
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x282 (* ?x451 y2y)))
 (let ((?x487 (+ (+ (+ (+ (* xx y1y) (* xy y2x)) (* y1x y2y)) ?x282) (* (* (- 1.0) xy) y1x))))
 (> (+ ?x487 ?x369) 0.0)))))))
(assert
 (let ((?x401 (* (- 1.0) y1y)))
 (let ((?x369 (* ?x401 y2x)))
 (> (+ (+ (+ y1y (* (- 1.0) y2y)) (* y1x y2y)) ?x369) 0.0))))
(assert
 (let ((?x401 (* (- 1.0) y1y)))
 (let ((?x369 (* ?x401 y2x)))
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x86 (* ?x171 y1x)))
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x125 (* ?x283 y2y)))
 (let ((?x405 (+ (+ (+ (+ (* v1x y1y) (* v1y y2x)) (* y1x y2y)) ?x125) ?x86)))
 (> (+ ?x405 ?x369) 0.0)))))))))
(assert
 (let ((?x401 (* (- 1.0) y1y)))
 (let ((?x369 (* ?x401 y2x)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x83 (* ?x322 y1x)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x67 (* ?x172 y2y)))
 (let ((?x151 (+ (+ (+ (+ (* b1x y1y) (* b1y y2x)) (* y1x y2y)) ?x67) ?x83)))
 (> (+ ?x151 ?x369) 0.0)))))))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x306 (* ?x451 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x306) 0.0))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x306 (* ?x451 y1y)))
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x86 (* ?x171 y1x)))
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x257 (* ?x283 xy)))
 (let ((?x134 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x257) ?x86)))
 (> (+ ?x134 ?x306) 0.0)))))))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x306 (* ?x451 y1y)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x83 (* ?x322 y1x)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x172 xy)))
 (let ((?x20 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x34) ?x83)))
 (> (+ ?x20 ?x306) 0.0)))))))))
(assert
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x86 (* ?x171 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x86) 0.0))))
(assert
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x83 (* ?x322 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x83) 0.0))))
(assert
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x437 (* ?x283 y1y)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x83 (* ?x322 y1x)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x148 (* ?x172 v1y)))
 (let ((?x124 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x148) ?x83)))
 (> (+ ?x124 ?x437) 0.0)))))))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x282 (* ?x451 y2y)))
 (> (+ (+ (+ y2y (* (- 1.0) xy)) (* xy y2x)) ?x282) 0.0))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x282 (* ?x451 y2y)))
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x446 (* ?x171 y2x)))
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x257 (* ?x283 xy)))
 (let ((?x430 (+ (+ (+ (+ (* v1x y2y) (* v1y xx)) (* xy y2x)) ?x257) ?x446)))
 (> (+ ?x430 ?x282) 0.0)))))))))
(assert
 (let ((?x451 (* (- 1.0) xx)))
 (let ((?x282 (* ?x451 y2y)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x372 (* ?x322 y2x)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x34 (* ?x172 xy)))
 (let ((?x779 (+ (+ (+ (+ (* b1x y2y) (* b1y xx)) (* xy y2x)) ?x34) ?x372)))
 (> (+ ?x779 ?x282) 0.0)))))))))
(assert
 (let ((?x171 (* (- 1.0) v1y)))
 (let ((?x446 (* ?x171 y2x)))
 (> (+ (+ (+ v1y (* (- 1.0) y2y)) (* v1x y2y)) ?x446) 0.0))))
(assert
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x372 (* ?x322 y2x)))
 (> (+ (+ (+ b1y (* (- 1.0) y2y)) (* b1x y2y)) ?x372) 0.0))))
(assert
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x125 (* ?x283 y2y)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x372 (* ?x322 y2x)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x148 (* ?x172 v1y)))
 (let ((?x439 (+ (+ (+ (+ (* b1x y2y) (* b1y v1x)) (* v1y y2x)) ?x148) ?x372)))
 (> (+ ?x439 ?x125) 0.0)))))))))
(assert
 (let ((?x109 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x109 0.0)))
(assert
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x223 (* ?x322 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x223) 0.0))))
(assert
 (let ((?x283 (* (- 1.0) v1x)))
 (let ((?x257 (* ?x283 xy)))
 (let ((?x322 (* (- 1.0) b1y)))
 (let ((?x223 (* ?x322 xx)))
 (let ((?x172 (* (- 1.0) b1x)))
 (let ((?x148 (* ?x172 v1y)))
 (let ((?x390 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x148) ?x223)))
 (> (+ ?x390 ?x257) 0.0)))))))))
(assert
 (let ((?x172 (* (- 1.0) b1x)))
(let ((?x148 (* ?x172 v1y)))
(> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x148) 0.0))))
(check-sat)
