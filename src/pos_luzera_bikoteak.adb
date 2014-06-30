with Posizioak;

package body Pos_Luzera_Bikoteak is


   procedure Sortu (P:in Posizioak.Posizio; L:in Positive;
                    PLB:out Pos_Luzera_Bikote) is
   begin
      PLB.Pos:=P;
      PLB.Luz:=L;
   exception
   when Storage_Error => raise Lekurik_Ez;
   end Sortu;

   procedure Lortu_Luzera (PLB:in Pos_Luzera_bikote; L:out Positive) is
   begin
      L:=PLB.Luz;
   end Lortu_Luzera;
   
   function Lortu_Posizioa (PLB:in Pos_Luzera_bikote) return Posizioak.Posizio is
   begin
      return PLB.Pos;
   end Lortu_Posizioa;
   
   procedure Kopiatu (PLB1:in Pos_Luzera_bikote; PLB2:out Pos_Luzera_Bikote)is
   --Post: PLB2-n PLB1-en kopia bat gordetzen du
   begin
      PLB2:=PLB1;
   exception
   when Storage_Error => raise Lekurik_Ez;
   end Kopiatu;
   
   function Aurrekoa_da (PL1,PL2:in Pos_Luzera_Bikote) return Boolean is
   --Post: True itzuliko du PL2-k duen posizioa, PL1-renaren aurrekoa bada
   begin
      return PL2.Pos-1=PL1.Pos ;
   end Aurrekoa_da;
   
   function Berdin (PL1,PL2: in Pos_Luzera_Bikote) return Boolean is
   begin
      return Posizioak.Berdin(PL1.Pos,PL2.Pos) and (PL1.Luz = PL2.Luz);
   end Berdin;
   
   
end Pos_Luzera_Bikoteak;
