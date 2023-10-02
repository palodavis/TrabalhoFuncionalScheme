#lang scheme
(define (curry fn)
  (if (not (procedure? fn))
      (error "No function provided")
      (lambda args
        (if (< (length args) (procedure-arity-includes? fn 0))
            (lambda args2
              (curry (apply fn (append args args2))))
            (apply fn args)))))

(define (filtro arr tit fcomp cat)
  (define (string-contain? str substr)
    (not (null? (regexp-match-positions (regexp (string-append ".*" substr ".*")) str))))

  (define (apply-fcomp item)
    (if (and (function? fcomp)
             (number? (hash-ref item 'cargaHoraria)))
        (fcomp (hash-ref item 'cargaHoraria))
        #f))

  (filter
   (lambda (item)
     (or (<= (string-length tit) 0)
         (string-contain? (hash-ref item 'titulo "") tit)))
   (filter
    (lambda (item)
      (or (not fcomp) (apply-fcomp item)))
    (filter
     (lambda (item)
       (or (<= (string-length cat) 0)
           (string=? (hash-ref item 'categoria "") cat)))
     arr))))

(define filter1
  ((curry filtro)
   '(
     ((titulo . "Exercício de academia") (cargaHoraria . 10) (categoria . "curso"))
     ((titulo . "dasdasdsa academia") (cargaHoraria . 20) (categoria . "curso"))
     ((titulo . "fdsfdsfsd academia") (cargaHoraria . 30) (categoria . "curso"))
     ((titulo . "gfdgfd academia") (cargaHoraria . 40) (categoria . "projeto"))
     ((titulo . "arte sdsa da") (cargaHoraria . 10) (categoria . "curso"))
     ((titulo . "dsasa arte dsadas") (cargaHoraria . 20) (categoria . "projeto"))
     ((titulo . "dsadsa arte dsadas") (cargaHoraria . 20) (categoria . "curso"))
     ((titulo . "dsds arte") (cargaHoraria . 30) (categoria . "projeto")))
   "academia"))

(display (filter1 (lambda (ch) (and (number? ch) (>= ch 20) (<= ch 30))) "curso"))
