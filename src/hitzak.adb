package body Hitzak is

   procedure Sortu (S: in String; H:out Hitz) is
   begin     
      H:=new string'(S);
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Sortu;

   procedure Kopiatu (H: in Hitz; H1:out Hitz) is
   begin
      H1:=new string'(H.all);
   exception
      when Storage_Error => raise Lekurik_Ez;   
   end Kopiatu;      

   function Berdin (H1,H2: in Hitz) return Boolean is
   begin
      return H1.all=H2.all;         
   end Berdin;

   function Balioa (H: in Hitz) return String is
   begin
      return H.all;
   end Balioa;

   function Luzera (H: in Hitz) return Natural is
   begin
      return H.all'Length;
   end Luzera;

   function "<" (H1, H2: in Hitz) return Boolean is
   begin
      return H1.all < H2.all;
   end "<";

end Hitzak;