with Posizioak;

package Pos_Luzera_Bikoteak is

   type Pos_Luzera_Bikote is limited private;
   Lekurik_Ez: exception;

   procedure Sortu (P:in Posizioak.Posizio; L:in Positive;
                    PLB:out Pos_Luzera_Bikote);

   procedure Lortu_Luzera (PLB:in Pos_Luzera_bikote; L:out Positive);
   function Lortu_Posizioa (PLB:in Pos_Luzera_bikote) return Posizioak.Posizio;
   procedure Kopiatu (PLB1:in Pos_Luzera_bikote; PLB2:out Pos_Luzera_Bikote);
   --Post: PLB2-n PLB1-en kopia bat gordetzen du
   function Aurrekoa_da (PL1,PL2:in Pos_Luzera_Bikote) return Boolean;
   --Post: True itzuliko du PL2-k duen posizioa, PL1-renaren aurrekoa bada
   function Berdin (PL1,PL2: in Pos_Luzera_Bikote) return Boolean;


private

   type Pos_Luzera_Bikote is record
      Pos: Posizioak.Posizio;
      Luz: Positive;
   end record;

end Pos_Luzera_Bikoteak;