with Indizeko_Sarrerak,Hitzak,Posizioak;  

package Indizea is

   Lekurik_Ez: exception;
   
   procedure Sortu_Hutsa; 

   procedure Txertatu (
         H   : in     Hitzak.Hitz;      
         Pos : in     Posizioak.Posizio ); 

   procedure Sarrera_Lortu (
         H        : in     Hitzak.Hitz;                       
         Aurkitua :    out Boolean;                           
         I        :    out Indizeko_Sarrerak.Indizeko_Sarrera ); 

end Indizea;