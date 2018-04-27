(defpackage :grupo02pareja071tq2704 ; se declara un paquete lisp que usa common-lisp
  (:use :common-lisp :mancala)      ; y mancala, y exporta la funci�n de evaluaci�n
  (:export :heuristica :*alias*))   ; heur�stica y un alias para el torneo

(in-package grupo02pareja071tq2704)

(defun heuristica (estado)
    (let ((f1 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          0))
          (f2 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          1))
          (f3 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          2))
          (f4 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          3))
          (f5 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          4))
          (f6 (get-fichas (estado-tablero estado) 
                          (estado-lado-sgte-jugador estado) 
                          5))
          (f1-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado))
                             0))
          (f2-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado)) 
                             1))
          (f3-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado)) 
                             2))
          (f4-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado)) 
                             3))
          (f5-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado)) 
                             4))
          (f6-op (get-fichas (estado-tablero estado) 
                             (lado-contrario (estado-lado-sgte-jugador estado))
                             5))
          (kl (get-tot (estado-lado-sgte-jugador estado)))
          (kl-op (get-tot (lado-contrario (estado-lado-sgte-jugador estado)))))
      (cond
       ((and (juego-terminado-p estado) 
             (> (+ kl f1 f2 f3 f4 f5 f6)
                (+ kl-op f1-op f2-op f3-op f4-op f5-op f6-op)))
        95534)
       ((and (juego-terminado-p estado) 
             (< (+ kl f1 f2 f3 f4 f5 f6)
                (+ kl-op f1-op f2-op f3-op f4-op f5-op f6-op)))
        (- 95534))
       (T (apply #'+ (mapcar #'* 
                       '(-294 -254 277 -182 -404 -364 -325 5 -213 54 -258 -306 62 -282 -248 -378)                       (list
                        f1
                        f2
                        f3
                        f4
                        f5
                        f6
                        f1-op
                        f2-op
                        f3-op
                        f4-op
                        f5-op
                        f6-op
                        kl
                        kl-op
                        (cuenta-ceros estado 0)
                        (cuenta-ceros estado 1))))))))

(defvar *alias* '|EVIL_MORTY_REFORMED|) ; alias que aparecer� en el ranking

(defun cuenta-ceros(estado jugador)
  (if (= jugador 0)
      (apply #'+ (mapcar #'(lambda (pos) 
                             (let 
                                 ((fichas (get-fichas (estado-tablero estado) 
                                                      (estado-lado-sgte-jugador estado) 
                                                      pos)))
                               (if (= fichas 0)
                                   1
                                 0)))
                   '(0 1 2 3 4 5)))
    (apply #'+ (mapcar #'(lambda (pos) 
                           (let 
                               ((fichas (get-fichas (estado-tablero estado) 
                                                    (lado-contrario (estado-lado-sgte-jugador estado)) 
                                                    pos)))
                             (if (= fichas 0)
                                 1
                               0)))
                 '(0 1 2 3 4 5)))))