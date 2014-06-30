with Zuhaitzak,Indizeko_Sarrerak,Hitzak,Posizioak; 

package body Indizea is

   package Indize is new Zuhaitzak (
      Indizeko_Sarrerak.Indizeko_Sarrera, 
      Indizeko_Sarrerak.Kopiatu,          
      Indizeko_Sarrerak.Berdin,
      Hitzak.Hitz,
      Hitzak.Berdin,
      Indizeko_Sarrerak.Esan_Hitza,
      Hitzak."<");

   Ind : Indize.Zuhaitz;  
   
   
   procedure Sortu_Hutsa is 
   begin
      Indize.Hutsa_Sortu(Ind);
   exception
      when Indize.Lekurik_Ez => raise Lekurik_Ez;
   end Sortu_Hutsa;

   procedure Txertatu (
         H   : in     Hitzak.Hitz;      
         Pos : in     Posizioak.Posizio ) is 
      Osagaia  : Indizeko_Sarrerak.Indizeko_Sarrera;  
      Aurkitua : Boolean;  

   begin
      Indize.Bilatu_Ordenan(Ind,H,Osagaia,Aurkitua);
      if Aurkitua then
         Indizeko_sarrerak.Posizioa_gehitu(Pos,Osagaia);
      else
         Indizeko_Sarrerak.Sortu(H,Osagaia);
         Indizeko_Sarrerak.Posizioa_Gehitu(Pos,Osagaia);
      end if;
      Indize.Txertatu_Ordenan(IND,Osagaia);
   exception
      when Indize.Lekurik_Ez => raise Lekurik_Ez;
      when Indizeko_Sarrerak.Lekurik_Ez => raise Lekurik_Ez;
   end Txertatu;

   procedure Sarrera_Lortu (
         H        : in     Hitzak.Hitz;                       
         Aurkitua :    out Boolean;                           
         I        :    out Indizeko_Sarrerak.Indizeko_Sarrera ) is 
   begin
      Indize.Bilatu_Ordenan(Ind,H,I,Aurkitua);
   end Sarrera_Lortu;
end Indizea;