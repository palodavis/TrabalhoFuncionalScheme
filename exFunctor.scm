#lang scheme

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

(define (filtrar-por-criterios dados criterios)
  (filter
   (lambda (elemento)
     (andmap
      (lambda (criterio)
        (equal? (cdr (assoc (car criterio) elemento)) (cdr criterio)))
      criterios))
   dados))

; Exemplo de uso com múltiplos critérios
(define criterios '(
                   (categoria . "curso")
                   (cargaHoraria . 20)))

(define resultados (filtrar-por-criterios dados criterios))

; Exibir os resultados
(display "Resultados:")
(newline)
(for-each
 (lambda (resultado)
   (display resultado)
   (newline))
 resultados)
