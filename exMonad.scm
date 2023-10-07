#lang scheme
    
(define (unit x)
  (list x))

(define (bind m f)
  (if (null? m)
      'Nothing
      (f (car m))))

;; Exemplo de utilização da Monad Maybe
(define resultado
  (bind (unit 6)
        (lambda (x)
          (bind (unit (* x 2))
                (lambda (y)
                  (unit (+ y 3)))))))

(display resultado)