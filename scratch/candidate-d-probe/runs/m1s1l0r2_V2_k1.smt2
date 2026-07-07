(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun rho2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x55 (* (- 1.0) R2)))
 (let ((?x377 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x55)))
 (= (+ (+ ?x377 ?x136) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x132 (* y1y y1y)))
 (let ((?x203 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x132) ?x354)))
 (= (+ (+ ?x203 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x250 (* xy xy)))
 (let ((?x226 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x250) ?x354)))
 (= (+ (+ ?x226 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x354 (* (- 1.0) rho2)))
 (let ((?x250 (* xy xy)))
 (let ((?x195 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x250) ?x354)))
 (= (+ (+ ?x195 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x146 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x146 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x254 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x254 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x316 (* oy oy)))
 (let ((?x263 (* (- 1.0) ?x316)))
 (let ((?x306 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x306 ?x263) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x316 (* oy oy)))
 (let ((?x263 (* (- 1.0) ?x316)))
 (let ((?x271 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x271 ?x263) (* (* 2.0 b2y) oy)) 0.0)))))
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
 (let ((?x937 (* (- 1.0) v1y)))
 (let ((?x103 (* ?x937 xy)))
 (> ?x103 0.0))))
(assert
 (let ((?x15 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x15 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x937 (* (- 1.0) v1y)))
 (let ((?x779 (* ?x937 y1y)))
 (> ?x779 0.0))))
(assert
 (let ((?x9 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x9 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x348 (* b1y v1x)))
 (let ((?x388 (* ?x348 v1y)))
 (let ((?x112 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x112 ?x388) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x24 (* b2y v1x)))
 (let ((?x438 (* ?x24 v1y)))
 (let ((?x14 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x14 ?x438) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x480 (* (- 1.0) y1y)))
 (> ?x480 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (let ((?x459 (* (- 1.0) xy)))
 (> ?x459 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
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
 (let ((?x110 (* (- 1.0) xx)))
 (let ((?x11 (* ?x110 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x11) 0.0))))
(assert
 (let ((?x110 (* (- 1.0) xx)))
 (let ((?x11 (* ?x110 y1y)))
 (let ((?x937 (* (- 1.0) v1y)))
 (let ((?x31 (* ?x937 y1x)))
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x393 (* ?x136 xy)))
 (let ((?x324 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x393) ?x31)))
 (> (+ ?x324 ?x11) 0.0)))))))))
(assert
 (let ((?x110 (* (- 1.0) xx)))
 (let ((?x11 (* ?x110 y1y)))
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x240 (* ?x474 y1x)))
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x368 (* ?x449 xy)))
 (let ((?x130 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x368) ?x240)))
 (> (+ ?x130 ?x11) 0.0)))))))))
(assert
 (let ((?x110 (* (- 1.0) xx)))
 (let ((?x11 (* ?x110 y1y)))
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x477 (* ?x476 y1x)))
 (let ((?x39 (* (- 1.0) b2x)))
 (let ((?x256 (* ?x39 xy)))
 (let ((?x101 (+ (+ (+ (+ (* b2x y1y) (* b2y xx)) (* xy y1x)) ?x256) ?x477)))
 (> (+ ?x101 ?x11) 0.0)))))))))
(assert
 (let ((?x937 (* (- 1.0) v1y)))
 (let ((?x31 (* ?x937 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x31) 0.0))))
(assert
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x240 (* ?x474 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x240) 0.0))))
(assert
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x477 (* ?x476 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x477) 0.0))))
(assert
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x421 (* ?x136 y1y)))
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x240 (* ?x474 y1x)))
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x261 (* ?x449 v1y)))
 (let ((?x221 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x261) ?x240)))
 (> (+ ?x221 ?x421) 0.0)))))))))
(assert
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x421 (* ?x136 y1y)))
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x477 (* ?x476 y1x)))
 (let ((?x39 (* (- 1.0) b2x)))
 (let ((?x301 (* ?x39 v1y)))
 (let ((?x297 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x301) ?x477)))
 (> (+ ?x297 ?x421) 0.0)))))))))
(assert
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x477 (* ?x476 y1x)))
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x236 (* ?x474 b2x)))
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x299 (* ?x449 y1y)))
 (let ((?x525 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x299) ?x236)))
 (> (+ ?x525 ?x477) 0.0)))))))))
(assert
 (let ((?x158 (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) (* (* (- 1.0) v1y) xx))))
 (> ?x158 0.0)))
(assert
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x38 (* ?x474 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x38) 0.0))))
(assert
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x43 (* ?x476 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x43) 0.0))))
(assert
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x393 (* ?x136 xy)))
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x38 (* ?x474 xx)))
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x261 (* ?x449 v1y)))
 (let ((?x208 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x261) ?x38)))
 (> (+ ?x208 ?x393) 0.0)))))))))
(assert
 (let ((?x136 (* (- 1.0) v1x)))
 (let ((?x393 (* ?x136 xy)))
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x43 (* ?x476 xx)))
 (let ((?x39 (* (- 1.0) b2x)))
 (let ((?x301 (* ?x39 v1y)))
 (let ((?x323 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x301) ?x43)))
 (> (+ ?x323 ?x393) 0.0)))))))))
(assert
 (let ((?x476 (* (- 1.0) b2y)))
 (let ((?x43 (* ?x476 xx)))
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x236 (* ?x474 b2x)))
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x368 (* ?x449 xy)))
 (let ((?x49 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x368) ?x236)))
 (> (+ ?x49 ?x43) 0.0)))))))))
(assert
 (let ((?x449 (* (- 1.0) b1x)))
 (let ((?x261 (* ?x449 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x261) 0.0))))
(assert
 (let ((?x39 (* (- 1.0) b2x)))
 (let ((?x301 (* ?x39 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x301) 0.0))))
(assert
 (let ((?x474 (* (- 1.0) b1y)))
 (let ((?x236 (* ?x474 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x236) 0.0))))
(assert
 (let ((?x474 (* (- 1.0) b1y)))
(let ((?x236 (* ?x474 b2x)))
(let ((?x449 (* (- 1.0) b1x)))
(let ((?x261 (* ?x449 v1y)))
(let ((?x95 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x261) ?x236)))
(> (+ ?x95 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
