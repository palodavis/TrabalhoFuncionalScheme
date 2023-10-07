#lang scheme

(define (make-curry fn)
  (lambda args
    (if (= (length args) (procedure-arity fn))
        (apply fn args)
        (make-curry (apply fn args)))))

(define (string-search str substr)
  ;; Implementação simples de busca de substring
  (let loop ((i 0) (len (string-length str)))
    (cond ((>= i len) -1)
          ((string-prefix? substr (substring str i))
           i)
          (else
           (loop (+ i 1) len)))))

(define (filtro arr tit fcomp cat)
  (filter
   (lambda (item)
     (or (<= (string-length tit) 0)
         (>= (string-search (cdr (assoc 'titulo item)) tit) 0)))
   (filter
    (if (not fcomp)
        (lambda (_) #t)
        (lambda (item)
          (fcomp (cdr (assoc 'cargaHoraria item)))))
    (filter
     (lambda (item)
       (or (<= (string-length cat) 0)
           (string=? cat (cdr (assoc 'categoria item)))))
     arr))))

;; Aplicando curry diretamente a filtro
(define filter1
  (make-curry filtro))

(define filter2
  (make-curry filtro))

(define dados
  '(
    ((titulo . "Exercício de academia") (cargaHoraria . 10) (categoria . "curso"))
    ((titulo . "dasdasdsa academia") (cargaHoraria . 20) (categoria . "curso"))
    ((titulo . "fdsfdsfsd academia") (cargaHoraria . 30) (categoria . "curso"))
    ((titulo . "gfdgfd academia") (cargaHoraria . 40) (categoria . "projeto"))
    ((titulo . "arte sdsa da") (cargaHoraria . 10) (categoria . "curso"))
    ((titulo . "dsasa arte dsadas") (cargaHoraria . 20) (categoria . "projeto"))
    ((titulo . "dsadsa arte dsadas") (cargaHoraria . 20) (categoria . "curso"))
    ((titulo . "dsds arte") (cargaHoraria . 30) (categoria . "projeto"))
  ))

(display (filter1 dados "" (lambda (ch) (and (>= ch 20) (<= ch 30))) "curso"))
(newline)
(display (filter2 dados "" (lambda (ch) (and (>= ch 20) (<= ch 40))) "projeto"))
