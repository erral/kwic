package body Posizioak is


   procedure Kopiatu (P1: in Posizio; P2: out Posizio) is
   begin
      P2:=P1;
   end Kopiatu;   

   function Txikiago (P1,P2: in Posizio) return Boolean is
   begin
       return P1<P2;
   end Txikiago;
   
   function Handiago (P1,P2: in Posizio) return Boolean is
   begin
      return P1>P2;
   end Handiago;
   
   function Berdin (P1,P2: in Posizio) return Boolean is
   begin
      return P1=P2;
   end Berdin;
   
   function Esan_Posizio (P:in Posizio) return Posizio is
   begin 
      return P;
   end Esan_Posizio;
end Posizioak;