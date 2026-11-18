## Logistic Map
El logistic map es una función discreta con caracter caótico la cual está dada por la siguiente relación de recuersión.

Ecuación del Logistic Map
$$x_{k+1} = ax_k(1-x_k)$$

Donde notemos que:
$$x]0,1[$$
$$a]0,4[$$

Comportamiento del logistic Map para diferentes valores de a:

#### Puntos Fijos $x*$
Se cumple que el logictic map se encuentra en un punto fijo si y solo si se cumple que: 
$$x_{k+1}=x_k$$

Comenzemos notando que:
$$
\frac{x_{k+1}}{ x_k} = a(1-x_k)  
$$
si y solo si $a<1$

Consecuentemente $$ x_{k+1}<x_k$$


### ANALISIS DE CONVERGENCIA
Comenzamos aumiendo que nuestro función del logistic mao cumple con que:
$$x_{k+1} = ax_k(1-a_k)$$
Por lo tanto tenemos que:

$$x_{k} = ax_k(1-a_k)$$
$$1-a=-ax_k$$
$$x_k=\frac{a-1}{a}$$

Netemos a este punto $x_k=x*$ nuestro punto de convergencia para el logistic map. Es decir si evaluamos el logistic mao en este punto obtendremos que:

$$x*=f(x*)=ax*(1-x*)$$

Ahora debemos notar en esta expresión que el valor que $a$ puede tomar se encuentra entre $0<a<4$.

## Caso 1 (0<a<2)

Las simulaciones computacionales han mostrado que el logistic map converge al punto fijo $a*$  y dado que $x_{k+1}<x_k$ para todo $a<1$ entonces tenemos que antes de llegar a la k-esima iteración donde el logistic map comienza a converger a su punto fijo se cumple la siguiente relación:

$$ |x_{k+1}-x*|<|x_k-x*|$$

De donde concluimos que hay convergencia hacia un punto fijo si y solo si:

$$
\left| \frac{x_{k+1} - x^*}{x_k - x^*} \right| < 1
$$

## Caso 2 (2<a<3)







### Demostración: Convergencia a cero para $a < 1$ en el mapa logístico

**1. Cálculo de los puntos fijos ($x^*$)**

Un punto fijo ocurre cuando el valor de la población no cambia en la siguiente iteración, estableciéndose la condición $x_{n+1} = x_n = x^*$. Evaluando el mapa logístico $f(x) = ax(1-x)$:

$$
x^* = a x^* (1 - x^*)
$$
$$
x^* = a x^* - a (x^*)^2
$$
$$
a (x^*)^2 + x^* (1 - a) = 0
$$
$$
x^* [a x^* + (1 - a)] = 0
$$

De esta ecuación obtenemos dos posibles puntos de equilibrio:
* $x_1^* = 0$
* $x_2^* = 1 - \frac{1}{a}$

Como el mapa logístico modela una fracción de población, su dominio físico es $x \in [0, 1]$. Si $a < 1$, el segundo punto fijo ($x_2^*$) resulta en un valor negativo (sin sentido físico). Por lo tanto, para $a < 1$, el único punto fijo válido es $x_1^* = 0$.

**2. Evaluación de la estabilidad**

Para saber si este punto fijo atrae a los valores cercanos (convergencia), calculamos la derivada de la función $f(x) = ax - ax^2$:

$$
f'(x) = a - 2ax
$$

**3. Condición de convergencia**

La condición matemática para que el punto fijo sea un "atractor estable" es que el valor absoluto de su derivada sea menor que 1. Evaluamos esta condición en el punto $x_1^* = 0$:

$$
|f'(0)| = |a - 2a(0)| = |a|
$$

Dado que estamos analizando el caso donde el parámetro es $0 \le a < 1$, la condición $|a| < 1$ se cumple siempre. En consecuencia, sin importar el valor inicial $x_0 \in (0, 1)$, el sistema inevitablemente colapsa y converge a $0$.