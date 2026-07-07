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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x355 (* (- 1.0) v1x)))
 (let ((?x361 (* (- 1.0) R2)))
 (let ((?x390 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x361)))
 (= (+ (+ ?x390 ?x355) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (= (+ (+ (* xx xx) (* xy xy)) (* (- 1.0) rho2)) 0.0))
(assert
 (let ((?x419 (* (- 1.0) rho2)))
 (let ((?x55 (* y1y y1y)))
 (let ((?x284 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x55) ?x419)))
 (= (+ (+ ?x284 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x419 (* (- 1.0) rho2)))
 (let ((?x124 (* xy xy)))
 (let ((?x463 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x124) ?x419)))
 (= (+ (+ ?x463 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x419 (* (- 1.0) rho2)))
 (let ((?x124 (* xy xy)))
 (let ((?x60 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x124) ?x419)))
 (= (+ (+ ?x60 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x373 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x373 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x86 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x86 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x612 (* oy oy)))
 (let ((?x267 (* (- 1.0) ?x612)))
 (let ((?x83 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x83 ?x267) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x612 (* oy oy)))
 (let ((?x267 (* (- 1.0) ?x612)))
 (let ((?x148 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x148 ?x267) (* (* 2.0 b1y) oy)) 0.0)))))
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
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x250 (* ?x190 xy)))
 (> ?x250 0.0))))
(assert
 (let ((?x75 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x75 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x120 (* ?x190 y1y)))
 (> ?x120 0.0))))
(assert
 (let ((?x282 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x282 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x306 (* a1y v1y)))
 (> ?x306 0.0)))
(assert
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x415 (* ?x375 v1x)))
 (let ((?x9 (* ?x415 v1y)))
 (let ((?x306 (* a1y v1y)))
 (let ((?x16 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x306) ?x9)))
 (> ?x16 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x74 (* b1y v1x)))
 (let ((?x245 (* ?x74 v1y)))
 (let ((?x193 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x193 ?x245) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x256 (* (- 1.0) y1y)))
 (> ?x256 0.0)))
(assert
 (> (+ (* a1y y1x) (* (* (- 1.0) a1x) y1y)) 0.0))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (let ((?x108 (* (- 1.0) xy)))
 (> ?x108 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> a1y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* a1x v1y) (* (* (- 1.0) a1y) v1x)) 0.0))
(assert
 (> (+ (* a1x b1y) (* (* (- 1.0) a1y) b1x)) 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x620 (* (- 1.0) xx)))
 (let ((?x440 (* ?x620 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x440) 0.0))))
(assert
 (let ((?x620 (* (- 1.0) xx)))
 (let ((?x440 (* ?x620 y1y)))
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x670 (* ?x375 y1x)))
 (let ((?x733 (* (- 1.0) a1x)))
 (let ((?x421 (* ?x733 xy)))
 (let ((?x474 (+ (+ (+ (+ (* a1x y1y) (* a1y xx)) (* xy y1x)) ?x421) ?x670)))
 (> (+ ?x474 ?x440) 0.0)))))))))
(assert
 (let ((?x620 (* (- 1.0) xx)))
 (let ((?x440 (* ?x620 y1y)))
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x204 (* ?x190 y1x)))
 (let ((?x355 (* (- 1.0) v1x)))
 (let ((?x247 (* ?x355 xy)))
 (let ((?x159 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x247) ?x204)))
 (> (+ ?x159 ?x440) 0.0)))))))))
(assert
 (let ((?x620 (* (- 1.0) xx)))
 (let ((?x440 (* ?x620 y1y)))
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x447 y1x)))
 (let ((?x443 (* (- 1.0) b1x)))
 (let ((?x327 (* ?x443 xy)))
 (let ((?x137 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x327) ?x489)))
 (> (+ ?x137 ?x440) 0.0)))))))))
(assert
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x670 (* ?x375 y1x)))
 (> (+ (+ (+ a1y (* (- 1.0) y1y)) (* a1x y1y)) ?x670) 0.0))))
(assert
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x204 (* ?x190 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x204) 0.0))))
(assert
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x447 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x489) 0.0))))
(assert
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x204 (* ?x190 y1x)))
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x415 (* ?x375 v1x)))
 (let ((?x733 (* (- 1.0) a1x)))
 (let ((?x47 (* ?x733 y1y)))
 (let ((?x301 (+ (+ (+ (+ (* a1x v1y) (* a1y y1x)) (* v1x y1y)) ?x47) ?x415)))
 (> (+ ?x301 ?x204) 0.0)))))))))
(assert
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x447 y1x)))
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x297 (* ?x375 b1x)))
 (let ((?x733 (* (- 1.0) a1x)))
 (let ((?x47 (* ?x733 y1y)))
 (let ((?x24 (+ (+ (+ (+ (* a1x b1y) (* a1y y1x)) (* b1x y1y)) ?x47) ?x297)))
 (> (+ ?x24 ?x489) 0.0)))))))))
(assert
 (let ((?x355 (* (- 1.0) v1x)))
 (let ((?x48 (* ?x355 y1y)))
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x489 (* ?x447 y1x)))
 (let ((?x443 (* (- 1.0) b1x)))
 (let ((?x178 (* ?x443 v1y)))
 (let ((?x117 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x178) ?x489)))
 (> (+ ?x117 ?x48) 0.0)))))))))
(assert
 (let ((?x310 (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) (* (* (- 1.0) a1y) xx))))
 (> ?x310 0.0)))
(assert
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x49 (* ?x190 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x49) 0.0))))
(assert
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x368 (* ?x447 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x368) 0.0))))
(assert
 (let ((?x190 (* (- 1.0) v1y)))
 (let ((?x49 (* ?x190 xx)))
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x415 (* ?x375 v1x)))
 (let ((?x733 (* (- 1.0) a1x)))
 (let ((?x421 (* ?x733 xy)))
 (let ((?x300 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x421) ?x415)))
 (> (+ ?x300 ?x49) 0.0)))))))))
(assert
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x368 (* ?x447 xx)))
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x297 (* ?x375 b1x)))
 (let ((?x733 (* (- 1.0) a1x)))
 (let ((?x421 (* ?x733 xy)))
 (let ((?x43 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x421) ?x297)))
 (> (+ ?x43 ?x368) 0.0)))))))))
(assert
 (let ((?x355 (* (- 1.0) v1x)))
 (let ((?x247 (* ?x355 xy)))
 (let ((?x447 (* (- 1.0) b1y)))
 (let ((?x368 (* ?x447 xx)))
 (let ((?x443 (* (- 1.0) b1x)))
 (let ((?x178 (* ?x443 v1y)))
 (let ((?x139 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x178) ?x368)))
 (> (+ ?x139 ?x247) 0.0)))))))))
(assert
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x415 (* ?x375 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x415) 0.0))))
(assert
 (let ((?x375 (* (- 1.0) a1y)))
 (let ((?x297 (* ?x375 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x297) 0.0))))
(assert
 (let ((?x443 (* (- 1.0) b1x)))
 (let ((?x178 (* ?x443 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x178) 0.0))))
(assert
 (let ((?x443 (* (- 1.0) b1x)))
(let ((?x178 (* ?x443 v1y)))
(let ((?x375 (* (- 1.0) a1y)))
(let ((?x415 (* ?x375 v1x)))
(let ((?x45 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
(> (+ (+ ?x45 ?x415) ?x178) 0.0)))))))
(check-sat)
