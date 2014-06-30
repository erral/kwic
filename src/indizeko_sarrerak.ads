with Hitzak,Posizio_Listak,Posizioak;  
package Indizeko_Sarrerak is

   type Indizeko_Sarrera is limited private; 
   Lekurik_Ez: exception;

   procedure Sortu_Berria (
         H   : in     Hitzak.Hitz;                    
         Pl  : in     Posizio_Listak.Lista_Ordenatua; 
         I_S :    out Indizeko_Sarrera                ); 

   function Esan_Hitza (
         I_S : in     Indizeko_Sarrera ) 
     return Hitzak.Hitz; 

   procedure Esan_Posizioak (
         I_S : in     Indizeko_Sarrera;              
         Pl  :    out Posizio_Listak.Lista_Ordenatua ); 

   procedure Kopiatu (
         I1 :    out Indizeko_Sarrera; 
         I2 : in     Indizeko_Sarrera  ); 
   --Post: I1-n I2-en kopia bat gordetzen du   

   function Berdin (
         I1,                          
         I2 : in     Indizeko_Sarrera ) 
     return Boolean; 

   procedure Sortu (
         H : in     Hitzak.Hitz;     
         I :    out Indizeko_Sarrera ); 
   --Post: Indizeko sarrera berri bat sortzen du Posizio lista hutsik utziz

   procedure Posizioa_Gehitu (
         P : in     Posizioak.Posizio; 
         I : in out Indizeko_Sarrera   ); 
   --Post: Emandako posizioa, indizeko sarreraren posizio listan sartuko du baina bukaeran


private
   type Indizeko_Sarrera is 
      record 
         Hitza         : Hitzak.Hitz;  
         Posizio_Lista : Posizio_Listak.Lista_Ordenatua;  
      end record; 


end Indizeko_Sarrerak;