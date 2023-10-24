# Multiplieur avec reset

Voici dans ce dépôt l'ensemble des fichiers sources utilisé pour réaliser les multiplieurs avec reset synchrone et asynchrone.

## Etude

Vous trouverez également les graphiques permettant de comparer les deux méthodes en terme d'utilisations de composants du FPGA. On remarque qu'il y a besoin d'un peu plus de LUTs pour un multiplieur asynchrone, le multiplieur synchrone utilise autant de DSP et de registres et est donc moins coûteux. Cependant, le test de temps n'a pas pu être réaliser dans ces cas.

Multiplieur asynchrone :

![alt text](multiplieur_async.png)

Multiplieur synchrone :

![alt text](multiplieur_sync.png)
