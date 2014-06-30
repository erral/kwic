with Posizioak;
with Lista_Ordenatuak;

package Posizio_Listak is new Lista_Ordenatuak (
   Osagai   => Posizioak.Posizio, 
   Asignatu => Posizioak.Kopiatu, 
   Berdin   => Posizioak.Berdin);

