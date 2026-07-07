(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x171 (* (- 1.0) R2)))
 (let ((?x824 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x171)))
 (= (+ (+ ?x824 ?x449) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x252 (* (- 2.0) xx)))
 (let ((?x302 (+ (+ (+ (+ 1.0 (* xx xx)) (* xy xy)) (* (- 1.0) rho2)) ?x252)))
 (= ?x302 0.0))))
(assert
 (let ((?x24 (* (- 1.0) rho2)))
 (let ((?x486 (* y1y y1y)))
 (let ((?x170 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x486) ?x24)))
 (= (+ (+ ?x170 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x24 (* (- 1.0) rho2)))
 (let ((?x91 (* xy xy)))
 (let ((?x358 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x91) ?x24)))
 (= (+ (+ ?x358 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x24 (* (- 1.0) rho2)))
 (let ((?x91 (* xy xy)))
 (let ((?x204 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x91) ?x24)))
 (= (+ (+ ?x204 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x275 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x275 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x264 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x264 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x348 (* oy oy)))
 (let ((?x327 (* (- 1.0) ?x348)))
 (let ((?x56 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x56 ?x327) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x348 (* oy oy)))
 (let ((?x327 (* (- 1.0) ?x348)))
 (let ((?x84 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x84 ?x327) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x414 (* (- 1.0) v1y)))
 (let ((?x23 (* ?x414 xy)))
 (> ?x23 0.0))))
(assert
 (let ((?x85 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x85 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x414 (* (- 1.0) v1y)))
 (let ((?x733 (* ?x414 y1y)))
 (> ?x733 0.0))))
(assert
 (let ((?x46 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x46 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x241 (* b1y v1x)))
 (let ((?x88 (* ?x241 v1y)))
 (let ((?x276 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x276 ?x88) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x441 (* b2y v1x)))
 (let ((?x28 (* ?x441 v1y)))
 (let ((?x125 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x125 ?x28) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (let ((?x175 (* (- 1.0) xy)))
 (> ?x175 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (let ((?x383 (* (- 1.0) y1y)))
 (> ?x383 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x175 (* (- 1.0) xy)))
 (let ((?x124 (* ?x175 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x124) 0.0))))
(assert
 (let ((?x175 (* (- 1.0) xy)))
 (let ((?x124 (* ?x175 y1x)))
 (let ((?x414 (* (- 1.0) v1y)))
 (let ((?x340 (* ?x414 xx)))
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x449 y1y)))
 (let ((?x217 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x199) ?x340)))
 (> (+ ?x217 ?x124) 0.0)))))))))
(assert
 (let ((?x175 (* (- 1.0) xy)))
 (let ((?x124 (* ?x175 y1x)))
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x75 (* ?x270 xx)))
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x257 (* ?x376 y1y)))
 (let ((?x155 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x257) ?x75)))
 (> (+ ?x155 ?x124) 0.0)))))))))
(assert
 (let ((?x175 (* (- 1.0) xy)))
 (let ((?x124 (* ?x175 y1x)))
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x399 (* ?x473 xx)))
 (let ((?x63 (* (- 1.0) b2x)))
 (let ((?x48 (* ?x63 y1y)))
 (let ((?x266 (+ (+ (+ (+ (* b2x xy) (* b2y y1x)) (* xx y1y)) ?x48) ?x399)))
 (> (+ ?x266 ?x124) 0.0)))))))))
(assert
 (let ((?x414 (* (- 1.0) v1y)))
 (let ((?x340 (* ?x414 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x340) 0.0))))
(assert
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x75 (* ?x270 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x75) 0.0))))
(assert
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x399 (* ?x473 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x399) 0.0))))
(assert
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x120 (* ?x449 xy)))
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x75 (* ?x270 xx)))
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x285 (* ?x376 v1y)))
 (let ((?x132 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x285) ?x75)))
 (> (+ ?x132 ?x120) 0.0)))))))))
(assert
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x120 (* ?x449 xy)))
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x399 (* ?x473 xx)))
 (let ((?x63 (* (- 1.0) b2x)))
 (let ((?x103 (* ?x63 v1y)))
 (let ((?x224 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x103) ?x399)))
 (> (+ ?x224 ?x120) 0.0)))))))))
(assert
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x399 (* ?x473 xx)))
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x286 (* ?x270 b2x)))
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x373 (* ?x376 xy)))
 (let ((?x250 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x373) ?x286)))
 (> (+ ?x250 ?x399) 0.0)))))))))
(assert
 (let ((?x278 (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) (* (* (- 1.0) v1y) y1x))))
 (> ?x278 0.0)))
(assert
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x195 (* ?x270 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x195) 0.0))))
(assert
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x65 (* ?x473 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x65) 0.0))))
(assert
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x449 y1y)))
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x195 (* ?x270 y1x)))
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x285 (* ?x376 v1y)))
 (let ((?x289 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x285) ?x195)))
 (> (+ ?x289 ?x199) 0.0)))))))))
(assert
 (let ((?x449 (* (- 1.0) v1x)))
 (let ((?x199 (* ?x449 y1y)))
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x65 (* ?x473 y1x)))
 (let ((?x63 (* (- 1.0) b2x)))
 (let ((?x103 (* ?x63 v1y)))
 (let ((?x42 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x103) ?x65)))
 (> (+ ?x42 ?x199) 0.0)))))))))
(assert
 (let ((?x473 (* (- 1.0) b2y)))
 (let ((?x65 (* ?x473 y1x)))
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x286 (* ?x270 b2x)))
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x257 (* ?x376 y1y)))
 (let ((?x40 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x257) ?x286)))
 (> (+ ?x40 ?x65) 0.0)))))))))
(assert
 (let ((?x376 (* (- 1.0) b1x)))
 (let ((?x285 (* ?x376 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x285) 0.0))))
(assert
 (let ((?x63 (* (- 1.0) b2x)))
 (let ((?x103 (* ?x63 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x103) 0.0))))
(assert
 (let ((?x270 (* (- 1.0) b1y)))
 (let ((?x286 (* ?x270 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x286) 0.0))))
(assert
 (let ((?x270 (* (- 1.0) b1y)))
(let ((?x286 (* ?x270 b2x)))
(let ((?x376 (* (- 1.0) b1x)))
(let ((?x285 (* ?x376 v1y)))
(let ((?x335 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x285) ?x286)))
(> (+ ?x335 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
