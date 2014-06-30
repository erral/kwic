with posizioak,Hitzak;
package Testuinguruak is

   type Testuinguru is limited private;   
   Lekurik_Ez: exception;
   
   procedure Sortu (
         S     : in     String;            
         P     : in     Posizioak.Posizio; 
         Luz   :        Positive;          
         Testu :    out Testuinguru        ); 
         
   procedure Inprimatu (Testu: in Testuinguru);
   
   
private
   type Testuinguru is record
      H: Hitzak.Hitz; 
      P: Posizioak.Posizio;
      L: Positive;
   end record;
   
end testuinguruak;