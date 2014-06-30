with Pos_Luzera_Bikoteak,Posizioak;
package Posizio_Taula is

   Lekurik_Ez, Hasieratze_Okerra: exception;
   
   procedure Sortu_Hutsa; 

   procedure Erantsi_Bukaeran (
         Plb : in     Pos_Luzera_Bikoteak.Pos_Luzera_Bikote ); 

   procedure Tiaren_Has_Am_Bilatu (
         P        : in     Posizioak.Posizio; 
         Aurkitua :    out Boolean;           
         Has,                                 
         Am       :    out Posizioak.Posizio; 
         Luze     :    out Positive           ); 


end Posizio_Taula;                                  