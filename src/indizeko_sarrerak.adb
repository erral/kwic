with Posizioak,Hitzak,Posizio_Listak;
package body Indizeko_Sarrerak is

   procedure Sortu_Berria (
         H   : in     Hitzak.Hitz;
         Pl  : in     Posizio_Listak.Lista_Ordenatua;
         I_S :    out Indizeko_Sarrera                ) is

   begin
      Hitzak.Kopiatu (H,I_S.Hitza);
      Posizio_Listak.Kopiatu(Pl,I_S.Posizio_Lista);
   exception
      when Storage_Error => raise Lekurik_Ez;
      when Hitzak.Lekurik_Ez => raise Lekurik_Ez;
      when Posizio_listak.Lekurik_Ez => raise Lekurik_Ez;
   end Sortu_Berria;


   function Esan_Hitza (
         I_S : in     Indizeko_Sarrera )
     return Hitzak.Hitz is
   begin
      return I_S.Hitza;
   end Esan_Hitza;

   procedure Esan_Posizioak (
         I_S : in     Indizeko_Sarrera;
         Pl  :    out Posizio_Listak.Lista_Ordenatua ) is
   begin
      Posizio_Listak.Kopiatu (I_S.Posizio_Lista,Pl);
   exception
      when Posizio_Listak.Lekurik_Ez => raise Lekurik_Ez;
   end Esan_Posizioak;

   procedure Kopiatu (
         I1 :    out Indizeko_Sarrera;
         I2 : in     Indizeko_Sarrera  ) is
      --Post: I1-n I2-en kopia bat gordetzen du   
   begin
      Hitzak.Kopiatu(I2.Hitza,I1.Hitza);
      Posizio_Listak.Kopiatu(I2.Posizio_Lista,I1.Posizio_Lista);
   exception
      when Storage_Error => raise Lekurik_Ez;
      when Hitzak.lekurik_Ez => raise Lekurik_Ez;
      when Posizio_Listak.Lekurik_Ez => raise Lekurik_Ez;
   end Kopiatu;

   function Berdin (
         I1,
         I2 : in     Indizeko_Sarrera )
     return Boolean is
   begin
      return Hitzak.Berdin (I1.Hitza,I2.Hitza) and Posizio_Listak.Berdin (
         I1.Posizio_Lista,I2.Posizio_Lista);
   end Berdin;

   procedure Sortu (
         H : in     Hitzak.Hitz;
         I :    out Indizeko_Sarrera ) is
      --Post: Indizeko sarrera berri bat sortzen du Posizio lista hutsik utziz
   begin
      Hitzak.Kopiatu (H,I.Hitza);
   exception
      when Storage_Error => raise Lekurik_Ez;
      when Hitzak.Lekurik_Ez => raise Lekurik_Ez;
   end Sortu;

   procedure Posizioa_Gehitu (
         P : in     Posizioak.Posizio;
         I : in out Indizeko_Sarrera   ) is
      --Post: Emandako posizioa, indizeko sarreraren posizio listan sartuko du baina bukaeran
   begin
      Posizio_Listak.Erantsi_Bukaeran (I.Posizio_Lista,P);
   exception
      when Storage_Error => raise Lekurik_Ez;
      when Posizio_Listak.Lekurik_Ez => raise Lekurik_Ez;
   end Posizioa_Gehitu;

end Indizeko_Sarrerak;