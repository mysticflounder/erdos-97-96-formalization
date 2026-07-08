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
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x74 (* (- 1.0) R2)))
 (let ((?x424 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x74)))
 (= (+ (+ ?x424 ?x476) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x494 (* (- 1.0) rho2)))
 (let ((?x320 (* xy xy)))
 (let ((?x190 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x320) ?x494)))
 (= (+ (+ ?x190 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x494 (* (- 1.0) rho2)))
 (let ((?x299 (* y1y y1y)))
 (let ((?x247 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x299) ?x494)))
 (= (+ (+ ?x247 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x494 (* (- 1.0) rho2)))
 (let ((?x366 (* y2y y2y)))
 (let ((?x323 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y2x y2x)) ?x366) ?x494)))
 (= (+ (+ ?x323 (* (* (- 2.0) xx) y2x)) (* (* (- 2.0) xy) y2y)) 0.0)))))
(assert
 (let ((?x494 (* (- 1.0) rho2)))
 (let ((?x320 (* xy xy)))
 (let ((?x376 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x320) ?x494)))
 (= (+ (+ ?x376 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x94 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x94 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x917 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x917 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x445 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y2x y2x)))))
 (>= (+ (+ ?x445 (* (- 1.0) (* y2y y2y))) (* (* 2.0 oy) y2y)) 0.0)))
(assert
 (let ((?x56 (* oy oy)))
 (let ((?x253 (* (- 1.0) ?x56)))
 (let ((?x272 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x272 ?x253) (* (* 2.0 b1y) oy)) 0.0)))))
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
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x571 (* ?x454 xy)))
 (> ?x571 0.0))))
(assert
 (let ((?x440 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x440 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x251 (* ?x454 y1y)))
 (> ?x251 0.0))))
(assert
 (let ((?x477 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x477 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x53 (* ?x454 y2y)))
 (> ?x53 0.0))))
(assert
 (let ((?x78 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y2y)) (* (* (- 1.0) y2x) (* v1y v1y)))))
 (> (+ ?x78 (* (* v1x v1y) y2y)) 0.0)))
(assert
 (> (+ (* y2x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y2y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x220 (* b1y v1x)))
 (let ((?x31 (* ?x220 v1y)))
 (let ((?x176 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x176 ?x31) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (> (+ (* xx y2y) (* (* (- 1.0) xy) y2x)) 0.0))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (> ?x14 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* y1x y2y) (* (* (- 1.0) y1y) y2x)) 0.0))
(assert
 (let ((?x271 (* (- 1.0) y1y)))
 (> ?x271 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (let ((?x25 (* (- 1.0) y2y)))
 (> ?x25 0.0)))
(assert
 (> (+ (* v1y y2x) (* (* (- 1.0) v1x) y2y)) 0.0))
(assert
 (> (+ (* b1y y2x) (* (* (- 1.0) b1x) y2y)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x271 (* (- 1.0) y1y)))
 (let ((?x281 (* ?x271 y2x)))
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x88 (* ?x14 y1x)))
 (let ((?x395 (+ (+ (+ (* xx y1y) (* xy y2x)) (* y1x y2y)) (* (* (- 1.0) xx) y2y))))
 (> (+ (+ ?x395 ?x88) ?x281) 0.0)))))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x88 (* ?x14 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x88) 0.0))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x88 (* ?x14 y1x)))
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x226 (* ?x454 xx)))
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x244 (* ?x476 y1y)))
 (let ((?x40 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x244) ?x226)))
 (> (+ ?x40 ?x88) 0.0)))))))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x88 (* ?x14 y1x)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x414 (* ?x213 xx)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x152 (* ?x115 y1y)))
 (let ((?x34 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x152) ?x414)))
 (> (+ ?x34 ?x88) 0.0)))))))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x782 (* ?x14 y2x)))
 (> (+ (+ (+ xy (* (- 1.0) y2y)) (* xx y2y)) ?x782) 0.0))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x782 (* ?x14 y2x)))
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x226 (* ?x454 xx)))
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x476 y2y)))
 (let ((?x973 (+ (+ (+ (+ (* v1x xy) (* v1y y2x)) (* xx y2y)) ?x199) ?x226)))
 (> (+ ?x973 ?x782) 0.0)))))))))
(assert
 (let ((?x14 (* (- 1.0) xy)))
 (let ((?x782 (* ?x14 y2x)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x414 (* ?x213 xx)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x475 (* ?x115 y2y)))
 (let ((?x134 (+ (+ (+ (+ (* b1x xy) (* b1y y2x)) (* xx y2y)) ?x475) ?x414)))
 (> (+ ?x134 ?x782) 0.0)))))))))
(assert
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x226 (* ?x454 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x226) 0.0))))
(assert
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x414 (* ?x213 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x414) 0.0))))
(assert
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x9 (* ?x476 xy)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x414 (* ?x213 xx)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x201 (* ?x115 v1y)))
 (let ((?x124 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x201) ?x414)))
 (> (+ ?x124 ?x9) 0.0)))))))))
(assert
 (let ((?x271 (* (- 1.0) y1y)))
 (let ((?x281 (* ?x271 y2x)))
 (> (+ (+ (+ y1y (* (- 1.0) y2y)) (* y1x y2y)) ?x281) 0.0))))
(assert
 (let ((?x271 (* (- 1.0) y1y)))
 (let ((?x281 (* ?x271 y2x)))
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x121 (* ?x454 y1x)))
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x476 y2y)))
 (let ((?x430 (+ (+ (+ (+ (* v1x y1y) (* v1y y2x)) (* y1x y2y)) ?x199) ?x121)))
 (> (+ ?x430 ?x281) 0.0)))))))))
(assert
 (let ((?x271 (* (- 1.0) y1y)))
 (let ((?x281 (* ?x271 y2x)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x333 (* ?x213 y1x)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x475 (* ?x115 y2y)))
 (let ((?x192 (+ (+ (+ (+ (* b1x y1y) (* b1y y2x)) (* y1x y2y)) ?x475) ?x333)))
 (> (+ ?x192 ?x281) 0.0)))))))))
(assert
 (let ((?x454 (* (- 1.0) v1y)))
 (let ((?x121 (* ?x454 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x121) 0.0))))
(assert
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x333 (* ?x213 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x333) 0.0))))
(assert
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x244 (* ?x476 y1y)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x333 (* ?x213 y1x)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x201 (* ?x115 v1y)))
 (let ((?x264 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x201) ?x333)))
 (> (+ ?x264 ?x244) 0.0)))))))))
(assert
 (let ((?x109 (+ (+ (+ v1y (* (- 1.0) y2y)) (* v1x y2y)) (* (* (- 1.0) v1y) y2x))))
 (> ?x109 0.0)))
(assert
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x288 (* ?x213 y2x)))
 (> (+ (+ (+ b1y (* (- 1.0) y2y)) (* b1x y2y)) ?x288) 0.0))))
(assert
 (let ((?x476 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x476 y2y)))
 (let ((?x213 (* (- 1.0) b1y)))
 (let ((?x288 (* ?x213 y2x)))
 (let ((?x115 (* (- 1.0) b1x)))
 (let ((?x201 (* ?x115 v1y)))
 (let ((?x324 (+ (+ (+ (+ (* b1x y2y) (* b1y v1x)) (* v1y y2x)) ?x201) ?x288)))
 (> (+ ?x324 ?x199) 0.0)))))))))
(assert
 (let ((?x115 (* (- 1.0) b1x)))
(let ((?x201 (* ?x115 v1y)))
(> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x201) 0.0))))
(check-sat)
